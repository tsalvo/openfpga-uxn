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
-- BIN_OP_EQ[uxn_opcodes_h_l659_c6_3120]
signal BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l659_c2_b365]
signal t8_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l659_c2_b365]
signal result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l659_c2_b365]
signal result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l659_c2_b365]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l659_c2_b365]
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l659_c2_b365]
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l659_c2_b365]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l659_c2_b365]
signal result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l659_c2_b365]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l659_c2_b365]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l659_c2_b365]
signal n8_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l672_c11_fa4f]
signal BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l672_c7_7723]
signal t8_MUX_uxn_opcodes_h_l672_c7_7723_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l672_c7_7723_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l672_c7_7723_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l672_c7_7723_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l672_c7_7723]
signal result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l672_c7_7723]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l672_c7_7723]
signal result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l672_c7_7723]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l672_c7_7723]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l672_c7_7723]
signal n8_MUX_uxn_opcodes_h_l672_c7_7723_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l672_c7_7723_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l672_c7_7723_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l672_c7_7723_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l675_c11_326f]
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l675_c7_5bdf]
signal t8_MUX_uxn_opcodes_h_l675_c7_5bdf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l675_c7_5bdf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l675_c7_5bdf]
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c7_5bdf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l675_c7_5bdf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l675_c7_5bdf]
signal n8_MUX_uxn_opcodes_h_l675_c7_5bdf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l678_c11_dca8]
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l678_c7_dd5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l678_c7_dd5c]
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l678_c7_dd5c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l678_c7_dd5c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l678_c7_dd5c]
signal n8_MUX_uxn_opcodes_h_l678_c7_dd5c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l680_c30_a15f]
signal sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l682_c22_4299]
signal BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l682_c37_ac2b]
signal BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l682_c22_eaf9]
signal MUX_uxn_opcodes_h_l682_c22_eaf9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l682_c22_eaf9_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l682_c22_eaf9_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l682_c22_eaf9_return_output : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_161f( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120
BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_left,
BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_right,
BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output);

-- t8_MUX_uxn_opcodes_h_l659_c2_b365
t8_MUX_uxn_opcodes_h_l659_c2_b365 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l659_c2_b365_cond,
t8_MUX_uxn_opcodes_h_l659_c2_b365_iftrue,
t8_MUX_uxn_opcodes_h_l659_c2_b365_iffalse,
t8_MUX_uxn_opcodes_h_l659_c2_b365_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365
result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_cond,
result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_return_output);

-- n8_MUX_uxn_opcodes_h_l659_c2_b365
n8_MUX_uxn_opcodes_h_l659_c2_b365 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l659_c2_b365_cond,
n8_MUX_uxn_opcodes_h_l659_c2_b365_iftrue,
n8_MUX_uxn_opcodes_h_l659_c2_b365_iffalse,
n8_MUX_uxn_opcodes_h_l659_c2_b365_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f
BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_left,
BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_right,
BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_return_output);

-- t8_MUX_uxn_opcodes_h_l672_c7_7723
t8_MUX_uxn_opcodes_h_l672_c7_7723 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l672_c7_7723_cond,
t8_MUX_uxn_opcodes_h_l672_c7_7723_iftrue,
t8_MUX_uxn_opcodes_h_l672_c7_7723_iffalse,
t8_MUX_uxn_opcodes_h_l672_c7_7723_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723
result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_cond,
result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_return_output);

-- n8_MUX_uxn_opcodes_h_l672_c7_7723
n8_MUX_uxn_opcodes_h_l672_c7_7723 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l672_c7_7723_cond,
n8_MUX_uxn_opcodes_h_l672_c7_7723_iftrue,
n8_MUX_uxn_opcodes_h_l672_c7_7723_iffalse,
n8_MUX_uxn_opcodes_h_l672_c7_7723_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f
BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_left,
BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_right,
BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_return_output);

-- t8_MUX_uxn_opcodes_h_l675_c7_5bdf
t8_MUX_uxn_opcodes_h_l675_c7_5bdf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l675_c7_5bdf_cond,
t8_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue,
t8_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse,
t8_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf
result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_cond,
result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output);

-- n8_MUX_uxn_opcodes_h_l675_c7_5bdf
n8_MUX_uxn_opcodes_h_l675_c7_5bdf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l675_c7_5bdf_cond,
n8_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue,
n8_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse,
n8_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8
BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_left,
BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_right,
BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c
result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_cond,
result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output);

