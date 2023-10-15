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
-- Submodules: 112
entity mul2_0CLK_c89b169c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_c89b169c;
architecture arch of mul2_0CLK_c89b169c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2177_c6_52df]
signal BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2177_c2_595d]
signal t16_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2177_c2_595d]
signal tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2177_c2_595d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2177_c2_595d]
signal result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2177_c2_595d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2177_c2_595d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2177_c2_595d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2177_c2_595d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2177_c2_595d]
signal n16_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2182_c11_8f03]
signal BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2182_c7_94f4]
signal t16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2182_c7_94f4]
signal tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2182_c7_94f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2182_c7_94f4]
signal result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2182_c7_94f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2182_c7_94f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2182_c7_94f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2182_c7_94f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2182_c7_94f4]
signal n16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2185_c11_a83a]
signal BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2185_c7_2786]
signal t16_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2185_c7_2786]
signal tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2185_c7_2786]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2185_c7_2786]
signal result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2185_c7_2786]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2185_c7_2786]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2185_c7_2786]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2185_c7_2786]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2185_c7_2786]
signal n16_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2190_c11_996c]
signal BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2190_c7_9ce8]
signal t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2190_c7_9ce8]
signal tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2190_c7_9ce8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2190_c7_9ce8]
signal result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2190_c7_9ce8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2190_c7_9ce8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2190_c7_9ce8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2190_c7_9ce8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2190_c7_9ce8]
signal n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2193_c11_86ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2193_c7_544b]
signal t16_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2193_c7_544b]
signal tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2193_c7_544b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2193_c7_544b]
signal result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2193_c7_544b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2193_c7_544b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2193_c7_544b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2193_c7_544b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2193_c7_544b]
signal n16_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2194_c3_9e9e]
signal BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2197_c11_6c6f]
signal BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2197_c7_a1e6]
signal tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2197_c7_a1e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2197_c7_a1e6]
signal result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2197_c7_a1e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2197_c7_a1e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2197_c7_a1e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2197_c7_a1e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2197_c7_a1e6]
signal n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2200_c11_9cb6]
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2200_c7_de3c]
signal tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2200_c7_de3c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2200_c7_de3c]
signal result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2200_c7_de3c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2200_c7_de3c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2200_c7_de3c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2200_c7_de3c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2200_c7_de3c]
signal n16_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2205_c11_7b5b]
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2205_c7_fefe]
signal tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2205_c7_fefe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2205_c7_fefe]
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2205_c7_fefe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2205_c7_fefe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2205_c7_fefe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2205_c7_fefe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2205_c7_fefe]
signal n16_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2208_c11_ec76]
signal BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2208_c7_33a6]
signal tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2208_c7_33a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2208_c7_33a6]
signal result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2208_c7_33a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2208_c7_33a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2208_c7_33a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2208_c7_33a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2208_c7_33a6]
signal n16_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2209_c3_a9fa]
signal BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2210_c11_8c88]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2212_c32_3480]
signal BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2212_c32_885b]
signal BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2212_c32_f1fa]
signal MUX_uxn_opcodes_h_l2212_c32_f1fa_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2212_c32_f1fa_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2212_c32_f1fa_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2212_c32_f1fa_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2214_c11_658c]
signal BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2214_c7_73cd]
signal result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2214_c7_73cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2214_c7_73cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2214_c7_73cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2214_c7_73cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2220_c11_f0ff]
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2220_c7_9ea8]
signal result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2220_c7_9ea8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2220_c7_9ea8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2220_c7_9ea8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2222_c34_b214]
signal CONST_SR_8_uxn_opcodes_h_l2222_c34_b214_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2222_c34_b214_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2224_c11_88ff]
signal BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2224_c7_c0a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2224_c7_c0a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df
BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_left,
BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_right,
BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output);

-- t16_MUX_uxn_opcodes_h_l2177_c2_595d
t16_MUX_uxn_opcodes_h_l2177_c2_595d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2177_c2_595d_cond,
t16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue,
t16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse,
t16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2177_c2_595d
tmp16_MUX_uxn_opcodes_h_l2177_c2_595d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_cond,
tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d
result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d
result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_return_output);

-- n16_MUX_uxn_opcodes_h_l2177_c2_595d
n16_MUX_uxn_opcodes_h_l2177_c2_595d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2177_c2_595d_cond,
n16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue,
n16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse,
n16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03
BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_left,
BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_right,
BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output);

-- t16_MUX_uxn_opcodes_h_l2182_c7_94f4
t16_MUX_uxn_opcodes_h_l2182_c7_94f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond,
t16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue,
t16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse,
t16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4
tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond,
tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4
result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4
result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4
result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4
result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output);

