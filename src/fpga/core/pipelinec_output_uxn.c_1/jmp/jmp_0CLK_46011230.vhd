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
entity jmp_0CLK_46011230 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_46011230;
architecture arch of jmp_0CLK_46011230 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : signed(7 downto 0) := to_signed(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : signed(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l644_c6_bd49]
signal BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l644_c1_3e3b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l644_c2_5a31]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l644_c2_5a31]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l644_c2_5a31]
signal result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l644_c2_5a31]
signal result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l644_c2_5a31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l644_c2_5a31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l644_c2_5a31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l644_c2_5a31]
signal t8_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : signed(7 downto 0);

-- printf_uxn_opcodes_h_l645_c3_38fd[uxn_opcodes_h_l645_c3_38fd]
signal printf_uxn_opcodes_h_l645_c3_38fd_uxn_opcodes_h_l645_c3_38fd_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l650_c11_4319]
signal BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l650_c7_fd8e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l650_c7_fd8e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l650_c7_fd8e]
signal result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l650_c7_fd8e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l650_c7_fd8e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l650_c7_fd8e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l650_c7_fd8e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l650_c7_fd8e]
signal t8_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l653_c11_7a8f]
signal BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l653_c7_2ad7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l653_c7_2ad7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l653_c7_2ad7]
signal result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l653_c7_2ad7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l653_c7_2ad7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l653_c7_2ad7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l653_c7_2ad7]
signal t8_MUX_uxn_opcodes_h_l653_c7_2ad7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output : signed(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l657_c32_a63f]
signal BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l657_c32_91d7]
signal BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l657_c32_a50b]
signal MUX_uxn_opcodes_h_l657_c32_a50b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l657_c32_a50b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l657_c32_a50b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l657_c32_a50b_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l659_c15_179c]
signal BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l661_c11_5c95]
signal BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l661_c7_a573]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l661_c7_a573]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l661_c7_a573]
signal result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_cc54( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49
BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_left,
BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_right,
BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_return_output);

-- result_pc_MUX_uxn_opcodes_h_l644_c2_5a31
result_pc_MUX_uxn_opcodes_h_l644_c2_5a31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_cond,
result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue,
result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse,
result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31
result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_return_output);

-- t8_MUX_uxn_opcodes_h_l644_c2_5a31
t8_MUX_uxn_opcodes_h_l644_c2_5a31 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l644_c2_5a31_cond,
t8_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue,
t8_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse,
t8_MUX_uxn_opcodes_h_l644_c2_5a31_return_output);

-- printf_uxn_opcodes_h_l645_c3_38fd_uxn_opcodes_h_l645_c3_38fd
printf_uxn_opcodes_h_l645_c3_38fd_uxn_opcodes_h_l645_c3_38fd : entity work.printf_uxn_opcodes_h_l645_c3_38fd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l645_c3_38fd_uxn_opcodes_h_l645_c3_38fd_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319
BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_left,
BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_right,
BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e
result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e
result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_cond,
result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue,
result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse,
result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e
result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e
result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output);

-- t8_MUX_uxn_opcodes_h_l650_c7_fd8e
t8_MUX_uxn_opcodes_h_l650_c7_fd8e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l650_c7_fd8e_cond,
t8_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue,
t8_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse,
t8_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f
BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_left,
BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_right,
BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7
result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7
result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output);

-- result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7
result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_cond,
result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue,
result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse,
result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output);

-- t8_MUX_uxn_opcodes_h_l653_c7_2ad7
t8_MUX_uxn_opcodes_h_l653_c7_2ad7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l653_c7_2ad7_cond,
t8_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue,
t8_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse,
t8_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f
BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_left,
BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_right,
BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7
BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_left,
BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_right,
BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_return_output);

