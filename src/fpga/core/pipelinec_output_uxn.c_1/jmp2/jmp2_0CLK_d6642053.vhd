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
-- BIN_OP_EQ[uxn_opcodes_h_l640_c6_99a3]
signal BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l640_c2_6b04]
signal t16_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l640_c2_6b04]
signal result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l640_c2_6b04]
signal result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l640_c2_6b04]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l640_c2_6b04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l640_c2_6b04]
signal result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l640_c2_6b04]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l640_c2_6b04]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l640_c2_6b04]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l640_c2_6b04]
signal result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l653_c11_1426]
signal BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l653_c7_9b0c]
signal t16_MUX_uxn_opcodes_h_l653_c7_9b0c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l653_c7_9b0c]
signal result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l653_c7_9b0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l653_c7_9b0c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l653_c7_9b0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l653_c7_9b0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l656_c11_d468]
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l656_c7_df61]
signal t16_MUX_uxn_opcodes_h_l656_c7_df61_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l656_c7_df61_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l656_c7_df61_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l656_c7_df61_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l656_c7_df61]
signal result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l656_c7_df61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l656_c7_df61]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l656_c7_df61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l658_c3_900a]
signal CONST_SL_8_uxn_opcodes_h_l658_c3_900a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l658_c3_900a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l660_c11_ef47]
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l660_c7_3c79]
signal t16_MUX_uxn_opcodes_h_l660_c7_3c79_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l660_c7_3c79_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l660_c7_3c79]
signal result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l660_c7_3c79]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l660_c7_3c79]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l660_c7_3c79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l661_c3_8f95]
signal BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l662_c30_9dcf]
signal sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_return_output : signed(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_cbec( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3
BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_left,
BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_right,
BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output);

-- t16_MUX_uxn_opcodes_h_l640_c2_6b04
t16_MUX_uxn_opcodes_h_l640_c2_6b04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l640_c2_6b04_cond,
t16_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue,
t16_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse,
t16_MUX_uxn_opcodes_h_l640_c2_6b04_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04
result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04
result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04
result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04
result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_cond,
result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04
result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426
BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_left,
BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_right,
BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_return_output);

-- t16_MUX_uxn_opcodes_h_l653_c7_9b0c
t16_MUX_uxn_opcodes_h_l653_c7_9b0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l653_c7_9b0c_cond,
t16_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue,
t16_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse,
t16_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c
result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_cond,
result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468
BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_left,
BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_right,
BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_return_output);

-- t16_MUX_uxn_opcodes_h_l656_c7_df61
t16_MUX_uxn_opcodes_h_l656_c7_df61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l656_c7_df61_cond,
t16_MUX_uxn_opcodes_h_l656_c7_df61_iftrue,
t16_MUX_uxn_opcodes_h_l656_c7_df61_iffalse,
t16_MUX_uxn_opcodes_h_l656_c7_df61_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61
result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_cond,
result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_return_output);

-- CONST_SL_8_uxn_opcodes_h_l658_c3_900a
CONST_SL_8_uxn_opcodes_h_l658_c3_900a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l658_c3_900a_x,
CONST_SL_8_uxn_opcodes_h_l658_c3_900a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47
BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_left,
BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_right,
BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_return_output);

-- t16_MUX_uxn_opcodes_h_l660_c7_3c79
t16_MUX_uxn_opcodes_h_l660_c7_3c79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l660_c7_3c79_cond,
t16_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue,
t16_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse,
t16_MUX_uxn_opcodes_h_l660_c7_3c79_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79
result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_cond,
result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95
BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_left,
BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_right,
BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_return_output);

-- sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf
sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_ins,
sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_x,
sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_y,
sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output,
 t16_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_return_output,
 t16_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_return_output,
 t16_MUX_uxn_opcodes_h_l656_c7_df61_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_return_output,
 CONST_SL_8_uxn_opcodes_h_l658_c3_900a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_return_output,
 t16_MUX_uxn_opcodes_h_l660_c7_3c79_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_return_output,
 BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_return_output,
 sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l645_c3_fea7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_d954 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l656_c7_df61_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l653_c7_9b0c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l654_c3_7a40 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l653_c7_9b0c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l656_c7_df61_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l656_c7_df61_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l660_c7_3c79_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l656_c7_df61_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l658_c3_900a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l658_c3_900a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l660_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l656_l640_l660_l653_DUPLICATE_131d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_f1de_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_10e2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_7167_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l661_l657_DUPLICATE_abf9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l668_l636_DUPLICATE_d144_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l645_c3_fea7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l645_c3_fea7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_d954 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l650_c3_d954;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l654_c3_7a40 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l654_c3_7a40;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l653_c11_1426] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_left;
     BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_return_output := BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l661_l657_DUPLICATE_abf9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l661_l657_DUPLICATE_abf9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_7167 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_7167_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l640_c2_6b04] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l640_c2_6b04_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l640_c6_99a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_f1de LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_f1de_return_output := result.sp_relative_shift;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l640_c2_6b04] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l640_c2_6b04_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l656_c11_d468] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_left;
     BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_return_output := BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l653_c7_9b0c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l653_c7_9b0c_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l662_c30_9dcf] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_ins;
     sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_x <= VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_x;
     sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_y <= VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_return_output := sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l640_c2_6b04] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l640_c2_6b04_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l660_c11_ef47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_left;
     BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_return_output := BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l640_c2_6b04] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l640_c2_6b04_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l656_l640_l660_l653_DUPLICATE_131d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l656_l640_l660_l653_DUPLICATE_131d_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_10e2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_10e2_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l640_c2_6b04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c6_99a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l653_c7_9b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_1426_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l656_c7_df61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_d468_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l660_c7_3c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_ef47_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l661_l657_DUPLICATE_abf9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l658_c3_900a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l661_l657_DUPLICATE_abf9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_f1de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_f1de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_f1de_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l656_l640_l660_l653_DUPLICATE_131d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l656_l640_l660_l653_DUPLICATE_131d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l656_l640_l660_l653_DUPLICATE_131d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l656_l640_l660_l653_DUPLICATE_131d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_7167_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_7167_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_7167_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_10e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_10e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l660_l653_DUPLICATE_10e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l640_c2_6b04_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l640_c2_6b04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l640_c2_6b04_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l640_c2_6b04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l653_c7_9b0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l662_c30_9dcf_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l658_c3_900a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l658_c3_900a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l658_c3_900a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l658_c3_900a_return_output := CONST_SL_8_uxn_opcodes_h_l658_c3_900a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l660_c7_3c79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l660_c7_3c79] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l640_c2_6b04] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l640_c2_6b04] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l640_c2_6b04] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l661_c3_8f95] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_left;
     BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_return_output := BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l653_c7_9b0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l640_c2_6b04] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l660_c7_3c79] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l661_c3_8f95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l656_c7_df61_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l658_c3_900a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_3c79_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_3c79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_3c79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l656_c7_df61] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_return_output;

     -- t16_MUX[uxn_opcodes_h_l660_c7_3c79] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l660_c7_3c79_cond <= VAR_t16_MUX_uxn_opcodes_h_l660_c7_3c79_cond;
     t16_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue;
     t16_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l660_c7_3c79_return_output := t16_MUX_uxn_opcodes_h_l660_c7_3c79_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l656_c7_df61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l640_c2_6b04] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l656_c7_df61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l660_c7_3c79] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_cond;
     result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_return_output := result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_df61_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_df61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_df61_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_3c79_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l656_c7_df61_iffalse := VAR_t16_MUX_uxn_opcodes_h_l660_c7_3c79_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l656_c7_df61] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_cond;
     result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_return_output := result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l653_c7_9b0c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output;

     -- t16_MUX[uxn_opcodes_h_l656_c7_df61] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l656_c7_df61_cond <= VAR_t16_MUX_uxn_opcodes_h_l656_c7_df61_cond;
     t16_MUX_uxn_opcodes_h_l656_c7_df61_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l656_c7_df61_iftrue;
     t16_MUX_uxn_opcodes_h_l656_c7_df61_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l656_c7_df61_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l656_c7_df61_return_output := t16_MUX_uxn_opcodes_h_l656_c7_df61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l653_c7_9b0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l653_c7_9b0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l656_c7_df61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l656_c7_df61_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l640_c2_6b04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l653_c7_9b0c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output := result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l640_c2_6b04] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_return_output;

     -- t16_MUX[uxn_opcodes_h_l653_c7_9b0c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l653_c7_9b0c_cond <= VAR_t16_MUX_uxn_opcodes_h_l653_c7_9b0c_cond;
     t16_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l653_c7_9b0c_iftrue;
     t16_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l653_c7_9b0c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output := t16_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l640_c2_6b04] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse := VAR_t16_MUX_uxn_opcodes_h_l653_c7_9b0c_return_output;
     -- t16_MUX[uxn_opcodes_h_l640_c2_6b04] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l640_c2_6b04_cond <= VAR_t16_MUX_uxn_opcodes_h_l640_c2_6b04_cond;
     t16_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue;
     t16_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l640_c2_6b04_return_output := t16_MUX_uxn_opcodes_h_l640_c2_6b04_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l640_c2_6b04] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_cond;
     result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_return_output := result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_return_output;

     -- Submodule level 6
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l640_c2_6b04_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l668_l636_DUPLICATE_d144 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l668_l636_DUPLICATE_d144_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cbec(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c2_6b04_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l640_c2_6b04_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l668_l636_DUPLICATE_d144_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cbec_uxn_opcodes_h_l668_l636_DUPLICATE_d144_return_output;
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
