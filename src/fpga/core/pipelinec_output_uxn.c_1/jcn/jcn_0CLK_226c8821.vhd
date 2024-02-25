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
-- BIN_OP_EQ[uxn_opcodes_h_l658_c6_9360]
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l658_c2_d8e3]
signal t8_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l658_c2_d8e3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l658_c2_d8e3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l658_c2_d8e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l658_c2_d8e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l658_c2_d8e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l658_c2_d8e3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l658_c2_d8e3]
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l658_c2_d8e3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l658_c2_d8e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l658_c2_d8e3]
signal n8_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l671_c11_59d5]
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l671_c7_6312]
signal t8_MUX_uxn_opcodes_h_l671_c7_6312_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_6312_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_6312_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l671_c7_6312_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l671_c7_6312]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l671_c7_6312]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l671_c7_6312]
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l671_c7_6312]
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l671_c7_6312]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l671_c7_6312]
signal n8_MUX_uxn_opcodes_h_l671_c7_6312_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_6312_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_6312_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l671_c7_6312_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l674_c11_a1e4]
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l674_c7_0f7f]
signal t8_MUX_uxn_opcodes_h_l674_c7_0f7f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l674_c7_0f7f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l674_c7_0f7f]
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_0f7f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_0f7f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l674_c7_0f7f]
signal n8_MUX_uxn_opcodes_h_l674_c7_0f7f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l677_c11_5cab]
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l677_c7_f902]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l677_c7_f902]
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l677_c7_f902]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l677_c7_f902]
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l677_c7_f902]
signal n8_MUX_uxn_opcodes_h_l677_c7_f902_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_f902_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_f902_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l677_c7_f902_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l679_c30_c3c8]
signal sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l681_c22_df65]
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l681_c37_2a51]
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l681_c22_ab44]
signal MUX_uxn_opcodes_h_l681_c22_ab44_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_ab44_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_ab44_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l681_c22_ab44_return_output : unsigned(15 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6a57( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360
BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_left,
BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_right,
BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output);

-- t8_MUX_uxn_opcodes_h_l658_c2_d8e3
t8_MUX_uxn_opcodes_h_l658_c2_d8e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l658_c2_d8e3_cond,
t8_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue,
t8_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse,
t8_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3
result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_cond,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output);

-- n8_MUX_uxn_opcodes_h_l658_c2_d8e3
n8_MUX_uxn_opcodes_h_l658_c2_d8e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l658_c2_d8e3_cond,
n8_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue,
n8_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse,
n8_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5
BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_left,
BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_right,
BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_return_output);

-- t8_MUX_uxn_opcodes_h_l671_c7_6312
t8_MUX_uxn_opcodes_h_l671_c7_6312 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l671_c7_6312_cond,
t8_MUX_uxn_opcodes_h_l671_c7_6312_iftrue,
t8_MUX_uxn_opcodes_h_l671_c7_6312_iffalse,
t8_MUX_uxn_opcodes_h_l671_c7_6312_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312
result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_cond,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_return_output);

-- n8_MUX_uxn_opcodes_h_l671_c7_6312
n8_MUX_uxn_opcodes_h_l671_c7_6312 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l671_c7_6312_cond,
n8_MUX_uxn_opcodes_h_l671_c7_6312_iftrue,
n8_MUX_uxn_opcodes_h_l671_c7_6312_iffalse,
n8_MUX_uxn_opcodes_h_l671_c7_6312_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4
BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_left,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_right,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_return_output);

-- t8_MUX_uxn_opcodes_h_l674_c7_0f7f
t8_MUX_uxn_opcodes_h_l674_c7_0f7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l674_c7_0f7f_cond,
t8_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue,
t8_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse,
t8_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f
result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_cond,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output);

-- n8_MUX_uxn_opcodes_h_l674_c7_0f7f
n8_MUX_uxn_opcodes_h_l674_c7_0f7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l674_c7_0f7f_cond,
n8_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue,
n8_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse,
n8_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab
BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_left,
BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_right,
BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902
result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_cond,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_return_output);

-- n8_MUX_uxn_opcodes_h_l677_c7_f902
n8_MUX_uxn_opcodes_h_l677_c7_f902 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l677_c7_f902_cond,
n8_MUX_uxn_opcodes_h_l677_c7_f902_iftrue,
n8_MUX_uxn_opcodes_h_l677_c7_f902_iffalse,
n8_MUX_uxn_opcodes_h_l677_c7_f902_return_output);

-- sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8
sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_ins,
sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_x,
sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_y,
sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65
BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_left,
BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_right,
BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_left,
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_right,
BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_return_output);

