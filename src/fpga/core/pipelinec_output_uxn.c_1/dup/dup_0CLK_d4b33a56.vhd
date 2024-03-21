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
-- Submodules: 31
entity dup_0CLK_d4b33a56 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup_0CLK_d4b33a56;
architecture arch of dup_0CLK_d4b33a56 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2756_c6_c2b1]
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2756_c2_a7da]
signal t8_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2756_c2_a7da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2756_c2_a7da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2756_c2_a7da]
signal result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2756_c2_a7da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2756_c2_a7da]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2756_c2_a7da]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2756_c2_a7da]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2756_c2_a7da]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2756_c2_a7da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2769_c11_aed6]
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2769_c7_f444]
signal t8_MUX_uxn_opcodes_h_l2769_c7_f444_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2769_c7_f444_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2769_c7_f444]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2769_c7_f444]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2769_c7_f444]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2769_c7_f444]
signal result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2769_c7_f444]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2770_c30_c284]
signal sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2772_c11_8d76]
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2772_c7_2e76]
signal t8_MUX_uxn_opcodes_h_l2772_c7_2e76_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2772_c7_2e76]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2772_c7_2e76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2772_c7_2e76]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2772_c7_2e76]
signal result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2772_c7_2e76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2778_c11_3e1e]
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2778_c7_4399]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2778_c7_4399]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2778_c7_4399]
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1
BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_left,
BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_right,
BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output);

-- t8_MUX_uxn_opcodes_h_l2756_c2_a7da
t8_MUX_uxn_opcodes_h_l2756_c2_a7da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2756_c2_a7da_cond,
t8_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue,
t8_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse,
t8_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da
result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da
result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_cond,
result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da
result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da
result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da
result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da
result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_left,
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_right,
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_return_output);

-- t8_MUX_uxn_opcodes_h_l2769_c7_f444
t8_MUX_uxn_opcodes_h_l2769_c7_f444 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2769_c7_f444_cond,
t8_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue,
t8_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse,
t8_MUX_uxn_opcodes_h_l2769_c7_f444_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444
result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444
result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444
result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_cond,
result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444
result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2770_c30_c284
sp_relative_shift_uxn_opcodes_h_l2770_c30_c284 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_ins,
sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_x,
sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_y,
sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_left,
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_right,
BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_return_output);

-- t8_MUX_uxn_opcodes_h_l2772_c7_2e76
t8_MUX_uxn_opcodes_h_l2772_c7_2e76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2772_c7_2e76_cond,
t8_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue,
t8_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse,
t8_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76
result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76
result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76
result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_cond,
result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76
result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_left,
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_right,
BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_cond,
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output,
 t8_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_return_output,
 t8_MUX_uxn_opcodes_h_l2769_c7_f444_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_return_output,
 sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_return_output,
 t8_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2769_c7_f444_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2761_c3_3a55 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2766_c3_a457 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2769_c7_f444_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2772_c7_2e76_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2774_c3_49c8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2772_c7_2e76_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_1ca0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2756_l2778_l2769_DUPLICATE_45d6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2778_l2769_l2772_DUPLICATE_e66f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2778_l2769_l2772_DUPLICATE_b3f9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2769_l2772_DUPLICATE_78c9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2784_l2752_DUPLICATE_5e21_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2766_c3_a457 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2766_c3_a457;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2761_c3_3a55 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2761_c3_3a55;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2774_c3_49c8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2774_c3_49c8;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_1ca0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_1ca0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2772_c11_8d76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_left;
     BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_return_output := BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2778_c11_3e1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2778_l2769_l2772_DUPLICATE_e66f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2778_l2769_l2772_DUPLICATE_e66f_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2756_c2_a7da] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2756_c2_a7da_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2756_c2_a7da] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2756_c2_a7da_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2756_l2778_l2769_DUPLICATE_45d6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2756_l2778_l2769_DUPLICATE_45d6_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2756_c6_c2b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2756_c2_a7da] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2756_c2_a7da_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2769_l2772_DUPLICATE_78c9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2769_l2772_DUPLICATE_78c9_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2769_c11_aed6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l2772_c7_2e76] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2772_c7_2e76_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2778_l2769_l2772_DUPLICATE_b3f9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2778_l2769_l2772_DUPLICATE_b3f9_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2756_c2_a7da] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2756_c2_a7da_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2770_c30_c284] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_ins;
     sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_x;
     sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_return_output := sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2756_c2_a7da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c6_c2b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2769_c7_f444_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_aed6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2772_c7_2e76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2772_c11_8d76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2778_c11_3e1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2778_l2769_l2772_DUPLICATE_e66f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2778_l2769_l2772_DUPLICATE_e66f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2778_l2769_l2772_DUPLICATE_e66f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2769_l2772_DUPLICATE_78c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2769_l2772_DUPLICATE_78c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2778_l2769_l2772_DUPLICATE_b3f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2778_l2769_l2772_DUPLICATE_b3f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2778_l2769_l2772_DUPLICATE_b3f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2756_l2778_l2769_DUPLICATE_45d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2756_l2778_l2769_DUPLICATE_45d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2756_l2778_l2769_DUPLICATE_45d6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2756_c2_a7da_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2756_c2_a7da_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2756_c2_a7da_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2756_c2_a7da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2772_c7_2e76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2770_c30_c284_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2778_c7_4399] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2778_c7_4399] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2772_c7_2e76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2756_c2_a7da] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2756_c2_a7da] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2778_c7_4399] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_return_output := result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_return_output;

     -- t8_MUX[uxn_opcodes_h_l2772_c7_2e76] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2772_c7_2e76_cond <= VAR_t8_MUX_uxn_opcodes_h_l2772_c7_2e76_cond;
     t8_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue;
     t8_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output := t8_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2756_c2_a7da] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2772_c7_2e76] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2756_c2_a7da] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2778_c7_4399_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2778_c7_4399_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2778_c7_4399_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2772_c7_2e76] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output := result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output;

     -- t8_MUX[uxn_opcodes_h_l2769_c7_f444] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2769_c7_f444_cond <= VAR_t8_MUX_uxn_opcodes_h_l2769_c7_f444_cond;
     t8_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue;
     t8_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2769_c7_f444_return_output := t8_MUX_uxn_opcodes_h_l2769_c7_f444_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2769_c7_f444] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2772_c7_2e76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2772_c7_2e76] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2769_c7_f444] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_f444_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_f444_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2772_c7_2e76_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2769_c7_f444_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2769_c7_f444] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2756_c2_a7da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output;

     -- t8_MUX[uxn_opcodes_h_l2756_c2_a7da] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2756_c2_a7da_cond <= VAR_t8_MUX_uxn_opcodes_h_l2756_c2_a7da_cond;
     t8_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue;
     t8_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output := t8_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2769_c7_f444] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2769_c7_f444] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_return_output := result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2756_c2_a7da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_f444_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_f444_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_f444_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2756_c2_a7da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2756_c2_a7da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2756_c2_a7da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output := result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2784_l2752_DUPLICATE_5e21 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2784_l2752_DUPLICATE_5e21_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2756_c2_a7da_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2784_l2752_DUPLICATE_5e21_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2784_l2752_DUPLICATE_5e21_return_output;
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
