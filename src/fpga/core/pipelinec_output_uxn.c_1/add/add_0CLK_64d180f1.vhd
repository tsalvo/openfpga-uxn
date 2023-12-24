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
-- BIN_OP_EQ[uxn_opcodes_h_l835_c6_a76c]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l835_c2_4e38]
signal t8_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l835_c2_4e38]
signal n8_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c2_4e38]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l835_c2_4e38]
signal result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l835_c2_4e38]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l835_c2_4e38]
signal result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c2_4e38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c2_4e38]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l835_c2_4e38]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c2_4e38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l835_c2_4e38]
signal result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l848_c11_dbe9]
signal BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l848_c7_fc98]
signal t8_MUX_uxn_opcodes_h_l848_c7_fc98_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l848_c7_fc98_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l848_c7_fc98]
signal n8_MUX_uxn_opcodes_h_l848_c7_fc98_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l848_c7_fc98_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l848_c7_fc98]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l848_c7_fc98]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l848_c7_fc98]
signal result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l848_c7_fc98]
signal result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l848_c7_fc98]
signal result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l851_c11_2d73]
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l851_c7_85f1]
signal t8_MUX_uxn_opcodes_h_l851_c7_85f1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l851_c7_85f1_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l851_c7_85f1]
signal n8_MUX_uxn_opcodes_h_l851_c7_85f1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l851_c7_85f1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c7_85f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c7_85f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_85f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l851_c7_85f1]
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_85f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l854_c11_1e52]
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l854_c7_7555]
signal n8_MUX_uxn_opcodes_h_l854_c7_7555_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_7555_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_7555_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_7555_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c7_7555]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c7_7555]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l854_c7_7555]
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l854_c7_7555]
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l854_c7_7555]
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l856_c30_2f69]
signal sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l859_c21_11ee]
signal BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c
BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output);

-- t8_MUX_uxn_opcodes_h_l835_c2_4e38
t8_MUX_uxn_opcodes_h_l835_c2_4e38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l835_c2_4e38_cond,
t8_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue,
t8_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse,
t8_MUX_uxn_opcodes_h_l835_c2_4e38_return_output);

-- n8_MUX_uxn_opcodes_h_l835_c2_4e38
n8_MUX_uxn_opcodes_h_l835_c2_4e38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l835_c2_4e38_cond,
n8_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue,
n8_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse,
n8_MUX_uxn_opcodes_h_l835_c2_4e38_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38
result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38
result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38
result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_cond,
result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38
result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38
result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9
BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_left,
BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_right,
BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_return_output);

-- t8_MUX_uxn_opcodes_h_l848_c7_fc98
t8_MUX_uxn_opcodes_h_l848_c7_fc98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l848_c7_fc98_cond,
t8_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue,
t8_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse,
t8_MUX_uxn_opcodes_h_l848_c7_fc98_return_output);

-- n8_MUX_uxn_opcodes_h_l848_c7_fc98
n8_MUX_uxn_opcodes_h_l848_c7_fc98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l848_c7_fc98_cond,
n8_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue,
n8_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse,
n8_MUX_uxn_opcodes_h_l848_c7_fc98_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98
result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98
result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_cond,
result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73
BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_left,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_right,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_return_output);

-- t8_MUX_uxn_opcodes_h_l851_c7_85f1
t8_MUX_uxn_opcodes_h_l851_c7_85f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l851_c7_85f1_cond,
t8_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue,
t8_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse,
t8_MUX_uxn_opcodes_h_l851_c7_85f1_return_output);

-- n8_MUX_uxn_opcodes_h_l851_c7_85f1
n8_MUX_uxn_opcodes_h_l851_c7_85f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l851_c7_85f1_cond,
n8_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue,
n8_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse,
n8_MUX_uxn_opcodes_h_l851_c7_85f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1
result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_cond,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52
BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_left,
BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_right,
BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_return_output);

-- n8_MUX_uxn_opcodes_h_l854_c7_7555
n8_MUX_uxn_opcodes_h_l854_c7_7555 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l854_c7_7555_cond,
n8_MUX_uxn_opcodes_h_l854_c7_7555_iftrue,
n8_MUX_uxn_opcodes_h_l854_c7_7555_iffalse,
n8_MUX_uxn_opcodes_h_l854_c7_7555_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555
result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_cond,
result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_return_output);

