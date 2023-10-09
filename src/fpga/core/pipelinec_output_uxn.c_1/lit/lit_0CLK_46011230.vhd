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
-- Submodules: 35
entity lit_0CLK_46011230 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit_0CLK_46011230;
architecture arch of lit_0CLK_46011230 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l201_c6_d033]
signal BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l201_c1_aa8c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l201_c2_404c]
signal result_pc_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l201_c2_404c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l201_c2_404c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l201_c2_404c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l201_c2_404c]
signal result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l201_c2_404c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l201_c2_404c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l201_c2_404c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l201_c2_404c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l201_c2_404c]
signal result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l202_c3_e187[uxn_opcodes_h_l202_c3_e187]
signal printf_uxn_opcodes_h_l202_c3_e187_uxn_opcodes_h_l202_c3_e187_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l209_c11_feb9]
signal BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l209_c7_8311]
signal result_pc_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l209_c7_8311]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l209_c7_8311]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l209_c7_8311]
signal result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l209_c7_8311]
signal result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l209_c7_8311]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l209_c7_8311]
signal result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l209_c7_8311]
signal result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l209_c7_8311]
signal result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l213_c15_0ff6]
signal BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l215_c11_8500]
signal BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l215_c7_6c52]
signal result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l215_c7_6c52]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l215_c7_6c52]
signal result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l215_c7_6c52]
signal result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l215_c7_6c52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l215_c7_6c52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l222_c11_0414]
signal BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l222_c7_27ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l222_c7_27ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_cb37( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.pc := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_ram_read := ref_toks_8;
      base.is_stack_write := ref_toks_9;
      base.ram_addr := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033
BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_left,
BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_right,
BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l201_c2_404c
result_pc_MUX_uxn_opcodes_h_l201_c2_404c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l201_c2_404c_cond,
result_pc_MUX_uxn_opcodes_h_l201_c2_404c_iftrue,
result_pc_MUX_uxn_opcodes_h_l201_c2_404c_iffalse,
result_pc_MUX_uxn_opcodes_h_l201_c2_404c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c
result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c
result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_cond,
result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c
result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c
result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c
result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c
result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_return_output);

-- printf_uxn_opcodes_h_l202_c3_e187_uxn_opcodes_h_l202_c3_e187
printf_uxn_opcodes_h_l202_c3_e187_uxn_opcodes_h_l202_c3_e187 : entity work.printf_uxn_opcodes_h_l202_c3_e187_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l202_c3_e187_uxn_opcodes_h_l202_c3_e187_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9
BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_left,
BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_right,
BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output);