-- n16_MUX_uxn_opcodes_h_l2182_c7_94f4
n16_MUX_uxn_opcodes_h_l2182_c7_94f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond,
n16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue,
n16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse,
n16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a
BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_left,
BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_right,
BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output);

-- t16_MUX_uxn_opcodes_h_l2185_c7_2786
t16_MUX_uxn_opcodes_h_l2185_c7_2786 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2185_c7_2786_cond,
t16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue,
t16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse,
t16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2185_c7_2786
tmp16_MUX_uxn_opcodes_h_l2185_c7_2786 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_cond,
tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue,
tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse,
tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786
result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786
result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_cond,
result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786
result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786
result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786
result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_return_output);

-- n16_MUX_uxn_opcodes_h_l2185_c7_2786
n16_MUX_uxn_opcodes_h_l2185_c7_2786 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2185_c7_2786_cond,
n16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue,
n16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse,
n16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c
BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_left,
BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_right,
BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output);

-- t16_MUX_uxn_opcodes_h_l2190_c7_9ce8
t16_MUX_uxn_opcodes_h_l2190_c7_9ce8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond,
t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue,
t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse,
t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8
tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond,
tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8
result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8
result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output);

-- n16_MUX_uxn_opcodes_h_l2190_c7_9ce8
n16_MUX_uxn_opcodes_h_l2190_c7_9ce8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond,
n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue,
n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse,
n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output);

-- t16_MUX_uxn_opcodes_h_l2193_c7_544b
t16_MUX_uxn_opcodes_h_l2193_c7_544b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2193_c7_544b_cond,
t16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue,
t16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse,
t16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2193_c7_544b
tmp16_MUX_uxn_opcodes_h_l2193_c7_544b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_cond,
tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_return_output);

-- n16_MUX_uxn_opcodes_h_l2193_c7_544b
n16_MUX_uxn_opcodes_h_l2193_c7_544b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2193_c7_544b_cond,
n16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue,
n16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse,
n16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e
BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_left,
BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_right,
BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f
BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_left,
BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_right,
BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6
tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond,
tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output);

-- n16_MUX_uxn_opcodes_h_l2197_c7_a1e6
n16_MUX_uxn_opcodes_h_l2197_c7_a1e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond,
n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue,
n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse,
n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_left,
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_right,
BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c
tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_cond,
tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output);

-- n16_MUX_uxn_opcodes_h_l2200_c7_de3c
n16_MUX_uxn_opcodes_h_l2200_c7_de3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2200_c7_de3c_cond,
n16_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue,
n16_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse,
n16_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_left,
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_right,
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe
tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_cond,
tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue,
tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse,
tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_cond,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output);

-- n16_MUX_uxn_opcodes_h_l2205_c7_fefe
n16_MUX_uxn_opcodes_h_l2205_c7_fefe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2205_c7_fefe_cond,
n16_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue,
n16_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse,
n16_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76
BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_left,
BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_right,
BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6
tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_cond,
tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output);

-- n16_MUX_uxn_opcodes_h_l2208_c7_33a6
n16_MUX_uxn_opcodes_h_l2208_c7_33a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2208_c7_33a6_cond,
n16_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue,
n16_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse,
n16_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa
BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_left,
BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_right,
BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480
BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_left,
BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_right,
BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b
BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_left,
BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_right,
BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_return_output);

