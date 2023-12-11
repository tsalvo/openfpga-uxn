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
-- BIN_OP_EQ[uxn_opcodes_h_l645_c6_e42b]
signal BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l645_c2_1f31]
signal t16_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l645_c2_1f31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l645_c2_1f31]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l645_c2_1f31]
signal result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l645_c2_1f31]
signal result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l645_c2_1f31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l645_c2_1f31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l645_c2_1f31]
signal result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l645_c2_1f31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l645_c2_1f31]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l658_c11_aa60]
signal BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l658_c7_76fe]
signal t16_MUX_uxn_opcodes_h_l658_c7_76fe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l658_c7_76fe_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l658_c7_76fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l658_c7_76fe]
signal result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l658_c7_76fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l658_c7_76fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l658_c7_76fe]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l661_c11_c20d]
signal BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l661_c7_5a8d]
signal t16_MUX_uxn_opcodes_h_l661_c7_5a8d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l661_c7_5a8d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l661_c7_5a8d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l661_c7_5a8d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l661_c7_5a8d]
signal result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l663_c3_bc9b]
signal CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l665_c11_f248]
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l665_c7_81f9]
signal t16_MUX_uxn_opcodes_h_l665_c7_81f9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c7_81f9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l665_c7_81f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l665_c7_81f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l665_c7_81f9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l665_c7_81f9]
signal result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l666_c3_d8e9]
signal BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l667_c30_e41d]
signal sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_return_output : signed(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_763b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b
BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_left,
BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_right,
BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output);

-- t16_MUX_uxn_opcodes_h_l645_c2_1f31
t16_MUX_uxn_opcodes_h_l645_c2_1f31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l645_c2_1f31_cond,
t16_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue,
t16_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse,
t16_MUX_uxn_opcodes_h_l645_c2_1f31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31
result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31
result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_cond,
result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31
result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31
result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31
result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31
result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31
result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60
BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_left,
BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_right,
BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_return_output);

-- t16_MUX_uxn_opcodes_h_l658_c7_76fe
t16_MUX_uxn_opcodes_h_l658_c7_76fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l658_c7_76fe_cond,
t16_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue,
t16_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse,
t16_MUX_uxn_opcodes_h_l658_c7_76fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe
result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe
result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_cond,
result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d
BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_left,
BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_right,
BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_return_output);

-- t16_MUX_uxn_opcodes_h_l661_c7_5a8d
t16_MUX_uxn_opcodes_h_l661_c7_5a8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l661_c7_5a8d_cond,
t16_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue,
t16_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse,
t16_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d
result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d
result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d
result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d
result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_cond,
result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b
CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b_x,
CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248
BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_left,
BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_right,
BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_return_output);

