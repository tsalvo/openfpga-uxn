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
-- BIN_OP_EQ[uxn_opcodes_h_l2564_c6_56ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2564_c2_b1e4]
signal n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2564_c2_b1e4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c2_b1e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c2_b1e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2564_c2_b1e4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c2_b1e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c2_b1e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2564_c2_b1e4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2564_c2_b1e4]
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2564_c2_b1e4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2564_c2_b1e4]
signal t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2577_c11_8180]
signal BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2577_c7_fd42]
signal n8_MUX_uxn_opcodes_h_l2577_c7_fd42_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2577_c7_fd42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2577_c7_fd42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2577_c7_fd42]
signal result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2577_c7_fd42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2577_c7_fd42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2577_c7_fd42]
signal t8_MUX_uxn_opcodes_h_l2577_c7_fd42_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2580_c11_2237]
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2580_c7_0660]
signal n8_MUX_uxn_opcodes_h_l2580_c7_0660_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2580_c7_0660_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2580_c7_0660]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2580_c7_0660]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2580_c7_0660]
signal result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2580_c7_0660]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2580_c7_0660]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2580_c7_0660]
signal t8_MUX_uxn_opcodes_h_l2580_c7_0660_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2580_c7_0660_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2582_c30_9288]
signal sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_e116]
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2587_c7_8d5d]
signal n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2587_c7_8d5d]
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2587_c7_8d5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2587_c7_8d5d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2587_c7_8d5d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output : unsigned(3 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec
BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output);

-- n8_MUX_uxn_opcodes_h_l2564_c2_b1e4
n8_MUX_uxn_opcodes_h_l2564_c2_b1e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond,
n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue,
n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse,
n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4
result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4
result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4
result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output);

-- t8_MUX_uxn_opcodes_h_l2564_c2_b1e4
t8_MUX_uxn_opcodes_h_l2564_c2_b1e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond,
t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue,
t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse,
t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_left,
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_right,
BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_return_output);

-- n8_MUX_uxn_opcodes_h_l2577_c7_fd42
n8_MUX_uxn_opcodes_h_l2577_c7_fd42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2577_c7_fd42_cond,
n8_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue,
n8_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse,
n8_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_cond,
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output);

-- t8_MUX_uxn_opcodes_h_l2577_c7_fd42
t8_MUX_uxn_opcodes_h_l2577_c7_fd42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2577_c7_fd42_cond,
t8_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue,
t8_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse,
t8_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_left,
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_right,
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_return_output);

-- n8_MUX_uxn_opcodes_h_l2580_c7_0660
n8_MUX_uxn_opcodes_h_l2580_c7_0660 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2580_c7_0660_cond,
n8_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue,
n8_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse,
n8_MUX_uxn_opcodes_h_l2580_c7_0660_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660
result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_cond,
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_return_output);

-- t8_MUX_uxn_opcodes_h_l2580_c7_0660
t8_MUX_uxn_opcodes_h_l2580_c7_0660 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2580_c7_0660_cond,
t8_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue,
t8_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse,
t8_MUX_uxn_opcodes_h_l2580_c7_0660_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2582_c30_9288
sp_relative_shift_uxn_opcodes_h_l2582_c30_9288 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_ins,
sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_x,
sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_y,
sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_left,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_right,
BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_return_output);

