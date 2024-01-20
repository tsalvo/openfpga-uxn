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
-- Submodules: 43
entity jsi_0CLK_4c8178ef is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_4c8178ef;
architecture arch of jsi_0CLK_4c8178ef is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l144_c6_8aa8]
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_8161]
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_8161]
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_8161]
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_8161]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l144_c2_8161]
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l144_c2_8161]
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_8161]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_8161]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_8161]
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_8161]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l144_c2_8161]
signal tmp16_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_b9b6]
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_051d]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_e4e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l160_c7_e4e2]
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_e4e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_e4e2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_e4e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l160_c7_e4e2]
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_e4e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_e4e2]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l163_c31_af35]
signal CONST_SR_8_uxn_opcodes_h_l163_c31_af35_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l163_c31_af35_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_00c2]
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l166_c11_2560]
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_0d24]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l166_c7_0d24]
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_0d24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_0d24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l166_c7_0d24]
signal tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l168_c3_cb92]
signal CONST_SL_8_uxn_opcodes_h_l168_c3_cb92_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l168_c3_cb92_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_d9fb]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_e02f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l171_c7_e02f]
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_e02f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_e02f]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l172_c3_76aa]
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_cf2f]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_056d]
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_return_output : unsigned(17 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6145( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8
BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_left,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_right,
BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161
result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_cond,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161
result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_cond,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_return_output);

-- tmp16_MUX_uxn_opcodes_h_l144_c2_8161
tmp16_MUX_uxn_opcodes_h_l144_c2_8161 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l144_c2_8161_cond,
tmp16_MUX_uxn_opcodes_h_l144_c2_8161_iftrue,
tmp16_MUX_uxn_opcodes_h_l144_c2_8161_iffalse,
tmp16_MUX_uxn_opcodes_h_l144_c2_8161_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_left,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_right,
BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d
BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2
result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_cond,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2
result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2
tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l163_c31_af35
CONST_SR_8_uxn_opcodes_h_l163_c31_af35 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l163_c31_af35_x,
CONST_SR_8_uxn_opcodes_h_l163_c31_af35_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_left,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_right,
BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560
BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_left,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_right,
BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24
result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_cond,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_return_output);

-- tmp16_MUX_uxn_opcodes_h_l166_c7_0d24
tmp16_MUX_uxn_opcodes_h_l166_c7_0d24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_cond,
tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue,
tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse,
tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_return_output);

