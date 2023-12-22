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
-- Submodules: 36
entity swp_0CLK_0d289325 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp_0CLK_0d289325;
architecture arch of swp_0CLK_0d289325 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2565_c6_5462]
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2565_c2_ff93]
signal t8_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2565_c2_ff93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2565_c2_ff93]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2565_c2_ff93]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2565_c2_ff93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2565_c2_ff93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2565_c2_ff93]
signal result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2565_c2_ff93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2565_c2_ff93]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2565_c2_ff93]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2565_c2_ff93]
signal n8_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2578_c11_f610]
signal BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2578_c7_67b9]
signal t8_MUX_uxn_opcodes_h_l2578_c7_67b9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2578_c7_67b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2578_c7_67b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2578_c7_67b9]
signal result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2578_c7_67b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2578_c7_67b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2578_c7_67b9]
signal n8_MUX_uxn_opcodes_h_l2578_c7_67b9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2581_c11_96f3]
signal BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2581_c7_8003]
signal t8_MUX_uxn_opcodes_h_l2581_c7_8003_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2581_c7_8003_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2581_c7_8003]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2581_c7_8003]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2581_c7_8003]
signal result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2581_c7_8003]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2581_c7_8003]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l2581_c7_8003]
signal n8_MUX_uxn_opcodes_h_l2581_c7_8003_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2581_c7_8003_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2583_c30_a6e2]
signal sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2588_c11_f169]
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2588_c7_a5b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2588_c7_a5b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2588_c7_a5b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2588_c7_a5b1]
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2588_c7_a5b1]
signal n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c580( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462
BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_left,
BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_right,
BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output);

-- t8_MUX_uxn_opcodes_h_l2565_c2_ff93
t8_MUX_uxn_opcodes_h_l2565_c2_ff93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2565_c2_ff93_cond,
t8_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue,
t8_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse,
t8_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93
result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93
result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_cond,
result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93
result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output);

-- n8_MUX_uxn_opcodes_h_l2565_c2_ff93
n8_MUX_uxn_opcodes_h_l2565_c2_ff93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2565_c2_ff93_cond,
n8_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue,
n8_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse,
n8_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_left,
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_right,
BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_return_output);

-- t8_MUX_uxn_opcodes_h_l2578_c7_67b9
t8_MUX_uxn_opcodes_h_l2578_c7_67b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2578_c7_67b9_cond,
t8_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue,
t8_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse,
t8_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9
result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output);

-- n8_MUX_uxn_opcodes_h_l2578_c7_67b9
n8_MUX_uxn_opcodes_h_l2578_c7_67b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2578_c7_67b9_cond,
n8_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue,
n8_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse,
n8_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_left,
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_right,
BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_return_output);

-- t8_MUX_uxn_opcodes_h_l2581_c7_8003
t8_MUX_uxn_opcodes_h_l2581_c7_8003 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2581_c7_8003_cond,
t8_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue,
t8_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse,
t8_MUX_uxn_opcodes_h_l2581_c7_8003_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003
result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_cond,
result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_return_output);

-- n8_MUX_uxn_opcodes_h_l2581_c7_8003
n8_MUX_uxn_opcodes_h_l2581_c7_8003 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2581_c7_8003_cond,
n8_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue,
n8_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse,
n8_MUX_uxn_opcodes_h_l2581_c7_8003_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2
sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_ins,
sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_x,
sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_y,
sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_left,
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_right,
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output);

