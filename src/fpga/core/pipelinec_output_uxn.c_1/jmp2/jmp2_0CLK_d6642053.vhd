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
-- BIN_OP_EQ[uxn_opcodes_h_l624_c6_c2dc]
signal BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l624_c2_e3bf]
signal t16_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l624_c2_e3bf]
signal result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l624_c2_e3bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l624_c2_e3bf]
signal result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l624_c2_e3bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l624_c2_e3bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l624_c2_e3bf]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l624_c2_e3bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l624_c2_e3bf]
signal result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l624_c2_e3bf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l637_c11_67a9]
signal BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l637_c7_1d03]
signal t16_MUX_uxn_opcodes_h_l637_c7_1d03_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l637_c7_1d03_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l637_c7_1d03]
signal result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l637_c7_1d03]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l637_c7_1d03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l637_c7_1d03]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l637_c7_1d03]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l640_c11_a23e]
signal BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l640_c7_e75d]
signal t16_MUX_uxn_opcodes_h_l640_c7_e75d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l640_c7_e75d_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l640_c7_e75d]
signal result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l640_c7_e75d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l640_c7_e75d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l640_c7_e75d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l642_c3_dba6]
signal CONST_SL_8_uxn_opcodes_h_l642_c3_dba6_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l642_c3_dba6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l644_c11_51e2]
signal BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l644_c7_3e80]
signal t16_MUX_uxn_opcodes_h_l644_c7_3e80_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l644_c7_3e80_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l644_c7_3e80]
signal result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l644_c7_3e80]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l644_c7_3e80]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l644_c7_3e80]
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l645_c3_9d9c]
signal BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l646_c30_5eac]
signal sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_return_output : signed(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3dff( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc
BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_left,
BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_right,
BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output);

-- t16_MUX_uxn_opcodes_h_l624_c2_e3bf
t16_MUX_uxn_opcodes_h_l624_c2_e3bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l624_c2_e3bf_cond,
t16_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue,
t16_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse,
t16_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf
result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_cond,
result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf
result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf
result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf
result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9
BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_left,
BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_right,
BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_return_output);

-- t16_MUX_uxn_opcodes_h_l637_c7_1d03
t16_MUX_uxn_opcodes_h_l637_c7_1d03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l637_c7_1d03_cond,
t16_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue,
t16_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse,
t16_MUX_uxn_opcodes_h_l637_c7_1d03_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03
result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_cond,
result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03
result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03
result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03
result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e
BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_left,
BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_right,
BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_return_output);

-- t16_MUX_uxn_opcodes_h_l640_c7_e75d
t16_MUX_uxn_opcodes_h_l640_c7_e75d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l640_c7_e75d_cond,
t16_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue,
t16_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse,
t16_MUX_uxn_opcodes_h_l640_c7_e75d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d
result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_cond,
result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l642_c3_dba6
CONST_SL_8_uxn_opcodes_h_l642_c3_dba6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l642_c3_dba6_x,
CONST_SL_8_uxn_opcodes_h_l642_c3_dba6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2
BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_left,
BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_right,
BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_return_output);

