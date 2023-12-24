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
-- BIN_OP_EQ[uxn_opcodes_h_l835_c6_98db]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l835_c2_9b63]
signal n8_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l835_c2_9b63]
signal result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c2_9b63]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c2_9b63]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l835_c2_9b63]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c2_9b63]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c2_9b63]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l835_c2_9b63]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l835_c2_9b63]
signal result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l835_c2_9b63]
signal result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l835_c2_9b63]
signal t8_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l848_c11_86e3]
signal BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l848_c7_3436]
signal n8_MUX_uxn_opcodes_h_l848_c7_3436_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l848_c7_3436_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l848_c7_3436_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l848_c7_3436_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l848_c7_3436]
signal result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l848_c7_3436]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l848_c7_3436]
signal result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l848_c7_3436]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l848_c7_3436]
signal result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l848_c7_3436]
signal t8_MUX_uxn_opcodes_h_l848_c7_3436_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l848_c7_3436_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l848_c7_3436_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l848_c7_3436_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l851_c11_91e8]
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l851_c7_e4e3]
signal n8_MUX_uxn_opcodes_h_l851_c7_e4e3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_e4e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c7_e4e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l851_c7_e4e3]
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c7_e4e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_e4e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l851_c7_e4e3]
signal t8_MUX_uxn_opcodes_h_l851_c7_e4e3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l854_c11_d1bc]
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l854_c7_3451]
signal n8_MUX_uxn_opcodes_h_l854_c7_3451_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_3451_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_3451_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_3451_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l854_c7_3451]
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c7_3451]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l854_c7_3451]
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c7_3451]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l854_c7_3451]
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l856_c30_2fad]
signal sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l859_c21_2249]
signal BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_return_output : unsigned(8 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_a47b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db
BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output);

-- n8_MUX_uxn_opcodes_h_l835_c2_9b63
n8_MUX_uxn_opcodes_h_l835_c2_9b63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l835_c2_9b63_cond,
n8_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue,
n8_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse,
n8_MUX_uxn_opcodes_h_l835_c2_9b63_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63
result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63
result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63
result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63
result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_cond,
result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63
result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output);

-- t8_MUX_uxn_opcodes_h_l835_c2_9b63
t8_MUX_uxn_opcodes_h_l835_c2_9b63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l835_c2_9b63_cond,
t8_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue,
t8_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse,
t8_MUX_uxn_opcodes_h_l835_c2_9b63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3
BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_left,
BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_right,
BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_return_output);

-- n8_MUX_uxn_opcodes_h_l848_c7_3436
n8_MUX_uxn_opcodes_h_l848_c7_3436 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l848_c7_3436_cond,
n8_MUX_uxn_opcodes_h_l848_c7_3436_iftrue,
n8_MUX_uxn_opcodes_h_l848_c7_3436_iffalse,
n8_MUX_uxn_opcodes_h_l848_c7_3436_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436
result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436
result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_cond,
result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_return_output);

-- t8_MUX_uxn_opcodes_h_l848_c7_3436
t8_MUX_uxn_opcodes_h_l848_c7_3436 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l848_c7_3436_cond,
t8_MUX_uxn_opcodes_h_l848_c7_3436_iftrue,
t8_MUX_uxn_opcodes_h_l848_c7_3436_iffalse,
t8_MUX_uxn_opcodes_h_l848_c7_3436_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8
BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_left,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_right,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_return_output);

-- n8_MUX_uxn_opcodes_h_l851_c7_e4e3
n8_MUX_uxn_opcodes_h_l851_c7_e4e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l851_c7_e4e3_cond,
n8_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue,
n8_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse,
n8_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output);

-- t8_MUX_uxn_opcodes_h_l851_c7_e4e3
t8_MUX_uxn_opcodes_h_l851_c7_e4e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l851_c7_e4e3_cond,
t8_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue,
t8_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse,
t8_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc
BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_left,
BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_right,
BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_return_output);

-- n8_MUX_uxn_opcodes_h_l854_c7_3451
n8_MUX_uxn_opcodes_h_l854_c7_3451 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l854_c7_3451_cond,
n8_MUX_uxn_opcodes_h_l854_c7_3451_iftrue,
n8_MUX_uxn_opcodes_h_l854_c7_3451_iffalse,
n8_MUX_uxn_opcodes_h_l854_c7_3451_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451
result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_cond,
result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_return_output);

