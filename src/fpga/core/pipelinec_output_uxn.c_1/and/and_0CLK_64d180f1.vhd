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
entity and_0CLK_64d180f1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and_0CLK_64d180f1;
architecture arch of and_0CLK_64d180f1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l904_c6_715b]
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l904_c2_813b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l904_c2_813b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l904_c2_813b]
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l904_c2_813b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c2_813b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l904_c2_813b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c2_813b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l904_c2_813b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l904_c2_813b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l904_c2_813b]
signal n8_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l904_c2_813b]
signal t8_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l917_c11_ce76]
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_468d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_468d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l917_c7_468d]
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_468d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_468d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l917_c7_468d]
signal n8_MUX_uxn_opcodes_h_l917_c7_468d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_468d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_468d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_468d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l917_c7_468d]
signal t8_MUX_uxn_opcodes_h_l917_c7_468d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_468d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_468d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_468d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l920_c11_a49a]
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l920_c7_17bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l920_c7_17bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l920_c7_17bd]
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l920_c7_17bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l920_c7_17bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l920_c7_17bd]
signal n8_MUX_uxn_opcodes_h_l920_c7_17bd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_17bd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l920_c7_17bd]
signal t8_MUX_uxn_opcodes_h_l920_c7_17bd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_17bd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l923_c11_9cf2]
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_7129]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_7129]
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l923_c7_7129]
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_7129]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_7129]
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l923_c7_7129]
signal n8_MUX_uxn_opcodes_h_l923_c7_7129_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_7129_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_7129_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_7129_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l925_c30_3227]
signal sp_relative_shift_uxn_opcodes_h_l925_c30_3227_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_3227_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_3227_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_3227_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l928_c21_0dba]
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b
BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_left,
BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_right,
BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b
result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_cond,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_return_output);

-- n8_MUX_uxn_opcodes_h_l904_c2_813b
n8_MUX_uxn_opcodes_h_l904_c2_813b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l904_c2_813b_cond,
n8_MUX_uxn_opcodes_h_l904_c2_813b_iftrue,
n8_MUX_uxn_opcodes_h_l904_c2_813b_iffalse,
n8_MUX_uxn_opcodes_h_l904_c2_813b_return_output);

-- t8_MUX_uxn_opcodes_h_l904_c2_813b
t8_MUX_uxn_opcodes_h_l904_c2_813b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l904_c2_813b_cond,
t8_MUX_uxn_opcodes_h_l904_c2_813b_iftrue,
t8_MUX_uxn_opcodes_h_l904_c2_813b_iffalse,
t8_MUX_uxn_opcodes_h_l904_c2_813b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76
BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_left,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_right,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d
result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_cond,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_return_output);

-- n8_MUX_uxn_opcodes_h_l917_c7_468d
n8_MUX_uxn_opcodes_h_l917_c7_468d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l917_c7_468d_cond,
n8_MUX_uxn_opcodes_h_l917_c7_468d_iftrue,
n8_MUX_uxn_opcodes_h_l917_c7_468d_iffalse,
n8_MUX_uxn_opcodes_h_l917_c7_468d_return_output);

-- t8_MUX_uxn_opcodes_h_l917_c7_468d
t8_MUX_uxn_opcodes_h_l917_c7_468d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l917_c7_468d_cond,
t8_MUX_uxn_opcodes_h_l917_c7_468d_iftrue,
t8_MUX_uxn_opcodes_h_l917_c7_468d_iffalse,
t8_MUX_uxn_opcodes_h_l917_c7_468d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a
BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_left,
BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_right,
BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd
result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_return_output);

-- n8_MUX_uxn_opcodes_h_l920_c7_17bd
n8_MUX_uxn_opcodes_h_l920_c7_17bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l920_c7_17bd_cond,
n8_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue,
n8_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse,
n8_MUX_uxn_opcodes_h_l920_c7_17bd_return_output);

-- t8_MUX_uxn_opcodes_h_l920_c7_17bd
t8_MUX_uxn_opcodes_h_l920_c7_17bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l920_c7_17bd_cond,
t8_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue,
t8_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse,
t8_MUX_uxn_opcodes_h_l920_c7_17bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2
BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_left,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_right,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129
result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_cond,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_return_output);

-- n8_MUX_uxn_opcodes_h_l923_c7_7129
n8_MUX_uxn_opcodes_h_l923_c7_7129 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l923_c7_7129_cond,
n8_MUX_uxn_opcodes_h_l923_c7_7129_iftrue,
n8_MUX_uxn_opcodes_h_l923_c7_7129_iffalse,
n8_MUX_uxn_opcodes_h_l923_c7_7129_return_output);

