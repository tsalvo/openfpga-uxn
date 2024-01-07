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
-- BIN_OP_EQ[uxn_opcodes_h_l818_c6_0cf3]
signal BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c2_6aa7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l818_c2_6aa7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l818_c2_6aa7]
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l818_c2_6aa7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c2_6aa7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l818_c2_6aa7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c2_6aa7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c2_6aa7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l818_c2_6aa7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l818_c2_6aa7]
signal n8_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l818_c2_6aa7]
signal t8_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l831_c11_3bcb]
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l831_c7_13b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l831_c7_13b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l831_c7_13b1]
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l831_c7_13b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l831_c7_13b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l831_c7_13b1]
signal n8_MUX_uxn_opcodes_h_l831_c7_13b1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l831_c7_13b1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l831_c7_13b1]
signal t8_MUX_uxn_opcodes_h_l831_c7_13b1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l831_c7_13b1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l834_c11_0d4f]
signal BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l834_c7_8fdd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l834_c7_8fdd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l834_c7_8fdd]
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l834_c7_8fdd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l834_c7_8fdd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l834_c7_8fdd]
signal n8_MUX_uxn_opcodes_h_l834_c7_8fdd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l834_c7_8fdd]
signal t8_MUX_uxn_opcodes_h_l834_c7_8fdd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l837_c11_314a]
signal BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l837_c7_d372]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l837_c7_d372]
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l837_c7_d372]
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l837_c7_d372]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l837_c7_d372]
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l837_c7_d372]
signal n8_MUX_uxn_opcodes_h_l837_c7_d372_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c7_d372_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c7_d372_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l837_c7_d372_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l839_c30_bf28]
signal sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l842_c21_346a]
signal BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_return_output : unsigned(8 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3
BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_left,
BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_right,
BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7
result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_cond,
result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output);

-- n8_MUX_uxn_opcodes_h_l818_c2_6aa7
n8_MUX_uxn_opcodes_h_l818_c2_6aa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l818_c2_6aa7_cond,
n8_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue,
n8_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse,
n8_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output);

-- t8_MUX_uxn_opcodes_h_l818_c2_6aa7
t8_MUX_uxn_opcodes_h_l818_c2_6aa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l818_c2_6aa7_cond,
t8_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue,
t8_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse,
t8_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb
BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_left,
BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_right,
BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1
result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_cond,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_return_output);

-- n8_MUX_uxn_opcodes_h_l831_c7_13b1
n8_MUX_uxn_opcodes_h_l831_c7_13b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l831_c7_13b1_cond,
n8_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue,
n8_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse,
n8_MUX_uxn_opcodes_h_l831_c7_13b1_return_output);

-- t8_MUX_uxn_opcodes_h_l831_c7_13b1
t8_MUX_uxn_opcodes_h_l831_c7_13b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l831_c7_13b1_cond,
t8_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue,
t8_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse,
t8_MUX_uxn_opcodes_h_l831_c7_13b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f
BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_left,
BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_right,
BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd
result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_cond,
result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output);

-- n8_MUX_uxn_opcodes_h_l834_c7_8fdd
n8_MUX_uxn_opcodes_h_l834_c7_8fdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l834_c7_8fdd_cond,
n8_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue,
n8_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse,
n8_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output);

-- t8_MUX_uxn_opcodes_h_l834_c7_8fdd
t8_MUX_uxn_opcodes_h_l834_c7_8fdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l834_c7_8fdd_cond,
t8_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue,
t8_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse,
t8_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a
BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_left,
BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_right,
BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372
result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_cond,
result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_return_output);

-- n8_MUX_uxn_opcodes_h_l837_c7_d372
n8_MUX_uxn_opcodes_h_l837_c7_d372 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l837_c7_d372_cond,
n8_MUX_uxn_opcodes_h_l837_c7_d372_iftrue,
n8_MUX_uxn_opcodes_h_l837_c7_d372_iffalse,
n8_MUX_uxn_opcodes_h_l837_c7_d372_return_output);

