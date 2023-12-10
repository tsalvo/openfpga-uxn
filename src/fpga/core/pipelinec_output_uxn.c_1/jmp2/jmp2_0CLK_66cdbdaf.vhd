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
-- Submodules: 35
entity jmp2_0CLK_66cdbdaf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp2_0CLK_66cdbdaf;
architecture arch of jmp2_0CLK_66cdbdaf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l616_c6_401a]
signal BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l616_c2_6773]
signal t16_MUX_uxn_opcodes_h_l616_c2_6773_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l616_c2_6773_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l616_c2_6773_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l616_c2_6773_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l616_c2_6773]
signal result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l616_c2_6773]
signal result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l616_c2_6773]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l616_c2_6773]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l616_c2_6773]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l623_c11_7cf1]
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l623_c7_c040]
signal t16_MUX_uxn_opcodes_h_l623_c7_c040_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c7_c040_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c7_c040_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c7_c040_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l623_c7_c040]
signal result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l623_c7_c040]
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l623_c7_c040]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l623_c7_c040]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l623_c7_c040]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l626_c11_1765]
signal BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l626_c7_8f95]
signal t16_MUX_uxn_opcodes_h_l626_c7_8f95_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l626_c7_8f95_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l626_c7_8f95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l626_c7_8f95]
signal result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l626_c7_8f95]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l626_c7_8f95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_return_output : signed(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l628_c3_c7f4]
signal CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l630_c11_c7d7]
signal BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l630_c7_e8ce]
signal t16_MUX_uxn_opcodes_h_l630_c7_e8ce_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l630_c7_e8ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l630_c7_e8ce]
signal result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l630_c7_e8ce]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l630_c7_e8ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l631_c3_d3d3]
signal BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l633_c30_691f]
signal sp_relative_shift_uxn_opcodes_h_l633_c30_691f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l633_c30_691f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l633_c30_691f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l633_c30_691f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l637_c11_3da5]
signal BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l637_c7_ce88]
signal result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l637_c7_ce88]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l637_c7_ce88]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_return_output : signed(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a
BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_left,
BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_right,
BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_return_output);

-- t16_MUX_uxn_opcodes_h_l616_c2_6773
t16_MUX_uxn_opcodes_h_l616_c2_6773 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l616_c2_6773_cond,
t16_MUX_uxn_opcodes_h_l616_c2_6773_iftrue,
t16_MUX_uxn_opcodes_h_l616_c2_6773_iffalse,
t16_MUX_uxn_opcodes_h_l616_c2_6773_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773
result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_cond,
result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773
result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773
result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1
BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_left,
BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_right,
BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_return_output);

-- t16_MUX_uxn_opcodes_h_l623_c7_c040
t16_MUX_uxn_opcodes_h_l623_c7_c040 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l623_c7_c040_cond,
t16_MUX_uxn_opcodes_h_l623_c7_c040_iftrue,
t16_MUX_uxn_opcodes_h_l623_c7_c040_iffalse,
t16_MUX_uxn_opcodes_h_l623_c7_c040_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040
result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_cond,
result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765
BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_left,
BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_right,
BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_return_output);

-- t16_MUX_uxn_opcodes_h_l626_c7_8f95
t16_MUX_uxn_opcodes_h_l626_c7_8f95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l626_c7_8f95_cond,
t16_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue,
t16_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse,
t16_MUX_uxn_opcodes_h_l626_c7_8f95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95
result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95
result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_cond,
result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95
result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95
result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_return_output);

-- CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4
CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4_x,
CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7
BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_left,
BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_right,
BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_return_output);

