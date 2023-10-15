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
-- Submodules: 96
entity gth2_0CLK_c7083908 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_c7083908;
architecture arch of gth2_0CLK_c7083908 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1993_c6_01e7]
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1993_c2_1bf1]
signal t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1993_c2_1bf1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1993_c2_1bf1]
signal result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c2_1bf1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1993_c2_1bf1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c2_1bf1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c2_1bf1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1993_c2_1bf1]
signal n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1998_c11_0d9a]
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1998_c7_16c1]
signal t16_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1998_c7_16c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1998_c7_16c1]
signal result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1998_c7_16c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1998_c7_16c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1998_c7_16c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1998_c7_16c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1998_c7_16c1]
signal n16_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2001_c11_4228]
signal BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2001_c7_da1d]
signal t16_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2001_c7_da1d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2001_c7_da1d]
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2001_c7_da1d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2001_c7_da1d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2001_c7_da1d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2001_c7_da1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2001_c7_da1d]
signal n16_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_baf9]
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2006_c7_fa78]
signal t16_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2006_c7_fa78]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2006_c7_fa78]
signal result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_fa78]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2006_c7_fa78]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_fa78]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_fa78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2006_c7_fa78]
signal n16_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2009_c11_9f78]
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2009_c7_cb8e]
signal t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2009_c7_cb8e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2009_c7_cb8e]
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2009_c7_cb8e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2009_c7_cb8e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2009_c7_cb8e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2009_c7_cb8e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2009_c7_cb8e]
signal n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2010_c3_7b80]
signal BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2013_c11_ccd2]
signal BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2013_c7_a95e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2013_c7_a95e]
signal result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2013_c7_a95e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2013_c7_a95e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2013_c7_a95e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2013_c7_a95e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2013_c7_a95e]
signal n16_MUX_uxn_opcodes_h_l2013_c7_a95e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2016_c11_36d5]
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2016_c7_e0fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2016_c7_e0fe]
signal result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2016_c7_e0fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2016_c7_e0fe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2016_c7_e0fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2016_c7_e0fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2016_c7_e0fe]
signal n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_0749]
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c7_996e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2021_c7_996e]
signal result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c7_996e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2021_c7_996e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c7_996e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c7_996e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2021_c7_996e]
signal n16_MUX_uxn_opcodes_h_l2021_c7_996e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_996e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2024_c11_cd18]
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2024_c7_7b7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2024_c7_7b7b]
signal result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2024_c7_7b7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2024_c7_7b7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2024_c7_7b7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2024_c7_7b7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2024_c7_7b7b]
signal n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2025_c3_ae47]
signal BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2027_c32_6dd8]
signal BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2027_c32_5565]
signal BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2027_c32_530f]
signal MUX_uxn_opcodes_h_l2027_c32_530f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2027_c32_530f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2027_c32_530f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2027_c32_530f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_6270]
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2029_c7_851a]
signal result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_851a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2029_c7_851a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_851a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_851a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2033_c24_ea36]
signal BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2033_c24_af62]
signal MUX_uxn_opcodes_h_l2033_c24_af62_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2033_c24_af62_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2033_c24_af62_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2033_c24_af62_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2035_c11_7ba1]
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2035_c7_e197]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2035_c7_e197]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7
BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_left,
BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_right,
BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_return_output);

-- t16_MUX_uxn_opcodes_h_l1993_c2_1bf1
t16_MUX_uxn_opcodes_h_l1993_c2_1bf1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond,
t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue,
t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse,
t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1
result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output);

-- n16_MUX_uxn_opcodes_h_l1993_c2_1bf1
n16_MUX_uxn_opcodes_h_l1993_c2_1bf1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond,
n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue,
n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse,
n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_left,
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_right,
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_return_output);

-- t16_MUX_uxn_opcodes_h_l1998_c7_16c1
t16_MUX_uxn_opcodes_h_l1998_c7_16c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1998_c7_16c1_cond,
t16_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue,
t16_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse,
t16_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1
result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output);

-- n16_MUX_uxn_opcodes_h_l1998_c7_16c1
n16_MUX_uxn_opcodes_h_l1998_c7_16c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1998_c7_16c1_cond,
n16_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue,
n16_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse,
n16_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_left,
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_right,
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_return_output);

-- t16_MUX_uxn_opcodes_h_l2001_c7_da1d
t16_MUX_uxn_opcodes_h_l2001_c7_da1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2001_c7_da1d_cond,
t16_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue,
t16_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse,
t16_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output);

-- n16_MUX_uxn_opcodes_h_l2001_c7_da1d
n16_MUX_uxn_opcodes_h_l2001_c7_da1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2001_c7_da1d_cond,
n16_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue,
n16_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse,
n16_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_left,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_right,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_return_output);

