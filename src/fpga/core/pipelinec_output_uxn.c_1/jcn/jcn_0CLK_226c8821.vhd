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
-- Submodules: 39
entity jcn_0CLK_226c8821 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_226c8821;
architecture arch of jcn_0CLK_226c8821 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l659_c6_a114]
signal BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l659_c2_dbea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l659_c2_dbea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l659_c2_dbea]
signal result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l659_c2_dbea]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l659_c2_dbea]
signal result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l659_c2_dbea]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l659_c2_dbea]
signal result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l659_c2_dbea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l659_c2_dbea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l659_c2_dbea]
signal t8_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l659_c2_dbea]
signal n8_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l672_c11_4e01]
signal BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l672_c7_4619]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l672_c7_4619]
signal result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l672_c7_4619]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l672_c7_4619]
signal result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l672_c7_4619]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l672_c7_4619]
signal t8_MUX_uxn_opcodes_h_l672_c7_4619_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l672_c7_4619_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l672_c7_4619_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l672_c7_4619_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l672_c7_4619]
signal n8_MUX_uxn_opcodes_h_l672_c7_4619_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l672_c7_4619_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l672_c7_4619_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l672_c7_4619_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l675_c11_5899]
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l675_c7_5160]
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l675_c7_5160]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l675_c7_5160]
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c7_5160]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l675_c7_5160]
signal t8_MUX_uxn_opcodes_h_l675_c7_5160_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c7_5160_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c7_5160_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c7_5160_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l675_c7_5160]
signal n8_MUX_uxn_opcodes_h_l675_c7_5160_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c7_5160_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c7_5160_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c7_5160_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l678_c11_2436]
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l678_c7_4103]
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l678_c7_4103]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l678_c7_4103]
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l678_c7_4103]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l678_c7_4103]
signal n8_MUX_uxn_opcodes_h_l678_c7_4103_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l678_c7_4103_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l678_c7_4103_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l678_c7_4103_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l680_c30_dedb]
signal sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l682_c22_c9fb]
signal BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l682_c37_3771]
signal BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l682_c22_8f81]
signal MUX_uxn_opcodes_h_l682_c22_8f81_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l682_c22_8f81_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l682_c22_8f81_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l682_c22_8f81_return_output : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114
BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_left,
BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_right,
BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea
result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_cond,
result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_return_output);

-- t8_MUX_uxn_opcodes_h_l659_c2_dbea
t8_MUX_uxn_opcodes_h_l659_c2_dbea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l659_c2_dbea_cond,
t8_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue,
t8_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse,
t8_MUX_uxn_opcodes_h_l659_c2_dbea_return_output);

-- n8_MUX_uxn_opcodes_h_l659_c2_dbea
n8_MUX_uxn_opcodes_h_l659_c2_dbea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l659_c2_dbea_cond,
n8_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue,
n8_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse,
n8_MUX_uxn_opcodes_h_l659_c2_dbea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01
BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_left,
BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_right,
BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619
result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_cond,
result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_return_output);

-- t8_MUX_uxn_opcodes_h_l672_c7_4619
t8_MUX_uxn_opcodes_h_l672_c7_4619 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l672_c7_4619_cond,
t8_MUX_uxn_opcodes_h_l672_c7_4619_iftrue,
t8_MUX_uxn_opcodes_h_l672_c7_4619_iffalse,
t8_MUX_uxn_opcodes_h_l672_c7_4619_return_output);

-- n8_MUX_uxn_opcodes_h_l672_c7_4619
n8_MUX_uxn_opcodes_h_l672_c7_4619 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l672_c7_4619_cond,
n8_MUX_uxn_opcodes_h_l672_c7_4619_iftrue,
n8_MUX_uxn_opcodes_h_l672_c7_4619_iffalse,
n8_MUX_uxn_opcodes_h_l672_c7_4619_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899
BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_left,
BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_right,
BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160
result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_cond,
result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_return_output);

-- t8_MUX_uxn_opcodes_h_l675_c7_5160
t8_MUX_uxn_opcodes_h_l675_c7_5160 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l675_c7_5160_cond,
t8_MUX_uxn_opcodes_h_l675_c7_5160_iftrue,
t8_MUX_uxn_opcodes_h_l675_c7_5160_iffalse,
t8_MUX_uxn_opcodes_h_l675_c7_5160_return_output);

-- n8_MUX_uxn_opcodes_h_l675_c7_5160
n8_MUX_uxn_opcodes_h_l675_c7_5160 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l675_c7_5160_cond,
n8_MUX_uxn_opcodes_h_l675_c7_5160_iftrue,
n8_MUX_uxn_opcodes_h_l675_c7_5160_iffalse,
n8_MUX_uxn_opcodes_h_l675_c7_5160_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436
BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_left,
BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_right,
BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103
result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_cond,
result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_return_output);

