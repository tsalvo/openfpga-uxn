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
-- Submodules: 79
entity mul2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_f74041be;
architecture arch of mul2_0CLK_f74041be is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1906_c6_723d]
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1906_c1_4035]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1906_c2_28cd]
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1906_c2_28cd]
signal n16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c2_28cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c2_28cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1906_c2_28cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1906_c2_28cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c2_28cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1906_c2_28cd]
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1906_c2_28cd]
signal t16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1907_c3_00bd[uxn_opcodes_h_l1907_c3_00bd]
signal printf_uxn_opcodes_h_l1907_c3_00bd_uxn_opcodes_h_l1907_c3_00bd_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_f23b]
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1911_c7_9983]
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1911_c7_9983]
signal n16_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_9983]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_9983]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_9983]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_9983]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_9983]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1911_c7_9983]
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1911_c7_9983]
signal t16_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_5f77]
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1914_c7_c515]
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1914_c7_c515]
signal n16_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c7_c515]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_c515]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1914_c7_c515]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1914_c7_c515]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_c515]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1914_c7_c515]
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1914_c7_c515]
signal t16_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1919_c11_3d47]
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1919_c7_9968]
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1919_c7_9968]
signal n16_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1919_c7_9968]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1919_c7_9968]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1919_c7_9968]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1919_c7_9968]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1919_c7_9968]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1919_c7_9968]
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1919_c7_9968]
signal t16_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1920_c3_0012]
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1923_c11_f886]
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1923_c7_5eee]
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1923_c7_5eee]
signal n16_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1923_c7_5eee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1923_c7_5eee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1923_c7_5eee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1923_c7_5eee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1923_c7_5eee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1923_c7_5eee]
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1927_c11_8de3]
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1927_c7_da7f]
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1927_c7_da7f]
signal n16_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1927_c7_da7f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1927_c7_da7f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1927_c7_da7f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1927_c7_da7f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1927_c7_da7f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1927_c7_da7f]
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1928_c3_5336]
signal BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1929_c11_6e7a]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1931_c30_c93d]
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1936_c11_669e]
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1936_c7_d770]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1936_c7_d770]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1936_c7_d770]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1936_c7_d770]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1936_c7_d770]
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1939_c31_40b8]
signal CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_374e]
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_2ac3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_2ac3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_left,
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_right,
BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd
tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond,
tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output);

-- n16_MUX_uxn_opcodes_h_l1906_c2_28cd
n16_MUX_uxn_opcodes_h_l1906_c2_28cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond,
n16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue,
n16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse,
n16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output);

-- t16_MUX_uxn_opcodes_h_l1906_c2_28cd
t16_MUX_uxn_opcodes_h_l1906_c2_28cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond,
t16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue,
t16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse,
t16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output);

-- printf_uxn_opcodes_h_l1907_c3_00bd_uxn_opcodes_h_l1907_c3_00bd
printf_uxn_opcodes_h_l1907_c3_00bd_uxn_opcodes_h_l1907_c3_00bd : entity work.printf_uxn_opcodes_h_l1907_c3_00bd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1907_c3_00bd_uxn_opcodes_h_l1907_c3_00bd_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_left,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_right,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1911_c7_9983
tmp16_MUX_uxn_opcodes_h_l1911_c7_9983 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_cond,
tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue,
tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse,
tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output);

-- n16_MUX_uxn_opcodes_h_l1911_c7_9983
n16_MUX_uxn_opcodes_h_l1911_c7_9983 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1911_c7_9983_cond,
n16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue,
n16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse,
n16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_cond,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_return_output);

-- t16_MUX_uxn_opcodes_h_l1911_c7_9983
t16_MUX_uxn_opcodes_h_l1911_c7_9983 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1911_c7_9983_cond,
t16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue,
t16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse,
t16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_left,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_right,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1914_c7_c515
tmp16_MUX_uxn_opcodes_h_l1914_c7_c515 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_cond,
tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue,
tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse,
tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output);

-- n16_MUX_uxn_opcodes_h_l1914_c7_c515
n16_MUX_uxn_opcodes_h_l1914_c7_c515 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1914_c7_c515_cond,
n16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue,
n16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse,
n16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_cond,
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_return_output);

-- t16_MUX_uxn_opcodes_h_l1914_c7_c515
t16_MUX_uxn_opcodes_h_l1914_c7_c515 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1914_c7_c515_cond,
t16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue,
t16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse,
t16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_left,
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_right,
BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1919_c7_9968
tmp16_MUX_uxn_opcodes_h_l1919_c7_9968 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_cond,
tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue,
tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse,
tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output);

-- n16_MUX_uxn_opcodes_h_l1919_c7_9968
n16_MUX_uxn_opcodes_h_l1919_c7_9968 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1919_c7_9968_cond,
n16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue,
n16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse,
n16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_cond,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_return_output);