-- t16_MUX_uxn_opcodes_h_l630_c7_e8ce
t16_MUX_uxn_opcodes_h_l630_c7_e8ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l630_c7_e8ce_cond,
t16_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue,
t16_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse,
t16_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce
result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_cond,
result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3
BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_left,
BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_right,
BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l633_c30_691f
sp_relative_shift_uxn_opcodes_h_l633_c30_691f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l633_c30_691f_ins,
sp_relative_shift_uxn_opcodes_h_l633_c30_691f_x,
sp_relative_shift_uxn_opcodes_h_l633_c30_691f_y,
sp_relative_shift_uxn_opcodes_h_l633_c30_691f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5
BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_left,
BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_right,
BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88
result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88
result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88
result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_return_output,
 t16_MUX_uxn_opcodes_h_l616_c2_6773_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_return_output,
 t16_MUX_uxn_opcodes_h_l623_c7_c040_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_return_output,
 t16_MUX_uxn_opcodes_h_l626_c7_8f95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_return_output,
 CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_return_output,
 t16_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output,
 BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_return_output,
 sp_relative_shift_uxn_opcodes_h_l633_c30_691f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l616_c2_6773_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l616_c2_6773_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_c040_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l616_c2_6773_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l616_c2_6773_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l620_c3_383c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_c040_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_c040_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l626_c7_8f95_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c7_c040_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l624_c3_aec5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l623_c7_c040_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l626_c7_8f95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l630_c7_e8ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l633_c30_691f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l633_c30_691f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l633_c30_691f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l633_c30_691f_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l638_c3_ac22 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l616_l630_l623_l626_DUPLICATE_892a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l616_l623_l637_l626_DUPLICATE_6de2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l616_l623_l637_l626_DUPLICATE_0191_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l623_l637_l626_DUPLICATE_3fc5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l627_l631_DUPLICATE_0542_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l643_l612_DUPLICATE_5fd4_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l620_c3_383c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l620_c3_383c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l633_c30_691f_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l624_c3_aec5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l624_c3_aec5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l633_c30_691f_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l638_c3_ac22 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l638_c3_ac22;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l633_c30_691f_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l616_c2_6773_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_c040_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l626_c11_1765] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_left;
     BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_return_output := BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l633_c30_691f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l633_c30_691f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l633_c30_691f_ins;
     sp_relative_shift_uxn_opcodes_h_l633_c30_691f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l633_c30_691f_x;
     sp_relative_shift_uxn_opcodes_h_l633_c30_691f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l633_c30_691f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l633_c30_691f_return_output := sp_relative_shift_uxn_opcodes_h_l633_c30_691f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l616_l623_l637_l626_DUPLICATE_0191 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l616_l623_l637_l626_DUPLICATE_0191_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l627_l631_DUPLICATE_0542 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l627_l631_DUPLICATE_0542_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l616_c6_401a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_left;
     BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_return_output := BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l616_l623_l637_l626_DUPLICATE_6de2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l616_l623_l637_l626_DUPLICATE_6de2_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l630_c11_c7d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l623_l637_l626_DUPLICATE_3fc5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l623_l637_l626_DUPLICATE_3fc5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l637_c11_3da5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_left;
     BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_return_output := BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l623_c11_7cf1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_left;
     BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_return_output := BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l616_l630_l623_l626_DUPLICATE_892a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l616_l630_l623_l626_DUPLICATE_892a_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l623_c7_c040] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l623_c7_c040_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l616_c2_6773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c6_401a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_c040_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c11_7cf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l626_c7_8f95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_1765_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l630_c7_e8ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l630_c11_c7d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_3da5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l627_l631_DUPLICATE_0542_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l627_l631_DUPLICATE_0542_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l616_l623_l637_l626_DUPLICATE_0191_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l616_l623_l637_l626_DUPLICATE_0191_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l616_l623_l637_l626_DUPLICATE_0191_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l616_l623_l637_l626_DUPLICATE_0191_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l616_l630_l623_l626_DUPLICATE_892a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l616_l630_l623_l626_DUPLICATE_892a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l616_l630_l623_l626_DUPLICATE_892a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l616_l630_l623_l626_DUPLICATE_892a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l623_l637_l626_DUPLICATE_3fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l623_l637_l626_DUPLICATE_3fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l623_l637_l626_DUPLICATE_3fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l630_l623_l637_l626_DUPLICATE_3fc5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l616_l623_l637_l626_DUPLICATE_6de2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l616_l623_l637_l626_DUPLICATE_6de2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l616_l623_l637_l626_DUPLICATE_6de2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l616_l623_l637_l626_DUPLICATE_6de2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l623_c7_c040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l633_c30_691f_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l637_c7_ce88] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l623_c7_c040] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l631_c3_d3d3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_left;
     BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_return_output := BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l637_c7_ce88] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l637_c7_ce88] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l628_c3_c7f4] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4_x <= VAR_CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4_return_output := CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l631_c3_d3d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l628_c3_c7f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_ce88_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_ce88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_ce88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c7_c040_return_output;
     -- t16_MUX[uxn_opcodes_h_l630_c7_e8ce] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l630_c7_e8ce_cond <= VAR_t16_MUX_uxn_opcodes_h_l630_c7_e8ce_cond;
     t16_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue;
     t16_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output := t16_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l630_c7_e8ce] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l630_c7_e8ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l630_c7_e8ce] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_cond;
     result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output := result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l616_c2_6773] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l630_c7_e8ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse := VAR_t16_MUX_uxn_opcodes_h_l630_c7_e8ce_return_output;
     -- t16_MUX[uxn_opcodes_h_l626_c7_8f95] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l626_c7_8f95_cond <= VAR_t16_MUX_uxn_opcodes_h_l626_c7_8f95_cond;
     t16_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue;
     t16_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l626_c7_8f95_return_output := t16_MUX_uxn_opcodes_h_l626_c7_8f95_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l626_c7_8f95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l626_c7_8f95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l626_c7_8f95] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l626_c7_8f95] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_cond;
     result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_return_output := result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_8f95_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_8f95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_8f95_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_8f95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_c040_iffalse := VAR_t16_MUX_uxn_opcodes_h_l626_c7_8f95_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l623_c7_c040] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_cond;
     result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_return_output := result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l623_c7_c040] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l623_c7_c040] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l623_c7_c040] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_return_output;

     -- t16_MUX[uxn_opcodes_h_l623_c7_c040] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l623_c7_c040_cond <= VAR_t16_MUX_uxn_opcodes_h_l623_c7_c040_cond;
     t16_MUX_uxn_opcodes_h_l623_c7_c040_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l623_c7_c040_iftrue;
     t16_MUX_uxn_opcodes_h_l623_c7_c040_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l623_c7_c040_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l623_c7_c040_return_output := t16_MUX_uxn_opcodes_h_l623_c7_c040_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c7_c040_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c7_c040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c7_c040_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c7_c040_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l616_c2_6773_iffalse := VAR_t16_MUX_uxn_opcodes_h_l623_c7_c040_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l616_c2_6773] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l616_c2_6773] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_return_output;

     -- t16_MUX[uxn_opcodes_h_l616_c2_6773] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l616_c2_6773_cond <= VAR_t16_MUX_uxn_opcodes_h_l616_c2_6773_cond;
     t16_MUX_uxn_opcodes_h_l616_c2_6773_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l616_c2_6773_iftrue;
     t16_MUX_uxn_opcodes_h_l616_c2_6773_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l616_c2_6773_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l616_c2_6773_return_output := t16_MUX_uxn_opcodes_h_l616_c2_6773_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l616_c2_6773] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l616_c2_6773] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_cond;
     result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_return_output := result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_return_output;

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l616_c2_6773_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l643_l612_DUPLICATE_5fd4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l643_l612_DUPLICATE_5fd4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l616_c2_6773_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c2_6773_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c2_6773_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l616_c2_6773_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l616_c2_6773_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l643_l612_DUPLICATE_5fd4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l643_l612_DUPLICATE_5fd4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