-- sp_relative_shift_uxn_opcodes_h_l856_c30_2f69
sp_relative_shift_uxn_opcodes_h_l856_c30_2f69 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_ins,
sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_x,
sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_y,
sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee
BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_left,
BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_right,
BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output,
 t8_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
 n8_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_return_output,
 t8_MUX_uxn_opcodes_h_l848_c7_fc98_return_output,
 n8_MUX_uxn_opcodes_h_l848_c7_fc98_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_return_output,
 t8_MUX_uxn_opcodes_h_l851_c7_85f1_return_output,
 n8_MUX_uxn_opcodes_h_l851_c7_85f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_return_output,
 n8_MUX_uxn_opcodes_h_l854_c7_7555_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_return_output,
 sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l848_c7_fc98_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l848_c7_fc98_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l840_c3_eaba : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_6052 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l851_c7_85f1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l848_c7_fc98_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c7_85f1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l848_c7_fc98_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l849_c3_fcd0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l851_c7_85f1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_7555_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c7_85f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_7555_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_7555_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_7555_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l858_c3_d502 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l859_c3_a7e8 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l848_l851_l835_DUPLICATE_fdb3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_7a18_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_c494_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_1e62_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l854_l851_DUPLICATE_d885_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l863_l831_DUPLICATE_06b0_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l849_c3_fcd0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l849_c3_fcd0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l840_c3_eaba := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l840_c3_eaba;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_6052 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_6052;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l858_c3_d502 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l858_c3_d502;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_7555_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_7555_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse := t8;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l835_c2_4e38_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_1e62 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_1e62_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l848_l851_l835_DUPLICATE_fdb3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l848_l851_l835_DUPLICATE_fdb3_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l854_l851_DUPLICATE_d885 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l854_l851_DUPLICATE_d885_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l835_c6_a76c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_7a18 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_7a18_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l835_c2_4e38_return_output := result.is_ram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l859_c21_11ee] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_left;
     BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_return_output := BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l848_c11_dbe9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_left;
     BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_return_output := BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l856_c30_2f69] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_ins;
     sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_x <= VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_x;
     sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_y <= VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_return_output := sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l851_c11_2d73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_left;
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_return_output := BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_c2_4e38_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l835_c2_4e38_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_c494 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_c494_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l854_c11_1e52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_left;
     BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_return_output := BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l835_c2_4e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l835_c2_4e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_a76c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l848_c7_fc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l848_c7_fc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_dbe9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l851_c7_85f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l851_c7_85f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2d73_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_7555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_1e52_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l859_c3_a7e8 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_11ee_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_7a18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_7a18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_7a18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_1e62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_1e62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_1e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_c494_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_c494_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l848_l851_DUPLICATE_c494_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l854_l851_DUPLICATE_d885_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l854_l851_DUPLICATE_d885_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l848_l851_l835_DUPLICATE_fdb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l848_l851_l835_DUPLICATE_fdb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l848_l851_l835_DUPLICATE_fdb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l848_l851_l835_DUPLICATE_fdb3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_c2_4e38_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l835_c2_4e38_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l835_c2_4e38_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l835_c2_4e38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2f69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_iftrue := VAR_result_u8_value_uxn_opcodes_h_l859_c3_a7e8;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output;

     -- n8_MUX[uxn_opcodes_h_l854_c7_7555] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l854_c7_7555_cond <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_7555_cond;
     n8_MUX_uxn_opcodes_h_l854_c7_7555_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_7555_iftrue;
     n8_MUX_uxn_opcodes_h_l854_c7_7555_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_7555_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_7555_return_output := n8_MUX_uxn_opcodes_h_l854_c7_7555_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_return_output;

     -- t8_MUX[uxn_opcodes_h_l851_c7_85f1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l851_c7_85f1_cond <= VAR_t8_MUX_uxn_opcodes_h_l851_c7_85f1_cond;
     t8_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue;
     t8_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l851_c7_85f1_return_output := t8_MUX_uxn_opcodes_h_l851_c7_85f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c7_7555] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l854_c7_7555] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l854_c7_7555] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_cond;
     result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_return_output := result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c7_7555] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l854_c7_7555] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l854_c7_7555_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_7555_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_7555_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_7555_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_7555_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_7555_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse := VAR_t8_MUX_uxn_opcodes_h_l851_c7_85f1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_85f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l851_c7_85f1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_return_output := result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c7_85f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_return_output;

     -- t8_MUX[uxn_opcodes_h_l848_c7_fc98] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l848_c7_fc98_cond <= VAR_t8_MUX_uxn_opcodes_h_l848_c7_fc98_cond;
     t8_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue;
     t8_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l848_c7_fc98_return_output := t8_MUX_uxn_opcodes_h_l848_c7_fc98_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c7_85f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_return_output;

     -- n8_MUX[uxn_opcodes_h_l851_c7_85f1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l851_c7_85f1_cond <= VAR_n8_MUX_uxn_opcodes_h_l851_c7_85f1_cond;
     n8_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue;
     n8_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l851_c7_85f1_return_output := n8_MUX_uxn_opcodes_h_l851_c7_85f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_85f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse := VAR_n8_MUX_uxn_opcodes_h_l851_c7_85f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_85f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_85f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_85f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_85f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_85f1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse := VAR_t8_MUX_uxn_opcodes_h_l848_c7_fc98_return_output;
     -- t8_MUX[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l835_c2_4e38_cond <= VAR_t8_MUX_uxn_opcodes_h_l835_c2_4e38_cond;
     t8_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue;
     t8_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l835_c2_4e38_return_output := t8_MUX_uxn_opcodes_h_l835_c2_4e38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l848_c7_fc98] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l848_c7_fc98] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l848_c7_fc98] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l848_c7_fc98] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_return_output;

     -- n8_MUX[uxn_opcodes_h_l848_c7_fc98] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l848_c7_fc98_cond <= VAR_n8_MUX_uxn_opcodes_h_l848_c7_fc98_cond;
     n8_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue;
     n8_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l848_c7_fc98_return_output := n8_MUX_uxn_opcodes_h_l848_c7_fc98_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l848_c7_fc98] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_cond;
     result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_return_output := result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse := VAR_n8_MUX_uxn_opcodes_h_l848_c7_fc98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_fc98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_fc98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_fc98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_fc98_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_fc98_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l835_c2_4e38_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_return_output;

     -- n8_MUX[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l835_c2_4e38_cond <= VAR_n8_MUX_uxn_opcodes_h_l835_c2_4e38_cond;
     n8_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue;
     n8_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l835_c2_4e38_return_output := n8_MUX_uxn_opcodes_h_l835_c2_4e38_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_cond;
     result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_return_output := result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c2_4e38] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l835_c2_4e38_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l863_l831_DUPLICATE_06b0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l863_l831_DUPLICATE_06b0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_4e38_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_4e38_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l863_l831_DUPLICATE_06b0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l863_l831_DUPLICATE_06b0_return_output;
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
