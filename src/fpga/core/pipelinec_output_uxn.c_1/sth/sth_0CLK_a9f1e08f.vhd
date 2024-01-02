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
-- BIN_OP_EQ[uxn_opcodes_h_l2386_c6_db46]
signal BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2386_c2_0d83]
signal t8_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2386_c2_0d83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2386_c2_0d83]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2386_c2_0d83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2386_c2_0d83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2386_c2_0d83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2386_c2_0d83]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2386_c2_0d83]
signal result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2386_c2_0d83]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2386_c2_0d83]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2399_c11_0902]
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2399_c7_f353]
signal t8_MUX_uxn_opcodes_h_l2399_c7_f353_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2399_c7_f353_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2399_c7_f353]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2399_c7_f353]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2399_c7_f353]
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2399_c7_f353]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2399_c7_f353]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2399_c7_f353]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2400_c30_3d6b]
signal sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_7430]
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2402_c7_9867]
signal t8_MUX_uxn_opcodes_h_l2402_c7_9867_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2402_c7_9867_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2402_c7_9867]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2402_c7_9867]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2402_c7_9867]
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_9867]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_9867]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2402_c7_9867]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_return_output : unsigned(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46
BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_left,
BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_right,
BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output);

-- t8_MUX_uxn_opcodes_h_l2386_c2_0d83
t8_MUX_uxn_opcodes_h_l2386_c2_0d83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2386_c2_0d83_cond,
t8_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue,
t8_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse,
t8_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83
result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83
result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83
result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83
result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83
result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_cond,
result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83
result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83
result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_left,
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_right,
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_return_output);

-- t8_MUX_uxn_opcodes_h_l2399_c7_f353
t8_MUX_uxn_opcodes_h_l2399_c7_f353 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2399_c7_f353_cond,
t8_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue,
t8_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse,
t8_MUX_uxn_opcodes_h_l2399_c7_f353_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_cond,
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b
sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_ins,
sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_x,
sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_y,
sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_left,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_right,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_return_output);

-- t8_MUX_uxn_opcodes_h_l2402_c7_9867
t8_MUX_uxn_opcodes_h_l2402_c7_9867 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2402_c7_9867_cond,
t8_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue,
t8_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse,
t8_MUX_uxn_opcodes_h_l2402_c7_9867_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_cond,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output,
 t8_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_return_output,
 t8_MUX_uxn_opcodes_h_l2399_c7_f353_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_return_output,
 sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_return_output,
 t8_MUX_uxn_opcodes_h_l2402_c7_9867_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2399_c7_f353_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2391_c3_5e8b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_6fa9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2402_c7_9867_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2399_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2402_c7_9867_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2405_c3_2ebc : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2402_c7_9867_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2407_c3_3228 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2402_l2386_l2399_DUPLICATE_4664_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_7129_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_ed04_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_0be4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_e3dd_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2412_l2382_DUPLICATE_08a7_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_6fa9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_6fa9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2405_c3_2ebc := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2405_c3_2ebc;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2407_c3_3228 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2407_c3_3228;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2391_c3_5e8b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2391_c3_5e8b;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l2400_c30_3d6b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_ins;
     sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_x;
     sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_return_output := sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_7430] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_left;
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_return_output := BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2386_c2_0d83] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2386_c2_0d83_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_7129 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_7129_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2386_c6_db46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_left;
     BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output := BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l2402_c7_9867] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2402_c7_9867_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2402_l2386_l2399_DUPLICATE_4664 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2402_l2386_l2399_DUPLICATE_4664_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_ed04 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_ed04_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_e3dd LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_e3dd_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2386_c2_0d83] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2386_c2_0d83_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2399_c11_0902] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_left;
     BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_return_output := BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2386_c2_0d83] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2386_c2_0d83_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_0be4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_0be4_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2386_c2_0d83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2386_c6_db46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2399_c7_f353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_0902_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2402_c7_9867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_7430_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_0be4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_0be4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_7129_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_7129_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_ed04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_ed04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_e3dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2402_l2399_DUPLICATE_e3dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2402_l2386_l2399_DUPLICATE_4664_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2402_l2386_l2399_DUPLICATE_4664_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2402_l2386_l2399_DUPLICATE_4664_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2386_c2_0d83_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2386_c2_0d83_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2386_c2_0d83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2402_c7_9867_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2400_c30_3d6b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2402_c7_9867] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_return_output := result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2402_c7_9867] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2386_c2_0d83] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2386_c2_0d83] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2402_c7_9867] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_return_output;

     -- t8_MUX[uxn_opcodes_h_l2402_c7_9867] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2402_c7_9867_cond <= VAR_t8_MUX_uxn_opcodes_h_l2402_c7_9867_cond;
     t8_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue;
     t8_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2402_c7_9867_return_output := t8_MUX_uxn_opcodes_h_l2402_c7_9867_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2386_c2_0d83] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_9867] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_9867] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2402_c7_9867] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_9867_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2402_c7_9867_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_9867_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_9867_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_9867_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2402_c7_9867_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2402_c7_9867_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2399_c7_f353] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_return_output := result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2399_c7_f353] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2399_c7_f353] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2399_c7_f353] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_return_output;

     -- t8_MUX[uxn_opcodes_h_l2399_c7_f353] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2399_c7_f353_cond <= VAR_t8_MUX_uxn_opcodes_h_l2399_c7_f353_cond;
     t8_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue;
     t8_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2399_c7_f353_return_output := t8_MUX_uxn_opcodes_h_l2399_c7_f353_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2399_c7_f353] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2399_c7_f353] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_f353_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2399_c7_f353_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_f353_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2399_c7_f353_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_f353_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2399_c7_f353_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2399_c7_f353_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2386_c2_0d83] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output;

     -- t8_MUX[uxn_opcodes_h_l2386_c2_0d83] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2386_c2_0d83_cond <= VAR_t8_MUX_uxn_opcodes_h_l2386_c2_0d83_cond;
     t8_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue;
     t8_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output := t8_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2386_c2_0d83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2386_c2_0d83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2386_c2_0d83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2386_c2_0d83] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output := result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2386_c2_0d83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output;

     -- Submodule level 4
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2412_l2382_DUPLICATE_08a7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2412_l2382_DUPLICATE_08a7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2386_c2_0d83_return_output);

     -- Submodule level 5
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2412_l2382_DUPLICATE_08a7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2412_l2382_DUPLICATE_08a7_return_output;
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