-- result_pc_MUX_uxn_opcodes_h_l209_c7_8311
result_pc_MUX_uxn_opcodes_h_l209_c7_8311 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l209_c7_8311_cond,
result_pc_MUX_uxn_opcodes_h_l209_c7_8311_iftrue,
result_pc_MUX_uxn_opcodes_h_l209_c7_8311_iffalse,
result_pc_MUX_uxn_opcodes_h_l209_c7_8311_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311
result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311
result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311
result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_cond,
result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311
result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311
result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311
result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311
result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_cond,
result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6
BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_left,
BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_right,
BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500
BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_left,
BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_right,
BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52
result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52
result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52
result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_cond,
result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52
result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52
result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414
BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_left,
BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_right,
BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff
result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff
result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_return_output,
 result_pc_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output,
 result_pc_MUX_uxn_opcodes_h_l209_c7_8311_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l204_c3_10be : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l201_c2_404c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l202_c3_e187_uxn_opcodes_h_l202_c3_e187_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l213_c3_c7c3 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l209_c7_8311_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l219_c3_312d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l201_l209_DUPLICATE_5e32_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l201_l215_DUPLICATE_319f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l201_l209_l215_DUPLICATE_d046_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l201_l209_l215_DUPLICATE_d773_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l201_l222_l209_DUPLICATE_8099_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l222_l209_l215_DUPLICATE_3f15_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l209_l215_DUPLICATE_e25d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l227_l197_DUPLICATE_001e_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l204_c3_10be := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l204_c3_10be;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l219_c3_312d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l219_c3_312d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue := VAR_previous_ram_read;
     -- BIN_OP_PLUS[uxn_opcodes_h_l213_c15_0ff6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l201_l222_l209_DUPLICATE_8099 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l201_l222_l209_DUPLICATE_8099_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l201_l209_l215_DUPLICATE_d773 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l201_l209_l215_DUPLICATE_d773_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l201_l215_DUPLICATE_319f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l201_l215_DUPLICATE_319f_return_output := result.is_pc_updated;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l201_c2_404c] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l201_c2_404c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l209_l215_DUPLICATE_e25d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l209_l215_DUPLICATE_e25d_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l201_l209_l215_DUPLICATE_d046 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l201_l209_l215_DUPLICATE_d046_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l222_c11_0414] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_left;
     BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_return_output := BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l201_c6_d033] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_left;
     BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output := BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l209_c11_feb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l222_l209_l215_DUPLICATE_3f15 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l222_l209_l215_DUPLICATE_3f15_return_output := result.is_opc_done;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l209_c7_8311] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l209_c7_8311_return_output := result.ram_addr;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l209_c7_8311] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l209_c7_8311_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l201_l209_DUPLICATE_5e32 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l201_l209_DUPLICATE_5e32_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l215_c11_8500] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_left;
     BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_return_output := BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l201_c2_404c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l201_c6_d033_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l209_c7_8311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l209_c11_feb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l215_c11_8500_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l222_c11_0414_return_output;
     VAR_result_pc_uxn_opcodes_h_l213_c3_c7c3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l213_c15_0ff6_return_output, 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l201_c2_404c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l201_l209_DUPLICATE_5e32_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l209_c7_8311_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l201_l209_DUPLICATE_5e32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l222_l209_l215_DUPLICATE_3f15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l222_l209_l215_DUPLICATE_3f15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l222_l209_l215_DUPLICATE_3f15_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l201_l215_DUPLICATE_319f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l201_l215_DUPLICATE_319f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l209_l215_DUPLICATE_e25d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l209_l215_DUPLICATE_e25d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l201_l222_l209_DUPLICATE_8099_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l201_l222_l209_DUPLICATE_8099_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l201_l222_l209_DUPLICATE_8099_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l201_l209_l215_DUPLICATE_d773_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l201_l209_l215_DUPLICATE_d773_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l201_l209_l215_DUPLICATE_d773_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l201_l209_l215_DUPLICATE_d046_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l201_l209_l215_DUPLICATE_d046_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l201_l209_l215_DUPLICATE_d046_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l209_c7_8311_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l209_c7_8311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l201_c2_404c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l209_c7_8311_iftrue := VAR_result_pc_uxn_opcodes_h_l213_c3_c7c3;
     -- result_ram_addr_MUX[uxn_opcodes_h_l209_c7_8311] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_return_output := result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l215_c7_6c52] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l209_c7_8311] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l222_c7_27ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l215_c7_6c52] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_cond;
     result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_return_output := result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l209_c7_8311] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l209_c7_8311_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l209_c7_8311_cond;
     result_pc_MUX_uxn_opcodes_h_l209_c7_8311_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l209_c7_8311_iftrue;
     result_pc_MUX_uxn_opcodes_h_l209_c7_8311_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l209_c7_8311_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l209_c7_8311_return_output := result_pc_MUX_uxn_opcodes_h_l209_c7_8311_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l201_c2_404c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l222_c7_27ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l215_c7_6c52] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l201_c1_aa8c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l215_c7_6c52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l202_c3_e187_uxn_opcodes_h_l202_c3_e187_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l201_c1_aa8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l222_c7_27ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l215_c7_6c52_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l215_c7_6c52_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l209_c7_8311_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l222_c7_27ff_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l201_c2_404c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l209_c7_8311_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l209_c7_8311_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l215_c7_6c52_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l215_c7_6c52_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l201_c2_404c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l209_c7_8311] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l209_c7_8311] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l209_c7_8311] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_cond;
     result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_return_output := result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l215_c7_6c52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l201_c2_404c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l201_c2_404c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l201_c2_404c_cond;
     result_pc_MUX_uxn_opcodes_h_l201_c2_404c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l201_c2_404c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l201_c2_404c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l201_c2_404c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l201_c2_404c_return_output := result_pc_MUX_uxn_opcodes_h_l201_c2_404c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l215_c7_6c52] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_return_output;

     -- printf_uxn_opcodes_h_l202_c3_e187[uxn_opcodes_h_l202_c3_e187] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l202_c3_e187_uxn_opcodes_h_l202_c3_e187_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l202_c3_e187_uxn_opcodes_h_l202_c3_e187_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l201_c2_404c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l209_c7_8311] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l215_c7_6c52_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l209_c7_8311_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l209_c7_8311_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l215_c7_6c52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l209_c7_8311_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l209_c7_8311_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l201_c2_404c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_return_output := result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l201_c2_404c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l209_c7_8311] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l201_c2_404c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l201_c2_404c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l209_c7_8311] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l209_c7_8311_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l209_c7_8311_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l201_c2_404c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l201_c2_404c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l227_l197_DUPLICATE_001e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l227_l197_DUPLICATE_001e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cb37(
     result,
     VAR_result_pc_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l201_c2_404c_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l201_c2_404c_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l227_l197_DUPLICATE_001e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l227_l197_DUPLICATE_001e_return_output;
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