-- n8_MUX_uxn_opcodes_h_l678_c7_4103
n8_MUX_uxn_opcodes_h_l678_c7_4103 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l678_c7_4103_cond,
n8_MUX_uxn_opcodes_h_l678_c7_4103_iftrue,
n8_MUX_uxn_opcodes_h_l678_c7_4103_iffalse,
n8_MUX_uxn_opcodes_h_l678_c7_4103_return_output);

-- sp_relative_shift_uxn_opcodes_h_l680_c30_dedb
sp_relative_shift_uxn_opcodes_h_l680_c30_dedb : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_ins,
sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_x,
sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_y,
sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb
BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_left,
BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_right,
BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771
BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_left,
BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_right,
BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_return_output);

-- MUX_uxn_opcodes_h_l682_c22_8f81
MUX_uxn_opcodes_h_l682_c22_8f81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l682_c22_8f81_cond,
MUX_uxn_opcodes_h_l682_c22_8f81_iftrue,
MUX_uxn_opcodes_h_l682_c22_8f81_iffalse,
MUX_uxn_opcodes_h_l682_c22_8f81_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
 t8_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
 n8_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_return_output,
 t8_MUX_uxn_opcodes_h_l672_c7_4619_return_output,
 n8_MUX_uxn_opcodes_h_l672_c7_4619_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_return_output,
 t8_MUX_uxn_opcodes_h_l675_c7_5160_return_output,
 n8_MUX_uxn_opcodes_h_l675_c7_5160_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_return_output,
 n8_MUX_uxn_opcodes_h_l678_c7_4103_return_output,
 sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_return_output,
 MUX_uxn_opcodes_h_l682_c22_8f81_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l669_c3_08b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l664_c3_b0e7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l672_c7_4619_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l672_c7_4619_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l659_c2_dbea_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l659_c2_dbea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_be3a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l672_c7_4619_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l672_c7_4619_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l672_c7_4619_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c7_5160_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l672_c7_4619_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l672_c7_4619_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l672_c7_4619_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_5160_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l672_c7_4619_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c7_5160_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c7_5160_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c7_5160_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_5160_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_5160_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_4103_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_5160_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_4103_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_4103_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_4103_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l682_c22_8f81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l682_c22_8f81_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l682_c22_8f81_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l682_c42_a62d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l682_c22_8f81_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l672_l675_l659_l678_DUPLICATE_b889_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_c1db_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_85df_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_6384_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l686_l655_DUPLICATE_cde3_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_be3a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_be3a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l669_c3_08b1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l669_c3_08b1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l664_c3_b0e7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l664_c3_b0e7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_right := to_unsigned(3, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l672_c7_4619_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_5160_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_4103_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l682_c22_8f81_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_4103_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l675_c7_5160_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l672_c7_4619_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l675_c7_5160_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l659_c6_a114] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_left;
     BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output := BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_85df LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_85df_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l682_c22_c9fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l659_c2_dbea_return_output := result.is_stack_write;

     -- CAST_TO_int8_t[uxn_opcodes_h_l682_c42_a62d] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l682_c42_a62d_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l672_c7_4619] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l672_c7_4619_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l659_c2_dbea_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l659_c2_dbea_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l659_c2_dbea_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_c1db LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_c1db_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l678_c11_2436] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_left;
     BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_return_output := BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_6384 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_6384_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l672_c11_4e01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_left;
     BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_return_output := BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l675_c11_5899] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_left;
     BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_return_output := BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l680_c30_dedb] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_ins;
     sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_x <= VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_x;
     sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_y <= VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_return_output := sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l672_l675_l659_l678_DUPLICATE_b889 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l672_l675_l659_l678_DUPLICATE_b889_return_output := result.u16_value;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l659_c2_dbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l659_c2_dbea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_a114_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l672_c7_4619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l672_c7_4619_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_4e01_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_5160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l675_c7_5160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_5899_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_4103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_2436_return_output;
     VAR_MUX_uxn_opcodes_h_l682_c22_8f81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_c9fb_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l682_c42_a62d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_c1db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_c1db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_c1db_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l672_l675_l659_l678_DUPLICATE_b889_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l672_l675_l659_l678_DUPLICATE_b889_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l672_l675_l659_l678_DUPLICATE_b889_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l672_l675_l659_l678_DUPLICATE_b889_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_85df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_85df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_85df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_6384_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_6384_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l672_l675_l678_DUPLICATE_6384_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l659_c2_dbea_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l659_c2_dbea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l659_c2_dbea_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l659_c2_dbea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l672_c7_4619_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_dedb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l672_c7_4619] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l678_c7_4103] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l678_c7_4103] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l682_c37_3771] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_left;
     BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_return_output := BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_return_output;

     -- t8_MUX[uxn_opcodes_h_l675_c7_5160] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l675_c7_5160_cond <= VAR_t8_MUX_uxn_opcodes_h_l675_c7_5160_cond;
     t8_MUX_uxn_opcodes_h_l675_c7_5160_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l675_c7_5160_iftrue;
     t8_MUX_uxn_opcodes_h_l675_c7_5160_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l675_c7_5160_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l675_c7_5160_return_output := t8_MUX_uxn_opcodes_h_l675_c7_5160_return_output;

     -- n8_MUX[uxn_opcodes_h_l678_c7_4103] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l678_c7_4103_cond <= VAR_n8_MUX_uxn_opcodes_h_l678_c7_4103_cond;
     n8_MUX_uxn_opcodes_h_l678_c7_4103_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l678_c7_4103_iftrue;
     n8_MUX_uxn_opcodes_h_l678_c7_4103_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l678_c7_4103_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_4103_return_output := n8_MUX_uxn_opcodes_h_l678_c7_4103_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l678_c7_4103] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l682_c22_8f81_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_3771_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_5160_iffalse := VAR_n8_MUX_uxn_opcodes_h_l678_c7_4103_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_4103_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_4103_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_4103_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_4619_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l672_c7_4619_iffalse := VAR_t8_MUX_uxn_opcodes_h_l675_c7_5160_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l675_c7_5160] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_return_output;

     -- MUX[uxn_opcodes_h_l682_c22_8f81] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l682_c22_8f81_cond <= VAR_MUX_uxn_opcodes_h_l682_c22_8f81_cond;
     MUX_uxn_opcodes_h_l682_c22_8f81_iftrue <= VAR_MUX_uxn_opcodes_h_l682_c22_8f81_iftrue;
     MUX_uxn_opcodes_h_l682_c22_8f81_iffalse <= VAR_MUX_uxn_opcodes_h_l682_c22_8f81_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l682_c22_8f81_return_output := MUX_uxn_opcodes_h_l682_c22_8f81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l675_c7_5160] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_return_output;

     -- t8_MUX[uxn_opcodes_h_l672_c7_4619] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l672_c7_4619_cond <= VAR_t8_MUX_uxn_opcodes_h_l672_c7_4619_cond;
     t8_MUX_uxn_opcodes_h_l672_c7_4619_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l672_c7_4619_iftrue;
     t8_MUX_uxn_opcodes_h_l672_c7_4619_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l672_c7_4619_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l672_c7_4619_return_output := t8_MUX_uxn_opcodes_h_l672_c7_4619_return_output;

     -- n8_MUX[uxn_opcodes_h_l675_c7_5160] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l675_c7_5160_cond <= VAR_n8_MUX_uxn_opcodes_h_l675_c7_5160_cond;
     n8_MUX_uxn_opcodes_h_l675_c7_5160_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l675_c7_5160_iftrue;
     n8_MUX_uxn_opcodes_h_l675_c7_5160_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l675_c7_5160_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_5160_return_output := n8_MUX_uxn_opcodes_h_l675_c7_5160_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c7_5160] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_iftrue := VAR_MUX_uxn_opcodes_h_l682_c22_8f81_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l672_c7_4619_iffalse := VAR_n8_MUX_uxn_opcodes_h_l675_c7_5160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5160_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5160_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse := VAR_t8_MUX_uxn_opcodes_h_l672_c7_4619_return_output;
     -- t8_MUX[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l659_c2_dbea_cond <= VAR_t8_MUX_uxn_opcodes_h_l659_c2_dbea_cond;
     t8_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue;
     t8_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l659_c2_dbea_return_output := t8_MUX_uxn_opcodes_h_l659_c2_dbea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l672_c7_4619] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l672_c7_4619] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_return_output;

     -- n8_MUX[uxn_opcodes_h_l672_c7_4619] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l672_c7_4619_cond <= VAR_n8_MUX_uxn_opcodes_h_l672_c7_4619_cond;
     n8_MUX_uxn_opcodes_h_l672_c7_4619_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l672_c7_4619_iftrue;
     n8_MUX_uxn_opcodes_h_l672_c7_4619_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l672_c7_4619_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l672_c7_4619_return_output := n8_MUX_uxn_opcodes_h_l672_c7_4619_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l672_c7_4619] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l678_c7_4103] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_cond;
     result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_return_output := result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse := VAR_n8_MUX_uxn_opcodes_h_l672_c7_4619_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_4619_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_4619_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_4619_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_4103_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l659_c2_dbea_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l675_c7_5160] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_cond;
     result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_return_output := result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_return_output;

     -- n8_MUX[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l659_c2_dbea_cond <= VAR_n8_MUX_uxn_opcodes_h_l659_c2_dbea_cond;
     n8_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue;
     n8_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l659_c2_dbea_return_output := n8_MUX_uxn_opcodes_h_l659_c2_dbea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l659_c2_dbea_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5160_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l672_c7_4619] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_cond;
     result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_return_output := result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_4619_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l659_c2_dbea] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_cond;
     result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_return_output := result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l686_l655_DUPLICATE_cde3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l686_l655_DUPLICATE_cde3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_dbea_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_dbea_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l686_l655_DUPLICATE_cde3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l686_l655_DUPLICATE_cde3_return_output;
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
