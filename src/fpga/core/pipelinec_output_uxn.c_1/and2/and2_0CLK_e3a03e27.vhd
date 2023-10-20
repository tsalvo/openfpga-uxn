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
-- Submodules: 105
entity and2_0CLK_e3a03e27 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_e3a03e27;
architecture arch of and2_0CLK_e3a03e27 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l986_c6_9601]
signal BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l986_c2_2124]
signal tmp16_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l986_c2_2124]
signal n16_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l986_c2_2124]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l986_c2_2124]
signal result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l986_c2_2124]
signal result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l986_c2_2124]
signal result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l986_c2_2124]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l986_c2_2124]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l986_c2_2124]
signal t16_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l991_c11_99a9]
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l991_c7_6072]
signal tmp16_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l991_c7_6072]
signal n16_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_6072]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l991_c7_6072]
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_6072]
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_6072]
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_6072]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c7_6072]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l991_c7_6072]
signal t16_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l994_c11_0a9d]
signal BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l994_c7_72ef]
signal tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l994_c7_72ef]
signal n16_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l994_c7_72ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l994_c7_72ef]
signal result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l994_c7_72ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l994_c7_72ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l994_c7_72ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l994_c7_72ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l994_c7_72ef]
signal t16_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l999_c11_b2ea]
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l999_c7_9bd6]
signal tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l999_c7_9bd6]
signal n16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l999_c7_9bd6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l999_c7_9bd6]
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l999_c7_9bd6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l999_c7_9bd6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l999_c7_9bd6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l999_c7_9bd6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l999_c7_9bd6]
signal t16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_d9a0]
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1002_c7_6840]
signal tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1002_c7_6840]
signal n16_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1002_c7_6840]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1002_c7_6840]
signal result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1002_c7_6840]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1002_c7_6840]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1002_c7_6840]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1002_c7_6840]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1002_c7_6840]
signal t16_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1003_c3_8407]
signal BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_96c8]
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1006_c7_056d]
signal tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1006_c7_056d]
signal n16_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1006_c7_056d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1006_c7_056d]
signal result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1006_c7_056d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1006_c7_056d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1006_c7_056d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1006_c7_056d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_797d]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1009_c7_0c55]
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1009_c7_0c55]
signal n16_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1009_c7_0c55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1009_c7_0c55]
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1009_c7_0c55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1009_c7_0c55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1009_c7_0c55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1009_c7_0c55]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_cb11]
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1014_c7_b5af]
signal tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1014_c7_b5af]
signal n16_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1014_c7_b5af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1014_c7_b5af]
signal result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1014_c7_b5af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1014_c7_b5af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1014_c7_b5af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1014_c7_b5af]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_6966]
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1017_c7_25da]
signal tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1017_c7_25da]
signal n16_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1017_c7_25da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1017_c7_25da]
signal result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1017_c7_25da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1017_c7_25da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1017_c7_25da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1017_c7_25da]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1018_c3_2cf2]
signal BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1019_c11_61f1]
signal BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1021_c30_a2fe]
signal sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_9714]
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1026_c7_8e8c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1026_c7_8e8c]
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1026_c7_8e8c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1026_c7_8e8c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1026_c7_8e8c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1029_c31_b273]
signal CONST_SR_8_uxn_opcodes_h_l1029_c31_b273_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1029_c31_b273_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_49b2]
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1031_c7_e5e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1031_c7_e5e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601
BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_left,
BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_right,
BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output);

-- tmp16_MUX_uxn_opcodes_h_l986_c2_2124
tmp16_MUX_uxn_opcodes_h_l986_c2_2124 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l986_c2_2124_cond,
tmp16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue,
tmp16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse,
tmp16_MUX_uxn_opcodes_h_l986_c2_2124_return_output);

-- n16_MUX_uxn_opcodes_h_l986_c2_2124
n16_MUX_uxn_opcodes_h_l986_c2_2124 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l986_c2_2124_cond,
n16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue,
n16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse,
n16_MUX_uxn_opcodes_h_l986_c2_2124_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124
result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_cond,
result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124
result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124
result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124
result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124
result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_return_output);

-- t16_MUX_uxn_opcodes_h_l986_c2_2124
t16_MUX_uxn_opcodes_h_l986_c2_2124 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l986_c2_2124_cond,
t16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue,
t16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse,
t16_MUX_uxn_opcodes_h_l986_c2_2124_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9
BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_left,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_right,
BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l991_c7_6072
tmp16_MUX_uxn_opcodes_h_l991_c7_6072 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l991_c7_6072_cond,
tmp16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue,
tmp16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse,
tmp16_MUX_uxn_opcodes_h_l991_c7_6072_return_output);

