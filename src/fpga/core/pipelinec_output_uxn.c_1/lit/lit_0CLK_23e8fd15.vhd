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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 30
entity lit_0CLK_23e8fd15 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit_0CLK_23e8fd15;
architecture arch of lit_0CLK_23e8fd15 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l191_c6_1dc4]
signal BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l191_c2_ee53]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l191_c2_ee53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l191_c2_ee53]
signal result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l191_c2_ee53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l191_c2_ee53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l191_c2_ee53]
signal result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l191_c2_ee53]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l191_c2_ee53]
signal result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l191_c2_ee53]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l198_c11_17e0]
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l198_c7_cb47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l198_c7_cb47]
signal result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l198_c7_cb47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l198_c7_cb47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l198_c7_cb47]
signal result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l198_c7_cb47]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l198_c7_cb47]
signal result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l198_c7_cb47]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l202_c15_ae64]
signal BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l204_c11_eb2a]
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l204_c7_068c]
signal result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l204_c7_068c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l204_c7_068c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l204_c7_068c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_068c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l210_c11_acca]
signal BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l210_c7_9aeb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l210_c7_9aeb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_610b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.pc := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_value := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.ram_addr := ref_toks_8;
      base.is_sp_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4
BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_left,
BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_right,
BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_return_output);

-- result_pc_MUX_uxn_opcodes_h_l191_c2_ee53
result_pc_MUX_uxn_opcodes_h_l191_c2_ee53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_cond,
result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue,
result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse,
result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53
result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_cond,
result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53
result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_cond,
result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0
BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_left,
BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_right,
BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_return_output);

-- result_pc_MUX_uxn_opcodes_h_l198_c7_cb47
result_pc_MUX_uxn_opcodes_h_l198_c7_cb47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_cond,
result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue,
result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse,
result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47
result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_cond,
result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47
result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_cond,
result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64
BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_left,
BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_right,
BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a
BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_left,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_right,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c
result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_cond,
result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca
BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_left,
BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_right,
BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
 result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_return_output,
 result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_ca45 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l191_c2_ee53_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l202_c3_eb5b : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_cb47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l207_c3_c18f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_5496_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l198_l191_DUPLICATE_5dd3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l191_l210_DUPLICATE_13cc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_7e20_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_6e1d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l210_DUPLICATE_2b06_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l187_l215_DUPLICATE_38da_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l207_c3_c18f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l207_c3_c18f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_ca45 := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_ca45;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_right := to_unsigned(1, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_iftrue := VAR_previous_ram_read;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l210_DUPLICATE_2b06 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l210_DUPLICATE_2b06_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l202_c15_ae64] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_left;
     BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_return_output := BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l204_c11_eb2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l191_c2_ee53] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l191_c2_ee53_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_7e20 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_7e20_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_5496 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_5496_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l191_c6_1dc4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_left;
     BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output := BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l191_l210_DUPLICATE_13cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l191_l210_DUPLICATE_13cc_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_6e1d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_6e1d_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l198_c11_17e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l198_c7_cb47] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_cb47_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l210_c11_acca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_left;
     BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_return_output := BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_return_output;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l198_c7_cb47] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l198_c7_cb47_return_output := result.ram_addr;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l198_l191_DUPLICATE_5dd3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l198_l191_DUPLICATE_5dd3_return_output := result.pc;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l191_c6_1dc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_17e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_eb2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l210_c11_acca_return_output;
     VAR_result_pc_uxn_opcodes_h_l202_c3_eb5b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l202_c15_ae64_return_output, 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l198_l191_DUPLICATE_5dd3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l198_l191_DUPLICATE_5dd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l210_DUPLICATE_2b06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l210_DUPLICATE_2b06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l210_DUPLICATE_2b06_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_6e1d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l204_l191_DUPLICATE_6e1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l191_l210_DUPLICATE_13cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l191_l210_DUPLICATE_13cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l198_l191_l210_DUPLICATE_13cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_5496_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_5496_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_5496_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_7e20_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_7e20_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l198_l204_l191_DUPLICATE_7e20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l198_c7_cb47_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l198_c7_cb47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l191_c2_ee53_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue := VAR_result_pc_uxn_opcodes_h_l202_c3_eb5b;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l204_c7_068c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l204_c7_068c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l191_c2_ee53] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l204_c7_068c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_return_output := result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l210_c7_9aeb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l198_c7_cb47] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_return_output := result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l198_c7_cb47] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l210_c7_9aeb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l198_c7_cb47] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_cond;
     result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue;
     result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_return_output := result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l210_c7_9aeb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l204_c7_068c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l210_c7_9aeb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l204_c7_068c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l204_c7_068c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l198_c7_cb47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l191_c2_ee53] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l191_c2_ee53] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_return_output := result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l198_c7_cb47] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_068c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l198_c7_cb47] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_cond;
     result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_return_output := result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l204_c7_068c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l191_c2_ee53] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_cond;
     result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue;
     result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_return_output := result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_068c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_068c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l191_c2_ee53] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l191_c2_ee53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l191_c2_ee53] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_cond;
     result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_return_output := result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l198_c7_cb47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l198_c7_cb47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_cb47_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l191_c2_ee53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l191_c2_ee53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l187_l215_DUPLICATE_38da LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l187_l215_DUPLICATE_38da_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_610b(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l191_c2_ee53_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l191_c2_ee53_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l187_l215_DUPLICATE_38da_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_610b_uxn_opcodes_h_l187_l215_DUPLICATE_38da_return_output;
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
