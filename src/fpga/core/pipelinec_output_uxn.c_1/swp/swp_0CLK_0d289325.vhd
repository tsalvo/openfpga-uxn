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
-- BIN_OP_EQ[uxn_opcodes_h_l2547_c6_7207]
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2547_c2_22e9]
signal n8_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2547_c2_22e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2547_c2_22e9]
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2547_c2_22e9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2547_c2_22e9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2547_c2_22e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2547_c2_22e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2547_c2_22e9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2547_c2_22e9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2547_c2_22e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2547_c2_22e9]
signal t8_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_9d62]
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2560_c7_a809]
signal n8_MUX_uxn_opcodes_h_l2560_c7_a809_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2560_c7_a809_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2560_c7_a809]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2560_c7_a809]
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2560_c7_a809]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2560_c7_a809]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2560_c7_a809]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2560_c7_a809]
signal t8_MUX_uxn_opcodes_h_l2560_c7_a809_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2560_c7_a809_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2563_c11_2527]
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2563_c7_b40e]
signal n8_MUX_uxn_opcodes_h_l2563_c7_b40e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2563_c7_b40e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2563_c7_b40e]
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2563_c7_b40e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2563_c7_b40e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2563_c7_b40e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2563_c7_b40e]
signal t8_MUX_uxn_opcodes_h_l2563_c7_b40e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2565_c30_98d5]
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2570_c11_9fed]
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2570_c7_a1bb]
signal n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2570_c7_a1bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2570_c7_a1bb]
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2570_c7_a1bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2570_c7_a1bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_b856( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_left,
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_right,
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output);

-- n8_MUX_uxn_opcodes_h_l2547_c2_22e9
n8_MUX_uxn_opcodes_h_l2547_c2_22e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2547_c2_22e9_cond,
n8_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue,
n8_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse,
n8_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output);

-- t8_MUX_uxn_opcodes_h_l2547_c2_22e9
t8_MUX_uxn_opcodes_h_l2547_c2_22e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2547_c2_22e9_cond,
t8_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue,
t8_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse,
t8_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_left,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_right,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_return_output);

-- n8_MUX_uxn_opcodes_h_l2560_c7_a809
n8_MUX_uxn_opcodes_h_l2560_c7_a809 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2560_c7_a809_cond,
n8_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue,
n8_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse,
n8_MUX_uxn_opcodes_h_l2560_c7_a809_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_cond,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_return_output);

-- t8_MUX_uxn_opcodes_h_l2560_c7_a809
t8_MUX_uxn_opcodes_h_l2560_c7_a809 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2560_c7_a809_cond,
t8_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue,
t8_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse,
t8_MUX_uxn_opcodes_h_l2560_c7_a809_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_left,
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_right,
BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_return_output);

-- n8_MUX_uxn_opcodes_h_l2563_c7_b40e
n8_MUX_uxn_opcodes_h_l2563_c7_b40e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2563_c7_b40e_cond,
n8_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue,
n8_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse,
n8_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output);

-- t8_MUX_uxn_opcodes_h_l2563_c7_b40e
t8_MUX_uxn_opcodes_h_l2563_c7_b40e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2563_c7_b40e_cond,
t8_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue,
t8_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse,
t8_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5
sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_ins,
sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_x,
sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_y,
sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_left,
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_right,
BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_return_output);

