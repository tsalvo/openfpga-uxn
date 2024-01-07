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
-- BIN_OP_EQ[uxn_opcodes_h_l1323_c6_c178]
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1323_c2_27f4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1323_c2_27f4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1323_c2_27f4]
signal result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1323_c2_27f4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1323_c2_27f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c2_27f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c2_27f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1323_c2_27f4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c2_27f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1323_c2_27f4]
signal t8_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1336_c11_8f6e]
signal BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1336_c7_50a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1336_c7_50a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1336_c7_50a3]
signal result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1336_c7_50a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1336_c7_50a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1336_c7_50a3]
signal t8_MUX_uxn_opcodes_h_l1336_c7_50a3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1339_c11_9666]
signal BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1339_c7_c875]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1339_c7_c875]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1339_c7_c875]
signal result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1339_c7_c875]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1339_c7_c875]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1339_c7_c875]
signal t8_MUX_uxn_opcodes_h_l1339_c7_c875_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1339_c7_c875_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1341_c30_891d]
signal sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1344_c21_3797]
signal BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_3;
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
-- BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178
BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_left,
BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_right,
BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output);

-- t8_MUX_uxn_opcodes_h_l1323_c2_27f4
t8_MUX_uxn_opcodes_h_l1323_c2_27f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1323_c2_27f4_cond,
t8_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue,
t8_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse,
t8_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e
BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_left,
BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_right,
BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output);

-- t8_MUX_uxn_opcodes_h_l1336_c7_50a3
t8_MUX_uxn_opcodes_h_l1336_c7_50a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1336_c7_50a3_cond,
t8_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue,
t8_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse,
t8_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666
BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_left,
BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_right,
BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_cond,
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_return_output);

-- t8_MUX_uxn_opcodes_h_l1339_c7_c875
t8_MUX_uxn_opcodes_h_l1339_c7_c875 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1339_c7_c875_cond,
t8_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue,
t8_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse,
t8_MUX_uxn_opcodes_h_l1339_c7_c875_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1341_c30_891d
sp_relative_shift_uxn_opcodes_h_l1341_c30_891d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_ins,
sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_x,
sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_y,
sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797
BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_left,
BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_right,
BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
 t8_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output,
 t8_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_return_output,
 t8_MUX_uxn_opcodes_h_l1339_c7_c875_return_output,
 sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1328_c3_9da3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1333_c3_8faa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1323_c2_27f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1337_c3_d9fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1339_c7_c875_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1336_c7_50a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1344_c3_a04d : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1343_c3_b44e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1339_c7_c875_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1339_c7_c875_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1336_l1339_l1323_DUPLICATE_9ffb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_4990_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_3953_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_66bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1348_l1319_DUPLICATE_54dd_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1328_c3_9da3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1328_c3_9da3;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1337_c3_d9fe := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1337_c3_d9fe;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1343_c3_b44e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1343_c3_b44e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1333_c3_8faa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1333_c3_8faa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse := t8;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1323_c2_27f4] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1323_c2_27f4_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1323_c2_27f4] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1323_c2_27f4_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1323_c2_27f4] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1323_c2_27f4_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1336_c11_8f6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1341_c30_891d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_ins;
     sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_x;
     sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_return_output := sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_3953 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_3953_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_66bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_66bf_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1339_c11_9666] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_left;
     BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_return_output := BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1323_c6_c178] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_left;
     BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output := BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1323_c2_27f4] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1323_c2_27f4_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_4990 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_4990_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1344_c21_3797] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1339_c7_c875] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1339_c7_c875_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1336_l1339_l1323_DUPLICATE_9ffb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1336_l1339_l1323_DUPLICATE_9ffb_return_output := result.u8_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1323_c2_27f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c6_c178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1336_c7_50a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1336_c11_8f6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1339_c7_c875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1339_c11_9666_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1344_c3_a04d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1344_c21_3797_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_4990_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_4990_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_66bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_66bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_3953_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1336_l1339_DUPLICATE_3953_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1336_l1339_l1323_DUPLICATE_9ffb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1336_l1339_l1323_DUPLICATE_9ffb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1336_l1339_l1323_DUPLICATE_9ffb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1323_c2_27f4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1323_c2_27f4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1323_c2_27f4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1323_c2_27f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1339_c7_c875_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1341_c30_891d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1344_c3_a04d;
     -- t8_MUX[uxn_opcodes_h_l1339_c7_c875] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1339_c7_c875_cond <= VAR_t8_MUX_uxn_opcodes_h_l1339_c7_c875_cond;
     t8_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue;
     t8_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1339_c7_c875_return_output := t8_MUX_uxn_opcodes_h_l1339_c7_c875_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1323_c2_27f4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1323_c2_27f4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1323_c2_27f4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1339_c7_c875] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1339_c7_c875] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_return_output := result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1339_c7_c875] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1339_c7_c875] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1339_c7_c875] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1323_c2_27f4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1339_c7_c875_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1339_c7_c875_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1339_c7_c875_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1339_c7_c875_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1339_c7_c875_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1339_c7_c875_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1336_c7_50a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1336_c7_50a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1336_c7_50a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output;

     -- t8_MUX[uxn_opcodes_h_l1336_c7_50a3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1336_c7_50a3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1336_c7_50a3_cond;
     t8_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue;
     t8_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output := t8_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1336_c7_50a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1336_c7_50a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1336_c7_50a3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1323_c2_27f4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c2_27f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c2_27f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c2_27f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1323_c2_27f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1323_c2_27f4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1323_c2_27f4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1323_c2_27f4_cond;
     t8_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1323_c2_27f4_iftrue;
     t8_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1323_c2_27f4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output := t8_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output;

     -- Submodule level 4
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1348_l1319_DUPLICATE_54dd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1348_l1319_DUPLICATE_54dd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c2_27f4_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1348_l1319_DUPLICATE_54dd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l1348_l1319_DUPLICATE_54dd_return_output;
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
