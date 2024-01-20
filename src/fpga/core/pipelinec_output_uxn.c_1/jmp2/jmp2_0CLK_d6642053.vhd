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
entity jmp2_0CLK_d6642053 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp2_0CLK_d6642053;
architecture arch of jmp2_0CLK_d6642053 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l623_c6_b180]
signal BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l623_c2_d5ac]
signal t16_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l623_c2_d5ac]
signal result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l623_c2_d5ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l623_c2_d5ac]
signal result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l623_c2_d5ac]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l623_c2_d5ac]
signal result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l623_c2_d5ac]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l623_c2_d5ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l623_c2_d5ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l623_c2_d5ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l636_c11_1069]
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l636_c7_c1cf]
signal t16_MUX_uxn_opcodes_h_l636_c7_c1cf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l636_c7_c1cf]
signal result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l636_c7_c1cf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l636_c7_c1cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l636_c7_c1cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l636_c7_c1cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l639_c11_869c]
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l639_c7_7099]
signal t16_MUX_uxn_opcodes_h_l639_c7_7099_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l639_c7_7099_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l639_c7_7099_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l639_c7_7099_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l639_c7_7099]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l639_c7_7099]
signal result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l639_c7_7099]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l639_c7_7099]
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l641_c3_23d9]
signal CONST_SL_8_uxn_opcodes_h_l641_c3_23d9_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l641_c3_23d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l643_c11_3b42]
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l643_c7_57f8]
signal t16_MUX_uxn_opcodes_h_l643_c7_57f8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l643_c7_57f8_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l643_c7_57f8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l643_c7_57f8]
signal result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l643_c7_57f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l643_c7_57f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l644_c3_cf07]
signal BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l645_c30_a2ab]
signal sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_return_output : signed(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180
BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_left,
BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_right,
BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output);

-- t16_MUX_uxn_opcodes_h_l623_c2_d5ac
t16_MUX_uxn_opcodes_h_l623_c2_d5ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l623_c2_d5ac_cond,
t16_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue,
t16_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse,
t16_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac
result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac
result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac
result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac
result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_cond,
result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac
result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069
BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_left,
BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_right,
BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_return_output);

-- t16_MUX_uxn_opcodes_h_l636_c7_c1cf
t16_MUX_uxn_opcodes_h_l636_c7_c1cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l636_c7_c1cf_cond,
t16_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue,
t16_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse,
t16_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf
result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_cond,
result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c
BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_left,
BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_right,
BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_return_output);

-- t16_MUX_uxn_opcodes_h_l639_c7_7099
t16_MUX_uxn_opcodes_h_l639_c7_7099 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l639_c7_7099_cond,
t16_MUX_uxn_opcodes_h_l639_c7_7099_iftrue,
t16_MUX_uxn_opcodes_h_l639_c7_7099_iffalse,
t16_MUX_uxn_opcodes_h_l639_c7_7099_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099
result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_cond,
result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_return_output);

-- CONST_SL_8_uxn_opcodes_h_l641_c3_23d9
CONST_SL_8_uxn_opcodes_h_l641_c3_23d9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l641_c3_23d9_x,
CONST_SL_8_uxn_opcodes_h_l641_c3_23d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42
BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_left,
BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_right,
BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_return_output);

-- t16_MUX_uxn_opcodes_h_l643_c7_57f8
t16_MUX_uxn_opcodes_h_l643_c7_57f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l643_c7_57f8_cond,
t16_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue,
t16_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse,
t16_MUX_uxn_opcodes_h_l643_c7_57f8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8
result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_cond,
result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07
BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_left,
BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_right,
BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_return_output);

-- sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab
sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_ins,
sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_x,
sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_y,
sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output,
 t16_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_return_output,
 t16_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_return_output,
 t16_MUX_uxn_opcodes_h_l639_c7_7099_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_return_output,
 CONST_SL_8_uxn_opcodes_h_l641_c3_23d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_return_output,
 t16_MUX_uxn_opcodes_h_l643_c7_57f8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_return_output,
 sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l628_c3_d7cd : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l633_c3_c401 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l639_c7_7099_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l636_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_551a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l636_c7_c1cf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l639_c7_7099_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l639_c7_7099_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l643_c7_57f8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l639_c7_7099_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l641_c3_23d9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l641_c3_23d9_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l643_c7_57f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l643_l639_l636_l623_DUPLICATE_283c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_cb15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_40fd_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_3ac1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l640_l644_DUPLICATE_1717_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l651_l619_DUPLICATE_907a_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_551a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_551a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l628_c3_d7cd := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l628_c3_d7cd;
     VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l633_c3_c401 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l633_c3_c401;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_3ac1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_3ac1_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l636_c7_c1cf] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l636_c7_c1cf_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_cb15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_cb15_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_40fd LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_40fd_return_output := result.sp_relative_shift;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l623_c2_d5ac] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l623_c2_d5ac_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l623_c2_d5ac] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l623_c2_d5ac_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l643_l639_l636_l623_DUPLICATE_283c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l643_l639_l636_l623_DUPLICATE_283c_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l623_c6_b180] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_left;
     BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output := BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l640_l644_DUPLICATE_1717 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l640_l644_DUPLICATE_1717_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l623_c2_d5ac] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l623_c2_d5ac_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l639_c11_869c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_left;
     BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_return_output := BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l645_c30_a2ab] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_ins;
     sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_x <= VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_x;
     sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_y <= VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_return_output := sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l623_c2_d5ac] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l623_c2_d5ac_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l643_c11_3b42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_left;
     BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_return_output := BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l636_c11_1069] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_left;
     BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_return_output := BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l623_c2_d5ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l623_c6_b180_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l636_c7_c1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_1069_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l639_c7_7099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_869c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l643_c7_57f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_3b42_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l640_l644_DUPLICATE_1717_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l641_c3_23d9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l640_l644_DUPLICATE_1717_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_40fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_40fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_40fd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l643_l639_l636_l623_DUPLICATE_283c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l643_l639_l636_l623_DUPLICATE_283c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l643_l639_l636_l623_DUPLICATE_283c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l643_l639_l636_l623_DUPLICATE_283c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_3ac1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_3ac1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_3ac1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_cb15_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_cb15_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l643_l639_l636_DUPLICATE_cb15_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l623_c2_d5ac_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l623_c2_d5ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l623_c2_d5ac_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l623_c2_d5ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l636_c7_c1cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l645_c30_a2ab_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l636_c7_c1cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l644_c3_cf07] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_left;
     BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_return_output := BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l643_c7_57f8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l623_c2_d5ac] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l623_c2_d5ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l643_c7_57f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l623_c2_d5ac] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l643_c7_57f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l623_c2_d5ac] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l641_c3_23d9] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l641_c3_23d9_x <= VAR_CONST_SL_8_uxn_opcodes_h_l641_c3_23d9_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l641_c3_23d9_return_output := CONST_SL_8_uxn_opcodes_h_l641_c3_23d9_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l644_c3_cf07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l639_c7_7099_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l641_c3_23d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_57f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_57f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_57f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l639_c7_7099] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l639_c7_7099] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l643_c7_57f8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_return_output := result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_return_output;

     -- t16_MUX[uxn_opcodes_h_l643_c7_57f8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l643_c7_57f8_cond <= VAR_t16_MUX_uxn_opcodes_h_l643_c7_57f8_cond;
     t16_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l643_c7_57f8_iftrue;
     t16_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l643_c7_57f8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l643_c7_57f8_return_output := t16_MUX_uxn_opcodes_h_l643_c7_57f8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l639_c7_7099] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l623_c2_d5ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_7099_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_7099_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_7099_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l643_c7_57f8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l639_c7_7099_iffalse := VAR_t16_MUX_uxn_opcodes_h_l643_c7_57f8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l636_c7_c1cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output;

     -- t16_MUX[uxn_opcodes_h_l639_c7_7099] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l639_c7_7099_cond <= VAR_t16_MUX_uxn_opcodes_h_l639_c7_7099_cond;
     t16_MUX_uxn_opcodes_h_l639_c7_7099_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l639_c7_7099_iftrue;
     t16_MUX_uxn_opcodes_h_l639_c7_7099_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l639_c7_7099_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l639_c7_7099_return_output := t16_MUX_uxn_opcodes_h_l639_c7_7099_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l636_c7_c1cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l639_c7_7099] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_cond;
     result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_return_output := result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l636_c7_c1cf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l639_c7_7099_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l639_c7_7099_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l623_c2_d5ac] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l623_c2_d5ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output;

     -- t16_MUX[uxn_opcodes_h_l636_c7_c1cf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l636_c7_c1cf_cond <= VAR_t16_MUX_uxn_opcodes_h_l636_c7_c1cf_cond;
     t16_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue;
     t16_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output := t16_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l623_c2_d5ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l636_c7_c1cf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output := result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse := VAR_t16_MUX_uxn_opcodes_h_l636_c7_c1cf_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l623_c2_d5ac] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_cond;
     result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output := result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output;

     -- t16_MUX[uxn_opcodes_h_l623_c2_d5ac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l623_c2_d5ac_cond <= VAR_t16_MUX_uxn_opcodes_h_l623_c2_d5ac_cond;
     t16_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l623_c2_d5ac_iftrue;
     t16_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l623_c2_d5ac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output := t16_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output;

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l651_l619_DUPLICATE_907a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l651_l619_DUPLICATE_907a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l623_c2_d5ac_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l651_l619_DUPLICATE_907a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l651_l619_DUPLICATE_907a_return_output;
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
