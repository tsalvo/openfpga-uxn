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
-- BIN_OP_EQ[uxn_opcodes_h_l2564_c6_3c50]
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2564_c2_6da9]
signal t8_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2564_c2_6da9]
signal n8_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c2_6da9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2564_c2_6da9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2564_c2_6da9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2564_c2_6da9]
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c2_6da9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c2_6da9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2564_c2_6da9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c2_6da9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2564_c2_6da9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2577_c11_d935]
signal BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2577_c7_8acb]
signal t8_MUX_uxn_opcodes_h_l2577_c7_8acb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2577_c7_8acb]
signal n8_MUX_uxn_opcodes_h_l2577_c7_8acb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2577_c7_8acb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2577_c7_8acb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2577_c7_8acb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2577_c7_8acb]
signal result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2577_c7_8acb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2580_c11_6576]
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2580_c7_377f]
signal t8_MUX_uxn_opcodes_h_l2580_c7_377f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2580_c7_377f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2580_c7_377f]
signal n8_MUX_uxn_opcodes_h_l2580_c7_377f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2580_c7_377f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2580_c7_377f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2580_c7_377f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2580_c7_377f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2580_c7_377f]
signal result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2580_c7_377f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2582_c30_4e52]
signal sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_2065]
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2587_c7_9572]
signal n8_MUX_uxn_opcodes_h_l2587_c7_9572_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2587_c7_9572_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2587_c7_9572]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2587_c7_9572]
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2587_c7_9572]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2587_c7_9572]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50
BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_left,
BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_right,
BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output);

-- t8_MUX_uxn_opcodes_h_l2564_c2_6da9
t8_MUX_uxn_opcodes_h_l2564_c2_6da9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2564_c2_6da9_cond,
t8_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue,
t8_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse,
t8_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output);

-- n8_MUX_uxn_opcodes_h_l2564_c2_6da9
n8_MUX_uxn_opcodes_h_l2564_c2_6da9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2564_c2_6da9_cond,
n8_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue,
n8_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse,
n8_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9
result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9
result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9
result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_left,
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_right,
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_return_output);

-- t8_MUX_uxn_opcodes_h_l2577_c7_8acb
t8_MUX_uxn_opcodes_h_l2577_c7_8acb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2577_c7_8acb_cond,
t8_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue,
t8_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse,
t8_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output);

-- n8_MUX_uxn_opcodes_h_l2577_c7_8acb
n8_MUX_uxn_opcodes_h_l2577_c7_8acb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2577_c7_8acb_cond,
n8_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue,
n8_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse,
n8_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_left,
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_right,
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_return_output);

-- t8_MUX_uxn_opcodes_h_l2580_c7_377f
t8_MUX_uxn_opcodes_h_l2580_c7_377f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2580_c7_377f_cond,
t8_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue,
t8_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse,
t8_MUX_uxn_opcodes_h_l2580_c7_377f_return_output);

-- n8_MUX_uxn_opcodes_h_l2580_c7_377f
n8_MUX_uxn_opcodes_h_l2580_c7_377f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2580_c7_377f_cond,
n8_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue,
n8_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse,
n8_MUX_uxn_opcodes_h_l2580_c7_377f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52
sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_ins,
sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_x,
sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_y,
sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_left,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_right,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_return_output);

