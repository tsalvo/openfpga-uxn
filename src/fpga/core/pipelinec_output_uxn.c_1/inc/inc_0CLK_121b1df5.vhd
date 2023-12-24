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
-- BIN_OP_EQ[uxn_opcodes_h_l1340_c6_0500]
signal BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1340_c2_ad2e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1340_c2_ad2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1340_c2_ad2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1340_c2_ad2e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1340_c2_ad2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1340_c2_ad2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1340_c2_ad2e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1340_c2_ad2e]
signal result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1340_c2_ad2e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1340_c2_ad2e]
signal t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1353_c11_1d90]
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1353_c7_4ba8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1353_c7_4ba8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1353_c7_4ba8]
signal result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1353_c7_4ba8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1353_c7_4ba8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1353_c7_4ba8]
signal t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1356_c11_9f8c]
signal BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1356_c7_4f06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1356_c7_4f06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1356_c7_4f06]
signal result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1356_c7_4f06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1356_c7_4f06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1356_c7_4f06]
signal t8_MUX_uxn_opcodes_h_l1356_c7_4f06_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1358_c30_a3ef]
signal sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1361_c21_b049]
signal BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_a47b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500
BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_left,
BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_right,
BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e
result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e
result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e
result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e
result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e
result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e
result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output);

-- t8_MUX_uxn_opcodes_h_l1340_c2_ad2e
t8_MUX_uxn_opcodes_h_l1340_c2_ad2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond,
t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue,
t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse,
t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_left,
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_right,
BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8
result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output);

-- t8_MUX_uxn_opcodes_h_l1353_c7_4ba8
t8_MUX_uxn_opcodes_h_l1353_c7_4ba8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond,
t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue,
t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse,
t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c
BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_left,
BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_right,
BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06
result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06
result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06
result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_cond,
result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06
result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output);

-- t8_MUX_uxn_opcodes_h_l1356_c7_4f06
t8_MUX_uxn_opcodes_h_l1356_c7_4f06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1356_c7_4f06_cond,
t8_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue,
t8_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse,
t8_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef
sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_ins,
sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_x,
sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_y,
sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049
BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_left,
BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_right,
BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
 t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output,
 t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output,
 t8_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output,
 sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1345_c3_cd82 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1350_c3_bfe2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_0dd1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1361_c3_be92 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1360_c3_fd07 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1356_c7_4f06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1356_c7_4f06_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1353_l1356_l1340_DUPLICATE_daea_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_e0ac_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_d874_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_1257_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1336_l1365_DUPLICATE_3eaa_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1345_c3_cd82 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1345_c3_cd82;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1360_c3_fd07 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1360_c3_fd07;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_0dd1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1354_c3_0dd1;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1350_c3_bfe2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1350_c3_bfe2;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1353_c11_1d90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_left;
     BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_return_output := BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1361_c21_b049] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_1257 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_1257_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1356_c11_9f8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_d874 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_d874_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_e0ac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_e0ac_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1356_c7_4f06] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1356_c7_4f06_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1340_c6_0500] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_left;
     BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output := BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1340_c2_ad2e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1340_c2_ad2e_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1340_c2_ad2e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1340_c2_ad2e_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1340_c2_ad2e] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1340_c2_ad2e_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1340_c2_ad2e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1340_c2_ad2e_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1353_l1356_l1340_DUPLICATE_daea LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1353_l1356_l1340_DUPLICATE_daea_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1358_c30_a3ef] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_ins;
     sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_x;
     sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_return_output := sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1340_c6_0500_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1353_c11_1d90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1356_c7_4f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1356_c11_9f8c_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1361_c3_be92 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1361_c21_b049_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_d874_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_d874_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_e0ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_e0ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_1257_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1353_l1356_DUPLICATE_1257_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1353_l1356_l1340_DUPLICATE_daea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1353_l1356_l1340_DUPLICATE_daea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1353_l1356_l1340_DUPLICATE_daea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1340_c2_ad2e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1340_c2_ad2e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1340_c2_ad2e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1340_c2_ad2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1356_c7_4f06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1358_c30_a3ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1361_c3_be92;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1356_c7_4f06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1356_c7_4f06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1356_c7_4f06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output;

     -- t8_MUX[uxn_opcodes_h_l1356_c7_4f06] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1356_c7_4f06_cond <= VAR_t8_MUX_uxn_opcodes_h_l1356_c7_4f06_cond;
     t8_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue;
     t8_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output := t8_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1356_c7_4f06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output := result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1356_c7_4f06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1340_c2_ad2e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1340_c2_ad2e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1340_c2_ad2e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1340_c2_ad2e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1356_c7_4f06_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1353_c7_4ba8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1353_c7_4ba8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1353_c7_4ba8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1353_c7_4ba8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1353_c7_4ba8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond;
     t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue;
     t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output := t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1353_c7_4ba8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1353_c7_4ba8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1340_c2_ad2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1340_c2_ad2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1340_c2_ad2e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond;
     t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue;
     t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output := t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1340_c2_ad2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1340_c2_ad2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1340_c2_ad2e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output;

     -- Submodule level 4
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1336_l1365_DUPLICATE_3eaa LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1336_l1365_DUPLICATE_3eaa_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1340_c2_ad2e_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1336_l1365_DUPLICATE_3eaa_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1336_l1365_DUPLICATE_3eaa_return_output;
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
