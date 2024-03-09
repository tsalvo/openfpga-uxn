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
-- BIN_OP_EQ[uxn_opcodes_h_l819_c6_bf86]
signal BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l819_c2_df76]
signal t8_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l819_c2_df76]
signal result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c2_df76]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l819_c2_df76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l819_c2_df76]
signal result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l819_c2_df76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c2_df76]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l819_c2_df76]
signal result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l819_c2_df76]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c2_df76]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l819_c2_df76]
signal n8_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l832_c11_b484]
signal BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l832_c7_a304]
signal t8_MUX_uxn_opcodes_h_l832_c7_a304_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l832_c7_a304_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l832_c7_a304_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l832_c7_a304_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l832_c7_a304]
signal result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l832_c7_a304]
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l832_c7_a304]
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l832_c7_a304]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l832_c7_a304]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l832_c7_a304]
signal n8_MUX_uxn_opcodes_h_l832_c7_a304_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l832_c7_a304_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l832_c7_a304_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l832_c7_a304_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l835_c11_c479]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l835_c7_3139]
signal t8_MUX_uxn_opcodes_h_l835_c7_3139_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c7_3139_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c7_3139_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c7_3139_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l835_c7_3139]
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_3139]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_3139]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_3139]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_3139]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l835_c7_3139]
signal n8_MUX_uxn_opcodes_h_l835_c7_3139_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c7_3139_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c7_3139_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c7_3139_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l838_c11_a747]
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l838_c7_2c7a]
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_2c7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_2c7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_2c7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_2c7a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l838_c7_2c7a]
signal n8_MUX_uxn_opcodes_h_l838_c7_2c7a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l840_c30_a022]
signal sp_relative_shift_uxn_opcodes_h_l840_c30_a022_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l840_c30_a022_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l840_c30_a022_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l840_c30_a022_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l843_c21_96a1]
signal BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_375c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86
BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_left,
BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_right,
BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output);

-- t8_MUX_uxn_opcodes_h_l819_c2_df76
t8_MUX_uxn_opcodes_h_l819_c2_df76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l819_c2_df76_cond,
t8_MUX_uxn_opcodes_h_l819_c2_df76_iftrue,
t8_MUX_uxn_opcodes_h_l819_c2_df76_iffalse,
t8_MUX_uxn_opcodes_h_l819_c2_df76_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76
result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_cond,
result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_return_output);

-- n8_MUX_uxn_opcodes_h_l819_c2_df76
n8_MUX_uxn_opcodes_h_l819_c2_df76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l819_c2_df76_cond,
n8_MUX_uxn_opcodes_h_l819_c2_df76_iftrue,
n8_MUX_uxn_opcodes_h_l819_c2_df76_iffalse,
n8_MUX_uxn_opcodes_h_l819_c2_df76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484
BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_left,
BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_right,
BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_return_output);

-- t8_MUX_uxn_opcodes_h_l832_c7_a304
t8_MUX_uxn_opcodes_h_l832_c7_a304 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l832_c7_a304_cond,
t8_MUX_uxn_opcodes_h_l832_c7_a304_iftrue,
t8_MUX_uxn_opcodes_h_l832_c7_a304_iffalse,
t8_MUX_uxn_opcodes_h_l832_c7_a304_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304
result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_cond,
result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_return_output);

-- n8_MUX_uxn_opcodes_h_l832_c7_a304
n8_MUX_uxn_opcodes_h_l832_c7_a304 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l832_c7_a304_cond,
n8_MUX_uxn_opcodes_h_l832_c7_a304_iftrue,
n8_MUX_uxn_opcodes_h_l832_c7_a304_iffalse,
n8_MUX_uxn_opcodes_h_l832_c7_a304_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479
BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_return_output);

-- t8_MUX_uxn_opcodes_h_l835_c7_3139
t8_MUX_uxn_opcodes_h_l835_c7_3139 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l835_c7_3139_cond,
t8_MUX_uxn_opcodes_h_l835_c7_3139_iftrue,
t8_MUX_uxn_opcodes_h_l835_c7_3139_iffalse,
t8_MUX_uxn_opcodes_h_l835_c7_3139_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139
result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_cond,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_return_output);

-- n8_MUX_uxn_opcodes_h_l835_c7_3139
n8_MUX_uxn_opcodes_h_l835_c7_3139 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l835_c7_3139_cond,
n8_MUX_uxn_opcodes_h_l835_c7_3139_iftrue,
n8_MUX_uxn_opcodes_h_l835_c7_3139_iffalse,
n8_MUX_uxn_opcodes_h_l835_c7_3139_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747
BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_left,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_right,
BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a
result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_cond,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output);

