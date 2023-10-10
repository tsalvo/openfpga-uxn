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
-- Submodules: 32
entity lit_0CLK_e573058b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit_0CLK_e573058b;
architecture arch of lit_0CLK_e573058b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l193_c6_9041]
signal BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l193_c1_789e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l193_c2_c296]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l193_c2_c296]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l193_c2_c296]
signal result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l193_c2_c296]
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l193_c2_c296]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l193_c2_c296]
signal result_pc_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l193_c2_c296]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l193_c2_c296]
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l193_c2_c296]
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l194_c3_b469[uxn_opcodes_h_l194_c3_b469]
signal printf_uxn_opcodes_h_l194_c3_b469_uxn_opcodes_h_l194_c3_b469_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l200_c11_a004]
signal BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l200_c7_5b23]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l200_c7_5b23]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l200_c7_5b23]
signal result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l200_c7_5b23]
signal result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l200_c7_5b23]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l200_c7_5b23]
signal result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l200_c7_5b23]
signal result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l200_c7_5b23]
signal result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l204_c15_83c4]
signal BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l206_c11_62c6]
signal BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l206_c7_ba82]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l206_c7_ba82]
signal result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l206_c7_ba82]
signal result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l206_c7_ba82]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l206_c7_ba82]
signal result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l212_c11_abdb]
signal BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l212_c7_f589]
signal result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l212_c7_f589]
signal result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_210b( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.pc := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041
BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_left,
BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_right,
BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296
result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_cond,
result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296
result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_cond,
result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296
result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_return_output);

-- result_pc_MUX_uxn_opcodes_h_l193_c2_c296
result_pc_MUX_uxn_opcodes_h_l193_c2_c296 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l193_c2_c296_cond,
result_pc_MUX_uxn_opcodes_h_l193_c2_c296_iftrue,
result_pc_MUX_uxn_opcodes_h_l193_c2_c296_iffalse,
result_pc_MUX_uxn_opcodes_h_l193_c2_c296_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296
result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296
result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296
result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_return_output);

-- printf_uxn_opcodes_h_l194_c3_b469_uxn_opcodes_h_l194_c3_b469
printf_uxn_opcodes_h_l194_c3_b469_uxn_opcodes_h_l194_c3_b469 : entity work.printf_uxn_opcodes_h_l194_c3_b469_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l194_c3_b469_uxn_opcodes_h_l194_c3_b469_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004
BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_left,
BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_right,
BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23
result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23
result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_cond,
result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23
result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_cond,
result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23
result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_return_output);

