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
-- BIN_OP_EQ[uxn_opcodes_h_l818_c6_4dea]
signal BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l818_c2_9bec]
signal n8_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l818_c2_9bec]
signal t8_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c2_9bec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l818_c2_9bec]
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l818_c2_9bec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l818_c2_9bec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c2_9bec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c2_9bec]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l818_c2_9bec]
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c2_9bec]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l818_c2_9bec]
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l831_c11_cf02]
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l831_c7_6376]
signal n8_MUX_uxn_opcodes_h_l831_c7_6376_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l831_c7_6376_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l831_c7_6376_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l831_c7_6376_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l831_c7_6376]
signal t8_MUX_uxn_opcodes_h_l831_c7_6376_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l831_c7_6376_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l831_c7_6376_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l831_c7_6376_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l831_c7_6376]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l831_c7_6376]
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l831_c7_6376]
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l831_c7_6376]
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l831_c7_6376]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l834_c11_235a]
signal BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l834_c7_4d33]
signal n8_MUX_uxn_opcodes_h_l834_c7_4d33_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l834_c7_4d33_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l834_c7_4d33]
signal t8_MUX_uxn_opcodes_h_l834_c7_4d33_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l834_c7_4d33_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l834_c7_4d33]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l834_c7_4d33]
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l834_c7_4d33]
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l834_c7_4d33]
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l834_c7_4d33]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l837_c11_b0be]
signal BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l837_c7_858e]
signal n8_MUX_uxn_opcodes_h_l837_c7_858e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c7_858e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c7_858e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c7_858e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l837_c7_858e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l837_c7_858e]
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l837_c7_858e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l837_c7_858e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l837_c7_858e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l839_c30_61ab]
signal sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l842_c21_987d]
signal BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_return_output : unsigned(8 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea
BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_left,
BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_right,
BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output);

-- n8_MUX_uxn_opcodes_h_l818_c2_9bec
n8_MUX_uxn_opcodes_h_l818_c2_9bec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l818_c2_9bec_cond,
n8_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue,
n8_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse,
n8_MUX_uxn_opcodes_h_l818_c2_9bec_return_output);

-- t8_MUX_uxn_opcodes_h_l818_c2_9bec
t8_MUX_uxn_opcodes_h_l818_c2_9bec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l818_c2_9bec_cond,
t8_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue,
t8_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse,
t8_MUX_uxn_opcodes_h_l818_c2_9bec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec
result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_cond,
result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02
BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_left,
BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_right,
BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_return_output);

-- n8_MUX_uxn_opcodes_h_l831_c7_6376
n8_MUX_uxn_opcodes_h_l831_c7_6376 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l831_c7_6376_cond,
n8_MUX_uxn_opcodes_h_l831_c7_6376_iftrue,
n8_MUX_uxn_opcodes_h_l831_c7_6376_iffalse,
n8_MUX_uxn_opcodes_h_l831_c7_6376_return_output);

-- t8_MUX_uxn_opcodes_h_l831_c7_6376
t8_MUX_uxn_opcodes_h_l831_c7_6376 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l831_c7_6376_cond,
t8_MUX_uxn_opcodes_h_l831_c7_6376_iftrue,
t8_MUX_uxn_opcodes_h_l831_c7_6376_iffalse,
t8_MUX_uxn_opcodes_h_l831_c7_6376_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376
result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_cond,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a
BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_left,
BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_right,
BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_return_output);

-- n8_MUX_uxn_opcodes_h_l834_c7_4d33
n8_MUX_uxn_opcodes_h_l834_c7_4d33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l834_c7_4d33_cond,
n8_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue,
n8_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse,
n8_MUX_uxn_opcodes_h_l834_c7_4d33_return_output);

-- t8_MUX_uxn_opcodes_h_l834_c7_4d33
t8_MUX_uxn_opcodes_h_l834_c7_4d33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l834_c7_4d33_cond,
t8_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue,
t8_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse,
t8_MUX_uxn_opcodes_h_l834_c7_4d33_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33
result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_cond,
result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be
BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_left,
BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_right,
BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_return_output);

