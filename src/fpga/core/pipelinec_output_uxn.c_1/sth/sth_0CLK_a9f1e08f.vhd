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
-- Submodules: 29
entity sth_0CLK_a9f1e08f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth_0CLK_a9f1e08f;
architecture arch of sth_0CLK_a9f1e08f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2387_c6_a316]
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2387_c2_30f0]
signal t8_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2387_c2_30f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2387_c2_30f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2387_c2_30f0]
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2387_c2_30f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2387_c2_30f0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2387_c2_30f0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2387_c2_30f0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2387_c2_30f0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2387_c2_30f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2400_c11_8f3a]
signal BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2400_c7_70de]
signal t8_MUX_uxn_opcodes_h_l2400_c7_70de_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2400_c7_70de_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2400_c7_70de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2400_c7_70de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2400_c7_70de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2400_c7_70de]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2400_c7_70de]
signal result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2400_c7_70de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2401_c30_32fc]
signal sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2403_c11_22c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2403_c7_06f3]
signal t8_MUX_uxn_opcodes_h_l2403_c7_06f3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2403_c7_06f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2403_c7_06f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2403_c7_06f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2403_c7_06f3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2403_c7_06f3]
signal result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2403_c7_06f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_a6df( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_3;
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
-- BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316
BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_left,
BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_right,
BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output);

-- t8_MUX_uxn_opcodes_h_l2387_c2_30f0
t8_MUX_uxn_opcodes_h_l2387_c2_30f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2387_c2_30f0_cond,
t8_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue,
t8_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse,
t8_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0
result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0
result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a
BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_left,
BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_right,
BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_return_output);

-- t8_MUX_uxn_opcodes_h_l2400_c7_70de
t8_MUX_uxn_opcodes_h_l2400_c7_70de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2400_c7_70de_cond,
t8_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue,
t8_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse,
t8_MUX_uxn_opcodes_h_l2400_c7_70de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de
result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_cond,
result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc
sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_ins,
sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_x,
sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_y,
sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3
BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_return_output);

-- t8_MUX_uxn_opcodes_h_l2403_c7_06f3
t8_MUX_uxn_opcodes_h_l2403_c7_06f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2403_c7_06f3_cond,
t8_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue,
t8_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse,
t8_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3
result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output,
 t8_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_return_output,
 t8_MUX_uxn_opcodes_h_l2400_c7_70de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_return_output,
 sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_return_output,
 t8_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2400_c7_70de_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2392_c3_5b52 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2397_c3_4ad4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2400_c7_70de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2403_c7_06f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2406_c3_54ad : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2403_c7_06f3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2408_c3_e7f0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2387_l2400_l2403_DUPLICATE_4eba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_ef7d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_482b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_0458_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_261d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2413_l2383_DUPLICATE_4705_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2397_c3_4ad4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2397_c3_4ad4;
     VAR_sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2408_c3_e7f0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2408_c3_e7f0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2406_c3_54ad := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2406_c3_54ad;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2392_c3_5b52 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2392_c3_5b52;
     VAR_sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse := t8;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2387_c2_30f0] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2387_c2_30f0_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2387_c2_30f0] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2387_c2_30f0_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_0458 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_0458_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2387_c6_a316] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_left;
     BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output := BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2400_c11_8f3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2387_c2_30f0] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2387_c2_30f0_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2401_c30_32fc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_ins;
     sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_x;
     sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_return_output := sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l2403_c7_06f3] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2403_c7_06f3_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2387_l2400_l2403_DUPLICATE_4eba LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2387_l2400_l2403_DUPLICATE_4eba_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_261d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_261d_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_ef7d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_ef7d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2403_c11_22c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_482b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_482b_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2387_c2_30f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c6_a316_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2400_c7_70de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2400_c11_8f3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2403_c7_06f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_22c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_ef7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_ef7d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_0458_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_0458_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_261d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_261d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_482b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2400_l2403_DUPLICATE_482b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2387_l2400_l2403_DUPLICATE_4eba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2387_l2400_l2403_DUPLICATE_4eba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2387_l2400_l2403_DUPLICATE_4eba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2387_c2_30f0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2387_c2_30f0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2387_c2_30f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2403_c7_06f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2401_c30_32fc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2403_c7_06f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2387_c2_30f0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2387_c2_30f0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2403_c7_06f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2403_c7_06f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2387_c2_30f0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output;

     -- t8_MUX[uxn_opcodes_h_l2403_c7_06f3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2403_c7_06f3_cond <= VAR_t8_MUX_uxn_opcodes_h_l2403_c7_06f3_cond;
     t8_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue;
     t8_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output := t8_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2403_c7_06f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2403_c7_06f3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2403_c7_06f3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2403_c7_06f3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2400_c7_70de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_return_output := result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2400_c7_70de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2400_c7_70de] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_return_output;

     -- t8_MUX[uxn_opcodes_h_l2400_c7_70de] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2400_c7_70de_cond <= VAR_t8_MUX_uxn_opcodes_h_l2400_c7_70de_cond;
     t8_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue;
     t8_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2400_c7_70de_return_output := t8_MUX_uxn_opcodes_h_l2400_c7_70de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2400_c7_70de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2400_c7_70de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2400_c7_70de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2400_c7_70de_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2400_c7_70de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2400_c7_70de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2400_c7_70de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2400_c7_70de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2400_c7_70de_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2400_c7_70de_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2387_c2_30f0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2387_c2_30f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2387_c2_30f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2387_c2_30f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2387_c2_30f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2387_c2_30f0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output;

     -- t8_MUX[uxn_opcodes_h_l2387_c2_30f0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2387_c2_30f0_cond <= VAR_t8_MUX_uxn_opcodes_h_l2387_c2_30f0_cond;
     t8_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2387_c2_30f0_iftrue;
     t8_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2387_c2_30f0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output := t8_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output;

     -- Submodule level 4
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2413_l2383_DUPLICATE_4705 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2413_l2383_DUPLICATE_4705_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c2_30f0_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2413_l2383_DUPLICATE_4705_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2413_l2383_DUPLICATE_4705_return_output;
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
