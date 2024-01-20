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
-- BIN_OP_EQ[uxn_opcodes_h_l818_c6_1259]
signal BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l818_c2_8a5a]
signal n8_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l818_c2_8a5a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l818_c2_8a5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l818_c2_8a5a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c2_8a5a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l818_c2_8a5a]
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c2_8a5a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c2_8a5a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l818_c2_8a5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c2_8a5a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l818_c2_8a5a]
signal t8_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l831_c11_26b4]
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l831_c7_8c2d]
signal n8_MUX_uxn_opcodes_h_l831_c7_8c2d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l831_c7_8c2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l831_c7_8c2d]
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l831_c7_8c2d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l831_c7_8c2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l831_c7_8c2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l831_c7_8c2d]
signal t8_MUX_uxn_opcodes_h_l831_c7_8c2d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l834_c11_0a40]
signal BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l834_c7_f152]
signal n8_MUX_uxn_opcodes_h_l834_c7_f152_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l834_c7_f152_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l834_c7_f152_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l834_c7_f152_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l834_c7_f152]
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l834_c7_f152]
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l834_c7_f152]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l834_c7_f152]
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l834_c7_f152]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l834_c7_f152]
signal t8_MUX_uxn_opcodes_h_l834_c7_f152_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l834_c7_f152_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l834_c7_f152_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l834_c7_f152_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l837_c11_40dd]
signal BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l837_c7_dfa2]
signal n8_MUX_uxn_opcodes_h_l837_c7_dfa2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l837_c7_dfa2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l837_c7_dfa2]
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l837_c7_dfa2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l837_c7_dfa2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l837_c7_dfa2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l839_c30_cf6c]
signal sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l842_c21_fb3e]
signal BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259
BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_left,
BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_right,
BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output);

-- n8_MUX_uxn_opcodes_h_l818_c2_8a5a
n8_MUX_uxn_opcodes_h_l818_c2_8a5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l818_c2_8a5a_cond,
n8_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue,
n8_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse,
n8_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a
result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_cond,
result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output);

-- t8_MUX_uxn_opcodes_h_l818_c2_8a5a
t8_MUX_uxn_opcodes_h_l818_c2_8a5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l818_c2_8a5a_cond,
t8_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue,
t8_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse,
t8_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4
BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_left,
BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_right,
BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_return_output);

-- n8_MUX_uxn_opcodes_h_l831_c7_8c2d
n8_MUX_uxn_opcodes_h_l831_c7_8c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l831_c7_8c2d_cond,
n8_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue,
n8_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse,
n8_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d
result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_cond,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output);

-- t8_MUX_uxn_opcodes_h_l831_c7_8c2d
t8_MUX_uxn_opcodes_h_l831_c7_8c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l831_c7_8c2d_cond,
t8_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue,
t8_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse,
t8_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40
BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_left,
BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_right,
BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_return_output);

-- n8_MUX_uxn_opcodes_h_l834_c7_f152
n8_MUX_uxn_opcodes_h_l834_c7_f152 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l834_c7_f152_cond,
n8_MUX_uxn_opcodes_h_l834_c7_f152_iftrue,
n8_MUX_uxn_opcodes_h_l834_c7_f152_iffalse,
n8_MUX_uxn_opcodes_h_l834_c7_f152_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152
result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_cond,
result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_return_output);

-- t8_MUX_uxn_opcodes_h_l834_c7_f152
t8_MUX_uxn_opcodes_h_l834_c7_f152 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l834_c7_f152_cond,
t8_MUX_uxn_opcodes_h_l834_c7_f152_iftrue,
t8_MUX_uxn_opcodes_h_l834_c7_f152_iffalse,
t8_MUX_uxn_opcodes_h_l834_c7_f152_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd
BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_left,
BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_right,
BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_return_output);

