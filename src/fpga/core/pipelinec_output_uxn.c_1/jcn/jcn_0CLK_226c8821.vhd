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
-- BIN_OP_EQ[uxn_opcodes_h_l659_c6_6078]
signal BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l659_c2_fcf3]
signal n8_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l659_c2_fcf3]
signal t8_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l659_c2_fcf3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l659_c2_fcf3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l659_c2_fcf3]
signal result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l659_c2_fcf3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l659_c2_fcf3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l659_c2_fcf3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l659_c2_fcf3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l659_c2_fcf3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l659_c2_fcf3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l672_c11_3ebf]
signal BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l672_c7_5114]
signal n8_MUX_uxn_opcodes_h_l672_c7_5114_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l672_c7_5114_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l672_c7_5114_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l672_c7_5114_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l672_c7_5114]
signal t8_MUX_uxn_opcodes_h_l672_c7_5114_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l672_c7_5114_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l672_c7_5114_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l672_c7_5114_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l672_c7_5114]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l672_c7_5114]
signal result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l672_c7_5114]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l672_c7_5114]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l672_c7_5114]
signal result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l675_c11_ad3c]
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l675_c7_8adb]
signal n8_MUX_uxn_opcodes_h_l675_c7_8adb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l675_c7_8adb_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l675_c7_8adb]
signal t8_MUX_uxn_opcodes_h_l675_c7_8adb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l675_c7_8adb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l675_c7_8adb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l675_c7_8adb]
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c7_8adb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l675_c7_8adb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l678_c11_7649]
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l678_c7_dee5]
signal n8_MUX_uxn_opcodes_h_l678_c7_dee5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l678_c7_dee5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l678_c7_dee5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l678_c7_dee5]
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l678_c7_dee5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l678_c7_dee5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l680_c30_080b]
signal sp_relative_shift_uxn_opcodes_h_l680_c30_080b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l680_c30_080b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l680_c30_080b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l680_c30_080b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l682_c22_b05c]
signal BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l682_c37_4d39]
signal BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l682_c22_2ab9]
signal MUX_uxn_opcodes_h_l682_c22_2ab9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l682_c22_2ab9_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l682_c22_2ab9_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l682_c22_2ab9_return_output : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6063( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078
BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_left,
BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_right,
BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output);

-- n8_MUX_uxn_opcodes_h_l659_c2_fcf3
n8_MUX_uxn_opcodes_h_l659_c2_fcf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l659_c2_fcf3_cond,
n8_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue,
n8_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse,
n8_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output);

-- t8_MUX_uxn_opcodes_h_l659_c2_fcf3
t8_MUX_uxn_opcodes_h_l659_c2_fcf3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l659_c2_fcf3_cond,
t8_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue,
t8_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse,
t8_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3
result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_cond,
result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf
BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_left,
BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_right,
BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_return_output);

-- n8_MUX_uxn_opcodes_h_l672_c7_5114
n8_MUX_uxn_opcodes_h_l672_c7_5114 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l672_c7_5114_cond,
n8_MUX_uxn_opcodes_h_l672_c7_5114_iftrue,
n8_MUX_uxn_opcodes_h_l672_c7_5114_iffalse,
n8_MUX_uxn_opcodes_h_l672_c7_5114_return_output);

-- t8_MUX_uxn_opcodes_h_l672_c7_5114
t8_MUX_uxn_opcodes_h_l672_c7_5114 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l672_c7_5114_cond,
t8_MUX_uxn_opcodes_h_l672_c7_5114_iftrue,
t8_MUX_uxn_opcodes_h_l672_c7_5114_iffalse,
t8_MUX_uxn_opcodes_h_l672_c7_5114_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114
result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_cond,
result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c
BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_left,
BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_right,
BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_return_output);

-- n8_MUX_uxn_opcodes_h_l675_c7_8adb
n8_MUX_uxn_opcodes_h_l675_c7_8adb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l675_c7_8adb_cond,
n8_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue,
n8_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse,
n8_MUX_uxn_opcodes_h_l675_c7_8adb_return_output);

-- t8_MUX_uxn_opcodes_h_l675_c7_8adb
t8_MUX_uxn_opcodes_h_l675_c7_8adb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l675_c7_8adb_cond,
t8_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue,
t8_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse,
t8_MUX_uxn_opcodes_h_l675_c7_8adb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb
result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_cond,
result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649
BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_left,
BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_right,
BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_return_output);

