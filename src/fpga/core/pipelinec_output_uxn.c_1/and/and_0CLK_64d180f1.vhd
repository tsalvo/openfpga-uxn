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
-- BIN_OP_EQ[uxn_opcodes_h_l904_c6_0fbe]
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l904_c2_3923]
signal t8_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l904_c2_3923]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l904_c2_3923]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l904_c2_3923]
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l904_c2_3923]
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l904_c2_3923]
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c2_3923]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l904_c2_3923]
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l904_c2_3923]
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c2_3923]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l904_c2_3923]
signal n8_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l917_c11_0156]
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l917_c7_27a2]
signal t8_MUX_uxn_opcodes_h_l917_c7_27a2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_27a2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_27a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_27a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l917_c7_27a2]
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_27a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_27a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l917_c7_27a2]
signal n8_MUX_uxn_opcodes_h_l917_c7_27a2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_27a2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l920_c11_220c]
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l920_c7_667f]
signal t8_MUX_uxn_opcodes_h_l920_c7_667f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_667f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_667f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_667f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l920_c7_667f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l920_c7_667f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l920_c7_667f]
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l920_c7_667f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l920_c7_667f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l920_c7_667f]
signal n8_MUX_uxn_opcodes_h_l920_c7_667f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_667f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_667f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_667f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l923_c11_b6d4]
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_d7cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_d7cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l923_c7_d7cd]
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_d7cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_d7cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l923_c7_d7cd]
signal n8_MUX_uxn_opcodes_h_l923_c7_d7cd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l925_c30_e615]
signal sp_relative_shift_uxn_opcodes_h_l925_c30_e615_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_e615_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_e615_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_e615_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l928_c21_0e41]
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_71f0( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe
BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_left,
BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_right,
BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output);

-- t8_MUX_uxn_opcodes_h_l904_c2_3923
t8_MUX_uxn_opcodes_h_l904_c2_3923 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l904_c2_3923_cond,
t8_MUX_uxn_opcodes_h_l904_c2_3923_iftrue,
t8_MUX_uxn_opcodes_h_l904_c2_3923_iffalse,
t8_MUX_uxn_opcodes_h_l904_c2_3923_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923
result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_cond,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_return_output);

-- n8_MUX_uxn_opcodes_h_l904_c2_3923
n8_MUX_uxn_opcodes_h_l904_c2_3923 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l904_c2_3923_cond,
n8_MUX_uxn_opcodes_h_l904_c2_3923_iftrue,
n8_MUX_uxn_opcodes_h_l904_c2_3923_iffalse,
n8_MUX_uxn_opcodes_h_l904_c2_3923_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156
BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_left,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_right,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_return_output);

-- t8_MUX_uxn_opcodes_h_l917_c7_27a2
t8_MUX_uxn_opcodes_h_l917_c7_27a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l917_c7_27a2_cond,
t8_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue,
t8_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse,
t8_MUX_uxn_opcodes_h_l917_c7_27a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2
result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_cond,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_return_output);

-- n8_MUX_uxn_opcodes_h_l917_c7_27a2
n8_MUX_uxn_opcodes_h_l917_c7_27a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l917_c7_27a2_cond,
n8_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue,
n8_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse,
n8_MUX_uxn_opcodes_h_l917_c7_27a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c
BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_left,
BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_right,
BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_return_output);

-- t8_MUX_uxn_opcodes_h_l920_c7_667f
t8_MUX_uxn_opcodes_h_l920_c7_667f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l920_c7_667f_cond,
t8_MUX_uxn_opcodes_h_l920_c7_667f_iftrue,
t8_MUX_uxn_opcodes_h_l920_c7_667f_iffalse,
t8_MUX_uxn_opcodes_h_l920_c7_667f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f
result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_cond,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_return_output);

-- n8_MUX_uxn_opcodes_h_l920_c7_667f
n8_MUX_uxn_opcodes_h_l920_c7_667f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l920_c7_667f_cond,
n8_MUX_uxn_opcodes_h_l920_c7_667f_iftrue,
n8_MUX_uxn_opcodes_h_l920_c7_667f_iffalse,
n8_MUX_uxn_opcodes_h_l920_c7_667f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4
BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_left,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_right,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd
result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_cond,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output);