-- CONST_SL_8_uxn_opcodes_h_l168_c3_cb92
CONST_SL_8_uxn_opcodes_h_l168_c3_cb92 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l168_c3_cb92_x,
CONST_SL_8_uxn_opcodes_h_l168_c3_cb92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb
BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_cond,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_e02f
tmp16_MUX_uxn_opcodes_h_l171_c7_e02f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa
BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_left,
BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_right,
BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_left,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_right,
BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
 tmp16_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output,
 CONST_SR_8_uxn_opcodes_h_l163_c31_af35_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_return_output,
 tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_return_output,
 CONST_SL_8_uxn_opcodes_h_l168_c3_cb92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_4f46 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_e08c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_8161_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l148_c3_1c5c : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_8161_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_8161_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_8161_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_0956_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l164_c3_9148 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_c459 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_e4e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_199b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_e4e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_af35_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_af35_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_36a2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_cb92_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_cb92_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l174_c3_31a3 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_dd7d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_01a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_f21e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_8134_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_9f73_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l178_l140_DUPLICATE_db1a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_c459 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l161_c3_c459;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_4f46 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l153_c3_4f46;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_199b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_199b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_e08c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l155_c3_e08c;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_af35_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l163_c31_af35] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l163_c31_af35_x <= VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_af35_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_af35_return_output := CONST_SR_8_uxn_opcodes_h_l163_c31_af35_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l144_c2_8161] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_8161_return_output := result.is_vram_write;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d[uxn_opcodes_h_l160_c7_e4e2] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_e4e2_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_d9fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_8134 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_8134_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_f21e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_f21e_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_dd7d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_dd7d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l166_c11_2560] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_left;
     BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_return_output := BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_01a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_01a2_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l144_c2_8161] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_8161_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_051d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l164_c22_00c2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_9f73 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_9f73_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l144_c6_8aa8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_left;
     BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output := BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l160_c7_e4e2] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_e4e2_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l144_c2_8161] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_8161_return_output := result.is_ram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l148_c11_b9b6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l160_c7_e4e2] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_e4e2_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_8161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l144_c6_8aa8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_051d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l166_c11_2560_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_d9fb_return_output;
     VAR_tmp16_uxn_opcodes_h_l148_c3_1c5c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l148_c11_b9b6_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l164_c3_9148 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l164_c22_00c2_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_8134_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_cb92_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l172_l167_DUPLICATE_8134_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_9f73_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l166_l171_DUPLICATE_9f73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_dd7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_dd7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_dd7d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_f21e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_f21e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l166_l171_l160_DUPLICATE_f21e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_01a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l166_l160_DUPLICATE_01a2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l144_c2_8161_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l144_c2_8161_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l144_c2_8161_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l160_c7_e4e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l160_c7_e4e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l160_c7_e4e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue := VAR_result_u16_value_uxn_opcodes_h_l164_c3_9148;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_8161_iftrue := VAR_tmp16_uxn_opcodes_h_l148_c3_1c5c;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_e02f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l166_c7_0d24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l144_c2_8161] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l144_c2_8161] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c21_36a2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_36a2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l163_c31_af35_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l156_c21_0956] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_0956_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l148_c3_1c5c);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l160_c7_e4e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l172_c3_76aa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_left;
     BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_return_output := BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l168_c3_cb92] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l168_c3_cb92_x <= VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_cb92_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_cb92_return_output := CONST_SL_8_uxn_opcodes_h_l168_c3_cb92_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_e02f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l160_c7_e4e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l144_c2_8161] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_right := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l172_c3_76aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l156_c21_0956_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c21_36a2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l168_c3_cb92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_e02f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_e02f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l166_c7_0d24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l171_c7_e02f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_e4e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l144_c2_8161] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l160_c7_e4e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_cf2f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l166_c7_0d24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l166_c7_0d24] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l144_c2_8161] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_cf2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l166_c7_0d24_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l166_c7_0d24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_e02f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l144_c2_8161] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_cond;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_return_output := result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l174_c22_056d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_e4e2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l166_c7_0d24] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_cond;
     tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue;
     tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_return_output := tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l144_c2_8161] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_e4e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;

     -- Submodule level 4
     VAR_result_u16_value_uxn_opcodes_h_l174_c3_31a3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l174_c22_056d_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l166_c7_0d24_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue := VAR_result_u16_value_uxn_opcodes_h_l174_c3_31a3;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l144_c2_8161] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l144_c2_8161] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l171_c7_e02f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_return_output := result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l160_c7_e4e2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l171_c7_e02f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_8161_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l144_c2_8161] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l144_c2_8161_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_8161_cond;
     tmp16_MUX_uxn_opcodes_h_l144_c2_8161_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_8161_iftrue;
     tmp16_MUX_uxn_opcodes_h_l144_c2_8161_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_8161_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_8161_return_output := tmp16_MUX_uxn_opcodes_h_l144_c2_8161_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l166_c7_0d24] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_cond;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_return_output := result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l166_c7_0d24_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l144_c2_8161_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l160_c7_e4e2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output := result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l160_c7_e4e2_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l144_c2_8161] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_cond;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_return_output := result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l178_l140_DUPLICATE_db1a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l178_l140_DUPLICATE_db1a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6145(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l144_c2_8161_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l144_c2_8161_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l178_l140_DUPLICATE_db1a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l178_l140_DUPLICATE_db1a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
