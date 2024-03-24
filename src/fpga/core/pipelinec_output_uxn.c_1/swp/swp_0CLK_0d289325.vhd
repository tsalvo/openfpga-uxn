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
-- BIN_OP_EQ[uxn_opcodes_h_l2548_c6_4afa]
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2548_c2_be8b]
signal n8_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2548_c2_be8b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2548_c2_be8b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2548_c2_be8b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2548_c2_be8b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2548_c2_be8b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2548_c2_be8b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2548_c2_be8b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2548_c2_be8b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2548_c2_be8b]
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2548_c2_be8b]
signal t8_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_3200]
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2561_c7_b022]
signal n8_MUX_uxn_opcodes_h_l2561_c7_b022_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2561_c7_b022_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_b022]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_b022]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_b022]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2561_c7_b022]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2561_c7_b022]
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2561_c7_b022]
signal t8_MUX_uxn_opcodes_h_l2561_c7_b022_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2561_c7_b022_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_87b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2564_c7_ff2a]
signal n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c7_ff2a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c7_ff2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c7_ff2a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c7_ff2a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2564_c7_ff2a]
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2564_c7_ff2a]
signal t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2566_c30_da4d]
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_9c35]
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2571_c7_500c]
signal n8_MUX_uxn_opcodes_h_l2571_c7_500c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_500c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c7_500c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c7_500c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c7_500c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2571_c7_500c]
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_04b4( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_left,
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_right,
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output);

-- n8_MUX_uxn_opcodes_h_l2548_c2_be8b
n8_MUX_uxn_opcodes_h_l2548_c2_be8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2548_c2_be8b_cond,
n8_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue,
n8_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse,
n8_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output);

-- t8_MUX_uxn_opcodes_h_l2548_c2_be8b
t8_MUX_uxn_opcodes_h_l2548_c2_be8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2548_c2_be8b_cond,
t8_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue,
t8_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse,
t8_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_left,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_right,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_return_output);

-- n8_MUX_uxn_opcodes_h_l2561_c7_b022
n8_MUX_uxn_opcodes_h_l2561_c7_b022 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2561_c7_b022_cond,
n8_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue,
n8_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse,
n8_MUX_uxn_opcodes_h_l2561_c7_b022_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_cond,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_return_output);

-- t8_MUX_uxn_opcodes_h_l2561_c7_b022
t8_MUX_uxn_opcodes_h_l2561_c7_b022 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2561_c7_b022_cond,
t8_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue,
t8_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse,
t8_MUX_uxn_opcodes_h_l2561_c7_b022_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_return_output);

-- n8_MUX_uxn_opcodes_h_l2564_c7_ff2a
n8_MUX_uxn_opcodes_h_l2564_c7_ff2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond,
n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue,
n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse,
n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output);

-- t8_MUX_uxn_opcodes_h_l2564_c7_ff2a
t8_MUX_uxn_opcodes_h_l2564_c7_ff2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond,
t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue,
t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse,
t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d
sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_ins,
sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_x,
sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_y,
sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_left,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_right,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_return_output);

-- n8_MUX_uxn_opcodes_h_l2571_c7_500c
n8_MUX_uxn_opcodes_h_l2571_c7_500c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2571_c7_500c_cond,
n8_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue,
n8_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse,
n8_MUX_uxn_opcodes_h_l2571_c7_500c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output,
 n8_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
 t8_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_return_output,
 n8_MUX_uxn_opcodes_h_l2561_c7_b022_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_return_output,
 t8_MUX_uxn_opcodes_h_l2561_c7_b022_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_return_output,
 n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output,
 t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_return_output,
 n8_MUX_uxn_opcodes_h_l2571_c7_500c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_b022_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_60e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2553_c3_ae2a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_b022_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_be8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_b022_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_23a2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_b022_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_500c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_211d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_500c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2573_c3_8bef : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_26fb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2571_c7_500c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_6740_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_3352_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_e62e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_5962_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2544_l2579_DUPLICATE_e9cf_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2573_c3_8bef := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2573_c3_8bef;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_26fb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_26fb;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_60e2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_60e2;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_23a2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_23a2;
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2553_c3_ae2a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2553_c3_ae2a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_211d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_211d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_87b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2548_c6_4afa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_3200] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_left;
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_return_output := BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_3352 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_3352_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_6740 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_6740_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2548_c2_be8b_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_5962 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_5962_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2566_c30_da4d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_ins;
     sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_x;
     sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_return_output := sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_9c35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_left;
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_return_output := BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_e62e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_e62e_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2548_c2_be8b_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2548_c2_be8b_return_output := result.is_stack_index_flipped;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2571_c7_500c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2571_c7_500c_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2548_c2_be8b_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_be8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_be8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_4afa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_b022_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_b022_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3200_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_87b2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_500c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_9c35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_3352_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_3352_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_e62e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_e62e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2564_l2571_l2561_DUPLICATE_e62e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_5962_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2564_l2561_DUPLICATE_5962_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_6740_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_6740_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_6740_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2548_c2_be8b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2548_c2_be8b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2548_c2_be8b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2548_c2_be8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2571_c7_500c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_da4d_return_output;
     -- t8_MUX[uxn_opcodes_h_l2564_c7_ff2a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond;
     t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue;
     t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output := t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2571_c7_500c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c7_500c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c7_ff2a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c7_500c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c7_500c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2571_c7_500c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2571_c7_500c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_500c_cond;
     n8_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_500c_iftrue;
     n8_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_500c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_500c_return_output := n8_MUX_uxn_opcodes_h_l2571_c7_500c_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2571_c7_500c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_500c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_500c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_500c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_500c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2564_c7_ff2a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2561_c7_b022] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c7_ff2a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c7_ff2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output;

     -- n8_MUX[uxn_opcodes_h_l2564_c7_ff2a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond;
     n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue;
     n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output := n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c7_ff2a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output;

     -- t8_MUX[uxn_opcodes_h_l2561_c7_b022] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2561_c7_b022_cond <= VAR_t8_MUX_uxn_opcodes_h_l2561_c7_b022_cond;
     t8_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue;
     t8_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_b022_return_output := t8_MUX_uxn_opcodes_h_l2561_c7_b022_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_b022_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_ff2a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2561_c7_b022_return_output;
     -- n8_MUX[uxn_opcodes_h_l2561_c7_b022] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2561_c7_b022_cond <= VAR_n8_MUX_uxn_opcodes_h_l2561_c7_b022_cond;
     n8_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue;
     n8_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_b022_return_output := n8_MUX_uxn_opcodes_h_l2561_c7_b022_return_output;

     -- t8_MUX[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2548_c2_be8b_cond <= VAR_t8_MUX_uxn_opcodes_h_l2548_c2_be8b_cond;
     t8_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue;
     t8_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output := t8_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_b022] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_b022] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2561_c7_b022] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_return_output := result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_b022] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2561_c7_b022_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_b022_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_b022_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_b022_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_b022_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output;
     -- n8_MUX[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2548_c2_be8b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2548_c2_be8b_cond;
     n8_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue;
     n8_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output := n8_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2548_c2_be8b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2544_l2579_DUPLICATE_e9cf LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2544_l2579_DUPLICATE_e9cf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_be8b_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2544_l2579_DUPLICATE_e9cf_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l2544_l2579_DUPLICATE_e9cf_return_output;
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
