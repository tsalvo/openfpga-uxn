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
-- Submodules: 27
entity lit_0CLK_62591bf8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit_0CLK_62591bf8;
architecture arch of lit_0CLK_62591bf8 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l184_c6_a5f9]
signal BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l184_c2_98dd]
signal result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l184_c2_98dd]
signal result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l184_c2_98dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l184_c2_98dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l184_c2_98dd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l184_c2_98dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l184_c2_98dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l193_c11_409f]
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l193_c7_2ee6]
signal result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l193_c7_2ee6]
signal result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l193_c7_2ee6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l193_c7_2ee6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l193_c7_2ee6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l193_c7_2ee6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l193_c7_2ee6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l196_c22_c7de]
signal BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l198_c11_10e2]
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l198_c7_4b36]
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l198_c7_4b36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l198_c7_4b36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l198_c7_4b36]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l198_c7_4b36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l204_c11_1cdc]
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_0020]
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l204_c7_0020]
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_f68f( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_pc_updated := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9
BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_left,
BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_right,
BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd
result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_cond,
result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd
result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_cond,
result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd
result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd
result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f
BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_left,
BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_right,
BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6
result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_cond,
result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6
result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_cond,
result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6
result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de
BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_left,
BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_right,
BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2
BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_left,
BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_right,
BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36
result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_cond,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc
BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_left,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_right,
BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l189_c3_7376 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l196_c3_f70d : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l193_c7_2ee6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_6fdd : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l193_c7_2ee6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l201_c3_e5c1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l184_l193_DUPLICATE_c4dd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l184_l204_l193_DUPLICATE_ab3e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l198_l184_DUPLICATE_272b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l184_l193_DUPLICATE_32ac_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l193_DUPLICATE_0144_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f68f_uxn_opcodes_h_l209_l180_DUPLICATE_3bbd_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l201_c3_e5c1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l201_c3_e5c1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_6fdd := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l194_c3_6fdd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l189_c3_7376 := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l189_c3_7376;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_right := to_unsigned(3, 2);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue := VAR_previous_ram_read;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l198_l184_DUPLICATE_272b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l198_l184_DUPLICATE_272b_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l184_c6_a5f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l193_c11_409f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_left;
     BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_return_output := BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l196_c22_c7de] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_left;
     BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_return_output := BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l184_l204_l193_DUPLICATE_ab3e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l184_l204_l193_DUPLICATE_ab3e_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l184_l193_DUPLICATE_c4dd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l184_l193_DUPLICATE_c4dd_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l193_DUPLICATE_0144 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l193_DUPLICATE_0144_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l184_l193_DUPLICATE_32ac LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l184_l193_DUPLICATE_32ac_return_output := result.stack_address_sp_offset;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l193_c7_2ee6] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l193_c7_2ee6_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l204_c11_1cdc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_left;
     BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_return_output := BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l193_c7_2ee6] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l193_c7_2ee6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l198_c11_10e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c6_a5f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l193_c11_409f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l198_c11_10e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l204_c11_1cdc_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l196_c3_f70d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l196_c22_c7de_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l193_DUPLICATE_0144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l193_DUPLICATE_0144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l198_l204_l193_DUPLICATE_0144_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l198_l184_DUPLICATE_272b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l198_l184_DUPLICATE_272b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l184_l204_l193_DUPLICATE_ab3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l184_l204_l193_DUPLICATE_ab3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l184_l204_l193_DUPLICATE_ab3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l184_l193_DUPLICATE_32ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l184_l193_DUPLICATE_32ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l198_l184_l193_DUPLICATE_32ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l184_l193_DUPLICATE_c4dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l184_l193_DUPLICATE_c4dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l198_l184_l193_DUPLICATE_c4dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l193_c7_2ee6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l193_c7_2ee6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue := VAR_result_u16_value_uxn_opcodes_h_l196_c3_f70d;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l204_c7_0020] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l198_c7_4b36] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l198_c7_4b36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l193_c7_2ee6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output := result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l198_c7_4b36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_return_output := result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l193_c7_2ee6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l204_c7_0020] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l204_c7_0020_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l198_c7_4b36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l204_c7_0020_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l198_c7_4b36_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l198_c7_4b36_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l193_c7_2ee6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l193_c7_2ee6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l198_c7_4b36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l184_c2_98dd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_return_output := result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l193_c7_2ee6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output := result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l198_c7_4b36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l184_c2_98dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l198_c7_4b36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l198_c7_4b36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l193_c7_2ee6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l184_c2_98dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l184_c2_98dd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l193_c7_2ee6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l184_c2_98dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_return_output := result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l193_c7_2ee6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l184_c2_98dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l184_c2_98dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f68f_uxn_opcodes_h_l209_l180_DUPLICATE_3bbd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f68f_uxn_opcodes_h_l209_l180_DUPLICATE_3bbd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f68f(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l184_c2_98dd_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l184_c2_98dd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l184_c2_98dd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c2_98dd_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c2_98dd_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l184_c2_98dd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l184_c2_98dd_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f68f_uxn_opcodes_h_l209_l180_DUPLICATE_3bbd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f68f_uxn_opcodes_h_l209_l180_DUPLICATE_3bbd_return_output;
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
