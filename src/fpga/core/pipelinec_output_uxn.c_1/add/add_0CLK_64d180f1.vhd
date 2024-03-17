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
-- Submodules: 38
entity add_0CLK_64d180f1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add_0CLK_64d180f1;
architecture arch of add_0CLK_64d180f1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l819_c6_e4f6]
signal BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l819_c2_8fef]
signal result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l819_c2_8fef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l819_c2_8fef]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l819_c2_8fef]
signal result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c2_8fef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c2_8fef]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l819_c2_8fef]
signal result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c2_8fef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l819_c2_8fef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l819_c2_8fef]
signal t8_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l819_c2_8fef]
signal n8_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l832_c11_17a8]
signal BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l832_c7_cbb5]
signal result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l832_c7_cbb5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l832_c7_cbb5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l832_c7_cbb5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l832_c7_cbb5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l832_c7_cbb5]
signal t8_MUX_uxn_opcodes_h_l832_c7_cbb5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l832_c7_cbb5]
signal n8_MUX_uxn_opcodes_h_l832_c7_cbb5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l835_c11_e698]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l835_c7_085f]
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_085f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_085f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_085f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_085f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l835_c7_085f]
signal t8_MUX_uxn_opcodes_h_l835_c7_085f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c7_085f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c7_085f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c7_085f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l835_c7_085f]
signal n8_MUX_uxn_opcodes_h_l835_c7_085f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c7_085f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c7_085f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c7_085f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l838_c11_0285]
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l838_c7_0136]
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_0136]
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_0136]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_0136]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_0136]
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l838_c7_0136]
signal n8_MUX_uxn_opcodes_h_l838_c7_0136_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l838_c7_0136_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l838_c7_0136_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l838_c7_0136_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l840_c30_7532]
signal sp_relative_shift_uxn_opcodes_h_l840_c30_7532_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l840_c30_7532_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l840_c30_7532_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l840_c30_7532_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l843_c21_489c]
signal BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_243c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6
BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_left,
BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_right,
BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef
result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_cond,
result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_return_output);

-- t8_MUX_uxn_opcodes_h_l819_c2_8fef
t8_MUX_uxn_opcodes_h_l819_c2_8fef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l819_c2_8fef_cond,
t8_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue,
t8_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse,
t8_MUX_uxn_opcodes_h_l819_c2_8fef_return_output);

-- n8_MUX_uxn_opcodes_h_l819_c2_8fef
n8_MUX_uxn_opcodes_h_l819_c2_8fef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l819_c2_8fef_cond,
n8_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue,
n8_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse,
n8_MUX_uxn_opcodes_h_l819_c2_8fef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8
BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_left,
BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_right,
BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5
result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_cond,
result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output);

-- t8_MUX_uxn_opcodes_h_l832_c7_cbb5
t8_MUX_uxn_opcodes_h_l832_c7_cbb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l832_c7_cbb5_cond,
t8_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue,
t8_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse,
t8_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output);

-- n8_MUX_uxn_opcodes_h_l832_c7_cbb5
n8_MUX_uxn_opcodes_h_l832_c7_cbb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l832_c7_cbb5_cond,
n8_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue,
n8_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse,
n8_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698
BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f
result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_cond,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_return_output);

-- t8_MUX_uxn_opcodes_h_l835_c7_085f
t8_MUX_uxn_opcodes_h_l835_c7_085f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l835_c7_085f_cond,
t8_MUX_uxn_opcodes_h_l835_c7_085f_iftrue,
t8_MUX_uxn_opcodes_h_l835_c7_085f_iffalse,
t8_MUX_uxn_opcodes_h_l835_c7_085f_return_output);

-- n8_MUX_uxn_opcodes_h_l835_c7_085f
n8_MUX_uxn_opcodes_h_l835_c7_085f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l835_c7_085f_cond,
n8_MUX_uxn_opcodes_h_l835_c7_085f_iftrue,
n8_MUX_uxn_opcodes_h_l835_c7_085f_iffalse,
n8_MUX_uxn_opcodes_h_l835_c7_085f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285
BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_left,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_right,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136
result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_cond,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_return_output);

