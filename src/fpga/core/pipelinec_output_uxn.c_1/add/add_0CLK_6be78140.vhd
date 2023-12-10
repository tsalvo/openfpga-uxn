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
entity add_0CLK_6be78140 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add_0CLK_6be78140;
architecture arch of add_0CLK_6be78140 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l808_c6_e8b4]
signal BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l808_c2_2217]
signal n8_MUX_uxn_opcodes_h_l808_c2_2217_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l808_c2_2217_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l808_c2_2217_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l808_c2_2217_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l808_c2_2217]
signal result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l808_c2_2217]
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l808_c2_2217]
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l808_c2_2217]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l808_c2_2217]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l808_c2_2217]
signal t8_MUX_uxn_opcodes_h_l808_c2_2217_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l808_c2_2217_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l808_c2_2217_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l808_c2_2217_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l815_c11_4367]
signal BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l815_c7_cece]
signal n8_MUX_uxn_opcodes_h_l815_c7_cece_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l815_c7_cece_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l815_c7_cece_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l815_c7_cece_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l815_c7_cece]
signal result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l815_c7_cece]
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l815_c7_cece]
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l815_c7_cece]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l815_c7_cece]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l815_c7_cece]
signal t8_MUX_uxn_opcodes_h_l815_c7_cece_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l815_c7_cece_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l815_c7_cece_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l815_c7_cece_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l818_c11_be43]
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l818_c7_2428]
signal n8_MUX_uxn_opcodes_h_l818_c7_2428_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c7_2428_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c7_2428_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l818_c7_2428_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l818_c7_2428]
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l818_c7_2428]
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l818_c7_2428]
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c7_2428]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c7_2428]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l818_c7_2428]
signal t8_MUX_uxn_opcodes_h_l818_c7_2428_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c7_2428_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c7_2428_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l818_c7_2428_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l821_c11_9c9b]
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l821_c7_f6b7]
signal n8_MUX_uxn_opcodes_h_l821_c7_f6b7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l821_c7_f6b7]
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l821_c7_f6b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l821_c7_f6b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l821_c7_f6b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l821_c7_f6b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l824_c30_8263]
signal sp_relative_shift_uxn_opcodes_h_l824_c30_8263_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l824_c30_8263_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l824_c30_8263_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l824_c30_8263_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l827_c21_7be3]
signal BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l829_c11_b09a]
signal BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l829_c7_b8ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l829_c7_b8ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l829_c7_b8ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output : signed(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4
BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_left,
BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_right,
BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_return_output);

-- n8_MUX_uxn_opcodes_h_l808_c2_2217
n8_MUX_uxn_opcodes_h_l808_c2_2217 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l808_c2_2217_cond,
n8_MUX_uxn_opcodes_h_l808_c2_2217_iftrue,
n8_MUX_uxn_opcodes_h_l808_c2_2217_iffalse,
n8_MUX_uxn_opcodes_h_l808_c2_2217_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217
result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_cond,
result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217
result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217
result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_return_output);

-- t8_MUX_uxn_opcodes_h_l808_c2_2217
t8_MUX_uxn_opcodes_h_l808_c2_2217 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l808_c2_2217_cond,
t8_MUX_uxn_opcodes_h_l808_c2_2217_iftrue,
t8_MUX_uxn_opcodes_h_l808_c2_2217_iffalse,
t8_MUX_uxn_opcodes_h_l808_c2_2217_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367
BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_left,
BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_right,
BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_return_output);

-- n8_MUX_uxn_opcodes_h_l815_c7_cece
n8_MUX_uxn_opcodes_h_l815_c7_cece : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l815_c7_cece_cond,
n8_MUX_uxn_opcodes_h_l815_c7_cece_iftrue,
n8_MUX_uxn_opcodes_h_l815_c7_cece_iffalse,
n8_MUX_uxn_opcodes_h_l815_c7_cece_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece
result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_cond,
result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_return_output);