-- n16_MUX_uxn_opcodes_h_l991_c7_6072
n16_MUX_uxn_opcodes_h_l991_c7_6072 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l991_c7_6072_cond,
n16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue,
n16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse,
n16_MUX_uxn_opcodes_h_l991_c7_6072_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072
result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_cond,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_return_output);

-- t16_MUX_uxn_opcodes_h_l991_c7_6072
t16_MUX_uxn_opcodes_h_l991_c7_6072 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l991_c7_6072_cond,
t16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue,
t16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse,
t16_MUX_uxn_opcodes_h_l991_c7_6072_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d
BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_left,
BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_right,
BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l994_c7_72ef
tmp16_MUX_uxn_opcodes_h_l994_c7_72ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_cond,
tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue,
tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse,
tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output);

-- n16_MUX_uxn_opcodes_h_l994_c7_72ef
n16_MUX_uxn_opcodes_h_l994_c7_72ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l994_c7_72ef_cond,
n16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue,
n16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse,
n16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef
result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef
result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef
result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_return_output);

-- t16_MUX_uxn_opcodes_h_l994_c7_72ef
t16_MUX_uxn_opcodes_h_l994_c7_72ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l994_c7_72ef_cond,
t16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue,
t16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse,
t16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea
BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_left,
BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_right,
BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output);

-- tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6
tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond,
tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue,
tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse,
tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output);

-- n16_MUX_uxn_opcodes_h_l999_c7_9bd6
n16_MUX_uxn_opcodes_h_l999_c7_9bd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond,
n16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue,
n16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse,
n16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6
result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_cond,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output);

-- t16_MUX_uxn_opcodes_h_l999_c7_9bd6
t16_MUX_uxn_opcodes_h_l999_c7_9bd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond,
t16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue,
t16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse,
t16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_left,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_right,
BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1002_c7_6840
tmp16_MUX_uxn_opcodes_h_l1002_c7_6840 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_cond,
tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue,
tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse,
tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output);

-- n16_MUX_uxn_opcodes_h_l1002_c7_6840
n16_MUX_uxn_opcodes_h_l1002_c7_6840 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1002_c7_6840_cond,
n16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue,
n16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse,
n16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840
result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_cond,
result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840
result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840
result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840
result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840
result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_return_output);

-- t16_MUX_uxn_opcodes_h_l1002_c7_6840
t16_MUX_uxn_opcodes_h_l1002_c7_6840 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1002_c7_6840_cond,
t16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue,
t16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse,
t16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407
BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_left,
BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_right,
BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_left,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_right,
BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1006_c7_056d
tmp16_MUX_uxn_opcodes_h_l1006_c7_056d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_cond,
tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_return_output);

-- n16_MUX_uxn_opcodes_h_l1006_c7_056d
n16_MUX_uxn_opcodes_h_l1006_c7_056d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1006_c7_056d_cond,
n16_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue,
n16_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse,
n16_MUX_uxn_opcodes_h_l1006_c7_056d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55
tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_cond,
tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue,
tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse,
tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output);

-- n16_MUX_uxn_opcodes_h_l1009_c7_0c55
n16_MUX_uxn_opcodes_h_l1009_c7_0c55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1009_c7_0c55_cond,
n16_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue,
n16_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse,
n16_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_cond,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_left,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_right,
BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af
tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_cond,
tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue,
tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse,
tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output);

-- n16_MUX_uxn_opcodes_h_l1014_c7_b5af
n16_MUX_uxn_opcodes_h_l1014_c7_b5af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1014_c7_b5af_cond,
n16_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue,
n16_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse,
n16_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_cond,
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_left,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_right,
BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1017_c7_25da
tmp16_MUX_uxn_opcodes_h_l1017_c7_25da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_cond,
tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue,
tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse,
tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_return_output);

