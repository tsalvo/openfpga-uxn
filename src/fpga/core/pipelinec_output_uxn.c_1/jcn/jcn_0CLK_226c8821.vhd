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
-- BIN_OP_EQ[uxn_opcodes_h_l658_c6_b2d4]
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l658_c2_8204]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l658_c2_8204]
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l658_c2_8204]
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l658_c2_8204]
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l658_c2_8204]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l658_c2_8204]
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l658_c2_8204]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l658_c2_8204]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l658_c2_8204]
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l658_c2_8204]
signal n8_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l658_c2_8204]
signal t8_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l671_c11_48b6]
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l671_c7_9a79]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l671_c7_9a79]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l671_c7_9a79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l671_c7_9a79]
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l671_c7_9a79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l671_c7_9a79]
signal n8_MUX_uxn_opcodes_h_l671_c7_9a79_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_9a79_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l671_c7_9a79]
signal t8_MUX_uxn_opcodes_h_l671_c7_9a79_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_9a79_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l674_c11_113e]
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l674_c7_5c0c]
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l674_c7_5c0c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_5c0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_5c0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l674_c7_5c0c]
signal n8_MUX_uxn_opcodes_h_l674_c7_5c0c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l674_c7_5c0c]
signal t8_MUX_uxn_opcodes_h_l674_c7_5c0c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l677_c11_8476]
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l677_c7_9c69]
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l677_c7_9c69]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l677_c7_9c69]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l677_c7_9c69]
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l677_c7_9c69]
signal n8_MUX_uxn_opcodes_h_l677_c7_9c69_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_9c69_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l679_c30_6d41]
signal sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l681_c22_a310]
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l681_c37_431f]
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l681_c22_0bbf]
signal MUX_uxn_opcodes_h_l681_c22_0bbf_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_0bbf_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_0bbf_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_0bbf_return_output : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6bdc( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4
BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_left,
BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_right,
BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204
result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_cond,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_return_output);

-- n8_MUX_uxn_opcodes_h_l658_c2_8204
n8_MUX_uxn_opcodes_h_l658_c2_8204 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l658_c2_8204_cond,
n8_MUX_uxn_opcodes_h_l658_c2_8204_iftrue,
n8_MUX_uxn_opcodes_h_l658_c2_8204_iffalse,
n8_MUX_uxn_opcodes_h_l658_c2_8204_return_output);

-- t8_MUX_uxn_opcodes_h_l658_c2_8204
t8_MUX_uxn_opcodes_h_l658_c2_8204 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l658_c2_8204_cond,
t8_MUX_uxn_opcodes_h_l658_c2_8204_iftrue,
t8_MUX_uxn_opcodes_h_l658_c2_8204_iffalse,
t8_MUX_uxn_opcodes_h_l658_c2_8204_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6
BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_left,
BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_right,
BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79
result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_cond,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_return_output);

-- n8_MUX_uxn_opcodes_h_l671_c7_9a79
n8_MUX_uxn_opcodes_h_l671_c7_9a79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l671_c7_9a79_cond,
n8_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue,
n8_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse,
n8_MUX_uxn_opcodes_h_l671_c7_9a79_return_output);

-- t8_MUX_uxn_opcodes_h_l671_c7_9a79
t8_MUX_uxn_opcodes_h_l671_c7_9a79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l671_c7_9a79_cond,
t8_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue,
t8_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse,
t8_MUX_uxn_opcodes_h_l671_c7_9a79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e
BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_left,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_right,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c
result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_cond,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output);

-- n8_MUX_uxn_opcodes_h_l674_c7_5c0c
n8_MUX_uxn_opcodes_h_l674_c7_5c0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l674_c7_5c0c_cond,
n8_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue,
n8_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse,
n8_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output);

-- t8_MUX_uxn_opcodes_h_l674_c7_5c0c
t8_MUX_uxn_opcodes_h_l674_c7_5c0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l674_c7_5c0c_cond,
t8_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue,
t8_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse,
t8_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476
BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_left,
BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_right,
BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69
result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_cond,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_return_output);

-- n8_MUX_uxn_opcodes_h_l677_c7_9c69
n8_MUX_uxn_opcodes_h_l677_c7_9c69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l677_c7_9c69_cond,
n8_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue,
n8_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse,
n8_MUX_uxn_opcodes_h_l677_c7_9c69_return_output);

-- sp_relative_shift_uxn_opcodes_h_l679_c30_6d41
sp_relative_shift_uxn_opcodes_h_l679_c30_6d41 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_ins,
sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_x,
sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_y,
sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310
BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_left,
BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_right,
BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_left,
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_right,
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_return_output);