-- t16_MUX_uxn_opcodes_h_l1919_c7_9968
t16_MUX_uxn_opcodes_h_l1919_c7_9968 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1919_c7_9968_cond,
t16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue,
t16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse,
t16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012
BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_left,
BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_right,
BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_left,
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_right,
BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee
tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_cond,
tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue,
tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse,
tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output);

-- n16_MUX_uxn_opcodes_h_l1923_c7_5eee
n16_MUX_uxn_opcodes_h_l1923_c7_5eee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1923_c7_5eee_cond,
n16_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue,
n16_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse,
n16_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_cond,
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_left,
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_right,
BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f
tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_cond,
tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output);

-- n16_MUX_uxn_opcodes_h_l1927_c7_da7f
n16_MUX_uxn_opcodes_h_l1927_c7_da7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1927_c7_da7f_cond,
n16_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue,
n16_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse,
n16_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336
BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_left,
BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_right,
BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d
sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_ins,
sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_x,
sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_y,
sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_left,
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_right,
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_cond,
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8
CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8_x,
CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_left,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_right,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1
CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_return_output,
 tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output,
 n16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output,
 t16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output,
 n16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_return_output,
 t16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output,
 tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output,
 n16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_return_output,
 t16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output,
 tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output,
 n16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_return_output,
 t16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_return_output,
 tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output,
 n16_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output,
 n16_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_return_output,
 sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_return_output,
 CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_2177 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1907_c3_00bd_uxn_opcodes_h_l1907_c3_00bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_7c3f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_9983_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_ae59 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1914_c7_c515_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_d0a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1919_c7_9968_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1929_c3_4460 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_a0af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c21_e987_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_a9f6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1939_c21_299b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1906_l1936_l1923_DUPLICATE_4fb8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_f67b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1927_l1923_DUPLICATE_4dc8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_25d6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1936_l1927_l1923_DUPLICATE_2df1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1928_l1924_l1920_DUPLICATE_726e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1936_l1923_DUPLICATE_80b5_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1946_l1902_DUPLICATE_6979_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_2177 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_2177;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_a0af := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1933_c3_a0af;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_d0a1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1921_c3_d0a1;
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_ae59 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1917_c3_ae59;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_a9f6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1938_c3_a9f6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_7c3f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_7c3f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse := tmp16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1936_l1923_DUPLICATE_80b5 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1936_l1923_DUPLICATE_80b5_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1906_l1936_l1923_DUPLICATE_4fb8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1906_l1936_l1923_DUPLICATE_4fb8_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1936_l1927_l1923_DUPLICATE_2df1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1936_l1927_l1923_DUPLICATE_2df1_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1931_c30_c93d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_ins;
     sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_x;
     sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_return_output := sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1927_c11_8de3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1936_c11_669e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1939_c31_40b8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8_return_output := CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1927_l1923_DUPLICATE_4dc8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1927_l1923_DUPLICATE_4dc8_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_5f77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_left;
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output := BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_25d6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_25d6_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1906_c6_723d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_374e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_f23b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1923_c11_f886] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_left;
     BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_return_output := BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_f67b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_f67b_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1928_l1924_l1920_DUPLICATE_726e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1928_l1924_l1920_DUPLICATE_726e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1919_c11_3d47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_left;
     BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output := BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c6_723d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_9983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_9983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_f23b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_c515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_c515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_5f77_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_9968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_9968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1919_c11_3d47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_5eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c11_f886_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_da7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1927_c11_8de3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_669e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_374e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1928_l1924_l1920_DUPLICATE_726e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1928_l1924_l1920_DUPLICATE_726e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1915_l1928_l1924_l1920_DUPLICATE_726e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1927_l1923_DUPLICATE_4dc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1927_l1923_DUPLICATE_4dc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1927_l1923_DUPLICATE_4dc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1927_l1923_DUPLICATE_4dc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1927_l1923_DUPLICATE_4dc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1927_l1923_DUPLICATE_4dc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1936_l1927_l1923_DUPLICATE_2df1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1936_l1927_l1923_DUPLICATE_2df1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1936_l1927_l1923_DUPLICATE_2df1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1936_l1927_l1923_DUPLICATE_2df1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1936_l1927_l1923_DUPLICATE_2df1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1936_l1927_l1923_DUPLICATE_2df1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1936_l1927_l1923_DUPLICATE_2df1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_f67b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_f67b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_f67b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_f67b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_f67b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_f67b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1906_l1936_l1923_DUPLICATE_4fb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1906_l1936_l1923_DUPLICATE_4fb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1906_l1936_l1923_DUPLICATE_4fb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1906_l1936_l1923_DUPLICATE_4fb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1906_l1936_l1923_DUPLICATE_4fb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1906_l1936_l1923_DUPLICATE_4fb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1941_l1906_l1936_l1923_DUPLICATE_4fb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1936_l1923_DUPLICATE_80b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1936_l1923_DUPLICATE_80b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_25d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_25d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_25d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_25d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_25d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1919_l1914_l1911_l1906_l1936_l1923_DUPLICATE_25d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1931_c30_c93d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1936_c7_d770] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1920_c3_0012] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_left;
     BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_return_output := BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1936_c7_d770] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1928_c3_5336] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_left;
     BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_return_output := BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1927_c7_da7f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1906_c1_4035] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1939_c21_299b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1939_c21_299b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1939_c31_40b8_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_2ac3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_2ac3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1920_c3_0012_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1928_c3_5336_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1939_c21_299b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1916_l1925_DUPLICATE_55e1_return_output;
     VAR_printf_uxn_opcodes_h_l1907_c3_00bd_uxn_opcodes_h_l1907_c3_00bd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1906_c1_4035_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2ac3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d770_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2ac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d770_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1936_c7_d770] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l1929_c11_6e7a] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1919_c7_9968] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1919_c7_9968_cond <= VAR_t16_MUX_uxn_opcodes_h_l1919_c7_9968_cond;
     t16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue;
     t16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output := t16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;

     -- n16_MUX[uxn_opcodes_h_l1927_c7_da7f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1927_c7_da7f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1927_c7_da7f_cond;
     n16_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue;
     n16_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output := n16_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1936_c7_d770] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_return_output := result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1927_c7_da7f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1923_c7_5eee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1936_c7_d770] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1927_c7_da7f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;

     -- printf_uxn_opcodes_h_l1907_c3_00bd[uxn_opcodes_h_l1907_c3_00bd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1907_c3_00bd_uxn_opcodes_h_l1907_c3_00bd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1907_c3_00bd_uxn_opcodes_h_l1907_c3_00bd_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1929_c3_4460 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l1929_c11_6e7a_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d770_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1936_c7_d770_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1936_c7_d770_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue := VAR_tmp16_uxn_opcodes_h_l1929_c3_4460;
     -- n16_MUX[uxn_opcodes_h_l1923_c7_5eee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1923_c7_5eee_cond <= VAR_n16_MUX_uxn_opcodes_h_l1923_c7_5eee_cond;
     n16_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue;
     n16_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output := n16_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1919_c7_9968] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1923_c7_5eee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1923_c7_5eee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1927_c7_da7f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_cond;
     tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output := tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1914_c7_c515] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1914_c7_c515_cond <= VAR_t16_MUX_uxn_opcodes_h_l1914_c7_c515_cond;
     t16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue;
     t16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output := t16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1934_c21_e987] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c21_e987_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l1929_c3_4460);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1927_c7_da7f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1927_c7_da7f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1934_c21_e987_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1923_c7_5eee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;

     -- t16_MUX[uxn_opcodes_h_l1911_c7_9983] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1911_c7_9983_cond <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_9983_cond;
     t16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue;
     t16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output := t16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1923_c7_5eee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_cond;
     tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output := tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;

     -- n16_MUX[uxn_opcodes_h_l1919_c7_9968] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1919_c7_9968_cond <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_9968_cond;
     n16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue;
     n16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output := n16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1914_c7_c515] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1923_c7_5eee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1919_c7_9968] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1927_c7_da7f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1919_c7_9968] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1927_c7_da7f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1919_c7_9968] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;

     -- n16_MUX[uxn_opcodes_h_l1914_c7_c515] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1914_c7_c515_cond <= VAR_n16_MUX_uxn_opcodes_h_l1914_c7_c515_cond;
     n16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue;
     n16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output := n16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_9983] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1919_c7_9968] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_cond;
     tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output := tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1923_c7_5eee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output := result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c7_c515] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;

     -- t16_MUX[uxn_opcodes_h_l1906_c2_28cd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond;
     t16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue;
     t16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output := t16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1919_c7_9968] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1914_c7_c515] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1923_c7_5eee_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_9983] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1914_c7_c515] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_cond;
     tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output := tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_c515] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_9983] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_c515] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1919_c7_9968] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_return_output := result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;

     -- n16_MUX[uxn_opcodes_h_l1911_c7_9983] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1911_c7_9983_cond <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_9983_cond;
     n16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue;
     n16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output := n16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1906_c2_28cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1919_c7_9968_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_9983] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c2_28cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1911_c7_9983] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_cond;
     tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output := tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1906_c2_28cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1914_c7_c515] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_return_output := result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;

     -- n16_MUX[uxn_opcodes_h_l1906_c2_28cd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond;
     n16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue;
     n16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output := n16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_9983] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1914_c7_c515_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c2_28cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1911_c7_9983] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_return_output := result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c2_28cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1906_c2_28cd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_cond;
     tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output := tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1911_c7_9983_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1906_c2_28cd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1946_l1902_DUPLICATE_6979 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1946_l1902_DUPLICATE_6979_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1906_c2_28cd_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1946_l1902_DUPLICATE_6979_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1946_l1902_DUPLICATE_6979_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