-- n8_MUX_uxn_opcodes_h_l923_c7_d7cd
n8_MUX_uxn_opcodes_h_l923_c7_d7cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l923_c7_d7cd_cond,
n8_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue,
n8_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse,
n8_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l925_c30_e615
sp_relative_shift_uxn_opcodes_h_l925_c30_e615 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l925_c30_e615_ins,
sp_relative_shift_uxn_opcodes_h_l925_c30_e615_x,
sp_relative_shift_uxn_opcodes_h_l925_c30_e615_y,
sp_relative_shift_uxn_opcodes_h_l925_c30_e615_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41
BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_left,
BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_right,
BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output,
 t8_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
 n8_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_return_output,
 t8_MUX_uxn_opcodes_h_l917_c7_27a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_return_output,
 n8_MUX_uxn_opcodes_h_l917_c7_27a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_return_output,
 t8_MUX_uxn_opcodes_h_l920_c7_667f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_return_output,
 n8_MUX_uxn_opcodes_h_l920_c7_667f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output,
 n8_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output,
 sp_relative_shift_uxn_opcodes_h_l925_c30_e615_return_output,
 BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_27a2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_e546 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_d892 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_3923_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_3923_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_27a2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_3923_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_3923_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_667f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_73e7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_667f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_27a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_667f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_667f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_667f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_667f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_667f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_667f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_f2f2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_d7cd_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_e615_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_e615_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_e615_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_e615_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l904_l923_l917_l920_DUPLICATE_defc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_d9e4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_a7cb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_8519_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_d9d6_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l932_l900_DUPLICATE_e9bf_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_e615_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_e615_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_e546 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_e546;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_d892 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_d892;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_f2f2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_f2f2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_73e7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_73e7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_e615_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_3923_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_667f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_667f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_3923_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_667f_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_8519 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_8519_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l904_c6_0fbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_3923_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l925_c30_e615] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l925_c30_e615_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_e615_ins;
     sp_relative_shift_uxn_opcodes_h_l925_c30_e615_x <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_e615_x;
     sp_relative_shift_uxn_opcodes_h_l925_c30_e615_y <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_e615_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_e615_return_output := sp_relative_shift_uxn_opcodes_h_l925_c30_e615_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l923_c11_b6d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_a7cb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_a7cb_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l928_c21_0e41] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_left;
     BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_return_output := BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_d9e4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_d9e4_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_3923_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_3923_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l904_l923_l917_l920_DUPLICATE_defc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l904_l923_l917_l920_DUPLICATE_defc_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_d9d6 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_d9d6_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_3923_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l917_c11_0156] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_left;
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_return_output := BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l920_c11_220c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_left;
     BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_return_output := BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_return_output;

     -- Submodule level 1
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_0e41_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_3923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_3923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_0fbe_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_27a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0156_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_667f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_667f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_220c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_d7cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_b6d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_a7cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_a7cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_a7cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_8519_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_8519_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_8519_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_d9e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_d9e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l923_l917_l920_DUPLICATE_d9e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_d9d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_d9d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l904_l923_l917_l920_DUPLICATE_defc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l904_l923_l917_l920_DUPLICATE_defc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l904_l923_l917_l920_DUPLICATE_defc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l904_l923_l917_l920_DUPLICATE_defc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_3923_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_3923_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_3923_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_3923_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_e615_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output;

     -- t8_MUX[uxn_opcodes_h_l920_c7_667f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l920_c7_667f_cond <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_667f_cond;
     t8_MUX_uxn_opcodes_h_l920_c7_667f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_667f_iftrue;
     t8_MUX_uxn_opcodes_h_l920_c7_667f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_667f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_667f_return_output := t8_MUX_uxn_opcodes_h_l920_c7_667f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_return_output;

     -- n8_MUX[uxn_opcodes_h_l923_c7_d7cd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l923_c7_d7cd_cond <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_d7cd_cond;
     n8_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue;
     n8_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output := n8_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_d7cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l923_c7_d7cd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output := result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_d7cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_d7cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_d7cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_667f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_d7cd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l920_c7_667f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l920_c7_667f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_return_output := result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l920_c7_667f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l920_c7_667f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l920_c7_667f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_return_output;

     -- n8_MUX[uxn_opcodes_h_l920_c7_667f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l920_c7_667f_cond <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_667f_cond;
     n8_MUX_uxn_opcodes_h_l920_c7_667f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_667f_iftrue;
     n8_MUX_uxn_opcodes_h_l920_c7_667f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_667f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_667f_return_output := n8_MUX_uxn_opcodes_h_l920_c7_667f_return_output;

     -- t8_MUX[uxn_opcodes_h_l917_c7_27a2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l917_c7_27a2_cond <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_27a2_cond;
     t8_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue;
     t8_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_27a2_return_output := t8_MUX_uxn_opcodes_h_l917_c7_27a2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l920_c7_667f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l920_c7_667f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_667f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_667f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_667f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_667f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_667f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_3923_iffalse := VAR_t8_MUX_uxn_opcodes_h_l917_c7_27a2_return_output;
     -- t8_MUX[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l904_c2_3923_cond <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_3923_cond;
     t8_MUX_uxn_opcodes_h_l904_c2_3923_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_3923_iftrue;
     t8_MUX_uxn_opcodes_h_l904_c2_3923_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_3923_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_3923_return_output := t8_MUX_uxn_opcodes_h_l904_c2_3923_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_27a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_27a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l917_c7_27a2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_return_output := result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_return_output;

     -- n8_MUX[uxn_opcodes_h_l917_c7_27a2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l917_c7_27a2_cond <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_27a2_cond;
     n8_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue;
     n8_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_27a2_return_output := n8_MUX_uxn_opcodes_h_l917_c7_27a2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_27a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_27a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_3923_iffalse := VAR_n8_MUX_uxn_opcodes_h_l917_c7_27a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_27a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_27a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_27a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_27a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_27a2_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l904_c2_3923_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_return_output;

     -- n8_MUX[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l904_c2_3923_cond <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_3923_cond;
     n8_MUX_uxn_opcodes_h_l904_c2_3923_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_3923_iftrue;
     n8_MUX_uxn_opcodes_h_l904_c2_3923_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_3923_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_3923_return_output := n8_MUX_uxn_opcodes_h_l904_c2_3923_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l904_c2_3923] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_cond;
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_return_output := result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l904_c2_3923_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l932_l900_DUPLICATE_e9bf LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l932_l900_DUPLICATE_e9bf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_3923_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_3923_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l932_l900_DUPLICATE_e9bf_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l932_l900_DUPLICATE_e9bf_return_output;
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
