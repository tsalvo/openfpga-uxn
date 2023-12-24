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
-- BIN_OP_EQ[uxn_opcodes_h_l640_c6_f4a6]
signal BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l640_c2_58ed]
signal result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l640_c2_58ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l640_c2_58ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l640_c2_58ed]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l640_c2_58ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l640_c2_58ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l640_c2_58ed]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l640_c2_58ed]
signal result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l640_c2_58ed]
signal result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l640_c2_58ed]
signal t16_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l653_c11_3951]
signal BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l653_c7_6fb5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l653_c7_6fb5]
signal result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l653_c7_6fb5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l653_c7_6fb5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l653_c7_6fb5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l653_c7_6fb5]
signal t16_MUX_uxn_opcodes_h_l653_c7_6fb5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l656_c11_9650]
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l656_c7_d522]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l656_c7_d522]
signal result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l656_c7_d522]
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l656_c7_d522]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l656_c7_d522]
signal t16_MUX_uxn_opcodes_h_l656_c7_d522_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l656_c7_d522_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l656_c7_d522_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l656_c7_d522_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l658_c3_a5d8]
signal CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l660_c11_ffbd]
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l660_c7_b0a7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l660_c7_b0a7]
signal result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l660_c7_b0a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l660_c7_b0a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l660_c7_b0a7]
signal t16_MUX_uxn_opcodes_h_l660_c7_b0a7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l661_c3_531b]
signal BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l662_c30_820c]
signal sp_relative_shift_uxn_opcodes_h_l662_c30_820c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l662_c30_820c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l662_c30_820c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l662_c30_820c_return_output : signed(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_de89( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6
BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_left,
BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_right,
BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed
result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed
result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed
result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed
result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_cond,
result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed
result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output);

-- t16_MUX_uxn_opcodes_h_l640_c2_58ed
t16_MUX_uxn_opcodes_h_l640_c2_58ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l640_c2_58ed_cond,
t16_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue,
t16_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse,
t16_MUX_uxn_opcodes_h_l640_c2_58ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951
BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_left,
BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_right,
BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5
result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_cond,
result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output);

-- t16_MUX_uxn_opcodes_h_l653_c7_6fb5
t16_MUX_uxn_opcodes_h_l653_c7_6fb5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l653_c7_6fb5_cond,
t16_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue,
t16_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse,
t16_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650
BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_left,
BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_right,
BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522
result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_cond,
result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_return_output);

-- t16_MUX_uxn_opcodes_h_l656_c7_d522
t16_MUX_uxn_opcodes_h_l656_c7_d522 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l656_c7_d522_cond,
t16_MUX_uxn_opcodes_h_l656_c7_d522_iftrue,
t16_MUX_uxn_opcodes_h_l656_c7_d522_iffalse,
t16_MUX_uxn_opcodes_h_l656_c7_d522_return_output);

-- CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8
CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8_x,
CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd
BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_left,
BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_right,
BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7
result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_cond,
result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output);

