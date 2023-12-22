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
-- BIN_OP_EQ[uxn_opcodes_h_l836_c6_0090]
signal BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l836_c2_11f8]
signal t8_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l836_c2_11f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l836_c2_11f8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l836_c2_11f8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l836_c2_11f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l836_c2_11f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l836_c2_11f8]
signal result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l836_c2_11f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l836_c2_11f8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l836_c2_11f8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l836_c2_11f8]
signal n8_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l849_c11_5ebb]
signal BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l849_c7_535f]
signal t8_MUX_uxn_opcodes_h_l849_c7_535f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l849_c7_535f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l849_c7_535f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l849_c7_535f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l849_c7_535f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l849_c7_535f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l849_c7_535f]
signal result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l849_c7_535f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l849_c7_535f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l849_c7_535f]
signal n8_MUX_uxn_opcodes_h_l849_c7_535f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l849_c7_535f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l849_c7_535f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l849_c7_535f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l852_c11_aee3]
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l852_c7_ec14]
signal t8_MUX_uxn_opcodes_h_l852_c7_ec14_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l852_c7_ec14_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l852_c7_ec14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l852_c7_ec14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l852_c7_ec14]
signal result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l852_c7_ec14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l852_c7_ec14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l852_c7_ec14]
signal n8_MUX_uxn_opcodes_h_l852_c7_ec14_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l852_c7_ec14_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l855_c11_730e]
signal BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l855_c7_6493]
signal result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l855_c7_6493]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l855_c7_6493]
signal result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l855_c7_6493]
signal result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l855_c7_6493]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l855_c7_6493]
signal n8_MUX_uxn_opcodes_h_l855_c7_6493_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l855_c7_6493_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l855_c7_6493_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l855_c7_6493_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l857_c30_bc7f]
signal sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l860_c21_1c3f]
signal BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c580( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090
BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_left,
BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_right,
BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output);

-- t8_MUX_uxn_opcodes_h_l836_c2_11f8
t8_MUX_uxn_opcodes_h_l836_c2_11f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l836_c2_11f8_cond,
t8_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue,
t8_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse,
t8_MUX_uxn_opcodes_h_l836_c2_11f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8
result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8
result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8
result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8
result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8
result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_cond,
result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8
result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_return_output);

-- n8_MUX_uxn_opcodes_h_l836_c2_11f8
n8_MUX_uxn_opcodes_h_l836_c2_11f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l836_c2_11f8_cond,
n8_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue,
n8_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse,
n8_MUX_uxn_opcodes_h_l836_c2_11f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb
BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_left,
BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_right,
BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_return_output);

-- t8_MUX_uxn_opcodes_h_l849_c7_535f
t8_MUX_uxn_opcodes_h_l849_c7_535f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l849_c7_535f_cond,
t8_MUX_uxn_opcodes_h_l849_c7_535f_iftrue,
t8_MUX_uxn_opcodes_h_l849_c7_535f_iffalse,
t8_MUX_uxn_opcodes_h_l849_c7_535f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f
result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_cond,
result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_return_output);

-- n8_MUX_uxn_opcodes_h_l849_c7_535f
n8_MUX_uxn_opcodes_h_l849_c7_535f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l849_c7_535f_cond,
n8_MUX_uxn_opcodes_h_l849_c7_535f_iftrue,
n8_MUX_uxn_opcodes_h_l849_c7_535f_iffalse,
n8_MUX_uxn_opcodes_h_l849_c7_535f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3
BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_left,
BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_right,
BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_return_output);

-- t8_MUX_uxn_opcodes_h_l852_c7_ec14
t8_MUX_uxn_opcodes_h_l852_c7_ec14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l852_c7_ec14_cond,
t8_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue,
t8_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse,
t8_MUX_uxn_opcodes_h_l852_c7_ec14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14
result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_cond,
result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_return_output);

-- n8_MUX_uxn_opcodes_h_l852_c7_ec14
n8_MUX_uxn_opcodes_h_l852_c7_ec14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l852_c7_ec14_cond,
n8_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue,
n8_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse,
n8_MUX_uxn_opcodes_h_l852_c7_ec14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e
BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_left,
BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_right,
BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493
result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493
result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_cond,
result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493
result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493
result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_return_output);

