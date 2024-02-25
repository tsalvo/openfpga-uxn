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
-- BIN_OP_EQ[uxn_opcodes_h_l904_c6_b92f]
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l904_c2_6589]
signal n8_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c2_6589]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l904_c2_6589]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l904_c2_6589]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l904_c2_6589]
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c2_6589]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l904_c2_6589]
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l904_c2_6589]
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l904_c2_6589]
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l904_c2_6589]
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l904_c2_6589]
signal t8_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l917_c11_9416]
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l917_c7_3b9e]
signal n8_MUX_uxn_opcodes_h_l917_c7_3b9e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_3b9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_3b9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l917_c7_3b9e]
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_3b9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_3b9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l917_c7_3b9e]
signal t8_MUX_uxn_opcodes_h_l917_c7_3b9e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l920_c11_4162]
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l920_c7_b48e]
signal n8_MUX_uxn_opcodes_h_l920_c7_b48e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_b48e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l920_c7_b48e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l920_c7_b48e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l920_c7_b48e]
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l920_c7_b48e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l920_c7_b48e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l920_c7_b48e]
signal t8_MUX_uxn_opcodes_h_l920_c7_b48e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_b48e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l923_c11_0409]
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l923_c7_0916]
signal n8_MUX_uxn_opcodes_h_l923_c7_0916_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_0916_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_0916_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_0916_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_0916]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_0916]
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l923_c7_0916]
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_0916]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_0916]
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l925_c30_d174]
signal sp_relative_shift_uxn_opcodes_h_l925_c30_d174_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_d174_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_d174_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_d174_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l928_c21_d8aa]
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_8b52( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f
BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_left,
BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_right,
BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output);

-- n8_MUX_uxn_opcodes_h_l904_c2_6589
n8_MUX_uxn_opcodes_h_l904_c2_6589 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l904_c2_6589_cond,
n8_MUX_uxn_opcodes_h_l904_c2_6589_iftrue,
n8_MUX_uxn_opcodes_h_l904_c2_6589_iffalse,
n8_MUX_uxn_opcodes_h_l904_c2_6589_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589
result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_cond,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_return_output);

-- t8_MUX_uxn_opcodes_h_l904_c2_6589
t8_MUX_uxn_opcodes_h_l904_c2_6589 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l904_c2_6589_cond,
t8_MUX_uxn_opcodes_h_l904_c2_6589_iftrue,
t8_MUX_uxn_opcodes_h_l904_c2_6589_iffalse,
t8_MUX_uxn_opcodes_h_l904_c2_6589_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416
BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_left,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_right,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_return_output);

-- n8_MUX_uxn_opcodes_h_l917_c7_3b9e
n8_MUX_uxn_opcodes_h_l917_c7_3b9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l917_c7_3b9e_cond,
n8_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue,
n8_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse,
n8_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e
result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_cond,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output);

-- t8_MUX_uxn_opcodes_h_l917_c7_3b9e
t8_MUX_uxn_opcodes_h_l917_c7_3b9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l917_c7_3b9e_cond,
t8_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue,
t8_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse,
t8_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162
BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_left,
BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_right,
BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_return_output);

-- n8_MUX_uxn_opcodes_h_l920_c7_b48e
n8_MUX_uxn_opcodes_h_l920_c7_b48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l920_c7_b48e_cond,
n8_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue,
n8_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse,
n8_MUX_uxn_opcodes_h_l920_c7_b48e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e
result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_cond,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_return_output);

-- t8_MUX_uxn_opcodes_h_l920_c7_b48e
t8_MUX_uxn_opcodes_h_l920_c7_b48e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l920_c7_b48e_cond,
t8_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue,
t8_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse,
t8_MUX_uxn_opcodes_h_l920_c7_b48e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409
BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_left,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_right,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_return_output);

-- n8_MUX_uxn_opcodes_h_l923_c7_0916
n8_MUX_uxn_opcodes_h_l923_c7_0916 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l923_c7_0916_cond,
n8_MUX_uxn_opcodes_h_l923_c7_0916_iftrue,
n8_MUX_uxn_opcodes_h_l923_c7_0916_iffalse,
n8_MUX_uxn_opcodes_h_l923_c7_0916_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916
result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_cond,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_return_output);

