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
-- Submodules: 42
entity jci_0CLK_4351dde2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_4351dde2;
architecture arch of jci_0CLK_4351dde2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_3bec]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_152a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_152a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_152a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_152a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_152a]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_152a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_152a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_152a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_152a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_152a]
signal t8_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_152a]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_4065]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_895f]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_895f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_895f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_895f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_895f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_895f]
signal t8_MUX_uxn_opcodes_h_l85_c7_895f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_895f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_895f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_895f_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_895f]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_895f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_895f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_895f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_895f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_db93]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_c7df]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_1017]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_1017]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_1017]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_1017]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_1017]
signal t8_MUX_uxn_opcodes_h_l90_c7_1017_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_1017_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_1017_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_1017_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_1017]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_1017_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_1017_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_1017_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_1017_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_d257]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_d257_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_d257_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_24ee]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_e0a9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l96_c7_e0a9]
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_e0a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_e0a9]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_1dcf]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c22_c2e6]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_788f]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_bd70]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_3094]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c22_7e78]
signal MUX_uxn_opcodes_h_l99_c22_7e78_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_7e78_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_7e78_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_7e78_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec
BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a
result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_152a
t8_MUX_uxn_opcodes_h_l71_c2_152a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_152a_cond,
t8_MUX_uxn_opcodes_h_l71_c2_152a_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_152a_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_152a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_152a
tmp16_MUX_uxn_opcodes_h_l71_c2_152a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_152a_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_152a_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_152a_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_152a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065
BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f
result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_895f
t8_MUX_uxn_opcodes_h_l85_c7_895f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_895f_cond,
t8_MUX_uxn_opcodes_h_l85_c7_895f_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_895f_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_895f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_895f
tmp16_MUX_uxn_opcodes_h_l85_c7_895f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_895f_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_895f_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_895f_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_895f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df
BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017
result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_1017
t8_MUX_uxn_opcodes_h_l90_c7_1017 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_1017_cond,
t8_MUX_uxn_opcodes_h_l90_c7_1017_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_1017_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_1017_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_1017
tmp16_MUX_uxn_opcodes_h_l90_c7_1017 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_1017_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_1017_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_1017_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_1017_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_d257
CONST_SL_8_uxn_opcodes_h_l93_c3_d257 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_d257_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_d257_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee
BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9
result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_cond,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9
tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf
BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6
BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_return_output);

-- MUX_uxn_opcodes_h_l99_c22_7e78
MUX_uxn_opcodes_h_l99_c22_7e78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c22_7e78_cond,
MUX_uxn_opcodes_h_l99_c22_7e78_iftrue,
MUX_uxn_opcodes_h_l99_c22_7e78_iffalse,
MUX_uxn_opcodes_h_l99_c22_7e78_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_895f_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_895f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_1017_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_1017_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_d257_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_return_output,
 MUX_uxn_opcodes_h_l99_c22_7e78_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_2a32 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_4d71 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_895f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_152a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_152a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_895f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_152a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_152a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_8ff3 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_474e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_552e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_895f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_895f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_895f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_1017_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_895f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_895f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_895f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_1017_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_895f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_c2bd : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_1017_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_1017_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_1017_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_1017_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_1017_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_1017_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_1017_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_d257_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_d257_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_7e78_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_7e78_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_7e78_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_7e78_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_5857_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_c882_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_bbd3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_764c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l103_l66_DUPLICATE_1757_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_2a32 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_2a32;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_c2bd := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_c2bd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_4d71 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_4d71;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_474e := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_474e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_552e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_552e;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_right := to_unsigned(3, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_1017_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_152a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_895f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_1017_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_152a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_895f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse := tmp16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_152a_return_output := result.is_ram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_152a_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_788f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_bbd3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_bbd3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_24ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_4065] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l85_c7_895f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_895f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_c882 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_c882_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_152a_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_5857 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_5857_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_3bec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_152a_return_output := result.is_stack_index_flipped;

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_db93] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c22_c2e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_c7df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_764c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_764c_return_output := result.u16_value;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l90_c7_1017] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_1017_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_152a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_152a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_3bec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_895f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_895f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_4065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_1017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_1017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_c7df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_24ee_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c22_7e78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_c2e6_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_8ff3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_db93_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c22_7e78_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_788f_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_bbd3_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_d257_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_bbd3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_764c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_764c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_c882_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_c882_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_c882_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_5857_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_5857_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_5857_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_152a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_152a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_152a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_152a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_1017_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_895f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_8ff3;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_1017] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_e0a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_d257] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_d257_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_d257_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_d257_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_d257_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_1dcf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_e0a9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output;

     -- t8_MUX[uxn_opcodes_h_l90_c7_1017] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_1017_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_1017_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_1017_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_1017_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_1017_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_1017_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_1017_return_output := t8_MUX_uxn_opcodes_h_l90_c7_1017_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_895f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_1dcf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_1017_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_d257_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_1017_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_895f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_895f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_1017_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l96_c7_e0a9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_895f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_1017] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_return_output;

     -- t8_MUX[uxn_opcodes_h_l85_c7_895f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_895f_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_895f_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_895f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_895f_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_895f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_895f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_895f_return_output := t8_MUX_uxn_opcodes_h_l85_c7_895f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_bd70] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_1017] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_bd70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_1017_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_1017_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_895f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_152a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_895f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_1017_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_3094] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_895f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_152a_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_152a_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_152a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_152a_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_152a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_152a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_152a_return_output := t8_MUX_uxn_opcodes_h_l71_c2_152a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_895f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_1017] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_1017_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_1017_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_1017_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_1017_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_1017_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_1017_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_1017_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_1017_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c22_7e78_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_3094_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_895f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_895f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_152a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_895f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_1017_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_return_output;

     -- MUX[uxn_opcodes_h_l99_c22_7e78] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c22_7e78_cond <= VAR_MUX_uxn_opcodes_h_l99_c22_7e78_cond;
     MUX_uxn_opcodes_h_l99_c22_7e78_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c22_7e78_iftrue;
     MUX_uxn_opcodes_h_l99_c22_7e78_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c22_7e78_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c22_7e78_return_output := MUX_uxn_opcodes_h_l99_c22_7e78_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_895f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_895f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_895f_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_895f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_895f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_895f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_895f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_895f_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_895f_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue := VAR_MUX_uxn_opcodes_h_l99_c22_7e78_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_152a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_895f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l96_c7_e0a9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output := result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_152a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_152a_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_152a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_152a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_152a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_152a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_152a_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_152a_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_e0a9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_152a_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_1017] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_1017_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_895f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_895f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_152a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l103_l66_DUPLICATE_1757 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l103_l66_DUPLICATE_1757_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_152a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_152a_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l103_l66_DUPLICATE_1757_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3bc7_uxn_opcodes_h_l103_l66_DUPLICATE_1757_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