-- sp_relative_shift_uxn_opcodes_h_l839_c30_bf28
sp_relative_shift_uxn_opcodes_h_l839_c30_bf28 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_ins,
sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_x,
sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_y,
sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_left,
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_right,
BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
 n8_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
 t8_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_return_output,
 n8_MUX_uxn_opcodes_h_l831_c7_13b1_return_output,
 t8_MUX_uxn_opcodes_h_l831_c7_13b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output,
 n8_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output,
 t8_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_return_output,
 n8_MUX_uxn_opcodes_h_l837_c7_d372_return_output,
 sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l823_c3_b522 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_c872 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_13b1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_13b1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c2_6aa7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_1fb5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l831_c7_13b1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l831_c7_13b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_d372_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l834_c7_8fdd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l834_c7_8fdd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l842_c3_7dd2 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_2b48 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_d372_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_d372_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l837_c7_d372_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l831_l834_l837_l818_DUPLICATE_5375_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_2fa9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_6be6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_5d34_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l834_l837_DUPLICATE_90d6_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l846_l814_DUPLICATE_f857_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_2b48 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_2b48;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_c872 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_c872;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l823_c3_b522 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l823_c3_b522;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_1fb5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l832_c3_1fb5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_d372_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_d372_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_5d34 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_5d34_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l839_c30_bf28] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_ins;
     sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_x <= VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_x;
     sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_y <= VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_return_output := sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l818_c2_6aa7_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l818_c2_6aa7_return_output := result.is_stack_index_flipped;

     -- BIN_OP_PLUS[uxn_opcodes_h_l842_c21_346a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_2fa9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_2fa9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l831_c11_3bcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l818_c2_6aa7_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l834_l837_DUPLICATE_90d6 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l834_l837_DUPLICATE_90d6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l834_c11_0d4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l818_c6_0cf3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_left;
     BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output := BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l837_c11_314a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_left;
     BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_return_output := BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l818_c2_6aa7_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l831_l834_l837_l818_DUPLICATE_5375 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l831_l834_l837_l818_DUPLICATE_5375_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_6be6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_6be6_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_6aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_6aa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c6_0cf3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_13b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_13b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l831_c11_3bcb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_8fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_8fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l834_c11_0d4f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_d372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l837_c11_314a_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l842_c3_7dd2 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l842_c21_346a_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_2fa9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_2fa9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_2fa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_5d34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_5d34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_5d34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_6be6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_6be6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l831_l834_l837_DUPLICATE_6be6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l834_l837_DUPLICATE_90d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l834_l837_DUPLICATE_90d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l831_l834_l837_l818_DUPLICATE_5375_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l831_l834_l837_l818_DUPLICATE_5375_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l831_l834_l837_l818_DUPLICATE_5375_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l831_l834_l837_l818_DUPLICATE_5375_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l818_c2_6aa7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l818_c2_6aa7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l818_c2_6aa7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l818_c2_6aa7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l839_c30_bf28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_iftrue := VAR_result_u8_value_uxn_opcodes_h_l842_c3_7dd2;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l837_c7_d372] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_return_output;

     -- n8_MUX[uxn_opcodes_h_l837_c7_d372] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l837_c7_d372_cond <= VAR_n8_MUX_uxn_opcodes_h_l837_c7_d372_cond;
     n8_MUX_uxn_opcodes_h_l837_c7_d372_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l837_c7_d372_iftrue;
     n8_MUX_uxn_opcodes_h_l837_c7_d372_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l837_c7_d372_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l837_c7_d372_return_output := n8_MUX_uxn_opcodes_h_l837_c7_d372_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l837_c7_d372] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l837_c7_d372] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_cond;
     result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_return_output := result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l837_c7_d372] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output;

     -- t8_MUX[uxn_opcodes_h_l834_c7_8fdd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l834_c7_8fdd_cond <= VAR_t8_MUX_uxn_opcodes_h_l834_c7_8fdd_cond;
     t8_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue;
     t8_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output := t8_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l837_c7_d372] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l837_c7_d372_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l837_c7_d372_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l837_c7_d372_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l837_c7_d372_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l837_c7_d372_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l837_c7_d372_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l834_c7_8fdd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output;

     -- t8_MUX[uxn_opcodes_h_l831_c7_13b1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l831_c7_13b1_cond <= VAR_t8_MUX_uxn_opcodes_h_l831_c7_13b1_cond;
     t8_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue;
     t8_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l831_c7_13b1_return_output := t8_MUX_uxn_opcodes_h_l831_c7_13b1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l834_c7_8fdd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output := result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l834_c7_8fdd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l834_c7_8fdd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l834_c7_8fdd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output;

     -- n8_MUX[uxn_opcodes_h_l834_c7_8fdd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l834_c7_8fdd_cond <= VAR_n8_MUX_uxn_opcodes_h_l834_c7_8fdd_cond;
     n8_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l834_c7_8fdd_iftrue;
     n8_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l834_c7_8fdd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output := n8_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l834_c7_8fdd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l831_c7_13b1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l831_c7_13b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_return_output;

     -- t8_MUX[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l818_c2_6aa7_cond <= VAR_t8_MUX_uxn_opcodes_h_l818_c2_6aa7_cond;
     t8_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue;
     t8_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output := t8_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l831_c7_13b1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_return_output := result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_return_output;

     -- n8_MUX[uxn_opcodes_h_l831_c7_13b1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l831_c7_13b1_cond <= VAR_n8_MUX_uxn_opcodes_h_l831_c7_13b1_cond;
     n8_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue;
     n8_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l831_c7_13b1_return_output := n8_MUX_uxn_opcodes_h_l831_c7_13b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l831_c7_13b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l831_c7_13b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l831_c7_13b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l831_c7_13b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l831_c7_13b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l831_c7_13b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l831_c7_13b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l831_c7_13b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l831_c7_13b1_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output;

     -- n8_MUX[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l818_c2_6aa7_cond <= VAR_n8_MUX_uxn_opcodes_h_l818_c2_6aa7_cond;
     n8_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue;
     n8_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output := n8_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output := result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l818_c2_6aa7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l846_l814_DUPLICATE_f857 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l846_l814_DUPLICATE_f857_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c2_6aa7_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l846_l814_DUPLICATE_f857_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l846_l814_DUPLICATE_f857_return_output;
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