-- sp_relative_shift_uxn_opcodes_h_l925_c30_3227
sp_relative_shift_uxn_opcodes_h_l925_c30_3227 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l925_c30_3227_ins,
sp_relative_shift_uxn_opcodes_h_l925_c30_3227_x,
sp_relative_shift_uxn_opcodes_h_l925_c30_3227_y,
sp_relative_shift_uxn_opcodes_h_l925_c30_3227_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba
BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_left,
BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_right,
BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
 n8_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
 t8_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_return_output,
 n8_MUX_uxn_opcodes_h_l917_c7_468d_return_output,
 t8_MUX_uxn_opcodes_h_l917_c7_468d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_return_output,
 n8_MUX_uxn_opcodes_h_l920_c7_17bd_return_output,
 t8_MUX_uxn_opcodes_h_l920_c7_17bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_return_output,
 n8_MUX_uxn_opcodes_h_l923_c7_7129_return_output,
 sp_relative_shift_uxn_opcodes_h_l925_c30_3227_return_output,
 BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_5b2a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_bfc7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_468d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_813b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_813b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_468d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_813b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_813b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_4df5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_468d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_468d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_17bd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_468d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_468d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_468d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_17bd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_468d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_7129_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_17bd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_17bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_b6d0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_7129_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_7129_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_7129_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_3227_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_3227_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_3227_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_3227_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l904_l923_l920_DUPLICATE_9ae5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_e6da_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_14e1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_2c19_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_08fd_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l900_l932_DUPLICATE_6b50_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_4df5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_4df5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_b6d0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_b6d0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_bfc7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_bfc7;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_3227_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_5b2a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_5b2a;
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_3227_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_3227_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_813b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_468d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_7129_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_7129_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_813b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_468d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_e6da LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_e6da_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l923_c11_9cf2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_left;
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_return_output := BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l920_c11_a49a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_left;
     BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_return_output := BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l928_c21_0dba] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_left;
     BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_return_output := BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_813b_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_813b_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_08fd LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_08fd_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_813b_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l917_c11_ce76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_left;
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_return_output := BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_2c19 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_2c19_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l904_l923_l920_DUPLICATE_9ae5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l904_l923_l920_DUPLICATE_9ae5_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l904_c6_715b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_left;
     BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output := BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_14e1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_14e1_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_813b_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l925_c30_3227] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l925_c30_3227_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_3227_ins;
     sp_relative_shift_uxn_opcodes_h_l925_c30_3227_x <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_3227_x;
     sp_relative_shift_uxn_opcodes_h_l925_c30_3227_y <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_3227_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_3227_return_output := sp_relative_shift_uxn_opcodes_h_l925_c30_3227_return_output;

     -- Submodule level 1
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0dba_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_813b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_813b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_715b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_468d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_468d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ce76_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_17bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_a49a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_7129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_9cf2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_e6da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_e6da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_e6da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_2c19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_2c19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_2c19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_14e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_14e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_14e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_08fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_08fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l904_l923_l920_DUPLICATE_9ae5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l904_l923_l920_DUPLICATE_9ae5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l904_l923_l920_DUPLICATE_9ae5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l904_l923_l920_DUPLICATE_9ae5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_813b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_813b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_813b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_813b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_3227_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l923_c7_7129] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_cond;
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_return_output := result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_7129] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output;

     -- n8_MUX[uxn_opcodes_h_l923_c7_7129] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l923_c7_7129_cond <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_7129_cond;
     n8_MUX_uxn_opcodes_h_l923_c7_7129_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_7129_iftrue;
     n8_MUX_uxn_opcodes_h_l923_c7_7129_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_7129_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_7129_return_output := n8_MUX_uxn_opcodes_h_l923_c7_7129_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_7129] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_7129] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_7129] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_return_output;

     -- t8_MUX[uxn_opcodes_h_l920_c7_17bd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l920_c7_17bd_cond <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_17bd_cond;
     t8_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue;
     t8_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_17bd_return_output := t8_MUX_uxn_opcodes_h_l920_c7_17bd_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l923_c7_7129_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_7129_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_7129_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_7129_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_7129_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_7129_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_468d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l920_c7_17bd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l920_c7_17bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l920_c7_17bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_return_output;

     -- n8_MUX[uxn_opcodes_h_l920_c7_17bd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l920_c7_17bd_cond <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_17bd_cond;
     n8_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue;
     n8_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_17bd_return_output := n8_MUX_uxn_opcodes_h_l920_c7_17bd_return_output;

     -- t8_MUX[uxn_opcodes_h_l917_c7_468d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l917_c7_468d_cond <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_468d_cond;
     t8_MUX_uxn_opcodes_h_l917_c7_468d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_468d_iftrue;
     t8_MUX_uxn_opcodes_h_l917_c7_468d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_468d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_468d_return_output := t8_MUX_uxn_opcodes_h_l917_c7_468d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l920_c7_17bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l920_c7_17bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l920_c7_17bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_468d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l920_c7_17bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_17bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_17bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_17bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_17bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_17bd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_813b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l917_c7_468d_return_output;
     -- t8_MUX[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l904_c2_813b_cond <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_813b_cond;
     t8_MUX_uxn_opcodes_h_l904_c2_813b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_813b_iftrue;
     t8_MUX_uxn_opcodes_h_l904_c2_813b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_813b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_813b_return_output := t8_MUX_uxn_opcodes_h_l904_c2_813b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l917_c7_468d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_return_output := result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_return_output;

     -- n8_MUX[uxn_opcodes_h_l917_c7_468d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l917_c7_468d_cond <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_468d_cond;
     n8_MUX_uxn_opcodes_h_l917_c7_468d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_468d_iftrue;
     n8_MUX_uxn_opcodes_h_l917_c7_468d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_468d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_468d_return_output := n8_MUX_uxn_opcodes_h_l917_c7_468d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_468d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_468d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_468d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_468d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_813b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l917_c7_468d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_468d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_468d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_468d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_468d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_468d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l904_c2_813b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output;

     -- n8_MUX[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l904_c2_813b_cond <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_813b_cond;
     n8_MUX_uxn_opcodes_h_l904_c2_813b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_813b_iftrue;
     n8_MUX_uxn_opcodes_h_l904_c2_813b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_813b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_813b_return_output := n8_MUX_uxn_opcodes_h_l904_c2_813b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l904_c2_813b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_return_output := result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l904_c2_813b_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l900_l932_DUPLICATE_6b50 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l900_l932_DUPLICATE_6b50_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_813b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_813b_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l900_l932_DUPLICATE_6b50_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l900_l932_DUPLICATE_6b50_return_output;
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