-- t16_MUX_uxn_opcodes_h_l644_c7_3e80
t16_MUX_uxn_opcodes_h_l644_c7_3e80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l644_c7_3e80_cond,
t16_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue,
t16_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse,
t16_MUX_uxn_opcodes_h_l644_c7_3e80_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80
result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_cond,
result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80
result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c
BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_left,
BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_right,
BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l646_c30_5eac
sp_relative_shift_uxn_opcodes_h_l646_c30_5eac : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_ins,
sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_x,
sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_y,
sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output,
 t16_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_return_output,
 t16_MUX_uxn_opcodes_h_l637_c7_1d03_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_return_output,
 t16_MUX_uxn_opcodes_h_l640_c7_e75d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_return_output,
 CONST_SL_8_uxn_opcodes_h_l642_c3_dba6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_return_output,
 t16_MUX_uxn_opcodes_h_l644_c7_3e80_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_return_output,
 BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_return_output,
 sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l637_c7_1d03_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l634_c3_5319 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l629_c3_6ed4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c7_e75d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l637_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l638_c3_9451 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l637_c7_1d03_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l644_c7_3e80_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c7_e75d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l642_c3_dba6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l642_c3_dba6_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l644_c7_3e80_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l624_l644_l637_l640_DUPLICATE_a323_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_c2ed_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_fa99_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_1046_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l645_l641_DUPLICATE_beae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l652_l620_DUPLICATE_8674_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l638_c3_9451 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l638_c3_9451;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l629_c3_6ed4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l629_c3_6ed4;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l634_c3_5319 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l634_c3_5319;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse := t16;
     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l624_c2_e3bf] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l624_c2_e3bf_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_c2ed LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_c2ed_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l644_c11_51e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_1046 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_1046_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l624_c2_e3bf] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l624_c2_e3bf_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_fa99 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_fa99_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l624_c2_e3bf] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l624_c2_e3bf_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l645_l641_DUPLICATE_beae LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l645_l641_DUPLICATE_beae_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l624_c2_e3bf] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l624_c2_e3bf_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l640_c11_a23e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_left;
     BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_return_output := BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l646_c30_5eac] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_ins;
     sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_x <= VAR_sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_x;
     sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_y <= VAR_sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_return_output := sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l637_c11_67a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l624_l644_l637_l640_DUPLICATE_a323 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l624_l644_l637_l640_DUPLICATE_a323_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l637_c7_1d03] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l637_c7_1d03_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l624_c6_c2dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_e3bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_c2dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l637_c7_1d03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l637_c11_67a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l640_c7_e75d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_a23e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l644_c7_3e80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c11_51e2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l645_l641_DUPLICATE_beae_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l642_c3_dba6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l645_l641_DUPLICATE_beae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_c2ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_c2ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_c2ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l624_l644_l637_l640_DUPLICATE_a323_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l624_l644_l637_l640_DUPLICATE_a323_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l624_l644_l637_l640_DUPLICATE_a323_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l624_l644_l637_l640_DUPLICATE_a323_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_fa99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_fa99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_fa99_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_1046_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_1046_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l637_l640_DUPLICATE_1046_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l624_c2_e3bf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l624_c2_e3bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l624_c2_e3bf_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l624_c2_e3bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l637_c7_1d03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l646_c30_5eac_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l644_c7_3e80] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l644_c7_3e80] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l637_c7_1d03] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l624_c2_e3bf] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l642_c3_dba6] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l642_c3_dba6_x <= VAR_CONST_SL_8_uxn_opcodes_h_l642_c3_dba6_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l642_c3_dba6_return_output := CONST_SL_8_uxn_opcodes_h_l642_c3_dba6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l624_c2_e3bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l624_c2_e3bf] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l644_c7_3e80] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l645_c3_9d9c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_left;
     BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_return_output := BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l624_c2_e3bf] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l645_c3_9d9c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l642_c3_dba6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c7_3e80_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c7_3e80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c7_3e80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l637_c7_1d03_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l640_c7_e75d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l640_c7_e75d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_return_output;

     -- t16_MUX[uxn_opcodes_h_l644_c7_3e80] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l644_c7_3e80_cond <= VAR_t16_MUX_uxn_opcodes_h_l644_c7_3e80_cond;
     t16_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue;
     t16_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l644_c7_3e80_return_output := t16_MUX_uxn_opcodes_h_l644_c7_3e80_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l624_c2_e3bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l640_c7_e75d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l644_c7_3e80] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_cond;
     result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_return_output := result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_e75d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_e75d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_e75d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l644_c7_3e80_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l644_c7_3e80_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l637_c7_1d03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l637_c7_1d03] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l640_c7_e75d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_return_output := result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l637_c7_1d03] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_return_output;

     -- t16_MUX[uxn_opcodes_h_l640_c7_e75d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l640_c7_e75d_cond <= VAR_t16_MUX_uxn_opcodes_h_l640_c7_e75d_cond;
     t16_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l640_c7_e75d_iftrue;
     t16_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l640_c7_e75d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l640_c7_e75d_return_output := t16_MUX_uxn_opcodes_h_l640_c7_e75d_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l637_c7_1d03_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l637_c7_1d03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l637_c7_1d03_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_e75d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse := VAR_t16_MUX_uxn_opcodes_h_l640_c7_e75d_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l624_c2_e3bf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l637_c7_1d03] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_cond;
     result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_return_output := result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l624_c2_e3bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output;

     -- t16_MUX[uxn_opcodes_h_l637_c7_1d03] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l637_c7_1d03_cond <= VAR_t16_MUX_uxn_opcodes_h_l637_c7_1d03_cond;
     t16_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l637_c7_1d03_iftrue;
     t16_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l637_c7_1d03_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l637_c7_1d03_return_output := t16_MUX_uxn_opcodes_h_l637_c7_1d03_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l624_c2_e3bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l637_c7_1d03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l637_c7_1d03_return_output;
     -- t16_MUX[uxn_opcodes_h_l624_c2_e3bf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l624_c2_e3bf_cond <= VAR_t16_MUX_uxn_opcodes_h_l624_c2_e3bf_cond;
     t16_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue;
     t16_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output := t16_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l624_c2_e3bf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output := result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output;

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l652_l620_DUPLICATE_8674 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l652_l620_DUPLICATE_8674_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3dff(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_e3bf_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l652_l620_DUPLICATE_8674_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l652_l620_DUPLICATE_8674_return_output;
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