-- n8_MUX_uxn_opcodes_h_l2587_c7_8d5d
n8_MUX_uxn_opcodes_h_l2587_c7_8d5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond,
n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue,
n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse,
n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output,
 n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
 t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_return_output,
 n8_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output,
 t8_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_return_output,
 n8_MUX_uxn_opcodes_h_l2580_c7_0660_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_return_output,
 t8_MUX_uxn_opcodes_h_l2580_c7_0660_return_output,
 sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_return_output,
 n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2569_c3_cfb7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_9316 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2580_c7_0660_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2577_c7_fd42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2578_c3_55e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2580_c7_0660_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2577_c7_fd42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2580_c7_0660_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_6eee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2580_c7_0660_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2589_c3_5d1b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2590_c3_a1e8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2587_c7_8d5d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2577_l2564_l2587_DUPLICATE_a57b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2577_l2580_l2587_DUPLICATE_0140_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2577_l2587_DUPLICATE_0ced_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2577_l2580_DUPLICATE_7581_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2595_l2560_DUPLICATE_d233_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_6eee := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2584_c3_6eee;
     VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2578_c3_55e2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2578_c3_55e2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2589_c3_5d1b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2589_c3_5d1b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_9316 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_9316;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2590_c3_a1e8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2590_c3_a1e8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2569_c3_cfb7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2569_c3_cfb7;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse := t8;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2564_c2_b1e4_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2577_l2587_DUPLICATE_0ced LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2577_l2587_DUPLICATE_0ced_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2564_c2_b1e4_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2580_c11_2237] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_left;
     BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_return_output := BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2587_c7_8d5d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2587_c7_8d5d_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2564_c2_b1e4_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2577_l2564_l2587_DUPLICATE_a57b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2577_l2564_l2587_DUPLICATE_a57b_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2577_l2580_DUPLICATE_7581 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2577_l2580_DUPLICATE_7581_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2577_c11_8180] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_left;
     BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_return_output := BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2582_c30_9288] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_ins;
     sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_x;
     sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_return_output := sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2587_c11_e116] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_left;
     BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_return_output := BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2564_c6_56ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2577_l2580_l2587_DUPLICATE_0140 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2577_l2580_l2587_DUPLICATE_0140_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2564_c2_b1e4_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c6_56ec_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2577_c7_fd42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2577_c7_fd42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2577_c11_8180_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2580_c7_0660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2580_c7_0660_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_2237_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2587_c11_e116_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2577_l2587_DUPLICATE_0ced_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2577_l2587_DUPLICATE_0ced_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2577_l2580_l2587_DUPLICATE_0140_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2577_l2580_l2587_DUPLICATE_0140_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2577_l2580_l2587_DUPLICATE_0140_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2577_l2580_DUPLICATE_7581_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2577_l2580_DUPLICATE_7581_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2577_l2564_l2587_DUPLICATE_a57b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2577_l2564_l2587_DUPLICATE_a57b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2577_l2564_l2587_DUPLICATE_a57b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2564_c2_b1e4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2564_c2_b1e4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2564_c2_b1e4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2564_c2_b1e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2587_c7_8d5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2582_c30_9288_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2587_c7_8d5d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output;

     -- t8_MUX[uxn_opcodes_h_l2580_c7_0660] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2580_c7_0660_cond <= VAR_t8_MUX_uxn_opcodes_h_l2580_c7_0660_cond;
     t8_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue;
     t8_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2580_c7_0660_return_output := t8_MUX_uxn_opcodes_h_l2580_c7_0660_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2587_c7_8d5d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2587_c7_8d5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2587_c7_8d5d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond;
     n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue;
     n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output := n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2587_c7_8d5d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2580_c7_0660] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2580_c7_0660_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2587_c7_8d5d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2580_c7_0660_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2580_c7_0660] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_return_output;

     -- n8_MUX[uxn_opcodes_h_l2580_c7_0660] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2580_c7_0660_cond <= VAR_n8_MUX_uxn_opcodes_h_l2580_c7_0660_cond;
     n8_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue;
     n8_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2580_c7_0660_return_output := n8_MUX_uxn_opcodes_h_l2580_c7_0660_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2577_c7_fd42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2580_c7_0660] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2580_c7_0660] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_return_output := result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2580_c7_0660] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_return_output;

     -- t8_MUX[uxn_opcodes_h_l2577_c7_fd42] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2577_c7_fd42_cond <= VAR_t8_MUX_uxn_opcodes_h_l2577_c7_fd42_cond;
     t8_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue;
     t8_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output := t8_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2580_c7_0660_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_0660_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2580_c7_0660_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2580_c7_0660_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2580_c7_0660_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2577_c7_fd42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output;

     -- t8_MUX[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond <= VAR_t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond;
     t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue;
     t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output := t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2577_c7_fd42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2577_c7_fd42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2577_c7_fd42] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2577_c7_fd42_cond <= VAR_n8_MUX_uxn_opcodes_h_l2577_c7_fd42_cond;
     n8_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue;
     n8_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output := n8_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2577_c7_fd42] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output := result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2577_c7_fd42_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output;
     -- n8_MUX[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond <= VAR_n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond;
     n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue;
     n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output := n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c2_b1e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2595_l2560_DUPLICATE_d233 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2595_l2560_DUPLICATE_d233_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2564_c2_b1e4_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2595_l2560_DUPLICATE_d233_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2595_l2560_DUPLICATE_d233_return_output;
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