-- MUX_uxn_opcodes_h_l657_c32_a50b
MUX_uxn_opcodes_h_l657_c32_a50b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l657_c32_a50b_cond,
MUX_uxn_opcodes_h_l657_c32_a50b_iftrue,
MUX_uxn_opcodes_h_l657_c32_a50b_iffalse,
MUX_uxn_opcodes_h_l657_c32_a50b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c
BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_left,
BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_right,
BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95
BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_left,
BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_right,
BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573
result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573
result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573
result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_return_output,
 result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_return_output,
 t8_MUX_uxn_opcodes_h_l644_c2_5a31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output,
 result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output,
 t8_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output,
 result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output,
 t8_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_return_output,
 MUX_uxn_opcodes_h_l657_c32_a50b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l647_c3_a5e8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_5a31_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l644_c2_5a31_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l645_c3_38fd_uxn_opcodes_h_l645_c3_38fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l651_c3_fcc9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l650_c7_fd8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l650_c7_fd8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l659_c3_dc5f : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l653_c7_2ad7_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l654_c8_9cb0_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l657_c32_a50b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l657_c32_a50b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l657_c32_a50b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l657_c32_a50b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l644_l661_l650_DUPLICATE_dd7f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l661_l650_DUPLICATE_978d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l644_l650_l653_DUPLICATE_272e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l650_l653_DUPLICATE_7ce8_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l650_l653_DUPLICATE_c59b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l661_l650_l653_DUPLICATE_428b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l667_l640_DUPLICATE_9e66_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : signed(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l657_c32_a50b_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l657_c32_a50b_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l647_c3_a5e8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l647_c3_a5e8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l651_c3_fcc9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l651_c3_fcc9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l661_c11_5c95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_left;
     BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_return_output := BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l650_l653_DUPLICATE_c59b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l650_l653_DUPLICATE_c59b_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l650_c11_4319] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_left;
     BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_return_output := BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l661_l650_l653_DUPLICATE_428b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l661_l650_l653_DUPLICATE_428b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l653_c11_7a8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l644_l661_l650_DUPLICATE_dd7f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l644_l661_l650_DUPLICATE_dd7f_return_output := result.is_sp_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l654_c8_9cb0] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l654_c8_9cb0_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_AND[uxn_opcodes_h_l657_c32_a63f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_left;
     BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_return_output := BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l644_l650_l653_DUPLICATE_272e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l644_l650_l653_DUPLICATE_272e_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l644_c6_bd49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_left;
     BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output := BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l650_c7_fd8e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l650_c7_fd8e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l650_l653_DUPLICATE_7ce8 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l650_l653_DUPLICATE_7ce8_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l661_l650_DUPLICATE_978d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l661_l650_DUPLICATE_978d_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l657_c32_a63f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_5a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l644_c6_bd49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l650_c7_fd8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_4319_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l653_c7_2ad7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l653_c11_7a8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l661_c11_5c95_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l654_c8_9cb0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l654_c8_9cb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l650_l653_DUPLICATE_7ce8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l650_l653_DUPLICATE_7ce8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l644_l650_l653_DUPLICATE_7ce8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l644_l650_l653_DUPLICATE_272e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l644_l650_l653_DUPLICATE_272e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l644_l650_l653_DUPLICATE_272e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l661_l650_l653_DUPLICATE_428b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l661_l650_l653_DUPLICATE_428b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l661_l650_l653_DUPLICATE_428b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l661_l650_DUPLICATE_978d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l661_l650_DUPLICATE_978d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l644_l661_l650_DUPLICATE_978d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l644_l661_l650_DUPLICATE_dd7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l644_l661_l650_DUPLICATE_dd7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l644_l661_l650_DUPLICATE_dd7f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l650_l653_DUPLICATE_c59b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l650_l653_DUPLICATE_c59b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l650_c7_fd8e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l650_c7_fd8e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l661_c7_a573] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l661_c7_a573] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l653_c7_2ad7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output;

     -- t8_MUX[uxn_opcodes_h_l653_c7_2ad7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l653_c7_2ad7_cond <= VAR_t8_MUX_uxn_opcodes_h_l653_c7_2ad7_cond;
     t8_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue;
     t8_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output := t8_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l657_c32_91d7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_left;
     BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_return_output := BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l644_c1_3e3b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l659_c15_179c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l661_c7_a573] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l657_c32_a50b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l657_c32_91d7_return_output;
     VAR_result_pc_uxn_opcodes_h_l659_c3_dc5f := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l659_c15_179c_return_output)),16);
     VAR_printf_uxn_opcodes_h_l645_c3_38fd_uxn_opcodes_h_l645_c3_38fd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l644_c1_3e3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l661_c7_a573_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l661_c7_a573_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l661_c7_a573_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue := VAR_result_pc_uxn_opcodes_h_l659_c3_dc5f;
     -- printf_uxn_opcodes_h_l645_c3_38fd[uxn_opcodes_h_l645_c3_38fd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l645_c3_38fd_uxn_opcodes_h_l645_c3_38fd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l645_c3_38fd_uxn_opcodes_h_l645_c3_38fd_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l653_c7_2ad7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l653_c7_2ad7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output;

     -- t8_MUX[uxn_opcodes_h_l650_c7_fd8e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l650_c7_fd8e_cond <= VAR_t8_MUX_uxn_opcodes_h_l650_c7_fd8e_cond;
     t8_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue;
     t8_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output := t8_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l650_c7_fd8e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l653_c7_2ad7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l653_c7_2ad7] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_cond;
     result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue;
     result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output := result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l644_c2_5a31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_return_output;

     -- MUX[uxn_opcodes_h_l657_c32_a50b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l657_c32_a50b_cond <= VAR_MUX_uxn_opcodes_h_l657_c32_a50b_cond;
     MUX_uxn_opcodes_h_l657_c32_a50b_iftrue <= VAR_MUX_uxn_opcodes_h_l657_c32_a50b_iftrue;
     MUX_uxn_opcodes_h_l657_c32_a50b_iffalse <= VAR_MUX_uxn_opcodes_h_l657_c32_a50b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l657_c32_a50b_return_output := MUX_uxn_opcodes_h_l657_c32_a50b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue := VAR_MUX_uxn_opcodes_h_l657_c32_a50b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse := VAR_t8_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l644_c2_5a31] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l650_c7_fd8e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;

     -- t8_MUX[uxn_opcodes_h_l644_c2_5a31] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l644_c2_5a31_cond <= VAR_t8_MUX_uxn_opcodes_h_l644_c2_5a31_cond;
     t8_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue;
     t8_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l644_c2_5a31_return_output := t8_MUX_uxn_opcodes_h_l644_c2_5a31_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l650_c7_fd8e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_cond;
     result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output := result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l650_c7_fd8e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l653_c7_2ad7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l650_c7_fd8e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l653_c7_2ad7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l644_c2_5a31_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l650_c7_fd8e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l644_c2_5a31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l644_c2_5a31] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l644_c2_5a31] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_cond;
     result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue;
     result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_return_output := result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l644_c2_5a31] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_return_output;

     -- Submodule level 5
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_fd8e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l644_c2_5a31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l667_l640_DUPLICATE_9e66 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l667_l640_DUPLICATE_9e66_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cc54(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l644_c2_5a31_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l644_c2_5a31_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l644_c2_5a31_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l644_c2_5a31_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l644_c2_5a31_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l644_c2_5a31_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l644_c2_5a31_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l667_l640_DUPLICATE_9e66_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc54_uxn_opcodes_h_l667_l640_DUPLICATE_9e66_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