-- n8_MUX_uxn_opcodes_h_l837_c7_dfa2
n8_MUX_uxn_opcodes_h_l837_c7_dfa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l837_c7_dfa2_cond,
n8_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue,
n8_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse,
n8_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2
result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_cond,
result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c
sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_ins,
sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_x,
sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_y,
sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_left,
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_right,
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output,
 n8_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
 t8_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_return_output,
 n8_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output,
 t8_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_return_output,
 n8_MUX_uxn_opcodes_h_l834_c7_f152_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_return_output,
 t8_MUX_uxn_opcodes_h_l834_c7_f152_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_return_output,
 n8_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output,
 sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l823_c3_f2a0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_c80a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_8a5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_f152_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_8c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_a6e0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_f152_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_8c2d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_f152_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_f152_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_f152_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_f152_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_f152_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_f152_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_dfa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l842_c3_01d3 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_328f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l818_l837_l831_l834_DUPLICATE_b682_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_8498_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_bb2a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_853e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l837_l834_DUPLICATE_065c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l846_l814_DUPLICATE_fc7a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_a6e0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_a6e0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_328f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_328f;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_c80a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_c80a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l823_c3_f2a0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l823_c3_f2a0;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_f152_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_f152_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_f152_iffalse := t8;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l818_c2_8a5a_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l818_c6_1259] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_left;
     BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output := BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l818_l837_l831_l834_DUPLICATE_b682 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l818_l837_l831_l834_DUPLICATE_b682_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l831_c11_26b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l818_c2_8a5a_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_bb2a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_bb2a_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l842_c21_fb3e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l837_l834_DUPLICATE_065c LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l837_l834_DUPLICATE_065c_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l818_c2_8a5a_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_8498 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_8498_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l837_c11_40dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_853e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_853e_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l818_c2_8a5a_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l839_c30_cf6c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_ins;
     sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_x;
     sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_return_output := sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l834_c11_0a40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_left;
     BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_return_output := BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_8a5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_8a5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_1259_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_8c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_8c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_26b4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_f152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_f152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0a40_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_dfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_40dd_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l842_c3_01d3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_fb3e_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_bb2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_bb2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_bb2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_853e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_853e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_853e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_8498_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_8498_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l837_l831_l834_DUPLICATE_8498_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l837_l834_DUPLICATE_065c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l837_l834_DUPLICATE_065c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l818_l837_l831_l834_DUPLICATE_b682_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l818_l837_l831_l834_DUPLICATE_b682_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l818_l837_l831_l834_DUPLICATE_b682_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l818_l837_l831_l834_DUPLICATE_b682_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l818_c2_8a5a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l818_c2_8a5a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l818_c2_8a5a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l818_c2_8a5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_cf6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue := VAR_result_u8_value_uxn_opcodes_h_l842_c3_01d3;
     -- n8_MUX[uxn_opcodes_h_l837_c7_dfa2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l837_c7_dfa2_cond <= VAR_n8_MUX_uxn_opcodes_h_l837_c7_dfa2_cond;
     n8_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue;
     n8_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output := n8_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l837_c7_dfa2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l837_c7_dfa2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l837_c7_dfa2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output := result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l837_c7_dfa2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l837_c7_dfa2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output;

     -- t8_MUX[uxn_opcodes_h_l834_c7_f152] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l834_c7_f152_cond <= VAR_t8_MUX_uxn_opcodes_h_l834_c7_f152_cond;
     t8_MUX_uxn_opcodes_h_l834_c7_f152_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l834_c7_f152_iftrue;
     t8_MUX_uxn_opcodes_h_l834_c7_f152_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l834_c7_f152_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_f152_return_output := t8_MUX_uxn_opcodes_h_l834_c7_f152_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_f152_iffalse := VAR_n8_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_dfa2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l834_c7_f152_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l834_c7_f152] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_return_output;

     -- n8_MUX[uxn_opcodes_h_l834_c7_f152] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l834_c7_f152_cond <= VAR_n8_MUX_uxn_opcodes_h_l834_c7_f152_cond;
     n8_MUX_uxn_opcodes_h_l834_c7_f152_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l834_c7_f152_iftrue;
     n8_MUX_uxn_opcodes_h_l834_c7_f152_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l834_c7_f152_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_f152_return_output := n8_MUX_uxn_opcodes_h_l834_c7_f152_return_output;

     -- t8_MUX[uxn_opcodes_h_l831_c7_8c2d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l831_c7_8c2d_cond <= VAR_t8_MUX_uxn_opcodes_h_l831_c7_8c2d_cond;
     t8_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue;
     t8_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output := t8_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l834_c7_f152] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l834_c7_f152] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l834_c7_f152] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_cond;
     result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_return_output := result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l834_c7_f152] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l834_c7_f152_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_f152_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_f152_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_f152_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_f152_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_f152_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l831_c7_8c2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l831_c7_8c2d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output := result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output;

     -- t8_MUX[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l818_c2_8a5a_cond <= VAR_t8_MUX_uxn_opcodes_h_l818_c2_8a5a_cond;
     t8_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue;
     t8_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output := t8_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l831_c7_8c2d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l831_c7_8c2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l831_c7_8c2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output;

     -- n8_MUX[uxn_opcodes_h_l831_c7_8c2d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l831_c7_8c2d_cond <= VAR_n8_MUX_uxn_opcodes_h_l831_c7_8c2d_cond;
     n8_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l831_c7_8c2d_iftrue;
     n8_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l831_c7_8c2d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output := n8_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_8c2d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output := result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output;

     -- n8_MUX[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l818_c2_8a5a_cond <= VAR_n8_MUX_uxn_opcodes_h_l818_c2_8a5a_cond;
     n8_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue;
     n8_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output := n8_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c2_8a5a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l846_l814_DUPLICATE_fc7a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l846_l814_DUPLICATE_fc7a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_8a5a_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l846_l814_DUPLICATE_fc7a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l846_l814_DUPLICATE_fc7a_return_output;
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
