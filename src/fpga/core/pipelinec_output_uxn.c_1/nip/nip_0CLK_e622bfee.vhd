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
entity nip_0CLK_e622bfee is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip_0CLK_e622bfee;
architecture arch of nip_0CLK_e622bfee is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2106_c6_6387]
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2106_c2_b968]
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c2_b968]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c2_b968]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c2_b968]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c2_b968]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2106_c2_b968]
signal t8_MUX_uxn_opcodes_h_l2106_c2_b968_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2106_c2_b968_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2113_c11_801c]
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2113_c7_af76]
signal result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2113_c7_af76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2113_c7_af76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2113_c7_af76]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2113_c7_af76]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2113_c7_af76]
signal t8_MUX_uxn_opcodes_h_l2113_c7_af76_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2113_c7_af76_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_f9db]
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2116_c7_5a65]
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_5a65]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_5a65]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_5a65]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_5a65]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2116_c7_5a65]
signal t8_MUX_uxn_opcodes_h_l2116_c7_5a65_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2119_c30_852b]
signal sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2124_c11_2c93]
signal BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2124_c7_636c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2124_c7_636c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2124_c7_636c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_return_output : signed(3 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387
BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_left,
BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_right,
BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968
result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_cond,
result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_return_output);

-- t8_MUX_uxn_opcodes_h_l2106_c2_b968
t8_MUX_uxn_opcodes_h_l2106_c2_b968 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2106_c2_b968_cond,
t8_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue,
t8_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse,
t8_MUX_uxn_opcodes_h_l2106_c2_b968_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_left,
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_right,
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76
result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_cond,
result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_return_output);

-- t8_MUX_uxn_opcodes_h_l2113_c7_af76
t8_MUX_uxn_opcodes_h_l2113_c7_af76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2113_c7_af76_cond,
t8_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue,
t8_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse,
t8_MUX_uxn_opcodes_h_l2113_c7_af76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_left,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_right,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_cond,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output);

-- t8_MUX_uxn_opcodes_h_l2116_c7_5a65
t8_MUX_uxn_opcodes_h_l2116_c7_5a65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2116_c7_5a65_cond,
t8_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue,
t8_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse,
t8_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2119_c30_852b
sp_relative_shift_uxn_opcodes_h_l2119_c30_852b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_ins,
sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_x,
sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_y,
sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93
BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_left,
BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_right,
BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_return_output,
 t8_MUX_uxn_opcodes_h_l2106_c2_b968_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_return_output,
 t8_MUX_uxn_opcodes_h_l2113_c7_af76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output,
 t8_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output,
 sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_2129 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2113_c7_af76_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2106_c2_b968_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2106_c2_b968_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_9f67 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2113_c7_af76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2121_c3_8f88 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_c7_5a65_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2116_c7_5a65_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2125_c3_c52a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2116_l2106_DUPLICATE_c1ea_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2113_l2106_l2124_DUPLICATE_81fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2113_l2106_l2124_DUPLICATE_c09f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2113_l2116_l2124_DUPLICATE_0f3f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2102_l2130_DUPLICATE_cca9_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2121_c3_8f88 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2121_c3_8f88;
     VAR_sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2125_c3_c52a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2125_c3_c52a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_9f67 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_9f67;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_2129 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2110_c3_2129;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l2119_c30_852b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_ins;
     sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_x;
     sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_return_output := sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2124_c11_2c93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_left;
     BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_return_output := BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2113_l2116_l2124_DUPLICATE_0f3f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2113_l2116_l2124_DUPLICATE_0f3f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2113_c11_801c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_f9db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2106_c6_6387] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_left;
     BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_return_output := BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2116_c7_5a65] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_c7_5a65_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2113_l2106_l2124_DUPLICATE_c09f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2113_l2106_l2124_DUPLICATE_c09f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2116_l2106_DUPLICATE_c1ea LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2116_l2106_DUPLICATE_c1ea_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2113_l2106_l2124_DUPLICATE_81fe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2113_l2106_l2124_DUPLICATE_81fe_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2106_c2_b968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c6_6387_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2113_c7_af76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_801c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2116_c7_5a65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_f9db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2124_c11_2c93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2113_l2106_l2124_DUPLICATE_c09f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2113_l2106_l2124_DUPLICATE_c09f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2113_l2106_l2124_DUPLICATE_c09f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2113_l2116_l2124_DUPLICATE_0f3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2113_l2116_l2124_DUPLICATE_0f3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2113_l2116_l2124_DUPLICATE_0f3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2113_l2106_l2124_DUPLICATE_81fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2113_l2106_l2124_DUPLICATE_81fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2113_l2106_l2124_DUPLICATE_81fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2116_l2106_DUPLICATE_c1ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2116_l2106_DUPLICATE_c1ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2116_l2106_DUPLICATE_c1ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_c7_5a65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2119_c30_852b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2116_c7_5a65] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output := result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2124_c7_636c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2124_c7_636c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2124_c7_636c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_5a65] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output;

     -- t8_MUX[uxn_opcodes_h_l2116_c7_5a65] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2116_c7_5a65_cond <= VAR_t8_MUX_uxn_opcodes_h_l2116_c7_5a65_cond;
     t8_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue;
     t8_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output := t8_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2124_c7_636c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2124_c7_636c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2124_c7_636c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_5a65] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2113_c7_af76] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_return_output := result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_5a65] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_5a65] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2113_c7_af76] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_return_output;

     -- t8_MUX[uxn_opcodes_h_l2113_c7_af76] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2113_c7_af76_cond <= VAR_t8_MUX_uxn_opcodes_h_l2113_c7_af76_cond;
     t8_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue;
     t8_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2113_c7_af76_return_output := t8_MUX_uxn_opcodes_h_l2113_c7_af76_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_5a65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_af76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c7_af76_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2113_c7_af76_return_output;
     -- t8_MUX[uxn_opcodes_h_l2106_c2_b968] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2106_c2_b968_cond <= VAR_t8_MUX_uxn_opcodes_h_l2106_c2_b968_cond;
     t8_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue;
     t8_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2106_c2_b968_return_output := t8_MUX_uxn_opcodes_h_l2106_c2_b968_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c2_b968] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2113_c7_af76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2113_c7_af76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2113_c7_af76] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2106_c2_b968] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_return_output := result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_af76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_af76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_af76_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2106_c2_b968_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c2_b968] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c2_b968] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c2_b968] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2102_l2130_DUPLICATE_cca9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2102_l2130_DUPLICATE_cca9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c2_b968_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c2_b968_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c2_b968_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c2_b968_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c2_b968_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2102_l2130_DUPLICATE_cca9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2102_l2130_DUPLICATE_cca9_return_output;
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