-- n8_MUX_uxn_opcodes_h_l838_c7_2c7a
n8_MUX_uxn_opcodes_h_l838_c7_2c7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l838_c7_2c7a_cond,
n8_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue,
n8_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse,
n8_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l840_c30_a022
sp_relative_shift_uxn_opcodes_h_l840_c30_a022 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l840_c30_a022_ins,
sp_relative_shift_uxn_opcodes_h_l840_c30_a022_x,
sp_relative_shift_uxn_opcodes_h_l840_c30_a022_y,
sp_relative_shift_uxn_opcodes_h_l840_c30_a022_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1
BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_left,
BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_right,
BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output,
 t8_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
 n8_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_return_output,
 t8_MUX_uxn_opcodes_h_l832_c7_a304_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_return_output,
 n8_MUX_uxn_opcodes_h_l832_c7_a304_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_return_output,
 t8_MUX_uxn_opcodes_h_l835_c7_3139_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_return_output,
 n8_MUX_uxn_opcodes_h_l835_c7_3139_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output,
 n8_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output,
 sp_relative_shift_uxn_opcodes_h_l840_c30_a022_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l832_c7_a304_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l829_c3_ea76 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l824_c3_62c8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l819_c2_df76_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l819_c2_df76_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l832_c7_a304_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l819_c2_df76_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l819_c2_df76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l832_c7_a304_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l832_c7_a304_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_3139_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l832_c7_a304_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_a925 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l832_c7_a304_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l832_c7_a304_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c7_3139_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l832_c7_a304_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_3139_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_3139_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c7_3139_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c7_3139_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c7_3139_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c7_3139_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l843_c3_aa64 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_133d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c7_2c7a_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_a022_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_a022_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_a022_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_a022_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l835_l819_l838_l832_DUPLICATE_efc6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_9da8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_c60f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_2ec0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l835_l838_DUPLICATE_b15d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l815_l847_DUPLICATE_865a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l829_c3_ea76 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l829_c3_ea76;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_a022_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_a022_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_a925 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l833_c3_a925;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l824_c3_62c8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l824_c3_62c8;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_133d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_133d;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_a022_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l819_c2_df76_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l832_c7_a304_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l835_c7_3139_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_3139_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l819_c2_df76_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l832_c7_a304_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_3139_iffalse := t8;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l819_c2_df76_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_c2_df76_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l840_c30_a022] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l840_c30_a022_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_a022_ins;
     sp_relative_shift_uxn_opcodes_h_l840_c30_a022_x <= VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_a022_x;
     sp_relative_shift_uxn_opcodes_h_l840_c30_a022_y <= VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_a022_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_a022_return_output := sp_relative_shift_uxn_opcodes_h_l840_c30_a022_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l819_c6_bf86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_left;
     BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output := BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_c60f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_c60f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l838_c11_a747] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_left;
     BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_return_output := BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l832_c11_b484] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_left;
     BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_return_output := BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l835_c11_c479] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l843_c21_96a1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_9da8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_9da8_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l819_c2_df76_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l835_l838_DUPLICATE_b15d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l835_l838_DUPLICATE_b15d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l835_l819_l838_l832_DUPLICATE_efc6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l835_l819_l838_l832_DUPLICATE_efc6_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_2ec0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_2ec0_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l819_c2_df76_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l819_c2_df76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l819_c2_df76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c6_bf86_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l832_c7_a304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l832_c7_a304_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l832_c11_b484_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l835_c7_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_3139_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_c479_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l838_c7_2c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c11_a747_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l843_c3_aa64 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l843_c21_96a1_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_2ec0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_2ec0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_2ec0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_9da8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_9da8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_9da8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_c60f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_c60f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l838_l832_DUPLICATE_c60f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l835_l838_DUPLICATE_b15d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l835_l838_DUPLICATE_b15d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l835_l819_l838_l832_DUPLICATE_efc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l835_l819_l838_l832_DUPLICATE_efc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l835_l819_l838_l832_DUPLICATE_efc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l835_l819_l838_l832_DUPLICATE_efc6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l819_c2_df76_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l819_c2_df76_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l819_c2_df76_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l819_c2_df76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l840_c30_a022_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue := VAR_result_u8_value_uxn_opcodes_h_l843_c3_aa64;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output;

     -- t8_MUX[uxn_opcodes_h_l835_c7_3139] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l835_c7_3139_cond <= VAR_t8_MUX_uxn_opcodes_h_l835_c7_3139_cond;
     t8_MUX_uxn_opcodes_h_l835_c7_3139_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l835_c7_3139_iftrue;
     t8_MUX_uxn_opcodes_h_l835_c7_3139_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l835_c7_3139_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l835_c7_3139_return_output := t8_MUX_uxn_opcodes_h_l835_c7_3139_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c7_2c7a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l838_c7_2c7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output;

     -- n8_MUX[uxn_opcodes_h_l838_c7_2c7a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l838_c7_2c7a_cond <= VAR_n8_MUX_uxn_opcodes_h_l838_c7_2c7a_cond;
     n8_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue;
     n8_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output := n8_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c7_2c7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l838_c7_2c7a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output := result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l838_c7_2c7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l835_c7_3139_iffalse := VAR_n8_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l838_c7_2c7a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l832_c7_a304_iffalse := VAR_t8_MUX_uxn_opcodes_h_l835_c7_3139_return_output;
     -- t8_MUX[uxn_opcodes_h_l832_c7_a304] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l832_c7_a304_cond <= VAR_t8_MUX_uxn_opcodes_h_l832_c7_a304_cond;
     t8_MUX_uxn_opcodes_h_l832_c7_a304_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l832_c7_a304_iftrue;
     t8_MUX_uxn_opcodes_h_l832_c7_a304_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l832_c7_a304_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l832_c7_a304_return_output := t8_MUX_uxn_opcodes_h_l832_c7_a304_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_3139] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l835_c7_3139] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_cond;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_return_output := result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_return_output;

     -- n8_MUX[uxn_opcodes_h_l835_c7_3139] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l835_c7_3139_cond <= VAR_n8_MUX_uxn_opcodes_h_l835_c7_3139_cond;
     n8_MUX_uxn_opcodes_h_l835_c7_3139_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l835_c7_3139_iftrue;
     n8_MUX_uxn_opcodes_h_l835_c7_3139_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l835_c7_3139_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l835_c7_3139_return_output := n8_MUX_uxn_opcodes_h_l835_c7_3139_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_3139] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_3139] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_3139] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l832_c7_a304_iffalse := VAR_n8_MUX_uxn_opcodes_h_l835_c7_3139_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_3139_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_3139_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_3139_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_3139_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c7_3139_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l819_c2_df76_iffalse := VAR_t8_MUX_uxn_opcodes_h_l832_c7_a304_return_output;
     -- t8_MUX[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l819_c2_df76_cond <= VAR_t8_MUX_uxn_opcodes_h_l819_c2_df76_cond;
     t8_MUX_uxn_opcodes_h_l819_c2_df76_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l819_c2_df76_iftrue;
     t8_MUX_uxn_opcodes_h_l819_c2_df76_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l819_c2_df76_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l819_c2_df76_return_output := t8_MUX_uxn_opcodes_h_l819_c2_df76_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l832_c7_a304] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l832_c7_a304] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l832_c7_a304] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_return_output;

     -- n8_MUX[uxn_opcodes_h_l832_c7_a304] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l832_c7_a304_cond <= VAR_n8_MUX_uxn_opcodes_h_l832_c7_a304_cond;
     n8_MUX_uxn_opcodes_h_l832_c7_a304_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l832_c7_a304_iftrue;
     n8_MUX_uxn_opcodes_h_l832_c7_a304_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l832_c7_a304_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l832_c7_a304_return_output := n8_MUX_uxn_opcodes_h_l832_c7_a304_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l832_c7_a304] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l832_c7_a304] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_cond;
     result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_return_output := result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l819_c2_df76_iffalse := VAR_n8_MUX_uxn_opcodes_h_l832_c7_a304_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l832_c7_a304_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l832_c7_a304_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l832_c7_a304_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l832_c7_a304_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l832_c7_a304_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l819_c2_df76_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_return_output;

     -- n8_MUX[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l819_c2_df76_cond <= VAR_n8_MUX_uxn_opcodes_h_l819_c2_df76_cond;
     n8_MUX_uxn_opcodes_h_l819_c2_df76_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l819_c2_df76_iftrue;
     n8_MUX_uxn_opcodes_h_l819_c2_df76_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l819_c2_df76_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l819_c2_df76_return_output := n8_MUX_uxn_opcodes_h_l819_c2_df76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_cond;
     result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_return_output := result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c2_df76] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l819_c2_df76_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l815_l847_DUPLICATE_865a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l815_l847_DUPLICATE_865a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c2_df76_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c2_df76_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l815_l847_DUPLICATE_865a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l815_l847_DUPLICATE_865a_return_output;
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
