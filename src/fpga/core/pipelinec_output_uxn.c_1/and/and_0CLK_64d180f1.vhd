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
-- BIN_OP_EQ[uxn_opcodes_h_l904_c6_1bab]
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l904_c2_ecf2]
signal n8_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c2_ecf2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l904_c2_ecf2]
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l904_c2_ecf2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l904_c2_ecf2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l904_c2_ecf2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c2_ecf2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l904_c2_ecf2]
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l904_c2_ecf2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l904_c2_ecf2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l904_c2_ecf2]
signal t8_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l917_c11_0744]
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l917_c7_4fc3]
signal n8_MUX_uxn_opcodes_h_l917_c7_4fc3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_4fc3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l917_c7_4fc3]
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_4fc3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_4fc3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_4fc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l917_c7_4fc3]
signal t8_MUX_uxn_opcodes_h_l917_c7_4fc3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l920_c11_51e6]
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l920_c7_c806]
signal n8_MUX_uxn_opcodes_h_l920_c7_c806_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_c806_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_c806_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_c806_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l920_c7_c806]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l920_c7_c806]
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l920_c7_c806]
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l920_c7_c806]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l920_c7_c806]
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l920_c7_c806]
signal t8_MUX_uxn_opcodes_h_l920_c7_c806_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_c806_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_c806_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_c806_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l923_c11_f88c]
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l923_c7_135e]
signal n8_MUX_uxn_opcodes_h_l923_c7_135e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_135e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_135e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_135e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_135e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l923_c7_135e]
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_135e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_135e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_135e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l925_c30_cee2]
signal sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l928_c21_2775]
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab
BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_left,
BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_right,
BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output);

-- n8_MUX_uxn_opcodes_h_l904_c2_ecf2
n8_MUX_uxn_opcodes_h_l904_c2_ecf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l904_c2_ecf2_cond,
n8_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue,
n8_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse,
n8_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2
result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_cond,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output);

-- t8_MUX_uxn_opcodes_h_l904_c2_ecf2
t8_MUX_uxn_opcodes_h_l904_c2_ecf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l904_c2_ecf2_cond,
t8_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue,
t8_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse,
t8_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744
BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_left,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_right,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_return_output);

-- n8_MUX_uxn_opcodes_h_l917_c7_4fc3
n8_MUX_uxn_opcodes_h_l917_c7_4fc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l917_c7_4fc3_cond,
n8_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue,
n8_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse,
n8_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3
result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_cond,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output);

-- t8_MUX_uxn_opcodes_h_l917_c7_4fc3
t8_MUX_uxn_opcodes_h_l917_c7_4fc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l917_c7_4fc3_cond,
t8_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue,
t8_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse,
t8_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6
BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_left,
BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_right,
BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_return_output);

-- n8_MUX_uxn_opcodes_h_l920_c7_c806
n8_MUX_uxn_opcodes_h_l920_c7_c806 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l920_c7_c806_cond,
n8_MUX_uxn_opcodes_h_l920_c7_c806_iftrue,
n8_MUX_uxn_opcodes_h_l920_c7_c806_iffalse,
n8_MUX_uxn_opcodes_h_l920_c7_c806_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806
result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_cond,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_return_output);

-- t8_MUX_uxn_opcodes_h_l920_c7_c806
t8_MUX_uxn_opcodes_h_l920_c7_c806 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l920_c7_c806_cond,
t8_MUX_uxn_opcodes_h_l920_c7_c806_iftrue,
t8_MUX_uxn_opcodes_h_l920_c7_c806_iffalse,
t8_MUX_uxn_opcodes_h_l920_c7_c806_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c
BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_left,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_right,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_return_output);