-- n16_MUX_uxn_opcodes_h_l1017_c7_25da
n16_MUX_uxn_opcodes_h_l1017_c7_25da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1017_c7_25da_cond,
n16_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue,
n16_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse,
n16_MUX_uxn_opcodes_h_l1017_c7_25da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da
result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_cond,
result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da
result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da
result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da
result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da
result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2
BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_left,
BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_right,
BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1
BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_left,
BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_right,
BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe
sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_ins,
sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_x,
sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_y,
sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_left,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_right,
BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c
result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c
result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1029_c31_b273
CONST_SR_8_uxn_opcodes_h_l1029_c31_b273 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1029_c31_b273_x,
CONST_SR_8_uxn_opcodes_h_l1029_c31_b273_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_left,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_right,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b
CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output,
 tmp16_MUX_uxn_opcodes_h_l986_c2_2124_return_output,
 n16_MUX_uxn_opcodes_h_l986_c2_2124_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_return_output,
 t16_MUX_uxn_opcodes_h_l986_c2_2124_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output,
 tmp16_MUX_uxn_opcodes_h_l991_c7_6072_return_output,
 n16_MUX_uxn_opcodes_h_l991_c7_6072_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_return_output,
 t16_MUX_uxn_opcodes_h_l991_c7_6072_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output,
 tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output,
 n16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_return_output,
 t16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output,
 tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output,
 n16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output,
 t16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output,
 n16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_return_output,
 t16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_return_output,
 n16_MUX_uxn_opcodes_h_l1006_c7_056d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output,
 n16_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_return_output,
 tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output,
 n16_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_return_output,
 tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_return_output,
 n16_MUX_uxn_opcodes_h_l1017_c7_25da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_return_output,
 sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output,
 CONST_SR_8_uxn_opcodes_h_l1029_c31_b273_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l988_c3_bf0c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_6072_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l986_c2_2124_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l986_c2_2124_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l992_c3_f5de : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l991_c7_6072_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_4699 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l994_c7_72ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_52d3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1004_c3_de34 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1002_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1007_c3_ff0e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_7af5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_e273 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1023_c3_7605 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1024_c21_a8c3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1028_c3_2fbb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1026_c7_8e8c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1029_c31_b273_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1029_c31_b273_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1029_c21_0a17_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_5db8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_c3a6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l986_l1009_l1006_l1002_l999_DUPLICATE_20f5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_799e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_92c1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l995_l1018_l1003_l1010_DUPLICATE_5741_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l982_l1036_DUPLICATE_7df3_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_7af5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1012_c3_7af5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l992_c3_f5de := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l992_c3_f5de;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_4699 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l997_c3_4699;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1023_c3_7605 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1023_c3_7605;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1028_c3_2fbb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1028_c3_2fbb;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l988_c3_bf0c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l988_c3_bf0c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1004_c3_de34 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1004_c3_de34;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1007_c3_ff0e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1007_c3_ff0e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_52d3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1000_c3_52d3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_e273 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_e273;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse := n16;
     VAR_n16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1029_c31_b273_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_799e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_799e_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1026_c7_8e8c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1026_c7_8e8c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_49b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1026_c11_9714] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_left;
     BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_return_output := BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l995_l1018_l1003_l1010_DUPLICATE_5741 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l995_l1018_l1003_l1010_DUPLICATE_5741_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_c3a6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_c3a6_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l991_c11_99a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1021_c30_a2fe] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_ins;
     sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_x;
     sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_return_output := sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1006_c11_96c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1017_c11_6966] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_left;
     BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_return_output := BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l986_c6_9601] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_left;
     BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output := BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1002_c11_d9a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l986_l1009_l1006_l1002_l999_DUPLICATE_20f5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l986_l1009_l1006_l1002_l999_DUPLICATE_20f5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_797d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1029_c31_b273] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1029_c31_b273_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1029_c31_b273_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1029_c31_b273_return_output := CONST_SR_8_uxn_opcodes_h_l1029_c31_b273_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_92c1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_92c1_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_5db8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_5db8_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l994_c11_0a9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1014_c11_cb11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_left;
     BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_return_output := BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l999_c11_b2ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1002_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1002_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1002_c11_d9a0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_056d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1006_c11_96c8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_0c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_797d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1014_c7_b5af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1014_c11_cb11_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1017_c7_25da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1017_c11_6966_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c11_9714_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_49b2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l986_c2_2124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l986_c2_2124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l986_c2_2124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l986_c6_9601_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_6072_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_6072_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_6072_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l991_c11_99a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l994_c7_72ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l994_c7_72ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l994_c11_0a9d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l999_c11_b2ea_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l995_l1018_l1003_l1010_DUPLICATE_5741_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l995_l1018_l1003_l1010_DUPLICATE_5741_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l995_l1018_l1003_l1010_DUPLICATE_5741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l986_l1009_l1006_l1002_l999_DUPLICATE_20f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l986_l1009_l1006_l1002_l999_DUPLICATE_20f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l986_l1009_l1006_l1002_l999_DUPLICATE_20f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l986_l1009_l1006_l1002_l999_DUPLICATE_20f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l986_l1009_l1006_l1002_l999_DUPLICATE_20f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l986_l1009_l1006_l1002_l999_DUPLICATE_20f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l986_l1009_l1006_l1002_l999_DUPLICATE_20f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l986_l1009_l1006_l1002_l999_DUPLICATE_20f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l986_l1009_l1006_l1002_l999_DUPLICATE_20f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_92c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_92c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_92c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_92c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_92c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_92c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_92c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_92c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_92c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l994_l1017_l991_l1014_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_92c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_799e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_799e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_799e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_799e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_799e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_799e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_799e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_799e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_799e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_c3a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_c3a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_c3a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_c3a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_c3a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_c3a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_c3a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_c3a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_c3a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l1031_l999_l1026_DUPLICATE_c3a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_5db8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_5db8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_5db8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_5db8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_5db8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_5db8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_5db8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_5db8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l994_l991_l1014_l986_l1009_l1006_l1002_l999_l1026_DUPLICATE_5db8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1026_c7_8e8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1021_c30_a2fe_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1026_c7_8e8c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1026_c7_8e8c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1003_c3_8407] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_left;
     BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_return_output := BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1017_c7_25da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1031_c7_e5e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1029_c21_0a17] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1029_c21_0a17_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1029_c31_b273_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1031_c7_e5e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1018_c3_2cf2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_left;
     BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_return_output := BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1003_c3_8407_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1018_c3_2cf2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1029_c21_0a17_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1011_l996_DUPLICATE_f94b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_e5e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_e5e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output;
     -- t16_MUX[uxn_opcodes_h_l1002_c7_6840] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1002_c7_6840_cond <= VAR_t16_MUX_uxn_opcodes_h_l1002_c7_6840_cond;
     t16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue;
     t16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output := t16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1026_c7_8e8c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1014_c7_b5af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1017_c7_25da] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1017_c7_25da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;

     -- n16_MUX[uxn_opcodes_h_l1017_c7_25da] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1017_c7_25da_cond <= VAR_n16_MUX_uxn_opcodes_h_l1017_c7_25da_cond;
     n16_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue;
     n16_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1017_c7_25da_return_output := n16_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1026_c7_8e8c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1019_c11_61f1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_left;
     BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_return_output := BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1026_c7_8e8c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c7_8e8c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1009_c7_0c55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;

     -- n16_MUX[uxn_opcodes_h_l1014_c7_b5af] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1014_c7_b5af_cond <= VAR_n16_MUX_uxn_opcodes_h_l1014_c7_b5af_cond;
     n16_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue;
     n16_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output := n16_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1017_c7_25da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1017_c7_25da] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_cond;
     tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_return_output := tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1017_c7_25da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1024_c21_a8c3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1024_c21_a8c3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l1019_c11_61f1_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1014_c7_b5af] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;

     -- t16_MUX[uxn_opcodes_h_l999_c7_9bd6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond <= VAR_t16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond;
     t16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue;
     t16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output := t16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1014_c7_b5af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1024_c21_a8c3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse := VAR_t16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1014_c7_b5af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1014_c7_b5af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1006_c7_056d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1009_c7_0c55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;

     -- n16_MUX[uxn_opcodes_h_l1009_c7_0c55] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1009_c7_0c55_cond <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_0c55_cond;
     n16_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue;
     n16_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output := n16_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1014_c7_b5af] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_cond;
     tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output := tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1009_c7_0c55] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1017_c7_25da] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_return_output := result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;

     -- t16_MUX[uxn_opcodes_h_l994_c7_72ef] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l994_c7_72ef_cond <= VAR_t16_MUX_uxn_opcodes_h_l994_c7_72ef_cond;
     t16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue;
     t16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output := t16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1017_c7_25da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse := VAR_t16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;
     -- n16_MUX[uxn_opcodes_h_l1006_c7_056d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1006_c7_056d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1006_c7_056d_cond;
     n16_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue;
     n16_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1006_c7_056d_return_output := n16_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1009_c7_0c55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1009_c7_0c55] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_cond;
     tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output := tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;

     -- t16_MUX[uxn_opcodes_h_l991_c7_6072] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l991_c7_6072_cond <= VAR_t16_MUX_uxn_opcodes_h_l991_c7_6072_cond;
     t16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue;
     t16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l991_c7_6072_return_output := t16_MUX_uxn_opcodes_h_l991_c7_6072_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1006_c7_056d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1002_c7_6840] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1009_c7_0c55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1014_c7_b5af] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output := result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1006_c7_056d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1014_c7_b5af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse := VAR_t16_MUX_uxn_opcodes_h_l991_c7_6072_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;
     -- n16_MUX[uxn_opcodes_h_l1002_c7_6840] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1002_c7_6840_cond <= VAR_n16_MUX_uxn_opcodes_h_l1002_c7_6840_cond;
     n16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue;
     n16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output := n16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1002_c7_6840] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1002_c7_6840] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1006_c7_056d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_cond;
     tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_return_output := tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1009_c7_0c55] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output := result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l999_c7_9bd6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1006_c7_056d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;

     -- t16_MUX[uxn_opcodes_h_l986_c2_2124] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l986_c2_2124_cond <= VAR_t16_MUX_uxn_opcodes_h_l986_c2_2124_cond;
     t16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue;
     t16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l986_c2_2124_return_output := t16_MUX_uxn_opcodes_h_l986_c2_2124_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1006_c7_056d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_0c55_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l986_c2_2124_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1002_c7_6840] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1002_c7_6840] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_cond;
     tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output := tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l994_c7_72ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1002_c7_6840] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l999_c7_9bd6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1006_c7_056d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l999_c7_9bd6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;

     -- n16_MUX[uxn_opcodes_h_l999_c7_9bd6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond <= VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond;
     n16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue;
     n16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output := n16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse := VAR_n16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1006_c7_056d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l999_c7_9bd6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l991_c7_6072] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l999_c7_9bd6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_cond;
     tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output := tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l994_c7_72ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1002_c7_6840] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_return_output := result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l994_c7_72ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l999_c7_9bd6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;

     -- n16_MUX[uxn_opcodes_h_l994_c7_72ef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l994_c7_72ef_cond <= VAR_n16_MUX_uxn_opcodes_h_l994_c7_72ef_cond;
     n16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue;
     n16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output := n16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse := VAR_n16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l991_c7_6072_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1002_c7_6840_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l994_c7_72ef] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_cond;
     tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue;
     tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output := tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l986_c2_2124] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l991_c7_6072] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l994_c7_72ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l991_c7_6072] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_return_output;

     -- n16_MUX[uxn_opcodes_h_l991_c7_6072] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l991_c7_6072_cond <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_6072_cond;
     n16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue;
     n16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l991_c7_6072_return_output := n16_MUX_uxn_opcodes_h_l991_c7_6072_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l994_c7_72ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l999_c7_9bd6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output := result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse := VAR_n16_MUX_uxn_opcodes_h_l991_c7_6072_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l991_c7_6072_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l991_c7_6072_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l999_c7_9bd6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l994_c7_72ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;

     -- n16_MUX[uxn_opcodes_h_l986_c2_2124] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l986_c2_2124_cond <= VAR_n16_MUX_uxn_opcodes_h_l986_c2_2124_cond;
     n16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue;
     n16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l986_c2_2124_return_output := n16_MUX_uxn_opcodes_h_l986_c2_2124_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l986_c2_2124] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l986_c2_2124] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l991_c7_6072] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l991_c7_6072_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_6072_cond;
     tmp16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_6072_iftrue;
     tmp16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_6072_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_6072_return_output := tmp16_MUX_uxn_opcodes_h_l991_c7_6072_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l991_c7_6072] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l991_c7_6072] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l986_c2_2124_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l991_c7_6072_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l991_c7_6072_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l994_c7_72ef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l991_c7_6072_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l986_c2_2124] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l986_c2_2124] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l991_c7_6072] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_cond;
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_return_output := result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l986_c2_2124] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l986_c2_2124_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l986_c2_2124_cond;
     tmp16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l986_c2_2124_iftrue;
     tmp16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l986_c2_2124_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l986_c2_2124_return_output := tmp16_MUX_uxn_opcodes_h_l986_c2_2124_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l991_c7_6072_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l986_c2_2124_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l986_c2_2124] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_cond;
     result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_return_output := result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l982_l1036_DUPLICATE_7df3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l982_l1036_DUPLICATE_7df3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l986_c2_2124_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l986_c2_2124_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l986_c2_2124_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l986_c2_2124_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l986_c2_2124_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l986_c2_2124_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l982_l1036_DUPLICATE_7df3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l982_l1036_DUPLICATE_7df3_return_output;
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
