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
-- BIN_OP_EQ[uxn_opcodes_h_l904_c6_1edc]
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l904_c2_5763]
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l904_c2_5763]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c2_5763]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l904_c2_5763]
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c2_5763]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l904_c2_5763]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l904_c2_5763]
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l904_c2_5763]
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l904_c2_5763]
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l904_c2_5763]
signal n8_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l904_c2_5763]
signal t8_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l917_c11_0fbf]
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l917_c7_1f6c]
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_1f6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_1f6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_1f6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_1f6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l917_c7_1f6c]
signal n8_MUX_uxn_opcodes_h_l917_c7_1f6c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l917_c7_1f6c]
signal t8_MUX_uxn_opcodes_h_l917_c7_1f6c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l920_c11_e297]
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l920_c7_f9ae]
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l920_c7_f9ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l920_c7_f9ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l920_c7_f9ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l920_c7_f9ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l920_c7_f9ae]
signal n8_MUX_uxn_opcodes_h_l920_c7_f9ae_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l920_c7_f9ae]
signal t8_MUX_uxn_opcodes_h_l920_c7_f9ae_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l923_c11_3dac]
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l923_c7_21c3]
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_21c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_21c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_21c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_21c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l923_c7_21c3]
signal n8_MUX_uxn_opcodes_h_l923_c7_21c3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l923_c7_21c3_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l925_c30_bb38]
signal sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l928_c21_827e]
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc
BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_left,
BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_right,
BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763
result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_cond,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output);

-- n8_MUX_uxn_opcodes_h_l904_c2_5763
n8_MUX_uxn_opcodes_h_l904_c2_5763 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l904_c2_5763_cond,
n8_MUX_uxn_opcodes_h_l904_c2_5763_iftrue,
n8_MUX_uxn_opcodes_h_l904_c2_5763_iffalse,
n8_MUX_uxn_opcodes_h_l904_c2_5763_return_output);

-- t8_MUX_uxn_opcodes_h_l904_c2_5763
t8_MUX_uxn_opcodes_h_l904_c2_5763 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l904_c2_5763_cond,
t8_MUX_uxn_opcodes_h_l904_c2_5763_iftrue,
t8_MUX_uxn_opcodes_h_l904_c2_5763_iffalse,
t8_MUX_uxn_opcodes_h_l904_c2_5763_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf
BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_left,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_right,
BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c
result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_cond,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output);

-- n8_MUX_uxn_opcodes_h_l917_c7_1f6c
n8_MUX_uxn_opcodes_h_l917_c7_1f6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l917_c7_1f6c_cond,
n8_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue,
n8_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse,
n8_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output);

-- t8_MUX_uxn_opcodes_h_l917_c7_1f6c
t8_MUX_uxn_opcodes_h_l917_c7_1f6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l917_c7_1f6c_cond,
t8_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue,
t8_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse,
t8_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297
BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_left,
BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_right,
BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae
result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_cond,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output);

-- n8_MUX_uxn_opcodes_h_l920_c7_f9ae
n8_MUX_uxn_opcodes_h_l920_c7_f9ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l920_c7_f9ae_cond,
n8_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue,
n8_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse,
n8_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output);

-- t8_MUX_uxn_opcodes_h_l920_c7_f9ae
t8_MUX_uxn_opcodes_h_l920_c7_f9ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l920_c7_f9ae_cond,
t8_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue,
t8_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse,
t8_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac
BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_left,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_right,
BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3
result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_cond,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_return_output);