-- sp_relative_shift_uxn_opcodes_h_l856_c30_2fad
sp_relative_shift_uxn_opcodes_h_l856_c30_2fad : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_ins,
sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_x,
sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_y,
sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249
BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_left,
BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_right,
BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output,
 n8_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
 t8_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_return_output,
 n8_MUX_uxn_opcodes_h_l848_c7_3436_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_return_output,
 t8_MUX_uxn_opcodes_h_l848_c7_3436_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_return_output,
 n8_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output,
 t8_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_return_output,
 n8_MUX_uxn_opcodes_h_l854_c7_3451_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_return_output,
 sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l848_c7_3436_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l840_c3_ef02 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_aecf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l848_c7_3436_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c2_9b63_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l835_c2_9b63_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l848_c7_3436_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l848_c7_3436_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l848_c7_3436_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l849_c3_0e24 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l848_c7_3436_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l848_c7_3436_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l848_c7_3436_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_3451_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l851_c7_e4e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_3451_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_3451_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_3451_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l859_c3_ab49 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l858_c3_7f7a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_return_output : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l851_l835_l848_DUPLICATE_8837_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_1eee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_371f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_f4c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l854_l851_DUPLICATE_0a97_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l863_l831_DUPLICATE_4c14_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l849_c3_0e24 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l849_c3_0e24;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l840_c3_ef02 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l840_c3_ef02;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_aecf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_aecf;
     VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l858_c3_7f7a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l858_c3_7f7a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l848_c7_3436_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_3451_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_3451_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l848_c7_3436_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_1eee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_1eee_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l856_c30_2fad] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_ins;
     sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_x <= VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_x;
     sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_y <= VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_return_output := sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l848_c11_86e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l851_l835_l848_DUPLICATE_8837 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l851_l835_l848_DUPLICATE_8837_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l835_c2_9b63_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l835_c6_98db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l854_c11_d1bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_371f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_371f_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l859_c21_2249] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_left;
     BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_return_output := BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l851_c11_91e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l835_c2_9b63_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_c2_9b63_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l854_l851_DUPLICATE_0a97 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l854_l851_DUPLICATE_0a97_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_f4c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_f4c0_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l835_c2_9b63_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l835_c2_9b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l835_c2_9b63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c6_98db_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l848_c7_3436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l848_c7_3436_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l848_c11_86e3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l851_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l851_c7_e4e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_91e8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_3451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_d1bc_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l859_c3_ab49 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l859_c21_2249_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_371f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_371f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_371f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_1eee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_1eee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_1eee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_f4c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_f4c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l848_DUPLICATE_f4c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l854_l851_DUPLICATE_0a97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l854_l851_DUPLICATE_0a97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l851_l835_l848_DUPLICATE_8837_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l851_l835_l848_DUPLICATE_8837_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l851_l835_l848_DUPLICATE_8837_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l854_l851_l835_l848_DUPLICATE_8837_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_c2_9b63_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l835_c2_9b63_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l835_c2_9b63_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l835_c2_9b63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l856_c30_2fad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_iftrue := VAR_result_u8_value_uxn_opcodes_h_l859_c3_ab49;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l854_c7_3451] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_return_output;

     -- n8_MUX[uxn_opcodes_h_l854_c7_3451] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l854_c7_3451_cond <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_3451_cond;
     n8_MUX_uxn_opcodes_h_l854_c7_3451_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_3451_iftrue;
     n8_MUX_uxn_opcodes_h_l854_c7_3451_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_3451_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_3451_return_output := n8_MUX_uxn_opcodes_h_l854_c7_3451_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l854_c7_3451] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_cond;
     result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_return_output := result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l854_c7_3451] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_return_output;

     -- t8_MUX[uxn_opcodes_h_l851_c7_e4e3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l851_c7_e4e3_cond <= VAR_t8_MUX_uxn_opcodes_h_l851_c7_e4e3_cond;
     t8_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue;
     t8_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output := t8_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c7_3451] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c7_3451] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l854_c7_3451_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_3451_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_3451_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_3451_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_3451_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c7_3451_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l848_c7_3436_iffalse := VAR_t8_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output;
     -- n8_MUX[uxn_opcodes_h_l851_c7_e4e3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l851_c7_e4e3_cond <= VAR_n8_MUX_uxn_opcodes_h_l851_c7_e4e3_cond;
     n8_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue;
     n8_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output := n8_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l851_c7_e4e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output;

     -- t8_MUX[uxn_opcodes_h_l848_c7_3436] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l848_c7_3436_cond <= VAR_t8_MUX_uxn_opcodes_h_l848_c7_3436_cond;
     t8_MUX_uxn_opcodes_h_l848_c7_3436_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l848_c7_3436_iftrue;
     t8_MUX_uxn_opcodes_h_l848_c7_3436_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l848_c7_3436_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l848_c7_3436_return_output := t8_MUX_uxn_opcodes_h_l848_c7_3436_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c7_e4e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_e4e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_e4e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c7_e4e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l848_c7_3436_iffalse := VAR_n8_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l851_c7_e4e3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse := VAR_t8_MUX_uxn_opcodes_h_l848_c7_3436_return_output;
     -- t8_MUX[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l835_c2_9b63_cond <= VAR_t8_MUX_uxn_opcodes_h_l835_c2_9b63_cond;
     t8_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue;
     t8_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l835_c2_9b63_return_output := t8_MUX_uxn_opcodes_h_l835_c2_9b63_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l848_c7_3436] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l848_c7_3436] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_return_output;

     -- n8_MUX[uxn_opcodes_h_l848_c7_3436] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l848_c7_3436_cond <= VAR_n8_MUX_uxn_opcodes_h_l848_c7_3436_cond;
     n8_MUX_uxn_opcodes_h_l848_c7_3436_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l848_c7_3436_iftrue;
     n8_MUX_uxn_opcodes_h_l848_c7_3436_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l848_c7_3436_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l848_c7_3436_return_output := n8_MUX_uxn_opcodes_h_l848_c7_3436_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l848_c7_3436] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l848_c7_3436] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l848_c7_3436] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_cond;
     result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_return_output := result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse := VAR_n8_MUX_uxn_opcodes_h_l848_c7_3436_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l848_c7_3436_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l848_c7_3436_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l848_c7_3436_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l848_c7_3436_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l848_c7_3436_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l835_c2_9b63_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_cond;
     result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_return_output := result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_return_output;

     -- n8_MUX[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l835_c2_9b63_cond <= VAR_n8_MUX_uxn_opcodes_h_l835_c2_9b63_cond;
     n8_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue;
     n8_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l835_c2_9b63_return_output := n8_MUX_uxn_opcodes_h_l835_c2_9b63_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c2_9b63] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l835_c2_9b63_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l863_l831_DUPLICATE_4c14 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l863_l831_DUPLICATE_4c14_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l835_c2_9b63_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l835_c2_9b63_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l863_l831_DUPLICATE_4c14_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l863_l831_DUPLICATE_4c14_return_output;
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
