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
-- BIN_OP_EQ[uxn_opcodes_h_l818_c6_5b5e]
signal BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l818_c2_3459]
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c2_3459]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c2_3459]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l818_c2_3459]
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c2_3459]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c2_3459]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l818_c2_3459]
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l818_c2_3459]
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l818_c2_3459]
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l818_c2_3459]
signal n8_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l818_c2_3459]
signal t8_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l831_c11_4de8]
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l831_c7_dc8d]
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l831_c7_dc8d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l831_c7_dc8d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l831_c7_dc8d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l831_c7_dc8d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l831_c7_dc8d]
signal n8_MUX_uxn_opcodes_h_l831_c7_dc8d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l831_c7_dc8d]
signal t8_MUX_uxn_opcodes_h_l831_c7_dc8d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l834_c11_b31d]
signal BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l834_c7_8059]
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l834_c7_8059]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l834_c7_8059]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l834_c7_8059]
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l834_c7_8059]
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l834_c7_8059]
signal n8_MUX_uxn_opcodes_h_l834_c7_8059_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l834_c7_8059_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l834_c7_8059_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l834_c7_8059_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l834_c7_8059]
signal t8_MUX_uxn_opcodes_h_l834_c7_8059_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l834_c7_8059_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l834_c7_8059_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l834_c7_8059_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l837_c11_f9a5]
signal BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l837_c7_f412]
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l837_c7_f412]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l837_c7_f412]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l837_c7_f412]
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l837_c7_f412]
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l837_c7_f412]
signal n8_MUX_uxn_opcodes_h_l837_c7_f412_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c7_f412_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c7_f412_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c7_f412_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l839_c30_4cb5]
signal sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l842_c21_969b]
signal BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_922a( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e
BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_left,
BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_right,
BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459
result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_cond,
result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output);

-- n8_MUX_uxn_opcodes_h_l818_c2_3459
n8_MUX_uxn_opcodes_h_l818_c2_3459 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l818_c2_3459_cond,
n8_MUX_uxn_opcodes_h_l818_c2_3459_iftrue,
n8_MUX_uxn_opcodes_h_l818_c2_3459_iffalse,
n8_MUX_uxn_opcodes_h_l818_c2_3459_return_output);

-- t8_MUX_uxn_opcodes_h_l818_c2_3459
t8_MUX_uxn_opcodes_h_l818_c2_3459 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l818_c2_3459_cond,
t8_MUX_uxn_opcodes_h_l818_c2_3459_iftrue,
t8_MUX_uxn_opcodes_h_l818_c2_3459_iffalse,
t8_MUX_uxn_opcodes_h_l818_c2_3459_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8
BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_left,
BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_right,
BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d
result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_cond,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output);

-- n8_MUX_uxn_opcodes_h_l831_c7_dc8d
n8_MUX_uxn_opcodes_h_l831_c7_dc8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l831_c7_dc8d_cond,
n8_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue,
n8_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse,
n8_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output);

-- t8_MUX_uxn_opcodes_h_l831_c7_dc8d
t8_MUX_uxn_opcodes_h_l831_c7_dc8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l831_c7_dc8d_cond,
t8_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue,
t8_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse,
t8_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d
BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_left,
BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_right,
BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059
result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_cond,
result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_return_output);

-- n8_MUX_uxn_opcodes_h_l834_c7_8059
n8_MUX_uxn_opcodes_h_l834_c7_8059 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l834_c7_8059_cond,
n8_MUX_uxn_opcodes_h_l834_c7_8059_iftrue,
n8_MUX_uxn_opcodes_h_l834_c7_8059_iffalse,
n8_MUX_uxn_opcodes_h_l834_c7_8059_return_output);

-- t8_MUX_uxn_opcodes_h_l834_c7_8059
t8_MUX_uxn_opcodes_h_l834_c7_8059 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l834_c7_8059_cond,
t8_MUX_uxn_opcodes_h_l834_c7_8059_iftrue,
t8_MUX_uxn_opcodes_h_l834_c7_8059_iffalse,
t8_MUX_uxn_opcodes_h_l834_c7_8059_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5
BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_left,
BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_right,
BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412
result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_cond,
result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_return_output);

-- n8_MUX_uxn_opcodes_h_l837_c7_f412
n8_MUX_uxn_opcodes_h_l837_c7_f412 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l837_c7_f412_cond,
n8_MUX_uxn_opcodes_h_l837_c7_f412_iftrue,
n8_MUX_uxn_opcodes_h_l837_c7_f412_iffalse,
n8_MUX_uxn_opcodes_h_l837_c7_f412_return_output);

-- sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5
sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_ins,
sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_x,
sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_y,
sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_left,
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_right,
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
 n8_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
 t8_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output,
 n8_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output,
 t8_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_return_output,
 n8_MUX_uxn_opcodes_h_l834_c7_8059_return_output,
 t8_MUX_uxn_opcodes_h_l834_c7_8059_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_return_output,
 n8_MUX_uxn_opcodes_h_l837_c7_f412_return_output,
 sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_8f73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l823_c3_082e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_3459_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_3459_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_3459_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_3459_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_e6f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_8059_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_dc8d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_8059_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_dc8d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_8059_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_8059_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_f412_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_8059_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_8059_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_8059_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_8059_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l842_c3_dadf : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_b1cf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_f412_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_f412_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_f412_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l818_l831_l837_l834_DUPLICATE_d4b8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_2ab6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_9c00_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_2d1a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l837_l834_DUPLICATE_70cd_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l846_l814_DUPLICATE_a153_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l823_c3_082e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l823_c3_082e;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_e6f4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_e6f4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_b1cf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_b1cf;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_8f73 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_8f73;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_3459_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_8059_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_f412_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_f412_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_8059_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_3459_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_8059_iffalse := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l842_c21_969b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l818_c2_3459_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l831_c11_4de8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_left;
     BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_return_output := BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l818_c6_5b5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l818_c2_3459_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l839_c30_4cb5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_ins;
     sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_x;
     sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_return_output := sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l837_l834_DUPLICATE_70cd LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l837_l834_DUPLICATE_70cd_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l818_c2_3459_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l837_c11_f9a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l818_l831_l837_l834_DUPLICATE_d4b8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l818_l831_l837_l834_DUPLICATE_d4b8_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l834_c11_b31d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_left;
     BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_return_output := BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_2ab6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_2ab6_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l818_c2_3459_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_9c00 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_9c00_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_2d1a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_2d1a_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_3459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_3459_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_5b5e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_dc8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_dc8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_4de8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_8059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_8059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_b31d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_f412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_f9a5_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l842_c3_dadf := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_969b_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_2ab6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_2ab6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_2ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_9c00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_9c00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_9c00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_2d1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_2d1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l837_l834_DUPLICATE_2d1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l837_l834_DUPLICATE_70cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l837_l834_DUPLICATE_70cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l818_l831_l837_l834_DUPLICATE_d4b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l818_l831_l837_l834_DUPLICATE_d4b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l818_l831_l837_l834_DUPLICATE_d4b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l818_l831_l837_l834_DUPLICATE_d4b8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l818_c2_3459_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l818_c2_3459_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l818_c2_3459_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l818_c2_3459_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_4cb5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_iftrue := VAR_result_u8_value_uxn_opcodes_h_l842_c3_dadf;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l837_c7_f412] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_cond;
     result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_return_output := result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_return_output;

     -- t8_MUX[uxn_opcodes_h_l834_c7_8059] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l834_c7_8059_cond <= VAR_t8_MUX_uxn_opcodes_h_l834_c7_8059_cond;
     t8_MUX_uxn_opcodes_h_l834_c7_8059_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l834_c7_8059_iftrue;
     t8_MUX_uxn_opcodes_h_l834_c7_8059_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l834_c7_8059_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_8059_return_output := t8_MUX_uxn_opcodes_h_l834_c7_8059_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l837_c7_f412] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output;

     -- n8_MUX[uxn_opcodes_h_l837_c7_f412] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l837_c7_f412_cond <= VAR_n8_MUX_uxn_opcodes_h_l837_c7_f412_cond;
     n8_MUX_uxn_opcodes_h_l837_c7_f412_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l837_c7_f412_iftrue;
     n8_MUX_uxn_opcodes_h_l837_c7_f412_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l837_c7_f412_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_f412_return_output := n8_MUX_uxn_opcodes_h_l837_c7_f412_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l837_c7_f412] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l837_c7_f412] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l837_c7_f412] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_8059_iffalse := VAR_n8_MUX_uxn_opcodes_h_l837_c7_f412_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_f412_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_f412_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_f412_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_f412_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_f412_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l834_c7_8059_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l834_c7_8059] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_return_output;

     -- n8_MUX[uxn_opcodes_h_l834_c7_8059] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l834_c7_8059_cond <= VAR_n8_MUX_uxn_opcodes_h_l834_c7_8059_cond;
     n8_MUX_uxn_opcodes_h_l834_c7_8059_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l834_c7_8059_iftrue;
     n8_MUX_uxn_opcodes_h_l834_c7_8059_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l834_c7_8059_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_8059_return_output := n8_MUX_uxn_opcodes_h_l834_c7_8059_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l834_c7_8059] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l834_c7_8059] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l834_c7_8059] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_cond;
     result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_return_output := result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_return_output;

     -- t8_MUX[uxn_opcodes_h_l831_c7_dc8d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l831_c7_dc8d_cond <= VAR_t8_MUX_uxn_opcodes_h_l831_c7_dc8d_cond;
     t8_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue;
     t8_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output := t8_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l834_c7_8059] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l834_c7_8059_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8059_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8059_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8059_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8059_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8059_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_3459_iffalse := VAR_t8_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l831_c7_dc8d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l831_c7_dc8d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output;

     -- t8_MUX[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l818_c2_3459_cond <= VAR_t8_MUX_uxn_opcodes_h_l818_c2_3459_cond;
     t8_MUX_uxn_opcodes_h_l818_c2_3459_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l818_c2_3459_iftrue;
     t8_MUX_uxn_opcodes_h_l818_c2_3459_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l818_c2_3459_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_3459_return_output := t8_MUX_uxn_opcodes_h_l818_c2_3459_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l831_c7_dc8d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output;

     -- n8_MUX[uxn_opcodes_h_l831_c7_dc8d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l831_c7_dc8d_cond <= VAR_n8_MUX_uxn_opcodes_h_l831_c7_dc8d_cond;
     n8_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue;
     n8_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output := n8_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l831_c7_dc8d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output := result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l831_c7_dc8d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_3459_iffalse := VAR_n8_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_dc8d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l818_c2_3459_return_output;
     -- n8_MUX[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l818_c2_3459_cond <= VAR_n8_MUX_uxn_opcodes_h_l818_c2_3459_cond;
     n8_MUX_uxn_opcodes_h_l818_c2_3459_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l818_c2_3459_iftrue;
     n8_MUX_uxn_opcodes_h_l818_c2_3459_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l818_c2_3459_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_3459_return_output := n8_MUX_uxn_opcodes_h_l818_c2_3459_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_cond;
     result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_return_output := result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c2_3459] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l818_c2_3459_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l846_l814_DUPLICATE_a153 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l846_l814_DUPLICATE_a153_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_3459_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l846_l814_DUPLICATE_a153_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l846_l814_DUPLICATE_a153_return_output;
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