-- n8_MUX_uxn_opcodes_h_l838_c7_0136
n8_MUX_uxn_opcodes_h_l838_c7_0136 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l838_c7_0136_cond,
n8_MUX_uxn_opcodes_h_l838_c7_0136_iftrue,
n8_MUX_uxn_opcodes_h_l838_c7_0136_iffalse,
n8_MUX_uxn_opcodes_h_l838_c7_0136_return_output);

-- sp_relative_shift_uxn_opcodes_h_l840_c30_7532
sp_relative_shift_uxn_opcodes_h_l840_c30_7532 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l840_c30_7532_ins,
sp_relative_shift_uxn_opcodes_h_l840_c30_7532_x,
sp_relative_shift_uxn_opcodes_h_l840_c30_7532_y,
sp_relative_shift_uxn_opcodes_h_l840_c30_7532_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c
BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_left,
BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_right,
BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
 t8_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
 n8_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output,
 t8_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output,
 n8_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_return_output,
 t8_MUX_uxn_opcodes_h_l835_c7_085f_return_output,
 n8_MUX_uxn_opcodes_h_l835_c7_085f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_return_output,
 n8_MUX_uxn_opcodes_h_l838_c7_0136_return_output,
 sp_relative_shift_uxn_opcodes_h_l840_c30_7532_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l829_c3_ede3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l824_c3_dbca : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l819_c2_8fef_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l819_c2_8fef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_4cb3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_085f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l832_c7_cbb5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c7_085f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l832_c7_cbb5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_085f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_085f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_085f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c7_085f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c7_085f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c7_0136_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c7_085f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l843_c3_e706 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_0235 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c7_0136_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c7_0136_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c7_0136_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_7532_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_7532_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_7532_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_7532_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l819_l838_l832_l835_DUPLICATE_a061_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_85f3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_b3d0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_694c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l835_DUPLICATE_822c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l847_l815_DUPLICATE_8165_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_4cb3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_4cb3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l829_c3_ede3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l829_c3_ede3;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l824_c3_dbca := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l824_c3_dbca;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_7532_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_7532_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_0235 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_0235;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_7532_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l835_c7_085f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l838_c7_0136_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l838_c7_0136_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_085f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_085f_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_b3d0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_b3d0_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_c2_8fef_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l819_c2_8fef_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_85f3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_85f3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l832_c11_17a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l843_c21_489c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l819_c2_8fef_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_694c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_694c_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l840_c30_7532] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l840_c30_7532_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_7532_ins;
     sp_relative_shift_uxn_opcodes_h_l840_c30_7532_x <= VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_7532_x;
     sp_relative_shift_uxn_opcodes_h_l840_c30_7532_y <= VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_7532_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_7532_return_output := sp_relative_shift_uxn_opcodes_h_l840_c30_7532_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l835_DUPLICATE_822c LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l835_DUPLICATE_822c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l819_c6_e4f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l819_c2_8fef_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l838_c11_0285] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_left;
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_return_output := BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l819_l838_l832_l835_DUPLICATE_a061 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l819_l838_l832_l835_DUPLICATE_a061_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l835_c11_e698] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l819_c2_8fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l819_c2_8fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_e4f6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l832_c7_cbb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l832_c7_cbb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_17a8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l835_c7_085f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_085f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_e698_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l838_c7_0136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_0285_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l843_c3_e706 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_489c_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_b3d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_b3d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_b3d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_694c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_694c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_694c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_85f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_85f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l838_l832_l835_DUPLICATE_85f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l835_DUPLICATE_822c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l838_l835_DUPLICATE_822c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l819_l838_l832_l835_DUPLICATE_a061_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l819_l838_l832_l835_DUPLICATE_a061_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l819_l838_l832_l835_DUPLICATE_a061_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l819_l838_l832_l835_DUPLICATE_a061_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_c2_8fef_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l819_c2_8fef_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l819_c2_8fef_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l819_c2_8fef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_7532_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_iftrue := VAR_result_u8_value_uxn_opcodes_h_l843_c3_e706;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_0136] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l838_c7_0136] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_cond;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_return_output := result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_0136] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_return_output;

     -- t8_MUX[uxn_opcodes_h_l835_c7_085f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l835_c7_085f_cond <= VAR_t8_MUX_uxn_opcodes_h_l835_c7_085f_cond;
     t8_MUX_uxn_opcodes_h_l835_c7_085f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l835_c7_085f_iftrue;
     t8_MUX_uxn_opcodes_h_l835_c7_085f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l835_c7_085f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_085f_return_output := t8_MUX_uxn_opcodes_h_l835_c7_085f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_0136] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_0136] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_return_output;

     -- n8_MUX[uxn_opcodes_h_l838_c7_0136] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l838_c7_0136_cond <= VAR_n8_MUX_uxn_opcodes_h_l838_c7_0136_cond;
     n8_MUX_uxn_opcodes_h_l838_c7_0136_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l838_c7_0136_iftrue;
     n8_MUX_uxn_opcodes_h_l838_c7_0136_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l838_c7_0136_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l838_c7_0136_return_output := n8_MUX_uxn_opcodes_h_l838_c7_0136_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l835_c7_085f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l838_c7_0136_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_0136_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_0136_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_0136_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_0136_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_0136_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l835_c7_085f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_085f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_085f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_085f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l835_c7_085f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_return_output := result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_return_output;

     -- n8_MUX[uxn_opcodes_h_l835_c7_085f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l835_c7_085f_cond <= VAR_n8_MUX_uxn_opcodes_h_l835_c7_085f_cond;
     n8_MUX_uxn_opcodes_h_l835_c7_085f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l835_c7_085f_iftrue;
     n8_MUX_uxn_opcodes_h_l835_c7_085f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l835_c7_085f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l835_c7_085f_return_output := n8_MUX_uxn_opcodes_h_l835_c7_085f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_085f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_return_output;

     -- t8_MUX[uxn_opcodes_h_l832_c7_cbb5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l832_c7_cbb5_cond <= VAR_t8_MUX_uxn_opcodes_h_l832_c7_cbb5_cond;
     t8_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue;
     t8_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output := t8_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l835_c7_085f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_085f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_085f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_085f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_085f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_085f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse := VAR_t8_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l832_c7_cbb5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l832_c7_cbb5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l832_c7_cbb5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l832_c7_cbb5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output;

     -- n8_MUX[uxn_opcodes_h_l832_c7_cbb5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l832_c7_cbb5_cond <= VAR_n8_MUX_uxn_opcodes_h_l832_c7_cbb5_cond;
     n8_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue;
     n8_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output := n8_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output;

     -- t8_MUX[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l819_c2_8fef_cond <= VAR_t8_MUX_uxn_opcodes_h_l819_c2_8fef_cond;
     t8_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue;
     t8_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l819_c2_8fef_return_output := t8_MUX_uxn_opcodes_h_l819_c2_8fef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l832_c7_cbb5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output := result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse := VAR_n8_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_cbb5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l819_c2_8fef_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_return_output;

     -- n8_MUX[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l819_c2_8fef_cond <= VAR_n8_MUX_uxn_opcodes_h_l819_c2_8fef_cond;
     n8_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue;
     n8_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l819_c2_8fef_return_output := n8_MUX_uxn_opcodes_h_l819_c2_8fef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l819_c2_8fef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_return_output := result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l819_c2_8fef_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l847_l815_DUPLICATE_8165 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l847_l815_DUPLICATE_8165_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_8fef_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_8fef_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l847_l815_DUPLICATE_8165_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l847_l815_DUPLICATE_8165_return_output;
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
