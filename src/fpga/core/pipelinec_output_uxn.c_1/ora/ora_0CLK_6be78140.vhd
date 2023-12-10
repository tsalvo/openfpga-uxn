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
entity ora_0CLK_6be78140 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora_0CLK_6be78140;
architecture arch of ora_0CLK_6be78140 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l974_c6_c31d]
signal BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l974_c2_8919]
signal n8_MUX_uxn_opcodes_h_l974_c2_8919_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l974_c2_8919_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l974_c2_8919_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l974_c2_8919_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l974_c2_8919]
signal result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l974_c2_8919]
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l974_c2_8919]
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l974_c2_8919]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l974_c2_8919]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l974_c2_8919]
signal t8_MUX_uxn_opcodes_h_l974_c2_8919_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l974_c2_8919_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l974_c2_8919_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l974_c2_8919_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l981_c11_1849]
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l981_c7_7ff6]
signal n8_MUX_uxn_opcodes_h_l981_c7_7ff6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l981_c7_7ff6]
signal result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l981_c7_7ff6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l981_c7_7ff6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l981_c7_7ff6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l981_c7_7ff6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l981_c7_7ff6]
signal t8_MUX_uxn_opcodes_h_l981_c7_7ff6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l984_c11_2d95]
signal BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l984_c7_3982]
signal n8_MUX_uxn_opcodes_h_l984_c7_3982_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l984_c7_3982_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l984_c7_3982_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l984_c7_3982_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l984_c7_3982]
signal result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l984_c7_3982]
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l984_c7_3982]
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l984_c7_3982]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l984_c7_3982]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l984_c7_3982]
signal t8_MUX_uxn_opcodes_h_l984_c7_3982_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l984_c7_3982_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l984_c7_3982_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l984_c7_3982_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l987_c11_5f47]
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l987_c7_d1dc]
signal n8_MUX_uxn_opcodes_h_l987_c7_d1dc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l987_c7_d1dc]
signal result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l987_c7_d1dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l987_c7_d1dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l987_c7_d1dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l987_c7_d1dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l990_c30_b699]
signal sp_relative_shift_uxn_opcodes_h_l990_c30_b699_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l990_c30_b699_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l990_c30_b699_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l990_c30_b699_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l993_c21_891a]
signal BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l995_c11_0cf6]
signal BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l995_c7_3b42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l995_c7_3b42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l995_c7_3b42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_return_output : signed(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d
BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_left,
BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_right,
BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_return_output);

-- n8_MUX_uxn_opcodes_h_l974_c2_8919
n8_MUX_uxn_opcodes_h_l974_c2_8919 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l974_c2_8919_cond,
n8_MUX_uxn_opcodes_h_l974_c2_8919_iftrue,
n8_MUX_uxn_opcodes_h_l974_c2_8919_iffalse,
n8_MUX_uxn_opcodes_h_l974_c2_8919_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919
result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_cond,
result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919
result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919
result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_return_output);

-- t8_MUX_uxn_opcodes_h_l974_c2_8919
t8_MUX_uxn_opcodes_h_l974_c2_8919 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l974_c2_8919_cond,
t8_MUX_uxn_opcodes_h_l974_c2_8919_iftrue,
t8_MUX_uxn_opcodes_h_l974_c2_8919_iffalse,
t8_MUX_uxn_opcodes_h_l974_c2_8919_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849
BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_left,
BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_right,
BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_return_output);

-- n8_MUX_uxn_opcodes_h_l981_c7_7ff6
n8_MUX_uxn_opcodes_h_l981_c7_7ff6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l981_c7_7ff6_cond,
n8_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue,
n8_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse,
n8_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6
result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_cond,
result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output);

-- t8_MUX_uxn_opcodes_h_l981_c7_7ff6
t8_MUX_uxn_opcodes_h_l981_c7_7ff6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l981_c7_7ff6_cond,
t8_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue,
t8_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse,
t8_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95
BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_left,
BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_right,
BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_return_output);

-- n8_MUX_uxn_opcodes_h_l984_c7_3982
n8_MUX_uxn_opcodes_h_l984_c7_3982 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l984_c7_3982_cond,
n8_MUX_uxn_opcodes_h_l984_c7_3982_iftrue,
n8_MUX_uxn_opcodes_h_l984_c7_3982_iffalse,
n8_MUX_uxn_opcodes_h_l984_c7_3982_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982
result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_cond,
result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982
result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_return_output);

-- t8_MUX_uxn_opcodes_h_l984_c7_3982
t8_MUX_uxn_opcodes_h_l984_c7_3982 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l984_c7_3982_cond,
t8_MUX_uxn_opcodes_h_l984_c7_3982_iftrue,
t8_MUX_uxn_opcodes_h_l984_c7_3982_iffalse,
t8_MUX_uxn_opcodes_h_l984_c7_3982_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47
BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_left,
BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_right,
BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_return_output);