-- n8_MUX_uxn_opcodes_h_l855_c7_6493
n8_MUX_uxn_opcodes_h_l855_c7_6493 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l855_c7_6493_cond,
n8_MUX_uxn_opcodes_h_l855_c7_6493_iftrue,
n8_MUX_uxn_opcodes_h_l855_c7_6493_iffalse,
n8_MUX_uxn_opcodes_h_l855_c7_6493_return_output);

-- sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f
sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_ins,
sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_x,
sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_y,
sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f
BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_left,
BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_right,
BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output,
 t8_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
 n8_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_return_output,
 t8_MUX_uxn_opcodes_h_l849_c7_535f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_return_output,
 n8_MUX_uxn_opcodes_h_l849_c7_535f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_return_output,
 t8_MUX_uxn_opcodes_h_l852_c7_ec14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_return_output,
 n8_MUX_uxn_opcodes_h_l852_c7_ec14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_return_output,
 n8_MUX_uxn_opcodes_h_l855_c7_6493_return_output,
 sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l849_c7_535f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l846_c3_affd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l841_c3_779d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l849_c7_535f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l836_c2_11f8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l836_c2_11f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l849_c7_535f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l849_c7_535f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l852_c7_ec14_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l849_c7_535f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_9994 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l849_c7_535f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l849_c7_535f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l852_c7_ec14_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l849_c7_535f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l852_c7_ec14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l855_c7_6493_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l852_c7_ec14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_af1a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l860_c3_3853 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l855_c7_6493_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l855_c7_6493_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l855_c7_6493_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l852_l849_l836_l855_DUPLICATE_e8b7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_e1b1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_e3b8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_1741_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l852_l855_DUPLICATE_5909_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l864_l832_DUPLICATE_c9ab_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_9994 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l850_c3_9994;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l846_c3_affd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l846_c3_affd;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_af1a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l859_c3_af1a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l841_c3_779d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l841_c3_779d;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l849_c7_535f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l855_c7_6493_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l855_c7_6493_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l849_c7_535f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l857_c30_bc7f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_ins;
     sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_x;
     sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_return_output := sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_e1b1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_e1b1_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l836_c2_11f8_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l852_c11_aee3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_left;
     BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_return_output := BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_1741 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_1741_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l849_c11_5ebb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_left;
     BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_return_output := BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l860_c21_1c3f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l836_c6_0090] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_left;
     BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output := BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l836_c2_11f8_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_e3b8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_e3b8_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l855_c11_730e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_left;
     BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_return_output := BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l836_c2_11f8_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l852_l849_l836_l855_DUPLICATE_e8b7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l852_l849_l836_l855_DUPLICATE_e8b7_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l852_l855_DUPLICATE_5909 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l852_l855_DUPLICATE_5909_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l836_c2_11f8_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l836_c2_11f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l836_c2_11f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l836_c6_0090_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l849_c7_535f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l849_c7_535f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l849_c11_5ebb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l852_c7_ec14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l852_c7_ec14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l852_c11_aee3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l855_c7_6493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l855_c11_730e_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l860_c3_3853 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l860_c21_1c3f_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_1741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_1741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_1741_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_e1b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_e1b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_e1b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_e3b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_e3b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l852_l849_l855_DUPLICATE_e3b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l852_l855_DUPLICATE_5909_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l852_l855_DUPLICATE_5909_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l852_l849_l836_l855_DUPLICATE_e8b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l852_l849_l836_l855_DUPLICATE_e8b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l852_l849_l836_l855_DUPLICATE_e8b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l852_l849_l836_l855_DUPLICATE_e8b7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l836_c2_11f8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l836_c2_11f8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l836_c2_11f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l836_c2_11f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l857_c30_bc7f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_iftrue := VAR_result_u8_value_uxn_opcodes_h_l860_c3_3853;
     -- t8_MUX[uxn_opcodes_h_l852_c7_ec14] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l852_c7_ec14_cond <= VAR_t8_MUX_uxn_opcodes_h_l852_c7_ec14_cond;
     t8_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue;
     t8_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l852_c7_ec14_return_output := t8_MUX_uxn_opcodes_h_l852_c7_ec14_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l855_c7_6493] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_return_output;

     -- n8_MUX[uxn_opcodes_h_l855_c7_6493] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l855_c7_6493_cond <= VAR_n8_MUX_uxn_opcodes_h_l855_c7_6493_cond;
     n8_MUX_uxn_opcodes_h_l855_c7_6493_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l855_c7_6493_iftrue;
     n8_MUX_uxn_opcodes_h_l855_c7_6493_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l855_c7_6493_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l855_c7_6493_return_output := n8_MUX_uxn_opcodes_h_l855_c7_6493_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l855_c7_6493] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l855_c7_6493] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l855_c7_6493] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_cond;
     result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_return_output := result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l855_c7_6493] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse := VAR_n8_MUX_uxn_opcodes_h_l855_c7_6493_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l855_c7_6493_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l855_c7_6493_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l855_c7_6493_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l855_c7_6493_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l855_c7_6493_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l849_c7_535f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l852_c7_ec14_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l852_c7_ec14] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_cond;
     result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_return_output := result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l852_c7_ec14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_return_output;

     -- t8_MUX[uxn_opcodes_h_l849_c7_535f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l849_c7_535f_cond <= VAR_t8_MUX_uxn_opcodes_h_l849_c7_535f_cond;
     t8_MUX_uxn_opcodes_h_l849_c7_535f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l849_c7_535f_iftrue;
     t8_MUX_uxn_opcodes_h_l849_c7_535f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l849_c7_535f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l849_c7_535f_return_output := t8_MUX_uxn_opcodes_h_l849_c7_535f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l852_c7_ec14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l852_c7_ec14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_return_output;

     -- n8_MUX[uxn_opcodes_h_l852_c7_ec14] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l852_c7_ec14_cond <= VAR_n8_MUX_uxn_opcodes_h_l852_c7_ec14_cond;
     n8_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue;
     n8_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l852_c7_ec14_return_output := n8_MUX_uxn_opcodes_h_l852_c7_ec14_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l852_c7_ec14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l849_c7_535f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l852_c7_ec14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l852_c7_ec14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l852_c7_ec14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l852_c7_ec14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l852_c7_ec14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l852_c7_ec14_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l849_c7_535f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l849_c7_535f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l849_c7_535f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_return_output := result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l849_c7_535f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_return_output;

     -- n8_MUX[uxn_opcodes_h_l849_c7_535f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l849_c7_535f_cond <= VAR_n8_MUX_uxn_opcodes_h_l849_c7_535f_cond;
     n8_MUX_uxn_opcodes_h_l849_c7_535f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l849_c7_535f_iftrue;
     n8_MUX_uxn_opcodes_h_l849_c7_535f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l849_c7_535f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l849_c7_535f_return_output := n8_MUX_uxn_opcodes_h_l849_c7_535f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l849_c7_535f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l849_c7_535f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_return_output;

     -- t8_MUX[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l836_c2_11f8_cond <= VAR_t8_MUX_uxn_opcodes_h_l836_c2_11f8_cond;
     t8_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue;
     t8_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l836_c2_11f8_return_output := t8_MUX_uxn_opcodes_h_l836_c2_11f8_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l849_c7_535f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l849_c7_535f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l849_c7_535f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l849_c7_535f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l849_c7_535f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l849_c7_535f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l836_c2_11f8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_return_output := result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_return_output;

     -- n8_MUX[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l836_c2_11f8_cond <= VAR_n8_MUX_uxn_opcodes_h_l836_c2_11f8_cond;
     n8_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue;
     n8_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l836_c2_11f8_return_output := n8_MUX_uxn_opcodes_h_l836_c2_11f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l836_c2_11f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l836_c2_11f8_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l864_l832_DUPLICATE_c9ab LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l864_l832_DUPLICATE_c9ab_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l836_c2_11f8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l836_c2_11f8_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l864_l832_DUPLICATE_c9ab_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l864_l832_DUPLICATE_c9ab_return_output;
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