-- n8_MUX_uxn_opcodes_h_l923_c7_135e
n8_MUX_uxn_opcodes_h_l923_c7_135e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l923_c7_135e_cond,
n8_MUX_uxn_opcodes_h_l923_c7_135e_iftrue,
n8_MUX_uxn_opcodes_h_l923_c7_135e_iffalse,
n8_MUX_uxn_opcodes_h_l923_c7_135e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e
result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_cond,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l925_c30_cee2
sp_relative_shift_uxn_opcodes_h_l925_c30_cee2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_ins,
sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_x,
sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_y,
sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l928_c21_2775
BIN_OP_AND_uxn_opcodes_h_l928_c21_2775 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_left,
BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_right,
BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output,
 n8_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
 t8_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_return_output,
 n8_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output,
 t8_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_return_output,
 n8_MUX_uxn_opcodes_h_l920_c7_c806_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_return_output,
 t8_MUX_uxn_opcodes_h_l920_c7_c806_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_return_output,
 n8_MUX_uxn_opcodes_h_l923_c7_135e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_return_output,
 sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_2523 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_745c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_ecf2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_c806_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_4fc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_150b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_c806_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_4fc3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_c806_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_c806_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_135e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_c806_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_c806_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_c806_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_c806_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_135e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_135e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_135e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_c2f0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l923_l904_l920_DUPLICATE_0c3f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_c7a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_61c8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_5f27_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_a71e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l932_l900_DUPLICATE_6844_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_y := resize(to_signed(-1, 2), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_150b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_150b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_c2f0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_c2f0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_2523 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_2523;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_745c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_745c;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_c806_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_135e_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_135e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_c806_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_c806_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l923_c11_f88c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_left;
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_return_output := BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_ecf2_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_61c8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_61c8_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l928_c21_2775] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_left;
     BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_return_output := BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l920_c11_51e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_ecf2_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_a71e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_a71e_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l925_c30_cee2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_ins;
     sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_x;
     sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_return_output := sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l904_c6_1bab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_left;
     BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output := BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_ecf2_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_ecf2_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l923_l904_l920_DUPLICATE_0c3f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l923_l904_l920_DUPLICATE_0c3f_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_c7a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_c7a2_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_5f27 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_5f27_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l917_c11_0744] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_left;
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_return_output := BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_return_output;

     -- Submodule level 1
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_2775_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_ecf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_ecf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1bab_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_4fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0744_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_c806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_c806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_51e6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_135e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f88c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_61c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_61c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_61c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_5f27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_5f27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_5f27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_c7a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_c7a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_c7a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_a71e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_a71e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l923_l904_l920_DUPLICATE_0c3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l923_l904_l920_DUPLICATE_0c3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l923_l904_l920_DUPLICATE_0c3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l923_l904_l920_DUPLICATE_0c3f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_ecf2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_ecf2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_ecf2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_ecf2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_cee2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l923_c7_135e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_return_output := result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output;

     -- n8_MUX[uxn_opcodes_h_l923_c7_135e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l923_c7_135e_cond <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_135e_cond;
     n8_MUX_uxn_opcodes_h_l923_c7_135e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_135e_iftrue;
     n8_MUX_uxn_opcodes_h_l923_c7_135e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_135e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_135e_return_output := n8_MUX_uxn_opcodes_h_l923_c7_135e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_135e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output;

     -- t8_MUX[uxn_opcodes_h_l920_c7_c806] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l920_c7_c806_cond <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_c806_cond;
     t8_MUX_uxn_opcodes_h_l920_c7_c806_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_c806_iftrue;
     t8_MUX_uxn_opcodes_h_l920_c7_c806_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_c806_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_c806_return_output := t8_MUX_uxn_opcodes_h_l920_c7_c806_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_135e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_135e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_135e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_c806_iffalse := VAR_n8_MUX_uxn_opcodes_h_l923_c7_135e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_135e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_135e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_135e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_135e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_135e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l920_c7_c806_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l920_c7_c806] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l920_c7_c806] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l920_c7_c806] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_return_output;

     -- t8_MUX[uxn_opcodes_h_l917_c7_4fc3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l917_c7_4fc3_cond <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_4fc3_cond;
     t8_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue;
     t8_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output := t8_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l920_c7_c806] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_return_output;

     -- n8_MUX[uxn_opcodes_h_l920_c7_c806] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l920_c7_c806_cond <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_c806_cond;
     n8_MUX_uxn_opcodes_h_l920_c7_c806_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_c806_iftrue;
     n8_MUX_uxn_opcodes_h_l920_c7_c806_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_c806_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_c806_return_output := n8_MUX_uxn_opcodes_h_l920_c7_c806_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l920_c7_c806] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_cond;
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_return_output := result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l920_c7_c806_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_c806_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_c806_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_c806_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_c806_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_c806_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output;
     -- t8_MUX[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l904_c2_ecf2_cond <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_ecf2_cond;
     t8_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue;
     t8_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output := t8_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l917_c7_4fc3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output := result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_4fc3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_4fc3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_4fc3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output;

     -- n8_MUX[uxn_opcodes_h_l917_c7_4fc3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l917_c7_4fc3_cond <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_4fc3_cond;
     n8_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue;
     n8_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output := n8_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_4fc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_4fc3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output := result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output;

     -- n8_MUX[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l904_c2_ecf2_cond <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_ecf2_cond;
     n8_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue;
     n8_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output := n8_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l904_c2_ecf2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l932_l900_DUPLICATE_6844 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l932_l900_DUPLICATE_6844_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_ecf2_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l932_l900_DUPLICATE_6844_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l932_l900_DUPLICATE_6844_return_output;
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
