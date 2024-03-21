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
-- BIN_OP_EQ[uxn_opcodes_h_l2548_c6_77ea]
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2548_c2_78a6]
signal n8_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2548_c2_78a6]
signal t8_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2548_c2_78a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2548_c2_78a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2548_c2_78a6]
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2548_c2_78a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2548_c2_78a6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2548_c2_78a6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2548_c2_78a6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2548_c2_78a6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2548_c2_78a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_3dd2]
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2561_c7_f415]
signal n8_MUX_uxn_opcodes_h_l2561_c7_f415_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2561_c7_f415_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2561_c7_f415]
signal t8_MUX_uxn_opcodes_h_l2561_c7_f415_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2561_c7_f415_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_f415]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_f415]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_f415]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2561_c7_f415]
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2561_c7_f415]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_e3dd]
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2564_c7_5054]
signal n8_MUX_uxn_opcodes_h_l2564_c7_5054_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2564_c7_5054_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2564_c7_5054]
signal t8_MUX_uxn_opcodes_h_l2564_c7_5054_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2564_c7_5054_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c7_5054]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c7_5054]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c7_5054]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2564_c7_5054]
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c7_5054]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2566_c30_dc44]
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_f5c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2571_c7_bfe1]
signal n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c7_bfe1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c7_bfe1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2571_c7_bfe1]
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c7_bfe1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output : unsigned(3 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_left,
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_right,
BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output);

-- n8_MUX_uxn_opcodes_h_l2548_c2_78a6
n8_MUX_uxn_opcodes_h_l2548_c2_78a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2548_c2_78a6_cond,
n8_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue,
n8_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse,
n8_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output);

-- t8_MUX_uxn_opcodes_h_l2548_c2_78a6
t8_MUX_uxn_opcodes_h_l2548_c2_78a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2548_c2_78a6_cond,
t8_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue,
t8_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse,
t8_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_left,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_right,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_return_output);

-- n8_MUX_uxn_opcodes_h_l2561_c7_f415
n8_MUX_uxn_opcodes_h_l2561_c7_f415 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2561_c7_f415_cond,
n8_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue,
n8_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse,
n8_MUX_uxn_opcodes_h_l2561_c7_f415_return_output);

-- t8_MUX_uxn_opcodes_h_l2561_c7_f415
t8_MUX_uxn_opcodes_h_l2561_c7_f415 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2561_c7_f415_cond,
t8_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue,
t8_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse,
t8_MUX_uxn_opcodes_h_l2561_c7_f415_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_cond,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_left,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_right,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_return_output);

-- n8_MUX_uxn_opcodes_h_l2564_c7_5054
n8_MUX_uxn_opcodes_h_l2564_c7_5054 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2564_c7_5054_cond,
n8_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue,
n8_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse,
n8_MUX_uxn_opcodes_h_l2564_c7_5054_return_output);

-- t8_MUX_uxn_opcodes_h_l2564_c7_5054
t8_MUX_uxn_opcodes_h_l2564_c7_5054 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2564_c7_5054_cond,
t8_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue,
t8_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse,
t8_MUX_uxn_opcodes_h_l2564_c7_5054_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_cond,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44
sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_ins,
sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_x,
sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_y,
sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_return_output);