-- result_pc_MUX_uxn_opcodes_h_l200_c7_5b23
result_pc_MUX_uxn_opcodes_h_l200_c7_5b23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_cond,
result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue,
result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse,
result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23
result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23
result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4
BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_left,
BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_right,
BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6
BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_left,
BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_right,
BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82
result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82
result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82
result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82
result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_cond,
result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb
BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_left,
BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_right,
BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589
result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589
result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
 result_pc_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_return_output,
 result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l196_c3_fc24 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l193_c2_c296_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l194_c3_b469_uxn_opcodes_h_l194_c3_b469_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l200_c7_5b23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l204_c3_e0d4 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l209_c3_460e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l206_l193_DUPLICATE_1381_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l200_l206_l193_DUPLICATE_acb8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l200_l206_l193_DUPLICATE_cb66_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l200_l193_DUPLICATE_336e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l200_l193_l212_DUPLICATE_5596_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l200_l206_l212_DUPLICATE_41a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l217_l189_DUPLICATE_b906_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l196_c3_fc24 := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l196_c3_fc24;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l209_c3_460e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l209_c3_460e;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue := VAR_previous_ram_read;
     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l200_c7_5b23] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l200_c7_5b23_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l200_l193_l212_DUPLICATE_5596 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l200_l193_l212_DUPLICATE_5596_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l204_c15_83c4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l193_c2_c296] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l193_c2_c296_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l200_l206_l193_DUPLICATE_acb8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l200_l206_l193_DUPLICATE_acb8_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l206_l193_DUPLICATE_1381 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l206_l193_DUPLICATE_1381_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l206_c11_62c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l200_l206_l212_DUPLICATE_41a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l200_l206_l212_DUPLICATE_41a8_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l212_c11_abdb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_left;
     BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_return_output := BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l193_c6_9041] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_left;
     BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output := BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l200_c7_5b23] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l200_c7_5b23_return_output := result.ram_addr;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l200_l193_DUPLICATE_336e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l200_l193_DUPLICATE_336e_return_output := result.pc;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l200_l206_l193_DUPLICATE_cb66 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l200_l206_l193_DUPLICATE_cb66_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l200_c11_a004] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_left;
     BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_return_output := BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c2_c296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c6_9041_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l200_c11_a004_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l206_c11_62c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l212_c11_abdb_return_output;
     VAR_result_pc_uxn_opcodes_h_l204_c3_e0d4 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l204_c15_83c4_return_output, 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c2_c296_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l200_l193_DUPLICATE_336e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l200_l193_DUPLICATE_336e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l200_l206_l212_DUPLICATE_41a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l200_l206_l212_DUPLICATE_41a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l200_l206_l212_DUPLICATE_41a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l206_l193_DUPLICATE_1381_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l206_l193_DUPLICATE_1381_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l200_l193_l212_DUPLICATE_5596_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l200_l193_l212_DUPLICATE_5596_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l200_l193_l212_DUPLICATE_5596_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l200_l206_l193_DUPLICATE_acb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l200_l206_l193_DUPLICATE_acb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l200_l206_l193_DUPLICATE_acb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l200_l206_l193_DUPLICATE_cb66_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l200_l206_l193_DUPLICATE_cb66_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l200_l206_l193_DUPLICATE_cb66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l200_c7_5b23_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l200_c7_5b23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l193_c2_c296_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue := VAR_result_pc_uxn_opcodes_h_l204_c3_e0d4;
     -- result_pc_MUX[uxn_opcodes_h_l200_c7_5b23] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_cond;
     result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue;
     result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_return_output := result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l206_c7_ba82] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l212_c7_f589] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l206_c7_ba82] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l193_c2_c296] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l193_c1_789e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l200_c7_5b23] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_return_output := result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l200_c7_5b23] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l212_c7_f589] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l206_c7_ba82] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_cond;
     result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_return_output := result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l194_c3_b469_uxn_opcodes_h_l194_c3_b469_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l193_c1_789e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l212_c7_f589_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l206_c7_ba82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l212_c7_f589_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c2_c296_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l206_c7_ba82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l206_c7_ba82_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l206_c7_ba82] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_return_output;

     -- printf_uxn_opcodes_h_l194_c3_b469[uxn_opcodes_h_l194_c3_b469] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l194_c3_b469_uxn_opcodes_h_l194_c3_b469_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l194_c3_b469_uxn_opcodes_h_l194_c3_b469_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l200_c7_5b23] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l200_c7_5b23] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l193_c2_c296] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l193_c2_c296] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_return_output := result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l200_c7_5b23] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_cond;
     result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_return_output := result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l206_c7_ba82] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l193_c2_c296] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l193_c2_c296_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c2_c296_cond;
     result_pc_MUX_uxn_opcodes_h_l193_c2_c296_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c2_c296_iftrue;
     result_pc_MUX_uxn_opcodes_h_l193_c2_c296_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l193_c2_c296_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c2_c296_return_output := result_pc_MUX_uxn_opcodes_h_l193_c2_c296_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l206_c7_ba82_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l206_c7_ba82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l200_c7_5b23] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l193_c2_c296] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l193_c2_c296] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l200_c7_5b23] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l193_c2_c296] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_cond;
     result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_return_output := result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l200_c7_5b23_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l193_c2_c296] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l193_c2_c296] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l217_l189_DUPLICATE_b906 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l217_l189_DUPLICATE_b906_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_210b(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c2_c296_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c2_c296_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l217_l189_DUPLICATE_b906_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_210b_uxn_opcodes_h_l217_l189_DUPLICATE_b906_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;