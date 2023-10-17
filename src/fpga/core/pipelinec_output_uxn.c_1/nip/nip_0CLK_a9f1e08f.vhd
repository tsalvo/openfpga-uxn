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
-- BIN_OP_EQ[uxn_opcodes_h_l2278_c6_fbfe]
signal BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2278_c1_870b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2278_c2_b37c]
signal t8_MUX_uxn_opcodes_h_l2278_c2_b37c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2278_c2_b37c]
signal result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2278_c2_b37c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2278_c2_b37c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2278_c2_b37c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2278_c2_b37c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2278_c2_b37c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l2279_c3_f05a[uxn_opcodes_h_l2279_c3_f05a]
signal printf_uxn_opcodes_h_l2279_c3_f05a_uxn_opcodes_h_l2279_c3_f05a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_561f]
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2283_c7_d65f]
signal t8_MUX_uxn_opcodes_h_l2283_c7_d65f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_d65f]
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_d65f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_d65f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2283_c7_d65f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2283_c7_d65f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_d65f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2286_c11_1433]
signal BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2286_c7_dee2]
signal t8_MUX_uxn_opcodes_h_l2286_c7_dee2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2286_c7_dee2]
signal result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2286_c7_dee2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2286_c7_dee2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2286_c7_dee2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2286_c7_dee2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2286_c7_dee2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2289_c30_14d5]
signal sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2294_c11_64ad]
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2294_c7_6bfa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2294_c7_6bfa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2294_c7_6bfa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe
BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_left,
BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_right,
BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_return_output);

-- t8_MUX_uxn_opcodes_h_l2278_c2_b37c
t8_MUX_uxn_opcodes_h_l2278_c2_b37c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2278_c2_b37c_cond,
t8_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue,
t8_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse,
t8_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c
result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output);

-- printf_uxn_opcodes_h_l2279_c3_f05a_uxn_opcodes_h_l2279_c3_f05a
printf_uxn_opcodes_h_l2279_c3_f05a_uxn_opcodes_h_l2279_c3_f05a : entity work.printf_uxn_opcodes_h_l2279_c3_f05a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2279_c3_f05a_uxn_opcodes_h_l2279_c3_f05a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_left,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_right,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_return_output);

-- t8_MUX_uxn_opcodes_h_l2283_c7_d65f
t8_MUX_uxn_opcodes_h_l2283_c7_d65f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2283_c7_d65f_cond,
t8_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue,
t8_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse,
t8_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433
BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_left,
BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_right,
BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_return_output);

-- t8_MUX_uxn_opcodes_h_l2286_c7_dee2
t8_MUX_uxn_opcodes_h_l2286_c7_dee2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2286_c7_dee2_cond,
t8_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue,
t8_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse,
t8_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2
result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5
sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_ins,
sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_x,
sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_y,
sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_left,
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_right,
BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_return_output,
 t8_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_return_output,
 t8_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_return_output,
 t8_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output,
 sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2278_c2_b37c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_4dfa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2279_c3_f05a_uxn_opcodes_h_l2279_c3_f05a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2283_c7_d65f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2284_c3_d39d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2286_c7_dee2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2291_c3_d5e6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2286_c7_dee2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2286_l2278_DUPLICATE_25c6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2283_l2286_l2278_DUPLICATE_45fb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2283_l2278_l2294_DUPLICATE_9dfc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2283_l2278_l2294_DUPLICATE_6b37_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2286_l2294_DUPLICATE_3206_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2274_l2300_DUPLICATE_5cb6_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2291_c3_d5e6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2291_c3_d5e6;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2284_c3_d39d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2284_c3_d39d;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_4dfa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2280_c3_4dfa;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2286_c7_dee2] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2286_c7_dee2_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2294_c11_64ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2289_c30_14d5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_ins;
     sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_x;
     sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_return_output := sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2286_l2294_DUPLICATE_3206 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2286_l2294_DUPLICATE_3206_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2286_l2278_DUPLICATE_25c6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2286_l2278_DUPLICATE_25c6_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2278_c6_fbfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2283_l2286_l2278_DUPLICATE_45fb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2283_l2286_l2278_DUPLICATE_45fb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_561f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2283_l2278_l2294_DUPLICATE_6b37 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2283_l2278_l2294_DUPLICATE_6b37_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2283_l2278_l2294_DUPLICATE_9dfc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2283_l2278_l2294_DUPLICATE_9dfc_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2286_c11_1433] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_left;
     BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_return_output := BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2278_c2_b37c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c6_fbfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2283_c7_d65f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_561f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2286_c7_dee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_1433_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2294_c11_64ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2283_l2286_l2278_DUPLICATE_45fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2283_l2286_l2278_DUPLICATE_45fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2283_l2286_l2278_DUPLICATE_45fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2286_l2294_DUPLICATE_3206_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2286_l2294_DUPLICATE_3206_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2283_l2286_l2294_DUPLICATE_3206_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2283_l2278_l2294_DUPLICATE_6b37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2283_l2278_l2294_DUPLICATE_6b37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2283_l2278_l2294_DUPLICATE_6b37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2283_l2278_l2294_DUPLICATE_9dfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2283_l2278_l2294_DUPLICATE_9dfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2283_l2278_l2294_DUPLICATE_9dfc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2286_l2278_DUPLICATE_25c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2286_l2278_DUPLICATE_25c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2283_l2286_l2278_DUPLICATE_25c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2286_c7_dee2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2289_c30_14d5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2286_c7_dee2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2294_c7_6bfa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2286_c7_dee2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2286_c7_dee2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2294_c7_6bfa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2278_c1_870b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2286_c7_dee2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2286_c7_dee2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2286_c7_dee2_cond;
     t8_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue;
     t8_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output := t8_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2294_c7_6bfa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l2279_c3_f05a_uxn_opcodes_h_l2279_c3_f05a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2278_c1_870b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2294_c7_6bfa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2286_c7_dee2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2283_c7_d65f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2283_c7_d65f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2283_c7_d65f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2283_c7_d65f_cond;
     t8_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue;
     t8_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output := t8_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2286_c7_dee2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_d65f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2286_c7_dee2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_d65f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output;

     -- printf_uxn_opcodes_h_l2279_c3_f05a[uxn_opcodes_h_l2279_c3_f05a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2279_c3_f05a_uxn_opcodes_h_l2279_c3_f05a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2279_c3_f05a_uxn_opcodes_h_l2279_c3_f05a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_dee2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output;
     -- t8_MUX[uxn_opcodes_h_l2278_c2_b37c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2278_c2_b37c_cond <= VAR_t8_MUX_uxn_opcodes_h_l2278_c2_b37c_cond;
     t8_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue;
     t8_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output := t8_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_d65f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2283_c7_d65f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2283_c7_d65f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2278_c2_b37c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2278_c2_b37c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2278_c2_b37c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_d65f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2278_c2_b37c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2278_c2_b37c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2278_c2_b37c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2274_l2300_DUPLICATE_5cb6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2274_l2300_DUPLICATE_5cb6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c2_b37c_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2274_l2300_DUPLICATE_5cb6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2274_l2300_DUPLICATE_5cb6_return_output;
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