-- MUX_uxn_opcodes_h_l2212_c32_f1fa
MUX_uxn_opcodes_h_l2212_c32_f1fa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2212_c32_f1fa_cond,
MUX_uxn_opcodes_h_l2212_c32_f1fa_iftrue,
MUX_uxn_opcodes_h_l2212_c32_f1fa_iffalse,
MUX_uxn_opcodes_h_l2212_c32_f1fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c
BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_left,
BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_right,
BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd
result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd
result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_left,
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_right,
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2222_c34_b214
CONST_SR_8_uxn_opcodes_h_l2222_c34_b214 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2222_c34_b214_x,
CONST_SR_8_uxn_opcodes_h_l2222_c34_b214_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff
BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_left,
BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_right,
BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca
CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output,
 t16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_return_output,
 n16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output,
 t16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output,
 n16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output,
 t16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output,
 tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_return_output,
 n16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output,
 t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output,
 n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output,
 t16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_return_output,
 n16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output,
 n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output,
 n16_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output,
 n16_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_return_output,
 tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output,
 n16_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_return_output,
 MUX_uxn_opcodes_h_l2212_c32_f1fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output,
 CONST_SR_8_uxn_opcodes_h_l2222_c34_b214_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_bcfb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2177_c2_595d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2183_c3_c4d8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2188_c3_2031 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2185_c7_2786_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2191_c3_fc43 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2195_c3_3fb2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2193_c7_544b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2198_c3_2bd0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2203_c3_f4c6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2200_c7_de3c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2206_c3_14d3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2205_c7_fefe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2210_c3_445b : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2208_c7_33a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_return_output : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2212_c32_f1fa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2212_c32_f1fa_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2212_c32_f1fa_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2212_c32_f1fa_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_ab9a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2218_c24_6078_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_017f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2222_c34_b214_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2222_c34_b214_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2222_c24_ec49_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2185_DUPLICATE_97d3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2220_l2190_l2185_DUPLICATE_3fb8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2214_l2185_DUPLICATE_f189_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2224_l2193_l2220_l2190_l2185_DUPLICATE_e2ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2200_l2197_l2224_l2193_l2220_l2190_l2214_l2185_DUPLICATE_d7cc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2186_l2194_l2201_l2209_DUPLICATE_aeea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2208_l2220_DUPLICATE_cc4d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2229_l2173_DUPLICATE_b9f9_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_ab9a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_ab9a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_017f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_017f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_right := to_unsigned(11, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2191_c3_fc43 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2191_c3_fc43;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_bcfb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_bcfb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2203_c3_f4c6 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2203_c3_f4c6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_right := to_unsigned(10, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2183_c3_c4d8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2183_c3_c4d8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2206_c3_14d3 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2206_c3_14d3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l2212_c32_f1fa_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2188_c3_2031 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2188_c3_2031;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2195_c3_3fb2 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2195_c3_3fb2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2198_c3_2bd0 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2198_c3_2bd0;
     VAR_MUX_uxn_opcodes_h_l2212_c32_f1fa_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_right := to_unsigned(7, 3);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2222_c34_b214_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2208_c11_ec76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_left;
     BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_return_output := BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2212_c32_3480] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_left;
     BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_return_output := BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2182_c11_8f03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_left;
     BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output := BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2177_c6_52df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_left;
     BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output := BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2214_c11_658c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2208_l2220_DUPLICATE_cc4d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2208_l2220_DUPLICATE_cc4d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2197_c11_6c6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2186_l2194_l2201_l2209_DUPLICATE_aeea LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2186_l2194_l2201_l2209_DUPLICATE_aeea_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2214_l2185_DUPLICATE_f189 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2214_l2185_DUPLICATE_f189_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2190_c11_996c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2220_c11_f0ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2193_c11_86ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2220_l2190_l2185_DUPLICATE_3fb8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2220_l2190_l2185_DUPLICATE_3fb8_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2185_c11_a83a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2218_c24_6078] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2218_c24_6078_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2205_c11_7b5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2222_c34_b214] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2222_c34_b214_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2222_c34_b214_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2222_c34_b214_return_output := CONST_SR_8_uxn_opcodes_h_l2222_c34_b214_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2224_c11_88ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2185_DUPLICATE_97d3 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2185_DUPLICATE_97d3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2200_c11_9cb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2200_l2197_l2224_l2193_l2220_l2190_l2214_l2185_DUPLICATE_d7cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2200_l2197_l2224_l2193_l2220_l2190_l2214_l2185_DUPLICATE_d7cc_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2224_l2193_l2220_l2190_l2185_DUPLICATE_e2ec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2224_l2193_l2220_l2190_l2185_DUPLICATE_e2ec_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2212_c32_3480_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2177_c2_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2177_c2_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2177_c6_52df_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2182_c11_8f03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2185_c7_2786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2185_c7_2786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2185_c11_a83a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2190_c11_996c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2193_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2193_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2193_c11_86ca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2197_c11_6c6f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2200_c7_de3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2200_c11_9cb6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2205_c7_fefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_7b5b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2208_c7_33a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2208_c11_ec76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c11_658c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_f0ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2224_c11_88ff_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2186_l2194_l2201_l2209_DUPLICATE_aeea_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2186_l2194_l2201_l2209_DUPLICATE_aeea_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2186_l2194_l2201_l2209_DUPLICATE_aeea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2218_c24_6078_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2185_DUPLICATE_97d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2185_DUPLICATE_97d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2185_DUPLICATE_97d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2185_DUPLICATE_97d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2185_DUPLICATE_97d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2185_DUPLICATE_97d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2185_DUPLICATE_97d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2185_DUPLICATE_97d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2185_DUPLICATE_97d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2200_l2197_l2224_l2193_l2220_l2190_l2214_l2185_DUPLICATE_d7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2200_l2197_l2224_l2193_l2220_l2190_l2214_l2185_DUPLICATE_d7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2200_l2197_l2224_l2193_l2220_l2190_l2214_l2185_DUPLICATE_d7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2200_l2197_l2224_l2193_l2220_l2190_l2214_l2185_DUPLICATE_d7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2200_l2197_l2224_l2193_l2220_l2190_l2214_l2185_DUPLICATE_d7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2200_l2197_l2224_l2193_l2220_l2190_l2214_l2185_DUPLICATE_d7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2200_l2197_l2224_l2193_l2220_l2190_l2214_l2185_DUPLICATE_d7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2200_l2197_l2224_l2193_l2220_l2190_l2214_l2185_DUPLICATE_d7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2200_l2197_l2224_l2193_l2220_l2190_l2214_l2185_DUPLICATE_d7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2200_l2197_l2224_l2193_l2220_l2190_l2214_l2185_DUPLICATE_d7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2200_l2197_l2224_l2193_l2220_l2190_l2214_l2185_DUPLICATE_d7cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2214_l2185_DUPLICATE_f189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2214_l2185_DUPLICATE_f189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2214_l2185_DUPLICATE_f189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2214_l2185_DUPLICATE_f189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2214_l2185_DUPLICATE_f189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2214_l2185_DUPLICATE_f189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2214_l2185_DUPLICATE_f189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2214_l2185_DUPLICATE_f189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2182_l2205_l2177_l2200_l2197_l2193_l2190_l2214_l2185_DUPLICATE_f189_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2224_l2193_l2220_l2190_l2185_DUPLICATE_e2ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2224_l2193_l2220_l2190_l2185_DUPLICATE_e2ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2224_l2193_l2220_l2190_l2185_DUPLICATE_e2ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2224_l2193_l2220_l2190_l2185_DUPLICATE_e2ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2224_l2193_l2220_l2190_l2185_DUPLICATE_e2ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2224_l2193_l2220_l2190_l2185_DUPLICATE_e2ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2224_l2193_l2220_l2190_l2185_DUPLICATE_e2ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2224_l2193_l2220_l2190_l2185_DUPLICATE_e2ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2224_l2193_l2220_l2190_l2185_DUPLICATE_e2ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2224_l2193_l2220_l2190_l2185_DUPLICATE_e2ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2224_l2193_l2220_l2190_l2185_DUPLICATE_e2ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2208_l2220_DUPLICATE_cc4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2208_l2220_DUPLICATE_cc4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2220_l2190_l2185_DUPLICATE_3fb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2220_l2190_l2185_DUPLICATE_3fb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2220_l2190_l2185_DUPLICATE_3fb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2220_l2190_l2185_DUPLICATE_3fb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2220_l2190_l2185_DUPLICATE_3fb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2220_l2190_l2185_DUPLICATE_3fb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2220_l2190_l2185_DUPLICATE_3fb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2220_l2190_l2185_DUPLICATE_3fb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2220_l2190_l2185_DUPLICATE_3fb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2208_l2182_l2205_l2177_l2200_l2197_l2193_l2220_l2190_l2185_DUPLICATE_3fb8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2214_c7_73cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2224_c7_c0a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2224_c7_c0a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2212_c32_885b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_left;
     BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_return_output := BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2194_c3_9e9e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_left;
     BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_return_output := BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2222_c24_ec49] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2222_c24_ec49_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2222_c34_b214_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2220_c7_9ea8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2209_c3_a9fa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_left;
     BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_return_output := BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2212_c32_f1fa_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2212_c32_885b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2194_c3_9e9e_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2209_c3_a9fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2222_c24_ec49_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2202_l2187_DUPLICATE_1fca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2224_c7_c0a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2224_c7_c0a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2220_c7_9ea8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2220_c7_9ea8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2210_c11_8c88] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_return_output;

     -- n16_MUX[uxn_opcodes_h_l2208_c7_33a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2208_c7_33a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2208_c7_33a6_cond;
     n16_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue;
     n16_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output := n16_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2220_c7_9ea8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2193_c7_544b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2193_c7_544b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2193_c7_544b_cond;
     t16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue;
     t16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output := t16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;

     -- MUX[uxn_opcodes_h_l2212_c32_f1fa] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2212_c32_f1fa_cond <= VAR_MUX_uxn_opcodes_h_l2212_c32_f1fa_cond;
     MUX_uxn_opcodes_h_l2212_c32_f1fa_iftrue <= VAR_MUX_uxn_opcodes_h_l2212_c32_f1fa_iftrue;
     MUX_uxn_opcodes_h_l2212_c32_f1fa_iffalse <= VAR_MUX_uxn_opcodes_h_l2212_c32_f1fa_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2212_c32_f1fa_return_output := MUX_uxn_opcodes_h_l2212_c32_f1fa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2208_c7_33a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2214_c7_73cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2210_c3_445b := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2210_c11_8c88_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue := VAR_MUX_uxn_opcodes_h_l2212_c32_f1fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2220_c7_9ea8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue := VAR_tmp16_uxn_opcodes_h_l2210_c3_445b;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2214_c7_73cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2205_c7_fefe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;

     -- t16_MUX[uxn_opcodes_h_l2190_c7_9ce8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond;
     t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue;
     t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output := t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2214_c7_73cd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2208_c7_33a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2205_c7_fefe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2205_c7_fefe_cond <= VAR_n16_MUX_uxn_opcodes_h_l2205_c7_fefe_cond;
     n16_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue;
     n16_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output := n16_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2214_c7_73cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2208_c7_33a6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_cond;
     tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output := tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2208_c7_33a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2214_c7_73cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2208_c7_33a6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2185_c7_2786] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2185_c7_2786_cond <= VAR_t16_MUX_uxn_opcodes_h_l2185_c7_2786_cond;
     t16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue;
     t16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output := t16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2200_c7_de3c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2205_c7_fefe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_cond;
     tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output := tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;

     -- n16_MUX[uxn_opcodes_h_l2200_c7_de3c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2200_c7_de3c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2200_c7_de3c_cond;
     n16_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue;
     n16_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output := n16_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2205_c7_fefe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2208_c7_33a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2208_c7_33a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2205_c7_fefe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2208_c7_33a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;
     -- t16_MUX[uxn_opcodes_h_l2182_c7_94f4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond;
     t16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue;
     t16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output := t16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2200_c7_de3c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_cond;
     tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output := tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2197_c7_a1e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2205_c7_fefe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output := result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2200_c7_de3c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2205_c7_fefe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2205_c7_fefe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2200_c7_de3c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2197_c7_a1e6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond;
     n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue;
     n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output := n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_fefe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2197_c7_a1e6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond;
     tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output := tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2177_c2_595d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2177_c2_595d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2177_c2_595d_cond;
     t16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue;
     t16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output := t16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2193_c7_544b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2193_c7_544b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2193_c7_544b_cond;
     n16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue;
     n16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output := n16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2197_c7_a1e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2200_c7_de3c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2193_c7_544b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2197_c7_a1e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2200_c7_de3c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2200_c7_de3c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2200_c7_de3c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2197_c7_a1e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2193_c7_544b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2197_c7_a1e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2193_c7_544b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2190_c7_9ce8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond;
     n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue;
     n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output := n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2193_c7_544b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_cond;
     tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output := tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2197_c7_a1e6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2190_c7_9ce8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2197_c7_a1e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2190_c7_9ce8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2190_c7_9ce8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2185_c7_2786] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2185_c7_2786_cond <= VAR_n16_MUX_uxn_opcodes_h_l2185_c7_2786_cond;
     n16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue;
     n16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output := n16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2190_c7_9ce8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond;
     tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output := tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2193_c7_544b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2185_c7_2786] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2193_c7_544b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2193_c7_544b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2193_c7_544b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2190_c7_9ce8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2185_c7_2786] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_cond;
     tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output := tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2190_c7_9ce8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2185_c7_2786] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2182_c7_94f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2185_c7_2786] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;

     -- n16_MUX[uxn_opcodes_h_l2182_c7_94f4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond;
     n16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue;
     n16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output := n16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2190_c7_9ce8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2190_c7_9ce8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2185_c7_2786] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2177_c2_595d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2177_c2_595d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2177_c2_595d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2177_c2_595d_cond;
     n16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue;
     n16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output := n16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2185_c7_2786] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_return_output := result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2182_c7_94f4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_cond;
     tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output := tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2185_c7_2786] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2182_c7_94f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2182_c7_94f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2185_c7_2786_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2177_c2_595d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2182_c7_94f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2177_c2_595d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2177_c2_595d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_cond;
     tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output := tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2182_c7_94f4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2182_c7_94f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2182_c7_94f4_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2177_c2_595d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2177_c2_595d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2177_c2_595d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2177_c2_595d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2229_l2173_DUPLICATE_b9f9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2229_l2173_DUPLICATE_b9f9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2177_c2_595d_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2177_c2_595d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2177_c2_595d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2177_c2_595d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2177_c2_595d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2177_c2_595d_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2229_l2173_DUPLICATE_b9f9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2229_l2173_DUPLICATE_b9f9_return_output;
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
