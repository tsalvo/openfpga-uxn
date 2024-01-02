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
-- BIN_OP_EQ[uxn_opcodes_h_l904_c6_a8af]
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l904_c2_6686]
signal n8_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l904_c2_6686]
signal t8_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c2_6686]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l904_c2_6686]
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l904_c2_6686]
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l904_c2_6686]
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c2_6686]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l904_c2_6686]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l904_c2_6686]
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l904_c2_6686]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l904_c2_6686]
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l917_c11_ec5c]
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l917_c7_8726]
signal n8_MUX_uxn_opcodes_h_l917_c7_8726_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_8726_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_8726_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_8726_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l917_c7_8726]
signal t8_MUX_uxn_opcodes_h_l917_c7_8726_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_8726_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_8726_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_8726_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_8726]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l917_c7_8726]
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_8726]
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_8726]
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_8726]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l920_c11_c773]
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l920_c7_a10e]
signal n8_MUX_uxn_opcodes_h_l920_c7_a10e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_a10e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l920_c7_a10e]
signal t8_MUX_uxn_opcodes_h_l920_c7_a10e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_a10e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l920_c7_a10e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l920_c7_a10e]
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l920_c7_a10e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l920_c7_a10e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l920_c7_a10e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l923_c11_f3af]
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l923_c7_e615]
signal n8_MUX_uxn_opcodes_h_l923_c7_e615_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_e615_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_e615_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_e615_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_e615]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l923_c7_e615]
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_e615]
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_e615]
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_e615]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l925_c30_9892]
signal sp_relative_shift_uxn_opcodes_h_l925_c30_9892_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_9892_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_9892_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_9892_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l928_c21_6efd]
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af
BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_left,
BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_right,
BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output);

-- n8_MUX_uxn_opcodes_h_l904_c2_6686
n8_MUX_uxn_opcodes_h_l904_c2_6686 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l904_c2_6686_cond,
n8_MUX_uxn_opcodes_h_l904_c2_6686_iftrue,
n8_MUX_uxn_opcodes_h_l904_c2_6686_iffalse,
n8_MUX_uxn_opcodes_h_l904_c2_6686_return_output);

-- t8_MUX_uxn_opcodes_h_l904_c2_6686
t8_MUX_uxn_opcodes_h_l904_c2_6686 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l904_c2_6686_cond,
t8_MUX_uxn_opcodes_h_l904_c2_6686_iftrue,
t8_MUX_uxn_opcodes_h_l904_c2_6686_iffalse,
t8_MUX_uxn_opcodes_h_l904_c2_6686_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686
result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_cond,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c
BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_left,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_right,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_return_output);

-- n8_MUX_uxn_opcodes_h_l917_c7_8726
n8_MUX_uxn_opcodes_h_l917_c7_8726 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l917_c7_8726_cond,
n8_MUX_uxn_opcodes_h_l917_c7_8726_iftrue,
n8_MUX_uxn_opcodes_h_l917_c7_8726_iffalse,
n8_MUX_uxn_opcodes_h_l917_c7_8726_return_output);

-- t8_MUX_uxn_opcodes_h_l917_c7_8726
t8_MUX_uxn_opcodes_h_l917_c7_8726 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l917_c7_8726_cond,
t8_MUX_uxn_opcodes_h_l917_c7_8726_iftrue,
t8_MUX_uxn_opcodes_h_l917_c7_8726_iffalse,
t8_MUX_uxn_opcodes_h_l917_c7_8726_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726
result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_cond,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773
BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_left,
BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_right,
BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_return_output);

-- n8_MUX_uxn_opcodes_h_l920_c7_a10e
n8_MUX_uxn_opcodes_h_l920_c7_a10e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l920_c7_a10e_cond,
n8_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue,
n8_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse,
n8_MUX_uxn_opcodes_h_l920_c7_a10e_return_output);