-- MUX_uxn_opcodes_h_l681_c22_0bbf
MUX_uxn_opcodes_h_l681_c22_0bbf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l681_c22_0bbf_cond,
MUX_uxn_opcodes_h_l681_c22_0bbf_iftrue,
MUX_uxn_opcodes_h_l681_c22_0bbf_iffalse,
MUX_uxn_opcodes_h_l681_c22_0bbf_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
 n8_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
 t8_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_return_output,
 n8_MUX_uxn_opcodes_h_l671_c7_9a79_return_output,
 t8_MUX_uxn_opcodes_h_l671_c7_9a79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output,
 n8_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output,
 t8_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_return_output,
 n8_MUX_uxn_opcodes_h_l677_c7_9c69_return_output,
 sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_return_output,
 MUX_uxn_opcodes_h_l681_c22_0bbf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_a879 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_378f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_9a79_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_8204_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_8204_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_9a79_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_8204_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_8204_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_c529 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_9a79_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_9a79_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_9a79_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_9c69_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_5c0c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_5c0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_9c69_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_0bbf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_0bbf_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_0bbf_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_76b5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_0bbf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_42bc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_157e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_c78a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_3ab3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6bdc_uxn_opcodes_h_l685_l654_DUPLICATE_d927_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_a879 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_a879;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_c529 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_c529;
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_378f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_378f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_8204_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l681_c22_0bbf_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_8204_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l679_c30_6d41] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_ins;
     sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_x <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_x;
     sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_y <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_return_output := sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l671_c11_48b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_8204_return_output := result.is_ram_write;

     -- CAST_TO_int8_t[uxn_opcodes_h_l681_c42_76b5] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_76b5_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_157e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_157e_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_8204_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l681_c22_a310] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_left;
     BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_return_output := BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_42bc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_42bc_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l671_c7_9a79] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_9a79_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l677_c11_8476] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_left;
     BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_return_output := BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l674_c11_113e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_left;
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_return_output := BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_8204_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l658_c6_b2d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_c78a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_c78a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_3ab3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_3ab3_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_8204_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_8204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_8204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_b2d4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_9a79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_48b6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_5c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_5c0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_113e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_9c69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_8476_return_output;
     VAR_MUX_uxn_opcodes_h_l681_c22_0bbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_a310_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_76b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_c78a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_c78a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_c78a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_42bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_42bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_42bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_42bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_3ab3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_3ab3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_3ab3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_157e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_157e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_157e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_8204_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_8204_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_8204_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_8204_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_9a79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_6d41_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l677_c7_9c69] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l681_c37_431f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l671_c7_9a79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_return_output;

     -- t8_MUX[uxn_opcodes_h_l674_c7_5c0c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l674_c7_5c0c_cond <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_5c0c_cond;
     t8_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue;
     t8_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output := t8_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l677_c7_9c69] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_return_output;

     -- n8_MUX[uxn_opcodes_h_l677_c7_9c69] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l677_c7_9c69_cond <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_9c69_cond;
     n8_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue;
     n8_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_9c69_return_output := n8_MUX_uxn_opcodes_h_l677_c7_9c69_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l677_c7_9c69] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l681_c22_0bbf_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_431f_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l677_c7_9c69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_9c69_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_9c69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_9c69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_9a79_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse := VAR_t8_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l674_c7_5c0c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output;

     -- MUX[uxn_opcodes_h_l681_c22_0bbf] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l681_c22_0bbf_cond <= VAR_MUX_uxn_opcodes_h_l681_c22_0bbf_cond;
     MUX_uxn_opcodes_h_l681_c22_0bbf_iftrue <= VAR_MUX_uxn_opcodes_h_l681_c22_0bbf_iftrue;
     MUX_uxn_opcodes_h_l681_c22_0bbf_iffalse <= VAR_MUX_uxn_opcodes_h_l681_c22_0bbf_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l681_c22_0bbf_return_output := MUX_uxn_opcodes_h_l681_c22_0bbf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_5c0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output;

     -- t8_MUX[uxn_opcodes_h_l671_c7_9a79] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l671_c7_9a79_cond <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_9a79_cond;
     t8_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue;
     t8_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_9a79_return_output := t8_MUX_uxn_opcodes_h_l671_c7_9a79_return_output;

     -- n8_MUX[uxn_opcodes_h_l674_c7_5c0c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l674_c7_5c0c_cond <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_5c0c_cond;
     n8_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue;
     n8_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output := n8_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_5c0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue := VAR_MUX_uxn_opcodes_h_l681_c22_0bbf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse := VAR_n8_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_8204_iffalse := VAR_t8_MUX_uxn_opcodes_h_l671_c7_9a79_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l671_c7_9a79] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l671_c7_9a79] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_return_output;

     -- n8_MUX[uxn_opcodes_h_l671_c7_9a79] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l671_c7_9a79_cond <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_9a79_cond;
     n8_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue;
     n8_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_9a79_return_output := n8_MUX_uxn_opcodes_h_l671_c7_9a79_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l671_c7_9a79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_return_output;

     -- t8_MUX[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l658_c2_8204_cond <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_8204_cond;
     t8_MUX_uxn_opcodes_h_l658_c2_8204_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_8204_iftrue;
     t8_MUX_uxn_opcodes_h_l658_c2_8204_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_8204_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_8204_return_output := t8_MUX_uxn_opcodes_h_l658_c2_8204_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l677_c7_9c69] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_cond;
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_return_output := result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_8204_iffalse := VAR_n8_MUX_uxn_opcodes_h_l671_c7_9a79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_9a79_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_9a79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_9a79_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_9c69_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l658_c2_8204_return_output;
     -- n8_MUX[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l658_c2_8204_cond <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_8204_cond;
     n8_MUX_uxn_opcodes_h_l658_c2_8204_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_8204_iftrue;
     n8_MUX_uxn_opcodes_h_l658_c2_8204_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_8204_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_8204_return_output := n8_MUX_uxn_opcodes_h_l658_c2_8204_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l674_c7_5c0c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output := result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l658_c2_8204_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_5c0c_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l671_c7_9a79] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_cond;
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_return_output := result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_9a79_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l658_c2_8204] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_cond;
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_return_output := result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6bdc_uxn_opcodes_h_l685_l654_DUPLICATE_d927 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6bdc_uxn_opcodes_h_l685_l654_DUPLICATE_d927_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6bdc(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_8204_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_8204_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6bdc_uxn_opcodes_h_l685_l654_DUPLICATE_d927_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6bdc_uxn_opcodes_h_l685_l654_DUPLICATE_d927_return_output;
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