-- t8_MUX_uxn_opcodes_h_l815_c7_cece
t8_MUX_uxn_opcodes_h_l815_c7_cece : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l815_c7_cece_cond,
t8_MUX_uxn_opcodes_h_l815_c7_cece_iftrue,
t8_MUX_uxn_opcodes_h_l815_c7_cece_iffalse,
t8_MUX_uxn_opcodes_h_l815_c7_cece_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43
BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_left,
BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_right,
BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_return_output);

-- n8_MUX_uxn_opcodes_h_l818_c7_2428
n8_MUX_uxn_opcodes_h_l818_c7_2428 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l818_c7_2428_cond,
n8_MUX_uxn_opcodes_h_l818_c7_2428_iftrue,
n8_MUX_uxn_opcodes_h_l818_c7_2428_iffalse,
n8_MUX_uxn_opcodes_h_l818_c7_2428_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428
result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_cond,
result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_return_output);

-- t8_MUX_uxn_opcodes_h_l818_c7_2428
t8_MUX_uxn_opcodes_h_l818_c7_2428 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l818_c7_2428_cond,
t8_MUX_uxn_opcodes_h_l818_c7_2428_iftrue,
t8_MUX_uxn_opcodes_h_l818_c7_2428_iffalse,
t8_MUX_uxn_opcodes_h_l818_c7_2428_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b
BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_left,
BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_right,
BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_return_output);