-- n8_MUX_uxn_opcodes_h_l2571_c7_bfe1
n8_MUX_uxn_opcodes_h_l2571_c7_bfe1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond,
n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue,
n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse,
n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output,
 n8_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
 t8_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_return_output,
 n8_MUX_uxn_opcodes_h_l2561_c7_f415_return_output,
 t8_MUX_uxn_opcodes_h_l2561_c7_f415_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_return_output,
 n8_MUX_uxn_opcodes_h_l2564_c7_5054_return_output,
 t8_MUX_uxn_opcodes_h_l2564_c7_5054_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_return_output,
 sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_return_output,
 n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_f415_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_f415_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2553_c3_d9f5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_1729 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_5054_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2561_c7_f415_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_5054_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2561_c7_f415_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_9b91 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2564_c7_5054_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2564_c7_5054_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_087f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2573_c3_5878 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_c32b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2571_c7_bfe1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_99fb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_0aea_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2571_l2561_l2564_DUPLICATE_048e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2561_l2564_DUPLICATE_1a2d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2579_l2544_DUPLICATE_206e_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_1729 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_1729;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_c32b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_c32b;
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2573_c3_5878 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2573_c3_5878;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2553_c3_d9f5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2553_c3_d9f5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_087f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2568_c3_087f;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_9b91 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_9b91;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_99fb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_99fb_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2571_l2561_l2564_DUPLICATE_048e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2571_l2561_l2564_DUPLICATE_048e_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2561_l2564_DUPLICATE_1a2d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2561_l2564_DUPLICATE_1a2d_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2548_c2_78a6_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2548_c2_78a6_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2571_c11_f5c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2548_c2_78a6_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_3dd2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2571_c7_bfe1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2571_c7_bfe1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_e3dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2566_c30_dc44] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_ins;
     sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_x;
     sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_return_output := sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_0aea LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_0aea_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2548_c6_77ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2548_c2_78a6_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_78a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_78a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2548_c6_77ea_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_f415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_f415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_3dd2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_5054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_5054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_e3dd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2571_c11_f5c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_0aea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2571_l2561_DUPLICATE_0aea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2571_l2561_l2564_DUPLICATE_048e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2571_l2561_l2564_DUPLICATE_048e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2571_l2561_l2564_DUPLICATE_048e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2561_l2564_DUPLICATE_1a2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2561_l2564_DUPLICATE_1a2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_99fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_99fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2548_l2571_l2561_DUPLICATE_99fb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2548_c2_78a6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2548_c2_78a6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2548_c2_78a6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2548_c2_78a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2571_c7_bfe1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2566_c30_dc44_return_output;
     -- t8_MUX[uxn_opcodes_h_l2564_c7_5054] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2564_c7_5054_cond <= VAR_t8_MUX_uxn_opcodes_h_l2564_c7_5054_cond;
     t8_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue;
     t8_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2564_c7_5054_return_output := t8_MUX_uxn_opcodes_h_l2564_c7_5054_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2571_c7_bfe1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2571_c7_bfe1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2571_c7_bfe1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output;

     -- n8_MUX[uxn_opcodes_h_l2571_c7_bfe1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond;
     n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue;
     n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output := n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2571_c7_bfe1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c7_5054] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_5054_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2571_c7_bfe1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2564_c7_5054_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c7_5054] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_return_output;

     -- n8_MUX[uxn_opcodes_h_l2564_c7_5054] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2564_c7_5054_cond <= VAR_n8_MUX_uxn_opcodes_h_l2564_c7_5054_cond;
     n8_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue;
     n8_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2564_c7_5054_return_output := n8_MUX_uxn_opcodes_h_l2564_c7_5054_return_output;

     -- t8_MUX[uxn_opcodes_h_l2561_c7_f415] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2561_c7_f415_cond <= VAR_t8_MUX_uxn_opcodes_h_l2561_c7_f415_cond;
     t8_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue;
     t8_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2561_c7_f415_return_output := t8_MUX_uxn_opcodes_h_l2561_c7_f415_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c7_5054] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2561_c7_f415] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2564_c7_5054] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_return_output := result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c7_5054] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2564_c7_5054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_5054_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2561_c7_f415_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_5054_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_5054_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_5054_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2561_c7_f415_return_output;
     -- t8_MUX[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2548_c2_78a6_cond <= VAR_t8_MUX_uxn_opcodes_h_l2548_c2_78a6_cond;
     t8_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue;
     t8_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output := t8_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_f415] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_f415] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_f415] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2561_c7_f415] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_return_output := result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_return_output;

     -- n8_MUX[uxn_opcodes_h_l2561_c7_f415] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2561_c7_f415_cond <= VAR_n8_MUX_uxn_opcodes_h_l2561_c7_f415_cond;
     n8_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2561_c7_f415_iftrue;
     n8_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2561_c7_f415_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2561_c7_f415_return_output := n8_MUX_uxn_opcodes_h_l2561_c7_f415_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2561_c7_f415_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_f415_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_f415_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_f415_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2561_c7_f415_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output;

     -- n8_MUX[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2548_c2_78a6_cond <= VAR_n8_MUX_uxn_opcodes_h_l2548_c2_78a6_cond;
     n8_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue;
     n8_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output := n8_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2548_c2_78a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2579_l2544_DUPLICATE_206e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2579_l2544_DUPLICATE_206e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2548_c2_78a6_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2579_l2544_DUPLICATE_206e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l2579_l2544_DUPLICATE_206e_return_output;
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