-- n8_MUX_uxn_opcodes_h_l923_c7_21c3
n8_MUX_uxn_opcodes_h_l923_c7_21c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l923_c7_21c3_cond,
n8_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue,
n8_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse,
n8_MUX_uxn_opcodes_h_l923_c7_21c3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l925_c30_bb38
sp_relative_shift_uxn_opcodes_h_l925_c30_bb38 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_ins,
sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_x,
sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_y,
sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l928_c21_827e
BIN_OP_AND_uxn_opcodes_h_l928_c21_827e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_left,
BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_right,
BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
 n8_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
 t8_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output,
 n8_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output,
 t8_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output,
 n8_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output,
 t8_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_return_output,
 n8_MUX_uxn_opcodes_h_l923_c7_21c3_return_output,
 sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_return_output,
 BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_51fc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_368e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_5763_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_5763_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_5763_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l904_c2_5763_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_d5ed : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l917_c7_1f6c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l917_c7_1f6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_21c3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l920_c7_f9ae_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l920_c7_f9ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_670b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l923_c7_21c3_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l923_l904_l920_DUPLICATE_a70b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_73fb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_5c28_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_a920_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_9764_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l932_l900_DUPLICATE_e0a1_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_670b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l927_c3_670b;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_51fc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l914_c3_51fc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_d5ed := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l918_c3_d5ed;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_368e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l909_c3_368e;
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_5763_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_5763_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l923_l904_l920_DUPLICATE_a70b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l923_l904_l920_DUPLICATE_a70b_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_73fb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_73fb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l904_c6_1edc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_left;
     BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output := BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_5763_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l920_c11_e297] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_left;
     BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_return_output := BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l928_c21_827e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_left;
     BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_return_output := BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l917_c11_0fbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_5763_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l925_c30_bb38] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_ins;
     sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_x <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_x;
     sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_y <= VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_return_output := sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_9764 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_9764_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_5763_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_5c28 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_5c28_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_a920 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_a920_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_5763_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l923_c11_3dac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_left;
     BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_return_output := BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_return_output;

     -- Submodule level 1
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l928_c21_827e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_5763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c6_1edc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_1f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_1f6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l917_c11_0fbf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_f9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_f9ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c11_e297_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_21c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l923_c11_3dac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_73fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_73fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_73fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_5c28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_5c28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_5c28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_a920_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_a920_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l917_l923_l920_DUPLICATE_a920_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_9764_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l923_l920_DUPLICATE_9764_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l923_l904_l920_DUPLICATE_a70b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l923_l904_l920_DUPLICATE_a70b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l923_l904_l920_DUPLICATE_a70b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l917_l923_l904_l920_DUPLICATE_a70b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l904_c2_5763_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l904_c2_5763_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l904_c2_5763_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l904_c2_5763_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l925_c30_bb38_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l923_c7_21c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l923_c7_21c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_return_output := result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l923_c7_21c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output;

     -- n8_MUX[uxn_opcodes_h_l923_c7_21c3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l923_c7_21c3_cond <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_21c3_cond;
     n8_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue;
     n8_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l923_c7_21c3_return_output := n8_MUX_uxn_opcodes_h_l923_c7_21c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l923_c7_21c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l923_c7_21c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_return_output;

     -- t8_MUX[uxn_opcodes_h_l920_c7_f9ae] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l920_c7_f9ae_cond <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_f9ae_cond;
     t8_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue;
     t8_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output := t8_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse := VAR_n8_MUX_uxn_opcodes_h_l923_c7_21c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l923_c7_21c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l923_c7_21c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l923_c7_21c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l923_c7_21c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l923_c7_21c3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l920_c7_f9ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l920_c7_f9ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l920_c7_f9ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l920_c7_f9ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output := result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output;

     -- n8_MUX[uxn_opcodes_h_l920_c7_f9ae] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l920_c7_f9ae_cond <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_f9ae_cond;
     n8_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue;
     n8_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output := n8_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l920_c7_f9ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output;

     -- t8_MUX[uxn_opcodes_h_l917_c7_1f6c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l917_c7_1f6c_cond <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_1f6c_cond;
     t8_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue;
     t8_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output := t8_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l920_c7_f9ae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_5763_iffalse := VAR_t8_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output;
     -- t8_MUX[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l904_c2_5763_cond <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_5763_cond;
     t8_MUX_uxn_opcodes_h_l904_c2_5763_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_5763_iftrue;
     t8_MUX_uxn_opcodes_h_l904_c2_5763_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l904_c2_5763_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l904_c2_5763_return_output := t8_MUX_uxn_opcodes_h_l904_c2_5763_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l917_c7_1f6c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output := result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l917_c7_1f6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l917_c7_1f6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output;

     -- n8_MUX[uxn_opcodes_h_l917_c7_1f6c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l917_c7_1f6c_cond <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_1f6c_cond;
     n8_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue;
     n8_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output := n8_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l917_c7_1f6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l917_c7_1f6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_5763_iffalse := VAR_n8_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l917_c7_1f6c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l904_c2_5763_return_output;
     -- n8_MUX[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l904_c2_5763_cond <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_5763_cond;
     n8_MUX_uxn_opcodes_h_l904_c2_5763_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_5763_iftrue;
     n8_MUX_uxn_opcodes_h_l904_c2_5763_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l904_c2_5763_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l904_c2_5763_return_output := n8_MUX_uxn_opcodes_h_l904_c2_5763_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_cond;
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_return_output := result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c2_5763] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l904_c2_5763_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l932_l900_DUPLICATE_e0a1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l932_l900_DUPLICATE_e0a1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c2_5763_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l932_l900_DUPLICATE_e0a1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l932_l900_DUPLICATE_e0a1_return_output;
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
