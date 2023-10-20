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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 31
entity inc_0CLK_121b1df5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc_0CLK_121b1df5;
architecture arch of inc_0CLK_121b1df5 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1405_c6_4aa3]
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1405_c2_5398]
signal t8_MUX_uxn_opcodes_h_l1405_c2_5398_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1405_c2_5398_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1405_c2_5398]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1405_c2_5398]
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1405_c2_5398]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1405_c2_5398]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1405_c2_5398]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1405_c2_5398]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_87dd]
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1410_c7_24e1]
signal t8_MUX_uxn_opcodes_h_l1410_c7_24e1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_24e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_24e1]
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_24e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_24e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_24e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_24e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1413_c11_85c3]
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1413_c7_9d39]
signal t8_MUX_uxn_opcodes_h_l1413_c7_9d39_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1413_c7_9d39]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1413_c7_9d39]
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1413_c7_9d39]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1413_c7_9d39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1413_c7_9d39]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1413_c7_9d39]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1416_c30_e83a]
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1419_c21_a9f3]
signal BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1421_c11_2159]
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1421_c7_7e14]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1421_c7_7e14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1421_c7_7e14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_left,
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_right,
BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_return_output);

-- t8_MUX_uxn_opcodes_h_l1405_c2_5398
t8_MUX_uxn_opcodes_h_l1405_c2_5398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1405_c2_5398_cond,
t8_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue,
t8_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse,
t8_MUX_uxn_opcodes_h_l1405_c2_5398_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_cond,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_left,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_right,
BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_return_output);

-- t8_MUX_uxn_opcodes_h_l1410_c7_24e1
t8_MUX_uxn_opcodes_h_l1410_c7_24e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1410_c7_24e1_cond,
t8_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue,
t8_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse,
t8_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_left,
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_right,
BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_return_output);

-- t8_MUX_uxn_opcodes_h_l1413_c7_9d39
t8_MUX_uxn_opcodes_h_l1413_c7_9d39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1413_c7_9d39_cond,
t8_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue,
t8_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse,
t8_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_cond,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a
sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_ins,
sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_x,
sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_y,
sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3
BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_left,
BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_right,
BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_left,
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_right,
BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_return_output,
 t8_MUX_uxn_opcodes_h_l1405_c2_5398_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_return_output,
 t8_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_return_output,
 t8_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output,
 sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_5398_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1405_c2_5398_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_609f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1410_c7_24e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_0bb1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1413_c7_9d39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1418_c3_7cc3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1413_c7_9d39_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1419_c3_9d0d : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_1f85_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1405_l1421_DUPLICATE_f7a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_17ae_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1410_l1405_l1421_DUPLICATE_2199_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1413_l1421_DUPLICATE_8b4d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1427_l1401_DUPLICATE_4373_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_0bb1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1411_c3_0bb1;
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1418_c3_7cc3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1418_c3_7cc3;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_609f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1407_c3_609f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1413_c11_85c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1421_c11_2159] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_left;
     BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_return_output := BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1419_c21_a9f3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1405_l1421_DUPLICATE_f7a4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1405_l1421_DUPLICATE_f7a4_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_1f85 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_1f85_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1410_l1405_l1421_DUPLICATE_2199 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1410_l1405_l1421_DUPLICATE_2199_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_17ae LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_17ae_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1416_c30_e83a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_ins;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_x;
     sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_return_output := sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1413_l1421_DUPLICATE_8b4d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1413_l1421_DUPLICATE_8b4d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1405_c6_4aa3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1410_c11_87dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1413_c7_9d39] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1413_c7_9d39_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_5398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1405_c6_4aa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_24e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1410_c11_87dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_9d39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1413_c11_85c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1421_c11_2159_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1419_c3_9d0d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1419_c21_a9f3_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_17ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_17ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_17ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1413_l1421_DUPLICATE_8b4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1413_l1421_DUPLICATE_8b4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1410_l1413_l1421_DUPLICATE_8b4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1410_l1405_l1421_DUPLICATE_2199_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1410_l1405_l1421_DUPLICATE_2199_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1410_l1405_l1421_DUPLICATE_2199_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1405_l1421_DUPLICATE_f7a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1405_l1421_DUPLICATE_f7a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1410_l1405_l1421_DUPLICATE_f7a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_1f85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_1f85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1410_l1413_l1405_DUPLICATE_1f85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1413_c7_9d39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1416_c30_e83a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1419_c3_9d0d;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1413_c7_9d39] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1413_c7_9d39] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1421_c7_7e14] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output;

     -- t8_MUX[uxn_opcodes_h_l1413_c7_9d39] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1413_c7_9d39_cond <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_9d39_cond;
     t8_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue;
     t8_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output := t8_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1413_c7_9d39] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output := result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1421_c7_7e14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1421_c7_7e14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1421_c7_7e14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1410_c7_24e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1413_c7_9d39] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1413_c7_9d39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1410_c7_24e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output;

     -- t8_MUX[uxn_opcodes_h_l1410_c7_24e1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1410_c7_24e1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_24e1_cond;
     t8_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue;
     t8_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output := t8_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1413_c7_9d39] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1410_c7_24e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1413_c7_9d39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1405_c2_5398] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1410_c7_24e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1410_c7_24e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1405_c2_5398] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_return_output;

     -- t8_MUX[uxn_opcodes_h_l1405_c2_5398] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1405_c2_5398_cond <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_5398_cond;
     t8_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue;
     t8_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1405_c2_5398_return_output := t8_MUX_uxn_opcodes_h_l1405_c2_5398_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1410_c7_24e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1405_c2_5398] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_return_output := result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1410_c7_24e1_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1405_c2_5398_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1405_c2_5398] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1405_c2_5398] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1405_c2_5398] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1427_l1401_DUPLICATE_4373 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1427_l1401_DUPLICATE_4373_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1405_c2_5398_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1405_c2_5398_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1405_c2_5398_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1405_c2_5398_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1405_c2_5398_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1405_c2_5398_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1427_l1401_DUPLICATE_4373_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1427_l1401_DUPLICATE_4373_return_output;
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