-- t16_MUX_uxn_opcodes_h_l2006_c7_fa78
t16_MUX_uxn_opcodes_h_l2006_c7_fa78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2006_c7_fa78_cond,
t16_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue,
t16_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse,
t16_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_cond,
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output);

-- n16_MUX_uxn_opcodes_h_l2006_c7_fa78
n16_MUX_uxn_opcodes_h_l2006_c7_fa78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2006_c7_fa78_cond,
n16_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue,
n16_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse,
n16_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_left,
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_right,
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_return_output);

-- t16_MUX_uxn_opcodes_h_l2009_c7_cb8e
t16_MUX_uxn_opcodes_h_l2009_c7_cb8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond,
t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue,
t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse,
t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output);

-- n16_MUX_uxn_opcodes_h_l2009_c7_cb8e
n16_MUX_uxn_opcodes_h_l2009_c7_cb8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond,
n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue,
n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse,
n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80
BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_left,
BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_right,
BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_left,
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_right,
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e
result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e
result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e
result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e
result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output);

-- n16_MUX_uxn_opcodes_h_l2013_c7_a95e
n16_MUX_uxn_opcodes_h_l2013_c7_a95e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2013_c7_a95e_cond,
n16_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue,
n16_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse,
n16_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_left,
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_right,
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe
result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond,
result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe
result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output);

-- n16_MUX_uxn_opcodes_h_l2016_c7_e0fe
n16_MUX_uxn_opcodes_h_l2016_c7_e0fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond,
n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue,
n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse,
n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_left,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_right,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_return_output);

-- n16_MUX_uxn_opcodes_h_l2021_c7_996e
n16_MUX_uxn_opcodes_h_l2021_c7_996e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2021_c7_996e_cond,
n16_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue,
n16_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse,
n16_MUX_uxn_opcodes_h_l2021_c7_996e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_left,
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_right,
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output);

-- n16_MUX_uxn_opcodes_h_l2024_c7_7b7b
n16_MUX_uxn_opcodes_h_l2024_c7_7b7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond,
n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue,
n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse,
n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47
BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_left,
BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_right,
BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8
BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_left,
BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_right,
BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565
BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_left,
BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_right,
BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_return_output);

-- MUX_uxn_opcodes_h_l2027_c32_530f
MUX_uxn_opcodes_h_l2027_c32_530f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2027_c32_530f_cond,
MUX_uxn_opcodes_h_l2027_c32_530f_iftrue,
MUX_uxn_opcodes_h_l2027_c32_530f_iffalse,
MUX_uxn_opcodes_h_l2027_c32_530f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_left,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_right,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36
BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_left,
BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_right,
BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_return_output);