-- n8_MUX_uxn_opcodes_h_l821_c7_f6b7
n8_MUX_uxn_opcodes_h_l821_c7_f6b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l821_c7_f6b7_cond,
n8_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue,
n8_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse,
n8_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7
result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l824_c30_8263
sp_relative_shift_uxn_opcodes_h_l824_c30_8263 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l824_c30_8263_ins,
sp_relative_shift_uxn_opcodes_h_l824_c30_8263_x,
sp_relative_shift_uxn_opcodes_h_l824_c30_8263_y,
sp_relative_shift_uxn_opcodes_h_l824_c30_8263_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3
BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_left,
BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_right,
BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a
BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_left,
BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_right,
BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca
result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca
result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_return_output,
 n8_MUX_uxn_opcodes_h_l808_c2_2217_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_return_output,
 t8_MUX_uxn_opcodes_h_l808_c2_2217_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_return_output,
 n8_MUX_uxn_opcodes_h_l815_c7_cece_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_return_output,
 t8_MUX_uxn_opcodes_h_l815_c7_cece_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_return_output,
 n8_MUX_uxn_opcodes_h_l818_c7_2428_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_return_output,
 t8_MUX_uxn_opcodes_h_l818_c7_2428_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_return_output,
 n8_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output,
 sp_relative_shift_uxn_opcodes_h_l824_c30_8263_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l808_c2_2217_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l808_c2_2217_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l815_c7_cece_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l808_c2_2217_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l808_c2_2217_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l812_c3_7b9c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l808_c2_2217_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l808_c2_2217_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l815_c7_cece_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l808_c2_2217_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l808_c2_2217_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l815_c7_cece_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l815_c7_cece_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c7_2428_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l815_c7_cece_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_cd72 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l815_c7_cece_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l815_c7_cece_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c7_2428_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l815_c7_cece_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c7_2428_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c7_2428_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l818_c7_2428_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c7_2428_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c7_2428_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l818_c7_2428_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l821_c7_f6b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l827_c3_016e : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l826_c3_49a7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_8263_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_8263_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_8263_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_8263_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l830_c3_9f4a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l808_l821_l815_l818_DUPLICATE_f469_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l808_l815_l829_l818_DUPLICATE_7dd2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l815_l829_l818_DUPLICATE_e4e5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l821_l815_l829_l818_DUPLICATE_91dc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l821_l818_DUPLICATE_ef39_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l835_l804_DUPLICATE_74be_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_8263_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l830_c3_9f4a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l830_c3_9f4a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_8263_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l826_c3_49a7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l826_c3_49a7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_cd72 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_cd72;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l812_c3_7b9c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l812_c3_7b9c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_8263_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l808_c2_2217_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l815_c7_cece_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l818_c7_2428_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l818_c7_2428_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l808_c2_2217_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l815_c7_cece_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l818_c7_2428_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l815_c11_4367] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_left;
     BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_return_output := BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l818_c11_be43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_left;
     BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_return_output := BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l808_l821_l815_l818_DUPLICATE_f469 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l808_l821_l815_l818_DUPLICATE_f469_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l808_l815_l829_l818_DUPLICATE_7dd2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l808_l815_l829_l818_DUPLICATE_7dd2_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l815_l829_l818_DUPLICATE_e4e5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l815_l829_l818_DUPLICATE_e4e5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l821_c11_9c9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l829_c11_b09a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_left;
     BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_return_output := BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l821_l818_DUPLICATE_ef39 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l821_l818_DUPLICATE_ef39_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l821_l815_l829_l818_DUPLICATE_91dc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l821_l815_l829_l818_DUPLICATE_91dc_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l824_c30_8263] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l824_c30_8263_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_8263_ins;
     sp_relative_shift_uxn_opcodes_h_l824_c30_8263_x <= VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_8263_x;
     sp_relative_shift_uxn_opcodes_h_l824_c30_8263_y <= VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_8263_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_8263_return_output := sp_relative_shift_uxn_opcodes_h_l824_c30_8263_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l827_c21_7be3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l808_c6_e8b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l808_c2_2217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l808_c2_2217_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c6_e8b4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l815_c7_cece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l815_c7_cece_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4367_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l818_c7_2428_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l818_c7_2428_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l818_c11_be43_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l821_c7_f6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_9c9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l829_c11_b09a_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l827_c3_016e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l827_c21_7be3_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l815_l829_l818_DUPLICATE_e4e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l815_l829_l818_DUPLICATE_e4e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l815_l829_l818_DUPLICATE_e4e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l808_l815_l829_l818_DUPLICATE_e4e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l821_l815_l829_l818_DUPLICATE_91dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l821_l815_l829_l818_DUPLICATE_91dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l821_l815_l829_l818_DUPLICATE_91dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l821_l815_l829_l818_DUPLICATE_91dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l808_l815_l829_l818_DUPLICATE_7dd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l808_l815_l829_l818_DUPLICATE_7dd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l808_l815_l829_l818_DUPLICATE_7dd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l808_l815_l829_l818_DUPLICATE_7dd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l821_l818_DUPLICATE_ef39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l821_l818_DUPLICATE_ef39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l808_l821_l815_l818_DUPLICATE_f469_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l808_l821_l815_l818_DUPLICATE_f469_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l808_l821_l815_l818_DUPLICATE_f469_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l808_l821_l815_l818_DUPLICATE_f469_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l824_c30_8263_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue := VAR_result_u8_value_uxn_opcodes_h_l827_c3_016e;
     -- t8_MUX[uxn_opcodes_h_l818_c7_2428] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l818_c7_2428_cond <= VAR_t8_MUX_uxn_opcodes_h_l818_c7_2428_cond;
     t8_MUX_uxn_opcodes_h_l818_c7_2428_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l818_c7_2428_iftrue;
     t8_MUX_uxn_opcodes_h_l818_c7_2428_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l818_c7_2428_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l818_c7_2428_return_output := t8_MUX_uxn_opcodes_h_l818_c7_2428_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l821_c7_f6b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l829_c7_b8ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l829_c7_b8ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l821_c7_f6b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l829_c7_b8ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output;

     -- n8_MUX[uxn_opcodes_h_l821_c7_f6b7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l821_c7_f6b7_cond <= VAR_n8_MUX_uxn_opcodes_h_l821_c7_f6b7_cond;
     n8_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue;
     n8_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output := n8_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l818_c7_2428_iffalse := VAR_n8_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l829_c7_b8ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l815_c7_cece_iffalse := VAR_t8_MUX_uxn_opcodes_h_l818_c7_2428_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l821_c7_f6b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output;

     -- n8_MUX[uxn_opcodes_h_l818_c7_2428] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l818_c7_2428_cond <= VAR_n8_MUX_uxn_opcodes_h_l818_c7_2428_cond;
     n8_MUX_uxn_opcodes_h_l818_c7_2428_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l818_c7_2428_iftrue;
     n8_MUX_uxn_opcodes_h_l818_c7_2428_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l818_c7_2428_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l818_c7_2428_return_output := n8_MUX_uxn_opcodes_h_l818_c7_2428_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l821_c7_f6b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l818_c7_2428] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_cond;
     result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_return_output := result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_return_output;

     -- t8_MUX[uxn_opcodes_h_l815_c7_cece] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l815_c7_cece_cond <= VAR_t8_MUX_uxn_opcodes_h_l815_c7_cece_cond;
     t8_MUX_uxn_opcodes_h_l815_c7_cece_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l815_c7_cece_iftrue;
     t8_MUX_uxn_opcodes_h_l815_c7_cece_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l815_c7_cece_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l815_c7_cece_return_output := t8_MUX_uxn_opcodes_h_l815_c7_cece_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l818_c7_2428] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l821_c7_f6b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l815_c7_cece_iffalse := VAR_n8_MUX_uxn_opcodes_h_l818_c7_2428_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l821_c7_f6b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l818_c7_2428_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l818_c7_2428_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l808_c2_2217_iffalse := VAR_t8_MUX_uxn_opcodes_h_l815_c7_cece_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l818_c7_2428] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l815_c7_cece] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_cond;
     result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_return_output := result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_return_output;

     -- t8_MUX[uxn_opcodes_h_l808_c2_2217] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l808_c2_2217_cond <= VAR_t8_MUX_uxn_opcodes_h_l808_c2_2217_cond;
     t8_MUX_uxn_opcodes_h_l808_c2_2217_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l808_c2_2217_iftrue;
     t8_MUX_uxn_opcodes_h_l808_c2_2217_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l808_c2_2217_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l808_c2_2217_return_output := t8_MUX_uxn_opcodes_h_l808_c2_2217_return_output;

     -- n8_MUX[uxn_opcodes_h_l815_c7_cece] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l815_c7_cece_cond <= VAR_n8_MUX_uxn_opcodes_h_l815_c7_cece_cond;
     n8_MUX_uxn_opcodes_h_l815_c7_cece_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l815_c7_cece_iftrue;
     n8_MUX_uxn_opcodes_h_l815_c7_cece_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l815_c7_cece_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l815_c7_cece_return_output := n8_MUX_uxn_opcodes_h_l815_c7_cece_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l818_c7_2428] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l818_c7_2428] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l815_c7_cece] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l808_c2_2217_iffalse := VAR_n8_MUX_uxn_opcodes_h_l815_c7_cece_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l818_c7_2428_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l818_c7_2428_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l818_c7_2428_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_cece_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l815_c7_cece_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l808_c2_2217_return_output;
     -- n8_MUX[uxn_opcodes_h_l808_c2_2217] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l808_c2_2217_cond <= VAR_n8_MUX_uxn_opcodes_h_l808_c2_2217_cond;
     n8_MUX_uxn_opcodes_h_l808_c2_2217_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l808_c2_2217_iftrue;
     n8_MUX_uxn_opcodes_h_l808_c2_2217_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l808_c2_2217_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l808_c2_2217_return_output := n8_MUX_uxn_opcodes_h_l808_c2_2217_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l808_c2_2217] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_cond;
     result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_return_output := result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l815_c7_cece] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l815_c7_cece] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l815_c7_cece] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l808_c2_2217] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l808_c2_2217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_cece_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_cece_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l815_c7_cece_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l808_c2_2217] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l808_c2_2217] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l808_c2_2217] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l835_l804_DUPLICATE_74be LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l835_l804_DUPLICATE_74be_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l808_c2_2217_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c2_2217_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c2_2217_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c2_2217_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c2_2217_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l835_l804_DUPLICATE_74be_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l835_l804_DUPLICATE_74be_return_output;
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
