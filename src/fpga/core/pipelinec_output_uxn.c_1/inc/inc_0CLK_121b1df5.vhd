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
-- Submodules: 28
entity inc_0CLK_121b1df5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc_0CLK_121b1df5;
architecture arch of inc_0CLK_121b1df5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1323_c6_b0d5]
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1323_c2_6cb6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c2_6cb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1323_c2_6cb6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1323_c2_6cb6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1323_c2_6cb6]
signal result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1323_c2_6cb6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1323_c2_6cb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c2_6cb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c2_6cb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1323_c2_6cb6]
signal t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1336_c11_d436]
signal BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1336_c7_8005]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1336_c7_8005]
signal result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1336_c7_8005]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1336_c7_8005]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1336_c7_8005]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1336_c7_8005]
signal t8_MUX_uxn_opcodes_h_l1336_c7_8005_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1336_c7_8005_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1339_c11_2d04]
signal BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1339_c7_799b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1339_c7_799b]
signal result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1339_c7_799b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1339_c7_799b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1339_c7_799b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1339_c7_799b]
signal t8_MUX_uxn_opcodes_h_l1339_c7_799b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1339_c7_799b_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1341_c30_017d]
signal sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1344_c21_d324]
signal BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5
BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_left,
BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_right,
BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output);

-- t8_MUX_uxn_opcodes_h_l1323_c2_6cb6
t8_MUX_uxn_opcodes_h_l1323_c2_6cb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond,
t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue,
t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse,
t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436
BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_left,
BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_right,
BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_cond,
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_return_output);

-- t8_MUX_uxn_opcodes_h_l1336_c7_8005
t8_MUX_uxn_opcodes_h_l1336_c7_8005 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1336_c7_8005_cond,
t8_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue,
t8_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse,
t8_MUX_uxn_opcodes_h_l1336_c7_8005_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04
BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_left,
BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_right,
BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_return_output);

-- t8_MUX_uxn_opcodes_h_l1339_c7_799b
t8_MUX_uxn_opcodes_h_l1339_c7_799b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1339_c7_799b_cond,
t8_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue,
t8_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse,
t8_MUX_uxn_opcodes_h_l1339_c7_799b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1341_c30_017d
sp_relative_shift_uxn_opcodes_h_l1341_c30_017d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_ins,
sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_x,
sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_y,
sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324
BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_left,
BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_right,
BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
 t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_return_output,
 t8_MUX_uxn_opcodes_h_l1336_c7_8005_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_return_output,
 t8_MUX_uxn_opcodes_h_l1339_c7_799b_return_output,
 sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1328_c3_12b8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1333_c3_8af6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1336_c7_8005_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1337_c3_c81c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1339_c7_799b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1336_c7_8005_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1344_c3_a780 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1343_c3_2a2d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1339_c7_799b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1339_c7_799b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1336_l1339_l1323_DUPLICATE_0b9f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_23a9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_ff10_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_2ea5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1348_l1319_DUPLICATE_6603_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1328_c3_12b8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1328_c3_12b8;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1343_c3_2a2d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1343_c3_2a2d;
     VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1337_c3_c81c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1337_c3_c81c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1333_c3_8af6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1333_c3_8af6;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse := t8;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1323_c2_6cb6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1323_c2_6cb6_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_2ea5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_2ea5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1336_c11_d436] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_left;
     BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_return_output := BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1339_c11_2d04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_left;
     BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_return_output := BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1339_c7_799b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1339_c7_799b_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1323_c2_6cb6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1323_c2_6cb6_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1323_c6_b0d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_23a9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_23a9_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1336_l1339_l1323_DUPLICATE_0b9f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1336_l1339_l1323_DUPLICATE_0b9f_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1341_c30_017d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_ins;
     sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_x;
     sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_return_output := sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1323_c2_6cb6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1323_c2_6cb6_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1323_c2_6cb6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1323_c2_6cb6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1344_c21_d324] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_ff10 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_ff10_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_b0d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1336_c7_8005_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_d436_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1339_c7_799b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_2d04_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1344_c3_a780 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_d324_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_ff10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_ff10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_2ea5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_2ea5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_23a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_23a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1336_l1339_l1323_DUPLICATE_0b9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1336_l1339_l1323_DUPLICATE_0b9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1336_l1339_l1323_DUPLICATE_0b9f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1323_c2_6cb6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1323_c2_6cb6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1323_c2_6cb6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1323_c2_6cb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1339_c7_799b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_017d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1344_c3_a780;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1339_c7_799b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1323_c2_6cb6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1339_c7_799b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1323_c2_6cb6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1339_c7_799b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1339_c7_799b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1339_c7_799b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1339_c7_799b_cond;
     t8_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue;
     t8_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1339_c7_799b_return_output := t8_MUX_uxn_opcodes_h_l1339_c7_799b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1323_c2_6cb6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1339_c7_799b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1339_c7_799b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1323_c2_6cb6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_799b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_799b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_799b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_799b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_799b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1339_c7_799b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1336_c7_8005] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1336_c7_8005] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_return_output := result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1336_c7_8005] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_return_output;

     -- t8_MUX[uxn_opcodes_h_l1336_c7_8005] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1336_c7_8005_cond <= VAR_t8_MUX_uxn_opcodes_h_l1336_c7_8005_cond;
     t8_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue;
     t8_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1336_c7_8005_return_output := t8_MUX_uxn_opcodes_h_l1336_c7_8005_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1336_c7_8005] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1336_c7_8005] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_8005_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_8005_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_8005_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_8005_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_8005_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1336_c7_8005_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1323_c2_6cb6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1323_c2_6cb6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond;
     t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue;
     t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output := t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c2_6cb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c2_6cb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1323_c2_6cb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c2_6cb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output;

     -- Submodule level 4
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1348_l1319_DUPLICATE_6603 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1348_l1319_DUPLICATE_6603_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_6cb6_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1348_l1319_DUPLICATE_6603_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1348_l1319_DUPLICATE_6603_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