-- n8_MUX_uxn_opcodes_h_l987_c7_d1dc
n8_MUX_uxn_opcodes_h_l987_c7_d1dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l987_c7_d1dc_cond,
n8_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue,
n8_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse,
n8_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc
result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l990_c30_b699
sp_relative_shift_uxn_opcodes_h_l990_c30_b699 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l990_c30_b699_ins,
sp_relative_shift_uxn_opcodes_h_l990_c30_b699_x,
sp_relative_shift_uxn_opcodes_h_l990_c30_b699_y,
sp_relative_shift_uxn_opcodes_h_l990_c30_b699_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l993_c21_891a
BIN_OP_OR_uxn_opcodes_h_l993_c21_891a : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_left,
BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_right,
BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6
BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_left,
BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_right,
BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_return_output,
 n8_MUX_uxn_opcodes_h_l974_c2_8919_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_return_output,
 t8_MUX_uxn_opcodes_h_l974_c2_8919_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_return_output,
 n8_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output,
 t8_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_return_output,
 n8_MUX_uxn_opcodes_h_l984_c7_3982_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_return_output,
 t8_MUX_uxn_opcodes_h_l984_c7_3982_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_return_output,
 n8_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output,
 sp_relative_shift_uxn_opcodes_h_l990_c30_b699_return_output,
 BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l974_c2_8919_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l974_c2_8919_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l974_c2_8919_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l974_c2_8919_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_929d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l974_c2_8919_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l974_c2_8919_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l974_c2_8919_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l974_c2_8919_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l984_c7_3982_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l981_c7_7ff6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l982_c3_6025 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l984_c7_3982_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l981_c7_7ff6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l984_c7_3982_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l984_c7_3982_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l984_c7_3982_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l984_c7_3982_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l984_c7_3982_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l984_c7_3982_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l987_c7_d1dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l992_c3_6bfd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l990_c30_b699_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l990_c30_b699_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l990_c30_b699_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l990_c30_b699_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l996_c3_0eca : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l987_l984_l981_l974_DUPLICATE_2a6f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l984_l981_l974_l995_DUPLICATE_5e47_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l984_l981_l974_l995_DUPLICATE_a072_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l984_l981_l995_DUPLICATE_de60_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l987_l984_DUPLICATE_3983_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1001_l970_DUPLICATE_1be1_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l982_c3_6025 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l982_c3_6025;
     VAR_sp_relative_shift_uxn_opcodes_h_l990_c30_b699_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_929d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_929d;
     VAR_sp_relative_shift_uxn_opcodes_h_l990_c30_b699_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l996_c3_0eca := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l996_c3_0eca;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l992_c3_6bfd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l992_c3_6bfd;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l990_c30_b699_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l974_c2_8919_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l984_c7_3982_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l984_c7_3982_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l974_c2_8919_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l984_c7_3982_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l984_c11_2d95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_left;
     BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_return_output := BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l990_c30_b699] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l990_c30_b699_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l990_c30_b699_ins;
     sp_relative_shift_uxn_opcodes_h_l990_c30_b699_x <= VAR_sp_relative_shift_uxn_opcodes_h_l990_c30_b699_x;
     sp_relative_shift_uxn_opcodes_h_l990_c30_b699_y <= VAR_sp_relative_shift_uxn_opcodes_h_l990_c30_b699_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l990_c30_b699_return_output := sp_relative_shift_uxn_opcodes_h_l990_c30_b699_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l984_l981_l974_l995_DUPLICATE_5e47 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l984_l981_l974_l995_DUPLICATE_5e47_return_output := result.is_stack_write;

     -- BIN_OP_OR[uxn_opcodes_h_l993_c21_891a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_left;
     BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_return_output := BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l974_c6_c31d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_left;
     BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_return_output := BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l984_l981_l995_DUPLICATE_de60 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l984_l981_l995_DUPLICATE_de60_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l995_c11_0cf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_left;
     BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_return_output := BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l987_c11_5f47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_left;
     BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_return_output := BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l984_l981_l974_l995_DUPLICATE_a072 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l984_l981_l974_l995_DUPLICATE_a072_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l987_l984_DUPLICATE_3983 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l987_l984_DUPLICATE_3983_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l981_c11_1849] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_left;
     BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_return_output := BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l987_l984_l981_l974_DUPLICATE_2a6f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l987_l984_l981_l974_DUPLICATE_2a6f_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l974_c2_8919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l974_c2_8919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c6_c31d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l981_c7_7ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l981_c7_7ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l981_c11_1849_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l984_c7_3982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l984_c7_3982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l984_c11_2d95_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l987_c7_d1dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l987_c11_5f47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l995_c11_0cf6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l993_c21_891a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l984_l981_l974_l995_DUPLICATE_a072_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l984_l981_l974_l995_DUPLICATE_a072_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l984_l981_l974_l995_DUPLICATE_a072_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l984_l981_l974_l995_DUPLICATE_a072_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l984_l981_l995_DUPLICATE_de60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l984_l981_l995_DUPLICATE_de60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l984_l981_l995_DUPLICATE_de60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l987_l984_l981_l995_DUPLICATE_de60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l984_l981_l974_l995_DUPLICATE_5e47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l984_l981_l974_l995_DUPLICATE_5e47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l984_l981_l974_l995_DUPLICATE_5e47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l984_l981_l974_l995_DUPLICATE_5e47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l987_l984_DUPLICATE_3983_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l987_l984_DUPLICATE_3983_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l987_l984_l981_l974_DUPLICATE_2a6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l987_l984_l981_l974_DUPLICATE_2a6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l987_l984_l981_l974_DUPLICATE_2a6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l987_l984_l981_l974_DUPLICATE_2a6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l990_c30_b699_return_output;
     -- n8_MUX[uxn_opcodes_h_l987_c7_d1dc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l987_c7_d1dc_cond <= VAR_n8_MUX_uxn_opcodes_h_l987_c7_d1dc_cond;
     n8_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue;
     n8_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output := n8_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l995_c7_3b42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_return_output;

     -- t8_MUX[uxn_opcodes_h_l984_c7_3982] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l984_c7_3982_cond <= VAR_t8_MUX_uxn_opcodes_h_l984_c7_3982_cond;
     t8_MUX_uxn_opcodes_h_l984_c7_3982_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l984_c7_3982_iftrue;
     t8_MUX_uxn_opcodes_h_l984_c7_3982_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l984_c7_3982_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l984_c7_3982_return_output := t8_MUX_uxn_opcodes_h_l984_c7_3982_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l987_c7_d1dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l995_c7_3b42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l995_c7_3b42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l987_c7_d1dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l984_c7_3982_iffalse := VAR_n8_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l995_c7_3b42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l995_c7_3b42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l995_c7_3b42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l984_c7_3982_return_output;
     -- n8_MUX[uxn_opcodes_h_l984_c7_3982] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l984_c7_3982_cond <= VAR_n8_MUX_uxn_opcodes_h_l984_c7_3982_cond;
     n8_MUX_uxn_opcodes_h_l984_c7_3982_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l984_c7_3982_iftrue;
     n8_MUX_uxn_opcodes_h_l984_c7_3982_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l984_c7_3982_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l984_c7_3982_return_output := n8_MUX_uxn_opcodes_h_l984_c7_3982_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l984_c7_3982] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_cond;
     result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_return_output := result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l987_c7_d1dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output;

     -- t8_MUX[uxn_opcodes_h_l981_c7_7ff6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l981_c7_7ff6_cond <= VAR_t8_MUX_uxn_opcodes_h_l981_c7_7ff6_cond;
     t8_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue;
     t8_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output := t8_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l987_c7_d1dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l987_c7_d1dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l984_c7_3982] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l984_c7_3982_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l987_c7_d1dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l984_c7_3982_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l984_c7_3982_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l974_c2_8919_iffalse := VAR_t8_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l981_c7_7ff6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output := result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l984_c7_3982] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_return_output;

     -- t8_MUX[uxn_opcodes_h_l974_c2_8919] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l974_c2_8919_cond <= VAR_t8_MUX_uxn_opcodes_h_l974_c2_8919_cond;
     t8_MUX_uxn_opcodes_h_l974_c2_8919_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l974_c2_8919_iftrue;
     t8_MUX_uxn_opcodes_h_l974_c2_8919_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l974_c2_8919_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l974_c2_8919_return_output := t8_MUX_uxn_opcodes_h_l974_c2_8919_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l981_c7_7ff6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l984_c7_3982] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_return_output;

     -- n8_MUX[uxn_opcodes_h_l981_c7_7ff6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l981_c7_7ff6_cond <= VAR_n8_MUX_uxn_opcodes_h_l981_c7_7ff6_cond;
     n8_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue;
     n8_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output := n8_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l984_c7_3982] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l974_c2_8919_iffalse := VAR_n8_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l984_c7_3982_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l984_c7_3982_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l984_c7_3982_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l974_c2_8919_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l981_c7_7ff6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output;

     -- n8_MUX[uxn_opcodes_h_l974_c2_8919] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l974_c2_8919_cond <= VAR_n8_MUX_uxn_opcodes_h_l974_c2_8919_cond;
     n8_MUX_uxn_opcodes_h_l974_c2_8919_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l974_c2_8919_iftrue;
     n8_MUX_uxn_opcodes_h_l974_c2_8919_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l974_c2_8919_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l974_c2_8919_return_output := n8_MUX_uxn_opcodes_h_l974_c2_8919_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l974_c2_8919] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_cond;
     result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_return_output := result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l974_c2_8919] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l981_c7_7ff6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l981_c7_7ff6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l974_c2_8919_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l981_c7_7ff6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l974_c2_8919] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l974_c2_8919] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l974_c2_8919] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1001_l970_DUPLICATE_1be1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1001_l970_DUPLICATE_1be1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l974_c2_8919_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c2_8919_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c2_8919_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c2_8919_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c2_8919_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1001_l970_DUPLICATE_1be1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l1001_l970_DUPLICATE_1be1_return_output;
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