-- n8_MUX_uxn_opcodes_h_l837_c7_858e
n8_MUX_uxn_opcodes_h_l837_c7_858e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l837_c7_858e_cond,
n8_MUX_uxn_opcodes_h_l837_c7_858e_iftrue,
n8_MUX_uxn_opcodes_h_l837_c7_858e_iffalse,
n8_MUX_uxn_opcodes_h_l837_c7_858e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e
result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_cond,
result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l839_c30_61ab
sp_relative_shift_uxn_opcodes_h_l839_c30_61ab : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_ins,
sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_x,
sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_y,
sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_left,
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_right,
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output,
 n8_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
 t8_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_return_output,
 n8_MUX_uxn_opcodes_h_l831_c7_6376_return_output,
 t8_MUX_uxn_opcodes_h_l831_c7_6376_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_return_output,
 n8_MUX_uxn_opcodes_h_l834_c7_4d33_return_output,
 t8_MUX_uxn_opcodes_h_l834_c7_4d33_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_return_output,
 n8_MUX_uxn_opcodes_h_l837_c7_858e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_return_output,
 sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_6376_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_6376_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l823_c3_0b53 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_f6af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_6376_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_6376_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_4d33_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_6376_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_6376_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_6376_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_4d33_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_6376_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_9d91 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_858e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_4d33_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_4d33_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_858e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_858e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_858e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l842_c3_6191 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_f3a8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l831_l834_l837_l818_DUPLICATE_34ef_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_3177_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_864f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_6609_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l834_l837_DUPLICATE_9305_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l814_l846_DUPLICATE_013f_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_9d91 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_9d91;
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_y := resize(to_signed(-1, 2), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l823_c3_0b53 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l823_c3_0b53;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_f3a8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_f3a8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_f6af := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_f6af;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_6376_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_858e_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_858e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_6376_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l831_l834_l837_l818_DUPLICATE_34ef LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l831_l834_l837_l818_DUPLICATE_34ef_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l837_c11_b0be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_left;
     BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_return_output := BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l818_c2_9bec_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l818_c2_9bec_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l839_c30_61ab] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_ins;
     sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_x <= VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_x;
     sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_y <= VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_return_output := sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l818_c2_9bec_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l818_c6_4dea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_left;
     BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output := BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l818_c2_9bec_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_3177 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_3177_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l831_c11_cf02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_left;
     BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_return_output := BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l834_c11_235a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_left;
     BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_return_output := BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l834_l837_DUPLICATE_9305 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l834_l837_DUPLICATE_9305_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_6609 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_6609_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_864f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_864f_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l842_c21_987d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_4dea_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_6376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_6376_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_cf02_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_4d33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_4d33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_235a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_858e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_b0be_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l842_c3_6191 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_987d_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_3177_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_3177_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_3177_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_6609_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_6609_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_6609_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_864f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_864f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_864f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l834_l837_DUPLICATE_9305_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l834_l837_DUPLICATE_9305_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l831_l834_l837_l818_DUPLICATE_34ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l831_l834_l837_l818_DUPLICATE_34ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l831_l834_l837_l818_DUPLICATE_34ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l831_l834_l837_l818_DUPLICATE_34ef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l818_c2_9bec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l818_c2_9bec_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l818_c2_9bec_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l818_c2_9bec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_61ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_iftrue := VAR_result_u8_value_uxn_opcodes_h_l842_c3_6191;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l837_c7_858e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_return_output;

     -- t8_MUX[uxn_opcodes_h_l834_c7_4d33] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l834_c7_4d33_cond <= VAR_t8_MUX_uxn_opcodes_h_l834_c7_4d33_cond;
     t8_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue;
     t8_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_4d33_return_output := t8_MUX_uxn_opcodes_h_l834_c7_4d33_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l837_c7_858e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_return_output := result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output;

     -- n8_MUX[uxn_opcodes_h_l837_c7_858e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l837_c7_858e_cond <= VAR_n8_MUX_uxn_opcodes_h_l837_c7_858e_cond;
     n8_MUX_uxn_opcodes_h_l837_c7_858e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l837_c7_858e_iftrue;
     n8_MUX_uxn_opcodes_h_l837_c7_858e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l837_c7_858e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_858e_return_output := n8_MUX_uxn_opcodes_h_l837_c7_858e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l837_c7_858e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l837_c7_858e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l837_c7_858e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse := VAR_n8_MUX_uxn_opcodes_h_l837_c7_858e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_858e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_858e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_858e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_858e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_858e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_6376_iffalse := VAR_t8_MUX_uxn_opcodes_h_l834_c7_4d33_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l834_c7_4d33] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l834_c7_4d33] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_cond;
     result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_return_output := result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_return_output;

     -- n8_MUX[uxn_opcodes_h_l834_c7_4d33] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l834_c7_4d33_cond <= VAR_n8_MUX_uxn_opcodes_h_l834_c7_4d33_cond;
     n8_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue;
     n8_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_4d33_return_output := n8_MUX_uxn_opcodes_h_l834_c7_4d33_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l834_c7_4d33] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l834_c7_4d33] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l834_c7_4d33] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_return_output;

     -- t8_MUX[uxn_opcodes_h_l831_c7_6376] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l831_c7_6376_cond <= VAR_t8_MUX_uxn_opcodes_h_l831_c7_6376_cond;
     t8_MUX_uxn_opcodes_h_l831_c7_6376_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l831_c7_6376_iftrue;
     t8_MUX_uxn_opcodes_h_l831_c7_6376_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l831_c7_6376_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_6376_return_output := t8_MUX_uxn_opcodes_h_l831_c7_6376_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_6376_iffalse := VAR_n8_MUX_uxn_opcodes_h_l834_c7_4d33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_4d33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_4d33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_4d33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_4d33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_4d33_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse := VAR_t8_MUX_uxn_opcodes_h_l831_c7_6376_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l831_c7_6376] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_cond;
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_return_output := result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l831_c7_6376] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l831_c7_6376] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_return_output;

     -- n8_MUX[uxn_opcodes_h_l831_c7_6376] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l831_c7_6376_cond <= VAR_n8_MUX_uxn_opcodes_h_l831_c7_6376_cond;
     n8_MUX_uxn_opcodes_h_l831_c7_6376_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l831_c7_6376_iftrue;
     n8_MUX_uxn_opcodes_h_l831_c7_6376_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l831_c7_6376_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_6376_return_output := n8_MUX_uxn_opcodes_h_l831_c7_6376_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l831_c7_6376] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l831_c7_6376] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_return_output;

     -- t8_MUX[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l818_c2_9bec_cond <= VAR_t8_MUX_uxn_opcodes_h_l818_c2_9bec_cond;
     t8_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue;
     t8_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_9bec_return_output := t8_MUX_uxn_opcodes_h_l818_c2_9bec_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse := VAR_n8_MUX_uxn_opcodes_h_l831_c7_6376_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_6376_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_6376_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_6376_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_6376_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_6376_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l818_c2_9bec_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_return_output;

     -- n8_MUX[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l818_c2_9bec_cond <= VAR_n8_MUX_uxn_opcodes_h_l818_c2_9bec_cond;
     n8_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue;
     n8_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_9bec_return_output := n8_MUX_uxn_opcodes_h_l818_c2_9bec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_return_output := result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l818_c2_9bec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l818_c2_9bec_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l814_l846_DUPLICATE_013f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l814_l846_DUPLICATE_013f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_9bec_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_9bec_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l814_l846_DUPLICATE_013f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l814_l846_DUPLICATE_013f_return_output;
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