-- n8_MUX_uxn_opcodes_h_l2587_c7_9572
n8_MUX_uxn_opcodes_h_l2587_c7_9572 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2587_c7_9572_cond,
n8_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue,
n8_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse,
n8_MUX_uxn_opcodes_h_l2587_c7_9572_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_cond,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output,
 t8_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
 n8_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_return_output,
 t8_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output,
 n8_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_return_output,
 t8_MUX_uxn_opcodes_h_l2580_c7_377f_return_output,
 n8_MUX_uxn_opcodes_h_l2580_c7_377f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_return_output,
 sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_return_output,
 n8_MUX_uxn_opcodes_h_l2587_c7_9572_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2569_c3_6cde : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_933c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2580_c7_377f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2577_c7_8acb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2580_c7_377f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2577_c7_8acb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2578_c3_4403 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2580_c7_377f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2587_c7_9572_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2580_c7_377f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_ea7c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2587_c7_9572_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2589_c3_677e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2590_c3_4b8f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2587_c7_9572_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2577_l2564_l2587_DUPLICATE_2441_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2577_l2587_DUPLICATE_8319_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2577_l2580_DUPLICATE_8577_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2577_l2580_l2587_DUPLICATE_69b8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2595_l2560_DUPLICATE_2a7b_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2578_c3_4403 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2578_c3_4403;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2590_c3_4b8f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2590_c3_4b8f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2569_c3_6cde := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2569_c3_6cde;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_933c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_933c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2589_c3_677e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2589_c3_677e;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_ea7c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_ea7c;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2580_c11_6576] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_left;
     BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_return_output := BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2577_l2580_DUPLICATE_8577 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2577_l2580_DUPLICATE_8577_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2564_c6_3c50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_left;
     BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output := BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2582_c30_4e52] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_ins;
     sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_x;
     sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_return_output := sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2587_c7_9572] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2587_c7_9572_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2564_c2_6da9_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2564_c2_6da9_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2564_c2_6da9_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2577_l2580_l2587_DUPLICATE_69b8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2577_l2580_l2587_DUPLICATE_69b8_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_2065] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_left;
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_return_output := BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2564_c2_6da9_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2577_l2564_l2587_DUPLICATE_2441 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2577_l2564_l2587_DUPLICATE_2441_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2577_l2587_DUPLICATE_8319 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2577_l2587_DUPLICATE_8319_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2577_c11_d935] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_left;
     BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_return_output := BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2564_c2_6da9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c2_6da9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_3c50_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2577_c7_8acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2577_c7_8acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_d935_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2580_c7_377f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2580_c7_377f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_6576_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2587_c7_9572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_2065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2577_l2587_DUPLICATE_8319_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2577_l2587_DUPLICATE_8319_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2577_l2580_l2587_DUPLICATE_69b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2577_l2580_l2587_DUPLICATE_69b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2577_l2580_l2587_DUPLICATE_69b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2577_l2580_DUPLICATE_8577_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2577_l2580_DUPLICATE_8577_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2577_l2564_l2587_DUPLICATE_2441_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2577_l2564_l2587_DUPLICATE_2441_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2577_l2564_l2587_DUPLICATE_2441_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2564_c2_6da9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2564_c2_6da9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2564_c2_6da9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2564_c2_6da9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2587_c7_9572_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_4e52_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2587_c7_9572] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output;

     -- t8_MUX[uxn_opcodes_h_l2580_c7_377f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2580_c7_377f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2580_c7_377f_cond;
     t8_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue;
     t8_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2580_c7_377f_return_output := t8_MUX_uxn_opcodes_h_l2580_c7_377f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2587_c7_9572] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_return_output;

     -- n8_MUX[uxn_opcodes_h_l2587_c7_9572] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2587_c7_9572_cond <= VAR_n8_MUX_uxn_opcodes_h_l2587_c7_9572_cond;
     n8_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue;
     n8_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2587_c7_9572_return_output := n8_MUX_uxn_opcodes_h_l2587_c7_9572_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2580_c7_377f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2587_c7_9572] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_return_output := result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2587_c7_9572] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2587_c7_9572_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_9572_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_377f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_9572_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_9572_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_9572_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2580_c7_377f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2580_c7_377f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2577_c7_8acb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2577_c7_8acb_cond <= VAR_t8_MUX_uxn_opcodes_h_l2577_c7_8acb_cond;
     t8_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue;
     t8_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output := t8_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output;

     -- n8_MUX[uxn_opcodes_h_l2580_c7_377f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2580_c7_377f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2580_c7_377f_cond;
     n8_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue;
     n8_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2580_c7_377f_return_output := n8_MUX_uxn_opcodes_h_l2580_c7_377f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2580_c7_377f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2577_c7_8acb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2580_c7_377f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2580_c7_377f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2580_c7_377f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_377f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_377f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_377f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_377f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2577_c7_8acb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output;

     -- n8_MUX[uxn_opcodes_h_l2577_c7_8acb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2577_c7_8acb_cond <= VAR_n8_MUX_uxn_opcodes_h_l2577_c7_8acb_cond;
     n8_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue;
     n8_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output := n8_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2577_c7_8acb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2577_c7_8acb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output;

     -- t8_MUX[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2564_c2_6da9_cond <= VAR_t8_MUX_uxn_opcodes_h_l2564_c2_6da9_cond;
     t8_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue;
     t8_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output := t8_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2577_c7_8acb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_8acb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output;

     -- n8_MUX[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2564_c2_6da9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2564_c2_6da9_cond;
     n8_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue;
     n8_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output := n8_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2564_c2_6da9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2595_l2560_DUPLICATE_2a7b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2595_l2560_DUPLICATE_2a7b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_6da9_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2595_l2560_DUPLICATE_2a7b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2595_l2560_DUPLICATE_2a7b_return_output;
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