-- n8_MUX_uxn_opcodes_h_l678_c7_dee5
n8_MUX_uxn_opcodes_h_l678_c7_dee5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l678_c7_dee5_cond,
n8_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue,
n8_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse,
n8_MUX_uxn_opcodes_h_l678_c7_dee5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5
result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_cond,
result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l680_c30_080b
sp_relative_shift_uxn_opcodes_h_l680_c30_080b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l680_c30_080b_ins,
sp_relative_shift_uxn_opcodes_h_l680_c30_080b_x,
sp_relative_shift_uxn_opcodes_h_l680_c30_080b_y,
sp_relative_shift_uxn_opcodes_h_l680_c30_080b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c
BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_left,
BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_right,
BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39
BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_left,
BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_right,
BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_return_output);

-- MUX_uxn_opcodes_h_l682_c22_2ab9
MUX_uxn_opcodes_h_l682_c22_2ab9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l682_c22_2ab9_cond,
MUX_uxn_opcodes_h_l682_c22_2ab9_iftrue,
MUX_uxn_opcodes_h_l682_c22_2ab9_iffalse,
MUX_uxn_opcodes_h_l682_c22_2ab9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output,
 n8_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
 t8_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_return_output,
 n8_MUX_uxn_opcodes_h_l672_c7_5114_return_output,
 t8_MUX_uxn_opcodes_h_l672_c7_5114_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_return_output,
 n8_MUX_uxn_opcodes_h_l675_c7_8adb_return_output,
 t8_MUX_uxn_opcodes_h_l675_c7_8adb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_return_output,
 n8_MUX_uxn_opcodes_h_l678_c7_dee5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_return_output,
 sp_relative_shift_uxn_opcodes_h_l680_c30_080b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_return_output,
 MUX_uxn_opcodes_h_l682_c22_2ab9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l672_c7_5114_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l672_c7_5114_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l664_c3_b6bd : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l669_c3_afd1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l672_c7_5114_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l672_c7_5114_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_8adb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l672_c7_5114_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l672_c7_5114_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l672_c7_5114_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c7_8adb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l672_c7_5114_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_fee2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l672_c7_5114_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_dee5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l675_c7_8adb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l675_c7_8adb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l678_c7_dee5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_080b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_080b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_080b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_080b_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l682_c22_2ab9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l682_c22_2ab9_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l682_c22_2ab9_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l682_c42_b987_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l682_c22_2ab9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l659_l678_l672_DUPLICATE_eee2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_afe2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_4838_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_3c83_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l686_l655_DUPLICATE_df94_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_fee2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l673_c3_fee2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l669_c3_afd1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l669_c3_afd1;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l664_c3_b6bd := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l664_c3_b6bd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_080b_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_080b_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_080b_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l672_c7_5114_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l682_c22_2ab9_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l672_c7_5114_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse := t8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l659_l678_l672_DUPLICATE_eee2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l659_l678_l672_DUPLICATE_eee2_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l680_c30_080b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l680_c30_080b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_080b_ins;
     sp_relative_shift_uxn_opcodes_h_l680_c30_080b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_080b_x;
     sp_relative_shift_uxn_opcodes_h_l680_c30_080b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_080b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_080b_return_output := sp_relative_shift_uxn_opcodes_h_l680_c30_080b_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l659_c2_fcf3_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_4838 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_4838_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_3c83 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_3c83_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l682_c22_b05c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_left;
     BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_return_output := BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l682_c42_b987] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l682_c42_b987_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l659_c2_fcf3_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l659_c2_fcf3_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l678_c11_7649] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_left;
     BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_return_output := BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l672_c7_5114] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l672_c7_5114_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l659_c2_fcf3_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l659_c6_6078] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_left;
     BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output := BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l672_c11_3ebf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_left;
     BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_return_output := BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_afe2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_afe2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l675_c11_ad3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l659_c2_fcf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l659_c2_fcf3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c6_6078_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l672_c7_5114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l672_c7_5114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l672_c11_3ebf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_8adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l675_c7_8adb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_ad3c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_dee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_7649_return_output;
     VAR_MUX_uxn_opcodes_h_l682_c22_2ab9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c22_b05c_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l682_c42_b987_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_4838_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_4838_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_4838_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l659_l678_l672_DUPLICATE_eee2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l659_l678_l672_DUPLICATE_eee2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l659_l678_l672_DUPLICATE_eee2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l675_l659_l678_l672_DUPLICATE_eee2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_afe2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_afe2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_afe2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_3c83_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_3c83_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l675_l678_l672_DUPLICATE_3c83_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l659_c2_fcf3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l659_c2_fcf3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l659_c2_fcf3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l659_c2_fcf3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l672_c7_5114_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l680_c30_080b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l678_c7_dee5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_return_output;

     -- t8_MUX[uxn_opcodes_h_l675_c7_8adb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l675_c7_8adb_cond <= VAR_t8_MUX_uxn_opcodes_h_l675_c7_8adb_cond;
     t8_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue;
     t8_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l675_c7_8adb_return_output := t8_MUX_uxn_opcodes_h_l675_c7_8adb_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l682_c37_4d39] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_left;
     BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_return_output := BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output;

     -- n8_MUX[uxn_opcodes_h_l678_c7_dee5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l678_c7_dee5_cond <= VAR_n8_MUX_uxn_opcodes_h_l678_c7_dee5_cond;
     n8_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue;
     n8_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l678_c7_dee5_return_output := n8_MUX_uxn_opcodes_h_l678_c7_dee5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l678_c7_dee5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l678_c7_dee5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l672_c7_5114] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l682_c22_2ab9_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l682_c37_4d39_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l678_c7_dee5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_dee5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l678_c7_dee5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_dee5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l672_c7_5114_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l672_c7_5114_iffalse := VAR_t8_MUX_uxn_opcodes_h_l675_c7_8adb_return_output;
     -- t8_MUX[uxn_opcodes_h_l672_c7_5114] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l672_c7_5114_cond <= VAR_t8_MUX_uxn_opcodes_h_l672_c7_5114_cond;
     t8_MUX_uxn_opcodes_h_l672_c7_5114_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l672_c7_5114_iftrue;
     t8_MUX_uxn_opcodes_h_l672_c7_5114_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l672_c7_5114_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l672_c7_5114_return_output := t8_MUX_uxn_opcodes_h_l672_c7_5114_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l675_c7_8adb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c7_8adb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_return_output;

     -- MUX[uxn_opcodes_h_l682_c22_2ab9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l682_c22_2ab9_cond <= VAR_MUX_uxn_opcodes_h_l682_c22_2ab9_cond;
     MUX_uxn_opcodes_h_l682_c22_2ab9_iftrue <= VAR_MUX_uxn_opcodes_h_l682_c22_2ab9_iftrue;
     MUX_uxn_opcodes_h_l682_c22_2ab9_iffalse <= VAR_MUX_uxn_opcodes_h_l682_c22_2ab9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l682_c22_2ab9_return_output := MUX_uxn_opcodes_h_l682_c22_2ab9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output;

     -- n8_MUX[uxn_opcodes_h_l675_c7_8adb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l675_c7_8adb_cond <= VAR_n8_MUX_uxn_opcodes_h_l675_c7_8adb_cond;
     n8_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue;
     n8_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l675_c7_8adb_return_output := n8_MUX_uxn_opcodes_h_l675_c7_8adb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l675_c7_8adb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue := VAR_MUX_uxn_opcodes_h_l682_c22_2ab9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l672_c7_5114_iffalse := VAR_n8_MUX_uxn_opcodes_h_l675_c7_8adb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_8adb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_8adb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l675_c7_8adb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l672_c7_5114_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l672_c7_5114] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l672_c7_5114] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l678_c7_dee5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_return_output := result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l672_c7_5114] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_return_output;

     -- n8_MUX[uxn_opcodes_h_l672_c7_5114] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l672_c7_5114_cond <= VAR_n8_MUX_uxn_opcodes_h_l672_c7_5114_cond;
     n8_MUX_uxn_opcodes_h_l672_c7_5114_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l672_c7_5114_iftrue;
     n8_MUX_uxn_opcodes_h_l672_c7_5114_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l672_c7_5114_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l672_c7_5114_return_output := n8_MUX_uxn_opcodes_h_l672_c7_5114_return_output;

     -- t8_MUX[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l659_c2_fcf3_cond <= VAR_t8_MUX_uxn_opcodes_h_l659_c2_fcf3_cond;
     t8_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue;
     t8_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output := t8_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l672_c7_5114_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l672_c7_5114_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l672_c7_5114_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l672_c7_5114_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l678_c7_dee5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l675_c7_8adb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_return_output := result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output;

     -- n8_MUX[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l659_c2_fcf3_cond <= VAR_n8_MUX_uxn_opcodes_h_l659_c2_fcf3_cond;
     n8_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue;
     n8_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output := n8_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l675_c7_8adb_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l672_c7_5114] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_cond;
     result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_return_output := result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l672_c7_5114_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l659_c2_fcf3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output := result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l686_l655_DUPLICATE_df94 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l686_l655_DUPLICATE_df94_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6063(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c2_fcf3_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l686_l655_DUPLICATE_df94_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l686_l655_DUPLICATE_df94_return_output;
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