-- t16_MUX_uxn_opcodes_h_l665_c7_81f9
t16_MUX_uxn_opcodes_h_l665_c7_81f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l665_c7_81f9_cond,
t16_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue,
t16_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse,
t16_MUX_uxn_opcodes_h_l665_c7_81f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9
result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_cond,
result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9
BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_left,
BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_right,
BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l667_c30_e41d
sp_relative_shift_uxn_opcodes_h_l667_c30_e41d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_ins,
sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_x,
sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_y,
sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output,
 t16_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_return_output,
 t16_MUX_uxn_opcodes_h_l658_c7_76fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_return_output,
 t16_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output,
 CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_return_output,
 t16_MUX_uxn_opcodes_h_l665_c7_81f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_return_output,
 sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l658_c7_76fe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l650_c3_a157 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l655_c3_3b66 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l658_c7_76fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l659_c3_164e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l658_c7_76fe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_81f9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l661_c7_5a8d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_81f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l645_l665_l658_l661_DUPLICATE_84eb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_8456_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_b3da_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_dbe6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l662_l666_DUPLICATE_f90d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l673_l641_DUPLICATE_884e_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l659_c3_164e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l659_c3_164e;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l650_c3_a157 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l650_c3_a157;
     VAR_sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l655_c3_3b66 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l655_c3_3b66;
     VAR_sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l658_c11_aa60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_left;
     BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_return_output := BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l645_c6_e42b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_left;
     BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output := BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l645_l665_l658_l661_DUPLICATE_84eb LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l645_l665_l658_l661_DUPLICATE_84eb_return_output := result.u16_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l645_c2_1f31] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l645_c2_1f31_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l665_c11_f248] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_left;
     BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_return_output := BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l645_c2_1f31] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l645_c2_1f31_return_output := result.is_stack_index_flipped;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l645_c2_1f31] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l645_c2_1f31_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l662_l666_DUPLICATE_f90d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l662_l666_DUPLICATE_f90d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l661_c11_c20d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_left;
     BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_return_output := BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l667_c30_e41d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_ins;
     sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_x;
     sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_return_output := sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l645_c2_1f31] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l645_c2_1f31_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_8456 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_8456_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l658_c7_76fe] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l658_c7_76fe_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_b3da LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_b3da_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_dbe6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_dbe6_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l645_c2_1f31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c6_e42b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l658_c7_76fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_aa60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l661_c7_5a8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_c20d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_81f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_f248_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l662_l666_DUPLICATE_f90d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l662_l666_DUPLICATE_f90d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_b3da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_b3da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_b3da_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l645_l665_l658_l661_DUPLICATE_84eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l645_l665_l658_l661_DUPLICATE_84eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l645_l665_l658_l661_DUPLICATE_84eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l645_l665_l658_l661_DUPLICATE_84eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_8456_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_8456_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_8456_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_dbe6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_dbe6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l665_l658_l661_DUPLICATE_dbe6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l645_c2_1f31_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l645_c2_1f31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l645_c2_1f31_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l645_c2_1f31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l658_c7_76fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l667_c30_e41d_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l666_c3_d8e9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_left;
     BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_return_output := BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l658_c7_76fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l665_c7_81f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l665_c7_81f9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l665_c7_81f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l663_c3_bc9b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b_return_output := CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l645_c2_1f31] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l645_c2_1f31] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l645_c2_1f31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l645_c2_1f31] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l666_c3_d8e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l663_c3_bc9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_81f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l665_c7_81f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_81f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c7_76fe_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l661_c7_5a8d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l665_c7_81f9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_return_output := result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l645_c2_1f31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l661_c7_5a8d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output;

     -- t16_MUX[uxn_opcodes_h_l665_c7_81f9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l665_c7_81f9_cond <= VAR_t16_MUX_uxn_opcodes_h_l665_c7_81f9_cond;
     t16_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l665_c7_81f9_iftrue;
     t16_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l665_c7_81f9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_81f9_return_output := t16_MUX_uxn_opcodes_h_l665_c7_81f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l661_c7_5a8d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l665_c7_81f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l665_c7_81f9_return_output;
     -- t16_MUX[uxn_opcodes_h_l661_c7_5a8d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l661_c7_5a8d_cond <= VAR_t16_MUX_uxn_opcodes_h_l661_c7_5a8d_cond;
     t16_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue;
     t16_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output := t16_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l658_c7_76fe] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l658_c7_76fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l661_c7_5a8d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output := result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l658_c7_76fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_76fe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_76fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_76fe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse := VAR_t16_MUX_uxn_opcodes_h_l661_c7_5a8d_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l645_c2_1f31] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l645_c2_1f31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_return_output;

     -- t16_MUX[uxn_opcodes_h_l658_c7_76fe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l658_c7_76fe_cond <= VAR_t16_MUX_uxn_opcodes_h_l658_c7_76fe_cond;
     t16_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue;
     t16_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l658_c7_76fe_return_output := t16_MUX_uxn_opcodes_h_l658_c7_76fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l645_c2_1f31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l658_c7_76fe] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_cond;
     result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_return_output := result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c7_76fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse := VAR_t16_MUX_uxn_opcodes_h_l658_c7_76fe_return_output;
     -- t16_MUX[uxn_opcodes_h_l645_c2_1f31] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l645_c2_1f31_cond <= VAR_t16_MUX_uxn_opcodes_h_l645_c2_1f31_cond;
     t16_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue;
     t16_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l645_c2_1f31_return_output := t16_MUX_uxn_opcodes_h_l645_c2_1f31_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l645_c2_1f31] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_cond;
     result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_return_output := result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_return_output;

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l645_c2_1f31_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l673_l641_DUPLICATE_884e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l673_l641_DUPLICATE_884e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_763b(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l645_c2_1f31_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c2_1f31_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l673_l641_DUPLICATE_884e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l673_l641_DUPLICATE_884e_return_output;
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