-- MUX_uxn_opcodes_h_l2033_c24_af62
MUX_uxn_opcodes_h_l2033_c24_af62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2033_c24_af62_cond,
MUX_uxn_opcodes_h_l2033_c24_af62_iftrue,
MUX_uxn_opcodes_h_l2033_c24_af62_iffalse,
MUX_uxn_opcodes_h_l2033_c24_af62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_left,
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_right,
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467
CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_return_output,
 t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output,
 n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_return_output,
 t16_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output,
 n16_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_return_output,
 t16_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output,
 n16_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_return_output,
 t16_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output,
 n16_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_return_output,
 t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output,
 n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output,
 n16_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output,
 n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_return_output,
 n16_MUX_uxn_opcodes_h_l2021_c7_996e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output,
 n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_return_output,
 MUX_uxn_opcodes_h_l2027_c32_530f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_return_output,
 MUX_uxn_opcodes_h_l2033_c24_af62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1995_c3_86f4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1999_c3_218a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_16c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2004_c3_88b7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2001_c7_da1d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2007_c3_338c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_fa78_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2011_c3_d7bf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_41f0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2013_c7_a95e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_60e4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_996e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2022_c3_d99d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_996e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2027_c32_530f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2027_c32_530f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2027_c32_530f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2027_c32_530f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2032_c3_066d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2033_c24_af62_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2033_c24_af62_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2033_c24_af62_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2033_c24_af62_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_d564_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_6040_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2006_l2029_l2001_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_2523_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_l2035_DUPLICATE_e203_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l2016_l2013_l2009_l2035_DUPLICATE_aa26_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2017_l2010_l2002_l2025_DUPLICATE_ee38_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2024_l2029_DUPLICATE_f961_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2040_l1989_DUPLICATE_439e_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2007_c3_338c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2007_c3_338c;
     VAR_MUX_uxn_opcodes_h_l2033_c24_af62_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2011_c3_d7bf := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2011_c3_d7bf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_41f0 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_41f0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1995_c3_86f4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1995_c3_86f4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1999_c3_218a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1999_c3_218a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2022_c3_d99d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2022_c3_d99d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2004_c3_88b7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2004_c3_88b7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2032_c3_066d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2032_c3_066d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_60e4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_60e4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l2027_c32_530f_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2027_c32_530f_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_right := to_unsigned(10, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2033_c24_af62_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse := t16;
     -- BIN_OP_GT[uxn_opcodes_h_l2033_c24_ea36] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_left;
     BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_return_output := BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2035_c11_7ba1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_l2035_DUPLICATE_e203 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_l2035_DUPLICATE_e203_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2001_c11_4228] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_left;
     BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_return_output := BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2009_c11_9f78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_left;
     BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_return_output := BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2016_c11_36d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_0749] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_left;
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_return_output := BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_6270] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_left;
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_return_output := BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1998_c11_0d9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l2016_l2013_l2009_l2035_DUPLICATE_aa26 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l2016_l2013_l2009_l2035_DUPLICATE_aa26_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_baf9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2013_c11_ccd2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2027_c32_6dd8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_left;
     BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_return_output := BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_6040 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_6040_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_d564 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_d564_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2024_c11_cd18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_left;
     BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_return_output := BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2017_l2010_l2002_l2025_DUPLICATE_ee38 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2017_l2010_l2002_l2025_DUPLICATE_ee38_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1993_c6_01e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2024_l2029_DUPLICATE_f961 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2024_l2029_DUPLICATE_f961_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2006_l2029_l2001_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_2523 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2006_l2029_l2001_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_2523_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_6dd8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_01e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_16c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_16c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_0d9a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2001_c7_da1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2001_c7_da1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_4228_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_fa78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2006_c7_fa78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_baf9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_9f78_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2013_c7_a95e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_ccd2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_36d5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_996e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_0749_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_cd18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_6270_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_7ba1_return_output;
     VAR_MUX_uxn_opcodes_h_l2033_c24_af62_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_ea36_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2017_l2010_l2002_l2025_DUPLICATE_ee38_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2017_l2010_l2002_l2025_DUPLICATE_ee38_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2017_l2010_l2002_l2025_DUPLICATE_ee38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_d564_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_d564_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_d564_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_d564_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_d564_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_d564_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_d564_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_d564_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_d564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l2016_l2013_l2009_l2035_DUPLICATE_aa26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l2016_l2013_l2009_l2035_DUPLICATE_aa26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l2016_l2013_l2009_l2035_DUPLICATE_aa26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l2016_l2013_l2009_l2035_DUPLICATE_aa26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l2016_l2013_l2009_l2035_DUPLICATE_aa26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l2016_l2013_l2009_l2035_DUPLICATE_aa26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l2016_l2013_l2009_l2035_DUPLICATE_aa26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l2016_l2013_l2009_l2035_DUPLICATE_aa26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l2016_l2013_l2009_l2035_DUPLICATE_aa26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l2016_l2013_l2009_l2035_DUPLICATE_aa26_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2006_l2029_l2001_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_2523_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2006_l2029_l2001_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_2523_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2006_l2029_l2001_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_2523_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2006_l2029_l2001_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_2523_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2006_l2029_l2001_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_2523_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2006_l2029_l2001_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_2523_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2006_l2029_l2001_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_2523_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2006_l2029_l2001_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_2523_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2006_l2029_l2001_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_2523_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_l2035_DUPLICATE_e203_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_l2035_DUPLICATE_e203_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_l2035_DUPLICATE_e203_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_l2035_DUPLICATE_e203_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_l2035_DUPLICATE_e203_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_l2035_DUPLICATE_e203_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_l2035_DUPLICATE_e203_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_l2035_DUPLICATE_e203_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_l2035_DUPLICATE_e203_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2006_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_l2035_DUPLICATE_e203_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2024_l2029_DUPLICATE_f961_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2024_l2029_DUPLICATE_f961_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_6040_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_6040_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_6040_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_6040_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_6040_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_6040_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_6040_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_6040_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_6040_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2006_l2029_l2001_l2024_l1998_l2021_l1993_l2016_l2013_l2009_DUPLICATE_6040_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2025_c3_ae47] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_left;
     BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_return_output := BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2035_c7_e197] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2035_c7_e197] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_return_output;

     -- MUX[uxn_opcodes_h_l2033_c24_af62] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2033_c24_af62_cond <= VAR_MUX_uxn_opcodes_h_l2033_c24_af62_cond;
     MUX_uxn_opcodes_h_l2033_c24_af62_iftrue <= VAR_MUX_uxn_opcodes_h_l2033_c24_af62_iftrue;
     MUX_uxn_opcodes_h_l2033_c24_af62_iffalse <= VAR_MUX_uxn_opcodes_h_l2033_c24_af62_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2033_c24_af62_return_output := MUX_uxn_opcodes_h_l2033_c24_af62_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2029_c7_851a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2010_c3_7b80] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_left;
     BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_return_output := BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_851a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2027_c32_5565] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_left;
     BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_return_output := BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2027_c32_530f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_5565_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_7b80_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_ae47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_8467_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue := VAR_MUX_uxn_opcodes_h_l2033_c24_af62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_e197_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_851a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_e197_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_851a_return_output;
     -- n16_MUX[uxn_opcodes_h_l2024_c7_7b7b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond;
     n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue;
     n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output := n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_851a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2009_c7_cb8e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond;
     t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue;
     t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output := t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2024_c7_7b7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output;

     -- MUX[uxn_opcodes_h_l2027_c32_530f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2027_c32_530f_cond <= VAR_MUX_uxn_opcodes_h_l2027_c32_530f_cond;
     MUX_uxn_opcodes_h_l2027_c32_530f_iftrue <= VAR_MUX_uxn_opcodes_h_l2027_c32_530f_iftrue;
     MUX_uxn_opcodes_h_l2027_c32_530f_iffalse <= VAR_MUX_uxn_opcodes_h_l2027_c32_530f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2027_c32_530f_return_output := MUX_uxn_opcodes_h_l2027_c32_530f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2024_c7_7b7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_851a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2029_c7_851a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue := VAR_MUX_uxn_opcodes_h_l2027_c32_530f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_851a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_851a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_851a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;
     -- t16_MUX[uxn_opcodes_h_l2006_c7_fa78] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2006_c7_fa78_cond <= VAR_t16_MUX_uxn_opcodes_h_l2006_c7_fa78_cond;
     t16_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue;
     t16_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output := t16_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2024_c7_7b7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2024_c7_7b7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2021_c7_996e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2024_c7_7b7b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2021_c7_996e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2021_c7_996e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_996e_cond;
     n16_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue;
     n16_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_996e_return_output := n16_MUX_uxn_opcodes_h_l2021_c7_996e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c7_996e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2024_c7_7b7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2021_c7_996e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_996e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_996e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_7b7b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2021_c7_996e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2016_c7_e0fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output;

     -- t16_MUX[uxn_opcodes_h_l2001_c7_da1d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2001_c7_da1d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2001_c7_da1d_cond;
     t16_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue;
     t16_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output := t16_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c7_996e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c7_996e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2016_c7_e0fe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c7_996e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2016_c7_e0fe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond <= VAR_n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond;
     n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue;
     n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output := n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_996e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_996e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_996e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_996e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2016_c7_e0fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2013_c7_a95e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1998_c7_16c1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1998_c7_16c1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_16c1_cond;
     t16_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue;
     t16_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output := t16_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2013_c7_a95e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2016_c7_e0fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output;

     -- n16_MUX[uxn_opcodes_h_l2013_c7_a95e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2013_c7_a95e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2013_c7_a95e_cond;
     n16_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue;
     n16_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output := n16_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2016_c7_e0fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2016_c7_e0fe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output := result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_e0fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2013_c7_a95e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2013_c7_a95e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2013_c7_a95e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2009_c7_cb8e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond;
     n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue;
     n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output := n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1993_c2_1bf1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond;
     t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue;
     t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output := t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2009_c7_cb8e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2009_c7_cb8e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2013_c7_a95e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_a95e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2009_c7_cb8e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2006_c7_fa78] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2006_c7_fa78_cond <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_fa78_cond;
     n16_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue;
     n16_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output := n16_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2009_c7_cb8e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2006_c7_fa78] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2009_c7_cb8e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_fa78] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2009_c7_cb8e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_cb8e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2006_c7_fa78] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_fa78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_fa78] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;

     -- n16_MUX[uxn_opcodes_h_l2001_c7_da1d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2001_c7_da1d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2001_c7_da1d_cond;
     n16_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue;
     n16_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output := n16_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2006_c7_fa78] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output := result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2001_c7_da1d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2001_c7_da1d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_fa78_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2001_c7_da1d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2001_c7_da1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2001_c7_da1d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1998_c7_16c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2001_c7_da1d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1998_c7_16c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1998_c7_16c1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1998_c7_16c1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_16c1_cond;
     n16_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue;
     n16_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output := n16_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_da1d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1993_c2_1bf1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1998_c7_16c1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1998_c7_16c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1998_c7_16c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1998_c7_16c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c2_1bf1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1993_c2_1bf1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond;
     n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue;
     n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output := n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_16c1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1993_c2_1bf1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c2_1bf1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c2_1bf1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1993_c2_1bf1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2040_l1989_DUPLICATE_439e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2040_l1989_DUPLICATE_439e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_1bf1_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2040_l1989_DUPLICATE_439e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2040_l1989_DUPLICATE_439e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
