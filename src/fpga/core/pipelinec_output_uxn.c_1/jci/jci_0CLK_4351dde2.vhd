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
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_a3b8]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_0763]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_0763]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_0763]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_0763]
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_0763]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_0763]
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_0763]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_0763]
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_0763]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_0763]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_0763]
signal t8_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_3c3a]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_d18a]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_d18a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_d18a]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_d18a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_d18a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_d18a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_d18a]
signal t8_MUX_uxn_opcodes_h_l85_c7_d18a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_d18a_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_80eb]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_dc4a]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_b306]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_b306_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_b306_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_b306_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_b306_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_b306]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_b306]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_b306]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_b306]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_b306]
signal t8_MUX_uxn_opcodes_h_l90_c7_b306_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_b306_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_b306_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_b306_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_9bf6]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_d181]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_c220]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_c220_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_c220_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_c220_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_c220_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_c220]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l96_c7_c220]
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_c220]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_c8f5]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c22_9585]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_e41f]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_7e5b]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_a137]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c22_d03a]
signal MUX_uxn_opcodes_h_l99_c22_d03a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_d03a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_d03a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_d03a_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c1cd( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8
BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_0763
tmp16_MUX_uxn_opcodes_h_l71_c2_0763 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_0763_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_0763_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_0763_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_0763_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763
result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_0763
t8_MUX_uxn_opcodes_h_l71_c2_0763 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_0763_cond,
t8_MUX_uxn_opcodes_h_l71_c2_0763_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_0763_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_0763_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a
BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_d18a
tmp16_MUX_uxn_opcodes_h_l85_c7_d18a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a
result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_d18a
t8_MUX_uxn_opcodes_h_l85_c7_d18a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_d18a_cond,
t8_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_d18a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a
BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_b306
tmp16_MUX_uxn_opcodes_h_l90_c7_b306 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_b306_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_b306_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_b306_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_b306_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306
result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_b306
t8_MUX_uxn_opcodes_h_l90_c7_b306 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_b306_cond,
t8_MUX_uxn_opcodes_h_l90_c7_b306_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_b306_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_b306_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6
CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181
BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_c220
tmp16_MUX_uxn_opcodes_h_l96_c7_c220 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_c220_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_c220_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_c220_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_c220_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220
result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_cond,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5
BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585
BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_return_output);

-- MUX_uxn_opcodes_h_l99_c22_d03a
MUX_uxn_opcodes_h_l99_c22_d03a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c22_d03a_cond,
MUX_uxn_opcodes_h_l99_c22_d03a_iftrue,
MUX_uxn_opcodes_h_l99_c22_d03a_iffalse,
MUX_uxn_opcodes_h_l99_c22_d03a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_d18a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_b306_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_b306_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_c220_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_return_output,
 MUX_uxn_opcodes_h_l99_c22_d03a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_29c6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_cbfe : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_0763_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_0763_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_d18a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_0763_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_0763_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b306_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_9b44 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_d18a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_7af5 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_538b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_b306_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_d18a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b306_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b306_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_c220_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b306_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_d7d5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_b306_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_b306_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_b306_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_b306_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_c220_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_c220_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_c220_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_d03a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_d03a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_d03a_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_d03a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_7319_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d55f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_90dd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_7b9c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1cd_uxn_opcodes_h_l103_l66_DUPLICATE_adac_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_d7d5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_d7d5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_538b := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_538b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_9b44 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_9b44;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_29c6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_29c6;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_cbfe := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_cbfe;

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_b306_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_0763_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_b306_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0763_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_c220_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_d181] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l85_c7_d18a] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_d18a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_3c3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_0763_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c22_9585] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_a3b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_90dd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_90dd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l90_c7_b306] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_b306_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_dc4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d55f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d55f_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_0763_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_7b9c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_7b9c_return_output := result.u16_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_e41f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_0763_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_0763_return_output := result.is_stack_index_flipped;

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_80eb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_7319 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_7319_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_0763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_a3b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_d18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_3c3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_b306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_dc4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_c220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_d181_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c22_d03a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_9585_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_7af5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_80eb_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c22_d03a_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_e41f_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_90dd_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_90dd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_7b9c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_7b9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d55f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d55f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d55f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_7319_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_7319_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_7319_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_0763_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_0763_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_0763_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_0763_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_b306_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_d18a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_7af5;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_b306] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_d18a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_c220] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_9bf6] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_c8f5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output;

     -- t8_MUX[uxn_opcodes_h_l90_c7_b306] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_b306_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_b306_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_b306_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_b306_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_b306_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_b306_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_b306_return_output := t8_MUX_uxn_opcodes_h_l90_c7_b306_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_c220] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_c220_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_c8f5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b306_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_9bf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_c220_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_c220_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_b306_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d18a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_b306_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_b306] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_return_output;

     -- t8_MUX[uxn_opcodes_h_l85_c7_d18a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_d18a_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_d18a_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_d18a_return_output := t8_MUX_uxn_opcodes_h_l85_c7_d18a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_b306] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_d18a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l96_c7_c220] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_c220_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_c220_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_c220_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_c220_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_c220_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_c220_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_c220_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_c220_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_7e5b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_7e5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_b306_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_b306_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d18a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_0763_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_d18a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b306_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_c220_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_a137] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_0763_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_0763_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_0763_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_0763_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_0763_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_0763_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_0763_return_output := t8_MUX_uxn_opcodes_h_l71_c2_0763_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_d18a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_d18a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_b306] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_b306_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b306_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_b306_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b306_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_b306_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b306_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b306_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_b306_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c22_d03a_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_a137_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d18a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d18a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_0763_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_b306_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_d18a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_return_output;

     -- MUX[uxn_opcodes_h_l99_c22_d03a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c22_d03a_cond <= VAR_MUX_uxn_opcodes_h_l99_c22_d03a_cond;
     MUX_uxn_opcodes_h_l99_c22_d03a_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c22_d03a_iftrue;
     MUX_uxn_opcodes_h_l99_c22_d03a_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c22_d03a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c22_d03a_return_output := MUX_uxn_opcodes_h_l99_c22_d03a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_iftrue := VAR_MUX_uxn_opcodes_h_l99_c22_d03a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0763_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d18a_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l96_c7_c220] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_cond;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_return_output := result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_0763_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0763_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_0763_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0763_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_0763_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0763_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0763_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_0763_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_c220_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0763_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_b306] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_b306_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_d18a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d18a_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_0763] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c1cd_uxn_opcodes_h_l103_l66_DUPLICATE_adac LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1cd_uxn_opcodes_h_l103_l66_DUPLICATE_adac_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c1cd(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0763_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0763_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1cd_uxn_opcodes_h_l103_l66_DUPLICATE_adac_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1cd_uxn_opcodes_h_l103_l66_DUPLICATE_adac_return_output;
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