-- MUX_uxn_opcodes_h_l681_c22_ab44
MUX_uxn_opcodes_h_l681_c22_ab44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l681_c22_ab44_cond,
MUX_uxn_opcodes_h_l681_c22_ab44_iftrue,
MUX_uxn_opcodes_h_l681_c22_ab44_iffalse,
MUX_uxn_opcodes_h_l681_c22_ab44_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output,
 t8_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
 n8_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_return_output,
 t8_MUX_uxn_opcodes_h_l671_c7_6312_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_return_output,
 n8_MUX_uxn_opcodes_h_l671_c7_6312_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_return_output,
 t8_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output,
 n8_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_return_output,
 n8_MUX_uxn_opcodes_h_l677_c7_f902_return_output,
 sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_return_output,
 MUX_uxn_opcodes_h_l681_c22_ab44_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_6312_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_7f19 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_505c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_6312_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c2_d8e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_6312_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_6312_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l671_c7_6312_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_6f03 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_6312_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_6312_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_6312_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l671_c7_6312_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l674_c7_0f7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_f902_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l674_c7_0f7f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_f902_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_f902_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l677_c7_f902_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_ab44_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_ab44_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_ab44_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_27d1_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l681_c22_ab44_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_bb39_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_2f95_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_8a40_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_8bb7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l685_l654_DUPLICATE_2656_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_505c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l668_c3_505c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_7f19 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l663_c3_7f19;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_6f03 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_6f03;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_6312_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_f902_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l681_c22_ab44_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_f902_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_6312_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_8a40 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_8a40_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l679_c30_c3c8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_ins;
     sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_x;
     sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_return_output := sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_d8e3_return_output := result.is_stack_index_flipped;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_d8e3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l658_c6_9360] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_left;
     BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output := BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l681_c22_df65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_left;
     BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_return_output := BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_8bb7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_8bb7_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l674_c11_a1e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l681_c42_27d1] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_27d1_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l677_c11_5cab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_left;
     BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_return_output := BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l671_c11_59d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_d8e3_return_output := result.is_ram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l671_c7_6312] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_6312_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_2f95 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_2f95_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_bb39 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_bb39_return_output := result.u16_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_d8e3_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_d8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_d8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c6_9360_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_6312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_6312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l671_c11_59d5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_0f7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_0f7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_a1e4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_f902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l677_c11_5cab_return_output;
     VAR_MUX_uxn_opcodes_h_l681_c22_ab44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c22_df65_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l681_c42_27d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_8a40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_8a40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_8a40_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_bb39_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_bb39_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_bb39_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l674_l658_l677_l671_DUPLICATE_bb39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_8bb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_8bb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_8bb7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_2f95_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_2f95_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l674_l677_l671_DUPLICATE_2f95_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l658_c2_d8e3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l658_c2_d8e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l658_c2_d8e3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l658_c2_d8e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l671_c7_6312_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l679_c30_c3c8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l677_c7_f902] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l681_c37_2a51] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_left;
     BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_return_output := BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l671_c7_6312] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output;

     -- n8_MUX[uxn_opcodes_h_l677_c7_f902] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l677_c7_f902_cond <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_f902_cond;
     n8_MUX_uxn_opcodes_h_l677_c7_f902_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_f902_iftrue;
     n8_MUX_uxn_opcodes_h_l677_c7_f902_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l677_c7_f902_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l677_c7_f902_return_output := n8_MUX_uxn_opcodes_h_l677_c7_f902_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output;

     -- t8_MUX[uxn_opcodes_h_l674_c7_0f7f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l674_c7_0f7f_cond <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_0f7f_cond;
     t8_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue;
     t8_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output := t8_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l677_c7_f902] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l677_c7_f902] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l681_c22_ab44_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l681_c37_2a51_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l677_c7_f902_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l677_c7_f902_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l677_c7_f902_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l677_c7_f902_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l671_c7_6312_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_6312_iffalse := VAR_t8_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output;
     -- t8_MUX[uxn_opcodes_h_l671_c7_6312] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l671_c7_6312_cond <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_6312_cond;
     t8_MUX_uxn_opcodes_h_l671_c7_6312_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_6312_iftrue;
     t8_MUX_uxn_opcodes_h_l671_c7_6312_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l671_c7_6312_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l671_c7_6312_return_output := t8_MUX_uxn_opcodes_h_l671_c7_6312_return_output;

     -- MUX[uxn_opcodes_h_l681_c22_ab44] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l681_c22_ab44_cond <= VAR_MUX_uxn_opcodes_h_l681_c22_ab44_cond;
     MUX_uxn_opcodes_h_l681_c22_ab44_iftrue <= VAR_MUX_uxn_opcodes_h_l681_c22_ab44_iftrue;
     MUX_uxn_opcodes_h_l681_c22_ab44_iffalse <= VAR_MUX_uxn_opcodes_h_l681_c22_ab44_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l681_c22_ab44_return_output := MUX_uxn_opcodes_h_l681_c22_ab44_return_output;

     -- n8_MUX[uxn_opcodes_h_l674_c7_0f7f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l674_c7_0f7f_cond <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_0f7f_cond;
     n8_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue;
     n8_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output := n8_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l674_c7_0f7f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_0f7f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_0f7f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_iftrue := VAR_MUX_uxn_opcodes_h_l681_c22_ab44_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_6312_iffalse := VAR_n8_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l671_c7_6312_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l677_c7_f902] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_cond;
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_return_output := result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l671_c7_6312] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_return_output;

     -- t8_MUX[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l658_c2_d8e3_cond <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_d8e3_cond;
     t8_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue;
     t8_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output := t8_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l671_c7_6312] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_return_output;

     -- n8_MUX[uxn_opcodes_h_l671_c7_6312] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l671_c7_6312_cond <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_6312_cond;
     n8_MUX_uxn_opcodes_h_l671_c7_6312_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_6312_iftrue;
     n8_MUX_uxn_opcodes_h_l671_c7_6312_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l671_c7_6312_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l671_c7_6312_return_output := n8_MUX_uxn_opcodes_h_l671_c7_6312_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l671_c7_6312] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l671_c7_6312_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l671_c7_6312_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l671_c7_6312_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l671_c7_6312_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l677_c7_f902_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output;
     -- n8_MUX[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l658_c2_d8e3_cond <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_d8e3_cond;
     n8_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue;
     n8_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output := n8_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l674_c7_0f7f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output := result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l674_c7_0f7f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l671_c7_6312] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_cond;
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_return_output := result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l671_c7_6312_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l658_c2_d8e3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output := result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l685_l654_DUPLICATE_2656 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l685_l654_DUPLICATE_2656_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6a57(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l658_c2_d8e3_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l685_l654_DUPLICATE_2656_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l685_l654_DUPLICATE_2656_return_output;
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