-- n8_MUX_uxn_opcodes_h_l2588_c7_a5b1
n8_MUX_uxn_opcodes_h_l2588_c7_a5b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond,
n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue,
n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse,
n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output,
 t8_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
 n8_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_return_output,
 t8_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output,
 n8_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_return_output,
 t8_MUX_uxn_opcodes_h_l2581_c7_8003_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_return_output,
 n8_MUX_uxn_opcodes_h_l2581_c7_8003_return_output,
 sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output,
 n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2575_c3_9fe4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2570_c3_4ba1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2565_c2_ff93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2581_c7_8003_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2578_c7_67b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_9e39 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2581_c7_8003_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2578_c7_67b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2581_c7_8003_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_e485 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2581_c7_8003_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2591_c3_a489 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2588_c7_a5b1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_97a5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2578_l2565_l2588_DUPLICATE_542e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2578_l2581_l2588_DUPLICATE_2b9a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2578_l2581_DUPLICATE_b93d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2588_DUPLICATE_1acb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2561_l2596_DUPLICATE_a8ad_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_e485 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_e485;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2570_c3_4ba1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2570_c3_4ba1;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_97a5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2590_c3_97a5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2591_c3_a489 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2591_c3_a489;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_9e39 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_9e39;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2575_c3_9fe4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2575_c3_9fe4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2578_l2581_DUPLICATE_b93d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2578_l2581_DUPLICATE_b93d_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2565_c2_ff93_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l2583_c30_a6e2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_ins;
     sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_x;
     sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_return_output := sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2565_c6_5462] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_left;
     BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output := BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2581_c11_96f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2588_c7_a5b1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2588_c7_a5b1_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2565_c2_ff93_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2588_DUPLICATE_1acb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2588_DUPLICATE_1acb_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2578_l2565_l2588_DUPLICATE_542e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2578_l2565_l2588_DUPLICATE_542e_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2588_c11_f169] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_left;
     BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_return_output := BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2578_l2581_l2588_DUPLICATE_2b9a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2578_l2581_l2588_DUPLICATE_2b9a_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2565_c2_ff93_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_c2_ff93_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2578_c11_f610] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_left;
     BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_return_output := BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2565_c2_ff93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2565_c2_ff93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c6_5462_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2578_c7_67b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2578_c7_67b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2578_c11_f610_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2581_c7_8003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2581_c7_8003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2581_c11_96f3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f169_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2588_DUPLICATE_1acb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2578_l2588_DUPLICATE_1acb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2578_l2581_l2588_DUPLICATE_2b9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2578_l2581_l2588_DUPLICATE_2b9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2578_l2581_l2588_DUPLICATE_2b9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2578_l2581_DUPLICATE_b93d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2578_l2581_DUPLICATE_b93d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2578_l2565_l2588_DUPLICATE_542e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2578_l2565_l2588_DUPLICATE_542e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2578_l2565_l2588_DUPLICATE_542e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2565_c2_ff93_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2565_c2_ff93_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2565_c2_ff93_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2565_c2_ff93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2588_c7_a5b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2583_c30_a6e2_return_output;
     -- n8_MUX[uxn_opcodes_h_l2588_c7_a5b1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond <= VAR_n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond;
     n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue;
     n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output := n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2588_c7_a5b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2588_c7_a5b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output;

     -- t8_MUX[uxn_opcodes_h_l2581_c7_8003] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2581_c7_8003_cond <= VAR_t8_MUX_uxn_opcodes_h_l2581_c7_8003_cond;
     t8_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue;
     t8_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2581_c7_8003_return_output := t8_MUX_uxn_opcodes_h_l2581_c7_8003_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2588_c7_a5b1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2581_c7_8003] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2588_c7_a5b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2581_c7_8003_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_a5b1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2581_c7_8003_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2578_c7_67b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2581_c7_8003] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_return_output;

     -- t8_MUX[uxn_opcodes_h_l2578_c7_67b9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2578_c7_67b9_cond <= VAR_t8_MUX_uxn_opcodes_h_l2578_c7_67b9_cond;
     t8_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue;
     t8_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output := t8_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2581_c7_8003] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_return_output;

     -- n8_MUX[uxn_opcodes_h_l2581_c7_8003] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2581_c7_8003_cond <= VAR_n8_MUX_uxn_opcodes_h_l2581_c7_8003_cond;
     n8_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue;
     n8_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2581_c7_8003_return_output := n8_MUX_uxn_opcodes_h_l2581_c7_8003_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2581_c7_8003] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_return_output := result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2581_c7_8003] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2581_c7_8003_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2581_c7_8003_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2581_c7_8003_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2581_c7_8003_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2581_c7_8003_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2578_c7_67b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2578_c7_67b9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output;

     -- n8_MUX[uxn_opcodes_h_l2578_c7_67b9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2578_c7_67b9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2578_c7_67b9_cond;
     n8_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue;
     n8_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output := n8_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2578_c7_67b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2578_c7_67b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output;

     -- t8_MUX[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2565_c2_ff93_cond <= VAR_t8_MUX_uxn_opcodes_h_l2565_c2_ff93_cond;
     t8_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue;
     t8_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output := t8_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2578_c7_67b9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output;

     -- n8_MUX[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2565_c2_ff93_cond <= VAR_n8_MUX_uxn_opcodes_h_l2565_c2_ff93_cond;
     n8_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue;
     n8_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output := n8_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output := result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2565_c2_ff93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2561_l2596_DUPLICATE_a8ad LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2561_l2596_DUPLICATE_a8ad_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2565_c2_ff93_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2561_l2596_DUPLICATE_a8ad_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2561_l2596_DUPLICATE_a8ad_return_output;
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