-- n8_MUX_uxn_opcodes_h_l678_c7_dd5c
n8_MUX_uxn_opcodes_h_l678_c7_dd5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l678_c7_dd5c_cond,
n8_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue,
n8_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse,
n8_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l680_c30_a15f
sp_relative_shift_uxn_opcodes_h_l680_c30_a15f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_ins,
sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_x,
sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_y,
sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299
BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_left,
BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_right,
BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b
BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_left,
BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_right,
BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_return_output);

-- MUX_uxn_opcodes_h_l682_c22_eaf9
MUX_uxn_opcodes_h_l682_c22_eaf9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l682_c22_eaf9_cond,
MUX_uxn_opcodes_h_l682_c22_eaf9_iftrue,
MUX_uxn_opcodes_h_l682_c22_eaf9_iffalse,
MUX_uxn_opcodes_h_l682_c22_eaf9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output,
 t8_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
 n8_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_return_output,
 t8_MUX_uxn_opcodes_h_l672_c7_7723_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_return_output,
 n8_MUX_uxn_opcodes_h_l672_c7_7723_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_return_output,
 t8_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output,
 n8_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output,
 n8_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output,
 sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_return_output,
 MUX_uxn_opcodes_h_l682_c22_eaf9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l672_c7_7723_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l669_c3_f6fc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l664_c3_231c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l659_c2_b365_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l659_c2_b365_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l672_c7_7723_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l659_c2_b365_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l659_c2_b365_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l672_c7_7723_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l672_c7_7723_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l672_c7_7723_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_53d6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l672_c7_7723_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l672_c7_7723_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l672_c7_7723_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l672_c7_7723_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c7_5bdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_5bdf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_dd5c_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l682_c22_eaf9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l682_c22_eaf9_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l682_c22_eaf9_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l682_c42_1800_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l682_c22_eaf9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l659_l678_l672_DUPLICATE_ece7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_609c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_d793_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_cddb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_161f_uxn_opcodes_h_l686_l655_DUPLICATE_36a3_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_53d6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_53d6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l669_c3_f6fc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l669_c3_f6fc;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l664_c3_231c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l664_c3_231c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l659_c2_b365_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l672_c7_7723_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l682_c22_eaf9_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l659_c2_b365_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l672_c7_7723_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l672_c7_7723] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l672_c7_7723_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l672_c11_fa4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l682_c22_4299] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_left;
     BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_return_output := BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l659_c6_3120] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_left;
     BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output := BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l675_c11_326f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_left;
     BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_return_output := BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l659_c2_b365_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_cddb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_cddb_return_output := result.sp_relative_shift;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l659_c2_b365_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_609c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_609c_return_output := result.is_pc_updated;

     -- CAST_TO_int8_t[uxn_opcodes_h_l682_c42_1800] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l682_c42_1800_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_d793 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_d793_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l659_l678_l672_DUPLICATE_ece7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l659_l678_l672_DUPLICATE_ece7_return_output := result.u16_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l659_c2_b365_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l659_c2_b365_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l678_c11_dca8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_left;
     BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_return_output := BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l680_c30_a15f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_ins;
     sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_x;
     sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_return_output := sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l659_c2_b365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l659_c2_b365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_3120_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l672_c7_7723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l672_c7_7723_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_fa4f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_5bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l675_c7_5bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_326f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_dd5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_dca8_return_output;
     VAR_MUX_uxn_opcodes_h_l682_c22_eaf9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_4299_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l682_c42_1800_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_cddb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_cddb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_cddb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l659_l678_l672_DUPLICATE_ece7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l659_l678_l672_DUPLICATE_ece7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l659_l678_l672_DUPLICATE_ece7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l659_l678_l672_DUPLICATE_ece7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_d793_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_d793_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_d793_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_609c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_609c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_609c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l659_c2_b365_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l659_c2_b365_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l659_c2_b365_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l659_c2_b365_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l672_c7_7723_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_a15f_return_output;
     -- t8_MUX[uxn_opcodes_h_l675_c7_5bdf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l675_c7_5bdf_cond <= VAR_t8_MUX_uxn_opcodes_h_l675_c7_5bdf_cond;
     t8_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue;
     t8_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output := t8_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_return_output;

     -- n8_MUX[uxn_opcodes_h_l678_c7_dd5c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l678_c7_dd5c_cond <= VAR_n8_MUX_uxn_opcodes_h_l678_c7_dd5c_cond;
     n8_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue;
     n8_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output := n8_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l678_c7_dd5c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l678_c7_dd5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l682_c37_ac2b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l672_c7_7723] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l678_c7_dd5c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l682_c22_eaf9_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_ac2b_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse := VAR_n8_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_7723_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l672_c7_7723_iffalse := VAR_t8_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l675_c7_5bdf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output;

     -- n8_MUX[uxn_opcodes_h_l675_c7_5bdf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l675_c7_5bdf_cond <= VAR_n8_MUX_uxn_opcodes_h_l675_c7_5bdf_cond;
     n8_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue;
     n8_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output := n8_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l675_c7_5bdf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output;

     -- t8_MUX[uxn_opcodes_h_l672_c7_7723] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l672_c7_7723_cond <= VAR_t8_MUX_uxn_opcodes_h_l672_c7_7723_cond;
     t8_MUX_uxn_opcodes_h_l672_c7_7723_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l672_c7_7723_iftrue;
     t8_MUX_uxn_opcodes_h_l672_c7_7723_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l672_c7_7723_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l672_c7_7723_return_output := t8_MUX_uxn_opcodes_h_l672_c7_7723_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c7_5bdf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output;

     -- MUX[uxn_opcodes_h_l682_c22_eaf9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l682_c22_eaf9_cond <= VAR_MUX_uxn_opcodes_h_l682_c22_eaf9_cond;
     MUX_uxn_opcodes_h_l682_c22_eaf9_iftrue <= VAR_MUX_uxn_opcodes_h_l682_c22_eaf9_iftrue;
     MUX_uxn_opcodes_h_l682_c22_eaf9_iffalse <= VAR_MUX_uxn_opcodes_h_l682_c22_eaf9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l682_c22_eaf9_return_output := MUX_uxn_opcodes_h_l682_c22_eaf9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue := VAR_MUX_uxn_opcodes_h_l682_c22_eaf9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l672_c7_7723_iffalse := VAR_n8_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l659_c2_b365_iffalse := VAR_t8_MUX_uxn_opcodes_h_l672_c7_7723_return_output;
     -- t8_MUX[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l659_c2_b365_cond <= VAR_t8_MUX_uxn_opcodes_h_l659_c2_b365_cond;
     t8_MUX_uxn_opcodes_h_l659_c2_b365_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l659_c2_b365_iftrue;
     t8_MUX_uxn_opcodes_h_l659_c2_b365_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l659_c2_b365_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l659_c2_b365_return_output := t8_MUX_uxn_opcodes_h_l659_c2_b365_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l672_c7_7723] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l678_c7_dd5c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output := result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l672_c7_7723] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l672_c7_7723] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_return_output;

     -- n8_MUX[uxn_opcodes_h_l672_c7_7723] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l672_c7_7723_cond <= VAR_n8_MUX_uxn_opcodes_h_l672_c7_7723_cond;
     n8_MUX_uxn_opcodes_h_l672_c7_7723_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l672_c7_7723_iftrue;
     n8_MUX_uxn_opcodes_h_l672_c7_7723_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l672_c7_7723_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l672_c7_7723_return_output := n8_MUX_uxn_opcodes_h_l672_c7_7723_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l659_c2_b365_iffalse := VAR_n8_MUX_uxn_opcodes_h_l672_c7_7723_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_7723_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_7723_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_7723_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dd5c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l659_c2_b365_return_output;
     -- n8_MUX[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l659_c2_b365_cond <= VAR_n8_MUX_uxn_opcodes_h_l659_c2_b365_cond;
     n8_MUX_uxn_opcodes_h_l659_c2_b365_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l659_c2_b365_iftrue;
     n8_MUX_uxn_opcodes_h_l659_c2_b365_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l659_c2_b365_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l659_c2_b365_return_output := n8_MUX_uxn_opcodes_h_l659_c2_b365_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l675_c7_5bdf] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_cond;
     result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output := result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l659_c2_b365_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_5bdf_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l672_c7_7723] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_cond;
     result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_return_output := result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_7723_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l659_c2_b365] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_cond;
     result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_return_output := result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_161f_uxn_opcodes_h_l686_l655_DUPLICATE_36a3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_161f_uxn_opcodes_h_l686_l655_DUPLICATE_36a3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_161f(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_b365_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_b365_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_161f_uxn_opcodes_h_l686_l655_DUPLICATE_36a3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_161f_uxn_opcodes_h_l686_l655_DUPLICATE_36a3_return_output;
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
