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
-- BIN_OP_EQ[uxn_opcodes_h_l191_c6_eec6]
signal BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l191_c1_767a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l191_c2_e3a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l191_c2_e3a0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l191_c2_e3a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l191_c2_e3a0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l191_c2_e3a0]
signal result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l191_c2_e3a0]
signal result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l191_c2_e3a0]
signal result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l191_c2_e3a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l191_c2_e3a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l192_c3_013f[uxn_opcodes_h_l192_c3_013f]
signal printf_uxn_opcodes_h_l192_c3_013f_uxn_opcodes_h_l192_c3_013f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l198_c11_eecc]
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l198_c7_712d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l198_c7_712d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l198_c7_712d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l198_c7_712d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l198_c7_712d]
signal result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l198_c7_712d]
signal result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l198_c7_712d]
signal result_pc_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l198_c7_712d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l202_c15_9471]
signal BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l204_c11_6c3a]
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l204_c7_088b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l204_c7_088b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l204_c7_088b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l204_c7_088b]
signal result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_088b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l210_c11_76c6]
signal BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l210_c7_fa9b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l210_c7_fa9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_0f75( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.pc := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6
BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_left,
BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_right,
BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0
result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_cond,
result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0
result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0
result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_cond,
result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue,
result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse,
result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output);

-- printf_uxn_opcodes_h_l192_c3_013f_uxn_opcodes_h_l192_c3_013f
printf_uxn_opcodes_h_l192_c3_013f_uxn_opcodes_h_l192_c3_013f : entity work.printf_uxn_opcodes_h_l192_c3_013f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l192_c3_013f_uxn_opcodes_h_l192_c3_013f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc
BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_left,
BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_right,
BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d
result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_cond,
result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d
result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l198_c7_712d
result_pc_MUX_uxn_opcodes_h_l198_c7_712d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l198_c7_712d_cond,
result_pc_MUX_uxn_opcodes_h_l198_c7_712d_iftrue,
result_pc_MUX_uxn_opcodes_h_l198_c7_712d_iffalse,
result_pc_MUX_uxn_opcodes_h_l198_c7_712d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471
BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_left,
BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_right,
BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a
BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_left,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_right,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b
result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_cond,
result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6
BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_left,
BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_right,
BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
 result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_return_output,
 result_pc_MUX_uxn_opcodes_h_l198_c7_712d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_adef : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l191_c2_e3a0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l192_c3_013f_uxn_opcodes_h_l192_c3_013f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l198_c7_712d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l202_c3_fb1e : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l207_c3_f8c8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l191_l210_DUPLICATE_5377_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_443f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_72b0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_c8b3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l198_l191_DUPLICATE_e72b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l210_DUPLICATE_721a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0f75_uxn_opcodes_h_l187_l215_DUPLICATE_5c05_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_adef := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_adef;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l207_c3_f8c8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l207_c3_f8c8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_iftrue := VAR_previous_ram_read;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_443f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_443f_return_output := result.stack_address_sp_offset;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l198_c7_712d] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l198_c7_712d_return_output := result.ram_addr;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l191_c2_e3a0] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l191_c2_e3a0_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_72b0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_72b0_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_c8b3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_c8b3_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l191_c6_eec6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_left;
     BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output := BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l198_l191_DUPLICATE_e72b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l198_l191_DUPLICATE_e72b_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l210_DUPLICATE_721a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l210_DUPLICATE_721a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l204_c11_6c3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l210_c11_76c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l191_l210_DUPLICATE_5377 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l191_l210_DUPLICATE_5377_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l202_c15_9471] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_left;
     BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_return_output := BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l198_c7_712d] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_712d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l198_c11_eecc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_left;
     BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_return_output := BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_eec6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_712d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_eecc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_6c3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_76c6_return_output;
     VAR_result_pc_uxn_opcodes_h_l202_c3_fb1e := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_9471_return_output, 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l198_l191_DUPLICATE_e72b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_712d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l198_l191_DUPLICATE_e72b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l210_DUPLICATE_721a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l210_DUPLICATE_721a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l210_DUPLICATE_721a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_72b0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_72b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l191_l210_DUPLICATE_5377_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l191_l210_DUPLICATE_5377_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l191_l210_DUPLICATE_5377_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_443f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_443f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_443f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_c8b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_c8b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_c8b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_712d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l198_c7_712d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l191_c2_e3a0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_712d_iftrue := VAR_result_pc_uxn_opcodes_h_l202_c3_fb1e;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l191_c1_767a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l210_c7_fa9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l198_c7_712d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l204_c7_088b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l198_c7_712d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l198_c7_712d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_712d_cond;
     result_pc_MUX_uxn_opcodes_h_l198_c7_712d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_712d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l198_c7_712d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_712d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_712d_return_output := result_pc_MUX_uxn_opcodes_h_l198_c7_712d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l191_c2_e3a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l198_c7_712d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l204_c7_088b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l210_c7_fa9b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l204_c7_088b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_return_output := result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l192_c3_013f_uxn_opcodes_h_l192_c3_013f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l191_c1_767a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_fa9b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_088b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_712d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_fa9b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_712d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_712d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_088b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_088b_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l191_c2_e3a0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_cond;
     result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output := result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l191_c2_e3a0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l191_c2_e3a0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l198_c7_712d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l198_c7_712d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_return_output;

     -- printf_uxn_opcodes_h_l192_c3_013f[uxn_opcodes_h_l192_c3_013f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l192_c3_013f_uxn_opcodes_h_l192_c3_013f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l192_c3_013f_uxn_opcodes_h_l192_c3_013f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l204_c7_088b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_088b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l198_c7_712d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_return_output := result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_088b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_712d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_088b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_712d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_712d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l198_c7_712d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l191_c2_e3a0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l191_c2_e3a0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output := result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l191_c2_e3a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l198_c7_712d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_712d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_712d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l191_c2_e3a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l191_c2_e3a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0f75_uxn_opcodes_h_l187_l215_DUPLICATE_5c05 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0f75_uxn_opcodes_h_l187_l215_DUPLICATE_5c05_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0f75(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_e3a0_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0f75_uxn_opcodes_h_l187_l215_DUPLICATE_5c05_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0f75_uxn_opcodes_h_l187_l215_DUPLICATE_5c05_return_output;
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
