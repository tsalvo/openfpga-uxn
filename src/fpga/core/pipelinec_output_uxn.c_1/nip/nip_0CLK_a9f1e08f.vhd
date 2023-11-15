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
-- BIN_OP_EQ[uxn_opcodes_h_l2024_c6_c4f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2024_c1_9c55]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2024_c2_e1a1]
signal t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2024_c2_e1a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2024_c2_e1a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2024_c2_e1a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2024_c2_e1a1]
signal result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2024_c2_e1a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2024_c2_e1a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2025_c3_cd22[uxn_opcodes_h_l2025_c3_cd22]
signal printf_uxn_opcodes_h_l2025_c3_cd22_uxn_opcodes_h_l2025_c3_cd22_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_e1ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2029_c7_e258]
signal t8_MUX_uxn_opcodes_h_l2029_c7_e258_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2029_c7_e258_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_e258]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_e258]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_e258]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_e258]
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_e258]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2029_c7_e258]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2032_c11_3b29]
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2032_c7_b608]
signal t8_MUX_uxn_opcodes_h_l2032_c7_b608_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2032_c7_b608_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2032_c7_b608]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2032_c7_b608]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2032_c7_b608]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2032_c7_b608]
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2032_c7_b608]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2032_c7_b608]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2035_c30_93f8]
signal sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_4591]
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c7_e6e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c7_e6e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2040_c7_e6e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6
BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_return_output);

-- t8_MUX_uxn_opcodes_h_l2024_c2_e1a1
t8_MUX_uxn_opcodes_h_l2024_c2_e1a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond,
t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue,
t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse,
t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1
result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output);

-- printf_uxn_opcodes_h_l2025_c3_cd22_uxn_opcodes_h_l2025_c3_cd22
printf_uxn_opcodes_h_l2025_c3_cd22_uxn_opcodes_h_l2025_c3_cd22 : entity work.printf_uxn_opcodes_h_l2025_c3_cd22_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2025_c3_cd22_uxn_opcodes_h_l2025_c3_cd22_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_return_output);

-- t8_MUX_uxn_opcodes_h_l2029_c7_e258
t8_MUX_uxn_opcodes_h_l2029_c7_e258 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2029_c7_e258_cond,
t8_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue,
t8_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse,
t8_MUX_uxn_opcodes_h_l2029_c7_e258_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_cond,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_left,
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_right,
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_return_output);

-- t8_MUX_uxn_opcodes_h_l2032_c7_b608
t8_MUX_uxn_opcodes_h_l2032_c7_b608 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2032_c7_b608_cond,
t8_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue,
t8_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse,
t8_MUX_uxn_opcodes_h_l2032_c7_b608_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608
result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_cond,
result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8
sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_ins,
sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_x,
sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_y,
sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_left,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_right,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_return_output,
 t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_return_output,
 t8_MUX_uxn_opcodes_h_l2029_c7_e258_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_return_output,
 t8_MUX_uxn_opcodes_h_l2032_c7_b608_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_return_output,
 sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2029_c7_e258_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2026_c3_3e63 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2025_c3_cd22_uxn_opcodes_h_l2025_c3_cd22_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c7_b608_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2029_c7_e258_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2030_c3_4b88 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c7_b608_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2037_c3_d53d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2032_c7_b608_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2024_l2040_DUPLICATE_1a0b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2032_l2024_DUPLICATE_b8e2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2032_l2024_DUPLICATE_745f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2029_l2024_l2040_DUPLICATE_8a1f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2032_l2040_DUPLICATE_1b6f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2046_l2020_DUPLICATE_ab09_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2030_c3_4b88 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2030_c3_4b88;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2026_c3_3e63 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2026_c3_3e63;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2037_c3_d53d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2037_c3_d53d;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_4591] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_left;
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_return_output := BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2032_l2024_DUPLICATE_745f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2032_l2024_DUPLICATE_745f_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2024_l2040_DUPLICATE_1a0b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2024_l2040_DUPLICATE_1a0b_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_e1ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2029_l2024_l2040_DUPLICATE_8a1f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2029_l2024_l2040_DUPLICATE_8a1f_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2032_c7_b608] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2032_c7_b608_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2032_l2024_DUPLICATE_b8e2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2032_l2024_DUPLICATE_b8e2_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2032_l2040_DUPLICATE_1b6f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2032_l2040_DUPLICATE_1b6f_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l2035_c30_93f8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_ins;
     sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_x;
     sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_return_output := sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2024_c6_c4f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2032_c11_3b29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_left;
     BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_return_output := BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c6_c4f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2029_c7_e258_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_e1ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2032_c7_b608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_3b29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_4591_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2032_l2024_DUPLICATE_b8e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2032_l2024_DUPLICATE_b8e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2032_l2024_DUPLICATE_b8e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2032_l2040_DUPLICATE_1b6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2032_l2040_DUPLICATE_1b6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2032_l2040_DUPLICATE_1b6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2029_l2024_l2040_DUPLICATE_8a1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2029_l2024_l2040_DUPLICATE_8a1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2029_l2024_l2040_DUPLICATE_8a1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2024_l2040_DUPLICATE_1a0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2024_l2040_DUPLICATE_1a0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2024_l2040_DUPLICATE_1a0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2032_l2024_DUPLICATE_745f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2032_l2024_DUPLICATE_745f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2032_l2024_DUPLICATE_745f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2032_c7_b608_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2035_c30_93f8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2024_c1_9c55] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c7_e6e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output;

     -- t8_MUX[uxn_opcodes_h_l2032_c7_b608] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2032_c7_b608_cond <= VAR_t8_MUX_uxn_opcodes_h_l2032_c7_b608_cond;
     t8_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue;
     t8_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2032_c7_b608_return_output := t8_MUX_uxn_opcodes_h_l2032_c7_b608_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2032_c7_b608] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2040_c7_e6e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2032_c7_b608] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_return_output := result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c7_e6e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2032_c7_b608] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l2025_c3_cd22_uxn_opcodes_h_l2025_c3_cd22_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2024_c1_9c55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_e6e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c7_b608_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_b608_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c7_b608_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2032_c7_b608_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_e258] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_return_output := result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_e258] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_return_output;

     -- printf_uxn_opcodes_h_l2025_c3_cd22[uxn_opcodes_h_l2025_c3_cd22] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2025_c3_cd22_uxn_opcodes_h_l2025_c3_cd22_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2025_c3_cd22_uxn_opcodes_h_l2025_c3_cd22_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2032_c7_b608] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_return_output;

     -- t8_MUX[uxn_opcodes_h_l2029_c7_e258] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2029_c7_e258_cond <= VAR_t8_MUX_uxn_opcodes_h_l2029_c7_e258_cond;
     t8_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue;
     t8_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2029_c7_e258_return_output := t8_MUX_uxn_opcodes_h_l2029_c7_e258_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2032_c7_b608] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2032_c7_b608] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_e258] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_b608_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c7_b608_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_b608_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e258_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e258_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e258_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2029_c7_e258_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2024_c2_e1a1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2029_c7_e258] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_e258] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2024_c2_e1a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_e258] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_return_output;

     -- t8_MUX[uxn_opcodes_h_l2024_c2_e1a1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond <= VAR_t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond;
     t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue;
     t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output := t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2024_c2_e1a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e258_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_e258_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e258_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2024_c2_e1a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2024_c2_e1a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2024_c2_e1a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2046_l2020_DUPLICATE_ab09 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2046_l2020_DUPLICATE_ab09_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c2_e1a1_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2046_l2020_DUPLICATE_ab09_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l2046_l2020_DUPLICATE_ab09_return_output;
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