-- t8_MUX_uxn_opcodes_h_l920_c7_a10e
t8_MUX_uxn_opcodes_h_l920_c7_a10e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l920_c7_a10e_cond,
t8_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue,
t8_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse,
t8_MUX_uxn_opcodes_h_l920_c7_a10e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e
result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_cond,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af
BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_left,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_right,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_return_output);

-- n8_MUX_uxn_opcodes_h_l923_c7_e615
n8_MUX_uxn_opcodes_h_l923_c7_e615 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l923_c7_e615_cond,
n8_MUX_uxn_opcodes_h_l923_c7_e615_iftrue,
n8_MUX_uxn_opcodes_h_l923_c7_e615_iffalse,
n8_MUX_uxn_opcodes_h_l923_c7_e615_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615
result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_cond,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_return_output);

-- sp_relative_shift_uxn_opcodes_h_l925_c30_9892
sp_relative_shift_uxn_opcodes_h_l925_c30_9892 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l925_c30_9892_ins,
sp_relative_shift_uxn_opcodes_h_l925_c30_9892_x,
sp_relative_shift_uxn_opcodes_h_l925_c30_9892_y,
sp_relative_shift_uxn_opcodes_h_l925_c30_9892_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd
BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_left,
BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_right,
BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output,
 n8_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
 t8_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_return_output,
 n8_MUX_uxn_opcodes_h_l917_c7_8726_return_output,
 t8_MUX_uxn_opcodes_h_l917_c7_8726_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_return_output,
 n8_MUX_uxn_opcodes_h_l920_c7_a10e_return_output,
 t8_MUX_uxn_opcodes_h_l920_c7_a10e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_return_output,
 n8_MUX_uxn_opcodes_h_l923_c7_e615_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_return_output,
 sp_relative_shift_uxn_opcodes_h_l925_c30_9892_return_output,
 BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_8726_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_8726_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_c528 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_81b5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_8726_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_8726_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_a10e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_8726_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_8726_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_8726_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_a10e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_8726_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_7598 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_e615_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_a10e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_a10e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_e615_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_e615_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_e615_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_45fb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_9892_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_9892_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_9892_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_9892_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l904_l923_l920_DUPLICATE_cb91_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_028c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_ae2a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_2f70_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_ffda_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l900_l932_DUPLICATE_2cd0_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_9892_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_81b5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_81b5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_45fb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_45fb;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_c528 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_c528;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_9892_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_7598 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_7598;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_9892_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_6686_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_8726_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_e615_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_e615_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_6686_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_8726_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l904_c6_a8af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_left;
     BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output := BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_6686_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l917_c11_ec5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_ae2a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_ae2a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_ffda LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_ffda_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l928_c21_6efd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_left;
     BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_return_output := BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_6686_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l920_c11_c773] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_left;
     BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_return_output := BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_6686_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_2f70 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_2f70_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_6686_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l925_c30_9892] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l925_c30_9892_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_9892_ins;
     sp_relative_shift_uxn_opcodes_h_l925_c30_9892_x <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_9892_x;
     sp_relative_shift_uxn_opcodes_h_l925_c30_9892_y <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_9892_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_9892_return_output := sp_relative_shift_uxn_opcodes_h_l925_c30_9892_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l923_c11_f3af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_left;
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_return_output := BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_028c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_028c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l904_l923_l920_DUPLICATE_cb91 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l904_l923_l920_DUPLICATE_cb91_return_output := result.u8_value;

     -- Submodule level 1
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_6efd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_6686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_6686_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_a8af_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_8726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_8726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_ec5c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_a10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_a10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_c773_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_e615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_f3af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_028c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_028c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_028c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_2f70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_2f70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_2f70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_ae2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_ae2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_ae2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_ffda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_ffda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l904_l923_l920_DUPLICATE_cb91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l904_l923_l920_DUPLICATE_cb91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l904_l923_l920_DUPLICATE_cb91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l904_l923_l920_DUPLICATE_cb91_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_6686_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_6686_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_6686_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_6686_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_9892_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_e615] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_e615] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l923_c7_e615] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_cond;
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_return_output := result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_return_output;

     -- t8_MUX[uxn_opcodes_h_l920_c7_a10e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l920_c7_a10e_cond <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_a10e_cond;
     t8_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue;
     t8_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_a10e_return_output := t8_MUX_uxn_opcodes_h_l920_c7_a10e_return_output;

     -- n8_MUX[uxn_opcodes_h_l923_c7_e615] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l923_c7_e615_cond <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_e615_cond;
     n8_MUX_uxn_opcodes_h_l923_c7_e615_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_e615_iftrue;
     n8_MUX_uxn_opcodes_h_l923_c7_e615_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_e615_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_e615_return_output := n8_MUX_uxn_opcodes_h_l923_c7_e615_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_e615] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_e615] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l923_c7_e615_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_e615_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_e615_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_e615_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_e615_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_e615_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_8726_iffalse := VAR_t8_MUX_uxn_opcodes_h_l920_c7_a10e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l920_c7_a10e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l920_c7_a10e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l920_c7_a10e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l920_c7_a10e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_return_output := result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_return_output;

     -- t8_MUX[uxn_opcodes_h_l917_c7_8726] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l917_c7_8726_cond <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_8726_cond;
     t8_MUX_uxn_opcodes_h_l917_c7_8726_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_8726_iftrue;
     t8_MUX_uxn_opcodes_h_l917_c7_8726_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_8726_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_8726_return_output := t8_MUX_uxn_opcodes_h_l917_c7_8726_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l920_c7_a10e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_return_output;

     -- n8_MUX[uxn_opcodes_h_l920_c7_a10e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l920_c7_a10e_cond <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_a10e_cond;
     n8_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_a10e_iftrue;
     n8_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_a10e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_a10e_return_output := n8_MUX_uxn_opcodes_h_l920_c7_a10e_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_8726_iffalse := VAR_n8_MUX_uxn_opcodes_h_l920_c7_a10e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_a10e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_a10e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_a10e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_a10e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_a10e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_6686_iffalse := VAR_t8_MUX_uxn_opcodes_h_l917_c7_8726_return_output;
     -- n8_MUX[uxn_opcodes_h_l917_c7_8726] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l917_c7_8726_cond <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_8726_cond;
     n8_MUX_uxn_opcodes_h_l917_c7_8726_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_8726_iftrue;
     n8_MUX_uxn_opcodes_h_l917_c7_8726_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_8726_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_8726_return_output := n8_MUX_uxn_opcodes_h_l917_c7_8726_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_8726] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l917_c7_8726] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_cond;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_return_output := result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_8726] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_return_output;

     -- t8_MUX[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l904_c2_6686_cond <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_6686_cond;
     t8_MUX_uxn_opcodes_h_l904_c2_6686_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_6686_iftrue;
     t8_MUX_uxn_opcodes_h_l904_c2_6686_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_6686_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_6686_return_output := t8_MUX_uxn_opcodes_h_l904_c2_6686_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_8726] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_8726] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_6686_iffalse := VAR_n8_MUX_uxn_opcodes_h_l917_c7_8726_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_8726_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_8726_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_8726_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_8726_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_8726_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l904_c2_6686_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_return_output;

     -- n8_MUX[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l904_c2_6686_cond <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_6686_cond;
     n8_MUX_uxn_opcodes_h_l904_c2_6686_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_6686_iftrue;
     n8_MUX_uxn_opcodes_h_l904_c2_6686_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_6686_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_6686_return_output := n8_MUX_uxn_opcodes_h_l904_c2_6686_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_cond;
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_return_output := result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c2_6686] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l904_c2_6686_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l900_l932_DUPLICATE_2cd0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l900_l932_DUPLICATE_2cd0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_6686_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_6686_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l900_l932_DUPLICATE_2cd0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l900_l932_DUPLICATE_2cd0_return_output;
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