-- sp_relative_shift_uxn_opcodes_h_l925_c30_d174
sp_relative_shift_uxn_opcodes_h_l925_c30_d174 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l925_c30_d174_ins,
sp_relative_shift_uxn_opcodes_h_l925_c30_d174_x,
sp_relative_shift_uxn_opcodes_h_l925_c30_d174_y,
sp_relative_shift_uxn_opcodes_h_l925_c30_d174_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa
BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_left,
BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_right,
BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output,
 n8_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
 t8_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_return_output,
 n8_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output,
 t8_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_return_output,
 n8_MUX_uxn_opcodes_h_l920_c7_b48e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_return_output,
 t8_MUX_uxn_opcodes_h_l920_c7_b48e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_return_output,
 n8_MUX_uxn_opcodes_h_l923_c7_0916_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_return_output,
 sp_relative_shift_uxn_opcodes_h_l925_c30_d174_return_output,
 BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_9df1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_6ae3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_6589_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_6589_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_6589_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_6589_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_b48e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_7935 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_b48e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_0916_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_b48e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_b48e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_0916_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_0916_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_0916_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_1637 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_d174_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_d174_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_d174_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_d174_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l920_l904_l923_l917_DUPLICATE_3eaa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_79db_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_239d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_7349_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l920_l923_DUPLICATE_0e30_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l932_l900_DUPLICATE_d43b_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_1637 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_1637;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_d174_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_9df1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_9df1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_7935 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_7935;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_6ae3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_6ae3;
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_d174_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_d174_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_6589_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_0916_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_0916_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_6589_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l925_c30_d174] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l925_c30_d174_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_d174_ins;
     sp_relative_shift_uxn_opcodes_h_l925_c30_d174_x <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_d174_x;
     sp_relative_shift_uxn_opcodes_h_l925_c30_d174_y <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_d174_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_d174_return_output := sp_relative_shift_uxn_opcodes_h_l925_c30_d174_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l920_l904_l923_l917_DUPLICATE_3eaa LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l920_l904_l923_l917_DUPLICATE_3eaa_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_79db LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_79db_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_6589_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_239d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_239d_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l928_c21_d8aa] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_left;
     BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_return_output := BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_6589_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l923_c11_0409] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_left;
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_return_output := BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l920_c11_4162] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_left;
     BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_return_output := BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l920_l923_DUPLICATE_0e30 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l920_l923_DUPLICATE_0e30_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l917_c11_9416] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_left;
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_return_output := BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_6589_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_6589_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_7349 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_7349_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l904_c6_b92f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_left;
     BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output := BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output;

     -- Submodule level 1
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_d8aa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_6589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_6589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_b92f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_9416_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_b48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_b48e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_4162_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_0916_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_0409_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_79db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_79db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_79db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_7349_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_7349_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_7349_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_239d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_239d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l920_l923_l917_DUPLICATE_239d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l920_l923_DUPLICATE_0e30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l920_l923_DUPLICATE_0e30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l920_l904_l923_l917_DUPLICATE_3eaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l920_l904_l923_l917_DUPLICATE_3eaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l920_l904_l923_l917_DUPLICATE_3eaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l920_l904_l923_l917_DUPLICATE_3eaa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_6589_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_6589_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_6589_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_6589_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_d174_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l923_c7_0916] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_cond;
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_return_output := result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_0916] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_0916] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_0916] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_0916] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_return_output;

     -- t8_MUX[uxn_opcodes_h_l920_c7_b48e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l920_c7_b48e_cond <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_b48e_cond;
     t8_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue;
     t8_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_b48e_return_output := t8_MUX_uxn_opcodes_h_l920_c7_b48e_return_output;

     -- n8_MUX[uxn_opcodes_h_l923_c7_0916] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l923_c7_0916_cond <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_0916_cond;
     n8_MUX_uxn_opcodes_h_l923_c7_0916_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_0916_iftrue;
     n8_MUX_uxn_opcodes_h_l923_c7_0916_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_0916_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_0916_return_output := n8_MUX_uxn_opcodes_h_l923_c7_0916_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l923_c7_0916_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_0916_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_0916_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_0916_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_0916_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_0916_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l920_c7_b48e_return_output;
     -- n8_MUX[uxn_opcodes_h_l920_c7_b48e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l920_c7_b48e_cond <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_b48e_cond;
     n8_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue;
     n8_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_b48e_return_output := n8_MUX_uxn_opcodes_h_l920_c7_b48e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l920_c7_b48e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l920_c7_b48e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l920_c7_b48e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_return_output;

     -- t8_MUX[uxn_opcodes_h_l917_c7_3b9e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l917_c7_3b9e_cond <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_3b9e_cond;
     t8_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue;
     t8_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output := t8_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l920_c7_b48e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l920_c7_b48e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_return_output := result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l920_c7_b48e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_b48e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_b48e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_b48e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_b48e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_b48e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_6589_iffalse := VAR_t8_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_3b9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output;

     -- t8_MUX[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l904_c2_6589_cond <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_6589_cond;
     t8_MUX_uxn_opcodes_h_l904_c2_6589_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_6589_iftrue;
     t8_MUX_uxn_opcodes_h_l904_c2_6589_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_6589_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_6589_return_output := t8_MUX_uxn_opcodes_h_l904_c2_6589_return_output;

     -- n8_MUX[uxn_opcodes_h_l917_c7_3b9e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l917_c7_3b9e_cond <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_3b9e_cond;
     n8_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue;
     n8_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output := n8_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_3b9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_3b9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_3b9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l917_c7_3b9e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output := result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_6589_iffalse := VAR_n8_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_3b9e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l904_c2_6589_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_cond;
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_return_output := result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_return_output;

     -- n8_MUX[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l904_c2_6589_cond <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_6589_cond;
     n8_MUX_uxn_opcodes_h_l904_c2_6589_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_6589_iftrue;
     n8_MUX_uxn_opcodes_h_l904_c2_6589_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_6589_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_6589_return_output := n8_MUX_uxn_opcodes_h_l904_c2_6589_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l904_c2_6589] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l904_c2_6589_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l932_l900_DUPLICATE_d43b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l932_l900_DUPLICATE_d43b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6589_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6589_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l932_l900_DUPLICATE_d43b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l932_l900_DUPLICATE_d43b_return_output;
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