-- n8_MUX_uxn_opcodes_h_l2570_c7_a1bb
n8_MUX_uxn_opcodes_h_l2570_c7_a1bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond,
n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue,
n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse,
n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output,
 n8_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
 t8_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_return_output,
 n8_MUX_uxn_opcodes_h_l2560_c7_a809_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_return_output,
 t8_MUX_uxn_opcodes_h_l2560_c7_a809_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_return_output,
 n8_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output,
 t8_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output,
 sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_return_output,
 n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a809_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_a5eb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_eea8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a809_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2547_c2_22e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_ace6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a809_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2563_c7_b40e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_6886 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2563_c7_b40e_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_833b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2570_c7_a1bb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2572_c3_c341 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2560_l2547_l2570_DUPLICATE_8200_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_0809_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2560_l2570_DUPLICATE_a8cc_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2560_l2563_l2570_DUPLICATE_0711_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2578_l2543_DUPLICATE_321c_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_833b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2573_c3_833b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_a5eb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_a5eb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2572_c3_c341 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2572_c3_c341;
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_eea8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2552_c3_eea8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_ace6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2561_c3_ace6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_6886 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_6886;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2560_l2547_l2570_DUPLICATE_8200 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2560_l2547_l2570_DUPLICATE_8200_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2547_c2_22e9_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_0809 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_0809_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_9d62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_left;
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_return_output := BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2565_c30_98d5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_ins;
     sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_x;
     sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_return_output := sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2547_c2_22e9_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2570_c11_9fed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2560_l2563_l2570_DUPLICATE_0711 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2560_l2563_l2570_DUPLICATE_0711_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2547_c2_22e9_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2547_c2_22e9_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2560_l2570_DUPLICATE_a8cc LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2560_l2570_DUPLICATE_a8cc_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2563_c11_2527] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_left;
     BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_return_output := BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2547_c6_7207] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_left;
     BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output := BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2570_c7_a1bb] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2570_c7_a1bb_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_22e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_22e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_7207_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_9d62_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_b40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_b40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2563_c11_2527_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2570_c11_9fed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2560_l2570_DUPLICATE_a8cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2560_l2570_DUPLICATE_a8cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2560_l2563_l2570_DUPLICATE_0711_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2560_l2563_l2570_DUPLICATE_0711_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2560_l2563_l2570_DUPLICATE_0711_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_0809_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2560_l2563_DUPLICATE_0809_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2560_l2547_l2570_DUPLICATE_8200_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2560_l2547_l2570_DUPLICATE_8200_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2560_l2547_l2570_DUPLICATE_8200_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2547_c2_22e9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2547_c2_22e9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2547_c2_22e9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2547_c2_22e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2570_c7_a1bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2565_c30_98d5_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2570_c7_a1bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2570_c7_a1bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2570_c7_a1bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output;

     -- t8_MUX[uxn_opcodes_h_l2563_c7_b40e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2563_c7_b40e_cond <= VAR_t8_MUX_uxn_opcodes_h_l2563_c7_b40e_cond;
     t8_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue;
     t8_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output := t8_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2570_c7_a1bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output;

     -- n8_MUX[uxn_opcodes_h_l2570_c7_a1bb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond <= VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_cond;
     n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_iftrue;
     n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output := n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2563_c7_b40e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2570_c7_a1bb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2563_c7_b40e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2563_c7_b40e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2560_c7_a809] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2563_c7_b40e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2563_c7_b40e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output;

     -- t8_MUX[uxn_opcodes_h_l2560_c7_a809] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2560_c7_a809_cond <= VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a809_cond;
     t8_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue;
     t8_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a809_return_output := t8_MUX_uxn_opcodes_h_l2560_c7_a809_return_output;

     -- n8_MUX[uxn_opcodes_h_l2563_c7_b40e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2563_c7_b40e_cond <= VAR_n8_MUX_uxn_opcodes_h_l2563_c7_b40e_cond;
     n8_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2563_c7_b40e_iftrue;
     n8_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2563_c7_b40e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output := n8_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_a809_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2563_c7_b40e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2560_c7_a809_return_output;
     -- t8_MUX[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2547_c2_22e9_cond <= VAR_t8_MUX_uxn_opcodes_h_l2547_c2_22e9_cond;
     t8_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue;
     t8_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output := t8_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2560_c7_a809] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_return_output;

     -- n8_MUX[uxn_opcodes_h_l2560_c7_a809] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2560_c7_a809_cond <= VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a809_cond;
     n8_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue;
     n8_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a809_return_output := n8_MUX_uxn_opcodes_h_l2560_c7_a809_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2560_c7_a809] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_return_output := result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2560_c7_a809] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2560_c7_a809] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2560_c7_a809_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_a809_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_a809_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_a809_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_a809_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output;

     -- n8_MUX[uxn_opcodes_h_l2547_c2_22e9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2547_c2_22e9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2547_c2_22e9_cond;
     n8_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2547_c2_22e9_iftrue;
     n8_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2547_c2_22e9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output := n8_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2578_l2543_DUPLICATE_321c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2578_l2543_DUPLICATE_321c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_22e9_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2578_l2543_DUPLICATE_321c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2578_l2543_DUPLICATE_321c_return_output;
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