-- t16_MUX_uxn_opcodes_h_l660_c7_b0a7
t16_MUX_uxn_opcodes_h_l660_c7_b0a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l660_c7_b0a7_cond,
t16_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue,
t16_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse,
t16_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l661_c3_531b
BIN_OP_OR_uxn_opcodes_h_l661_c3_531b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_left,
BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_right,
BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l662_c30_820c
sp_relative_shift_uxn_opcodes_h_l662_c30_820c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l662_c30_820c_ins,
sp_relative_shift_uxn_opcodes_h_l662_c30_820c_x,
sp_relative_shift_uxn_opcodes_h_l662_c30_820c_y,
sp_relative_shift_uxn_opcodes_h_l662_c30_820c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
 t16_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output,
 t16_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_return_output,
 t16_MUX_uxn_opcodes_h_l656_c7_d522_return_output,
 CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output,
 t16_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_return_output,
 sp_relative_shift_uxn_opcodes_h_l662_c30_820c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l645_c3_9e8b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_7677 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c2_58ed_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c2_58ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l654_c3_f34a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l653_c7_6fb5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l656_c7_d522_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l653_c7_6fb5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l656_c7_d522_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l656_c7_d522_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l656_c7_d522_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l660_c7_b0a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_820c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_820c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_820c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_820c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l656_l640_l660_l653_DUPLICATE_3480_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_9d98_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_5742_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_314e_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l661_l657_DUPLICATE_000f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l668_l636_DUPLICATE_b2d5_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l654_c3_f34a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l654_c3_f34a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_820c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l645_c3_9e8b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l645_c3_9e8b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_7677 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_7677;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_820c_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_820c_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_9d98 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_9d98_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_314e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_314e_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l640_c2_58ed] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l640_c2_58ed_return_output := result.is_ram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l640_c2_58ed] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l640_c2_58ed_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l640_c2_58ed] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l640_c2_58ed_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l662_c30_820c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l662_c30_820c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_820c_ins;
     sp_relative_shift_uxn_opcodes_h_l662_c30_820c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_820c_x;
     sp_relative_shift_uxn_opcodes_h_l662_c30_820c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_820c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_820c_return_output := sp_relative_shift_uxn_opcodes_h_l662_c30_820c_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l640_c2_58ed] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l640_c2_58ed_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l660_c11_ffbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l661_l657_DUPLICATE_000f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l661_l657_DUPLICATE_000f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l653_c11_3951] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_left;
     BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_return_output := BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l656_c11_9650] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_left;
     BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_return_output := BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_5742 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_5742_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l640_c6_f4a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l656_l640_l660_l653_DUPLICATE_3480 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l656_l640_l660_l653_DUPLICATE_3480_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l653_c7_6fb5] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l653_c7_6fb5_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l640_c2_58ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_f4a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l653_c7_6fb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_3951_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l656_c7_d522_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9650_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l660_c7_b0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ffbd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l661_l657_DUPLICATE_000f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l661_l657_DUPLICATE_000f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_314e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_314e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_314e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l656_l640_l660_l653_DUPLICATE_3480_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l656_l640_l660_l653_DUPLICATE_3480_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l656_l640_l660_l653_DUPLICATE_3480_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l656_l640_l660_l653_DUPLICATE_3480_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_5742_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_5742_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_5742_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_9d98_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_9d98_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_9d98_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l640_c2_58ed_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l640_c2_58ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l640_c2_58ed_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l640_c2_58ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l653_c7_6fb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_820c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l640_c2_58ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l640_c2_58ed] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l653_c7_6fb5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l660_c7_b0a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l661_c3_531b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_left;
     BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_return_output := BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l658_c3_a5d8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8_x <= VAR_CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8_return_output := CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l640_c2_58ed] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l640_c2_58ed] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l660_c7_b0a7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l660_c7_b0a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_531b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l656_c7_d522_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l658_c3_a5d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l640_c2_58ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l660_c7_b0a7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output := result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l656_c7_d522] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l656_c7_d522] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_return_output;

     -- t16_MUX[uxn_opcodes_h_l660_c7_b0a7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l660_c7_b0a7_cond <= VAR_t16_MUX_uxn_opcodes_h_l660_c7_b0a7_cond;
     t16_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l660_c7_b0a7_iftrue;
     t16_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l660_c7_b0a7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output := t16_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l656_c7_d522] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_d522_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_d522_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_d522_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l656_c7_d522_iffalse := VAR_t16_MUX_uxn_opcodes_h_l660_c7_b0a7_return_output;
     -- t16_MUX[uxn_opcodes_h_l656_c7_d522] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l656_c7_d522_cond <= VAR_t16_MUX_uxn_opcodes_h_l656_c7_d522_cond;
     t16_MUX_uxn_opcodes_h_l656_c7_d522_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l656_c7_d522_iftrue;
     t16_MUX_uxn_opcodes_h_l656_c7_d522_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l656_c7_d522_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l656_c7_d522_return_output := t16_MUX_uxn_opcodes_h_l656_c7_d522_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l653_c7_6fb5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l656_c7_d522] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_cond;
     result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_return_output := result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l653_c7_6fb5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l653_c7_6fb5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_d522_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l656_c7_d522_return_output;
     -- t16_MUX[uxn_opcodes_h_l653_c7_6fb5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l653_c7_6fb5_cond <= VAR_t16_MUX_uxn_opcodes_h_l653_c7_6fb5_cond;
     t16_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue;
     t16_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output := t16_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l653_c7_6fb5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output := result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l640_c2_58ed] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l640_c2_58ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l640_c2_58ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse := VAR_t16_MUX_uxn_opcodes_h_l653_c7_6fb5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l640_c2_58ed] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_cond;
     result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_return_output := result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_return_output;

     -- t16_MUX[uxn_opcodes_h_l640_c2_58ed] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l640_c2_58ed_cond <= VAR_t16_MUX_uxn_opcodes_h_l640_c2_58ed_cond;
     t16_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l640_c2_58ed_iftrue;
     t16_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l640_c2_58ed_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l640_c2_58ed_return_output := t16_MUX_uxn_opcodes_h_l640_c2_58ed_return_output;

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l640_c2_58ed_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l668_l636_DUPLICATE_b2d5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l668_l636_DUPLICATE_b2d5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_de89(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_58ed_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_58ed_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l668_l636_DUPLICATE_b2d5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_de89_uxn_opcodes_h_l668_l636_DUPLICATE_b2d5_return_output;
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
