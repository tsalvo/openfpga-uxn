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
-- Submodules: 98
entity gth2_0CLK_5ccafc54 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_5ccafc54;
architecture arch of gth2_0CLK_5ccafc54 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1993_c6_8d40]
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1993_c1_10e2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1993_c2_ba61]
signal t16_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1993_c2_ba61]
signal n16_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c2_ba61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1993_c2_ba61]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c2_ba61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1993_c2_ba61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1993_c2_ba61]
signal result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c2_ba61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1994_c3_fd34[uxn_opcodes_h_l1994_c3_fd34]
signal printf_uxn_opcodes_h_l1994_c3_fd34_uxn_opcodes_h_l1994_c3_fd34_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1998_c11_ac8a]
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1998_c7_a592]
signal t16_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1998_c7_a592]
signal n16_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1998_c7_a592]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1998_c7_a592]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1998_c7_a592]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1998_c7_a592]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1998_c7_a592]
signal result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1998_c7_a592]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2001_c11_3779]
signal BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2001_c7_926e]
signal t16_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2001_c7_926e]
signal n16_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2001_c7_926e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2001_c7_926e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2001_c7_926e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2001_c7_926e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2001_c7_926e]
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2001_c7_926e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_8287]
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2006_c7_2851]
signal t16_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2006_c7_2851]
signal n16_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_2851]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2006_c7_2851]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_2851]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2006_c7_2851]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2006_c7_2851]
signal result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_2851]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2009_c11_b4bd]
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2009_c7_36bf]
signal t16_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2009_c7_36bf]
signal n16_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2009_c7_36bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2009_c7_36bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2009_c7_36bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2009_c7_36bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2009_c7_36bf]
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2009_c7_36bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2010_c3_74bb]
signal BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2013_c11_a711]
signal BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2013_c7_606a]
signal n16_MUX_uxn_opcodes_h_l2013_c7_606a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2013_c7_606a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2013_c7_606a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2013_c7_606a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2013_c7_606a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2013_c7_606a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2013_c7_606a]
signal result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2013_c7_606a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2016_c11_8d9b]
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2016_c7_6e24]
signal n16_MUX_uxn_opcodes_h_l2016_c7_6e24_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2016_c7_6e24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2016_c7_6e24]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2016_c7_6e24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2016_c7_6e24]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2016_c7_6e24]
signal result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2016_c7_6e24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_3f4f]
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2021_c7_da81]
signal n16_MUX_uxn_opcodes_h_l2021_c7_da81_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c7_da81_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c7_da81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2021_c7_da81]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c7_da81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c7_da81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2021_c7_da81]
signal result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c7_da81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2024_c11_8e62]
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2024_c7_3cb0]
signal n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2024_c7_3cb0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2024_c7_3cb0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2024_c7_3cb0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2024_c7_3cb0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2024_c7_3cb0]
signal result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2024_c7_3cb0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2025_c3_b2a7]
signal BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2027_c32_a248]
signal BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2027_c32_465a]
signal BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2027_c32_321d]
signal MUX_uxn_opcodes_h_l2027_c32_321d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2027_c32_321d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2027_c32_321d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2027_c32_321d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_44cc]
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_f8a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2029_c7_f8a0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_f8a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2029_c7_f8a0]
signal result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_f8a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2033_c24_1c22]
signal BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2033_c24_4e0f]
signal MUX_uxn_opcodes_h_l2033_c24_4e0f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2033_c24_4e0f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2033_c24_4e0f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2033_c24_4e0f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2035_c11_9144]
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2035_c7_5fd0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2035_c7_5fd0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40
BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_left,
BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_right,
BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_return_output);

-- t16_MUX_uxn_opcodes_h_l1993_c2_ba61
t16_MUX_uxn_opcodes_h_l1993_c2_ba61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1993_c2_ba61_cond,
t16_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue,
t16_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse,
t16_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output);

-- n16_MUX_uxn_opcodes_h_l1993_c2_ba61
n16_MUX_uxn_opcodes_h_l1993_c2_ba61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1993_c2_ba61_cond,
n16_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue,
n16_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse,
n16_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61
result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_cond,
result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output);

-- printf_uxn_opcodes_h_l1994_c3_fd34_uxn_opcodes_h_l1994_c3_fd34
printf_uxn_opcodes_h_l1994_c3_fd34_uxn_opcodes_h_l1994_c3_fd34 : entity work.printf_uxn_opcodes_h_l1994_c3_fd34_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1994_c3_fd34_uxn_opcodes_h_l1994_c3_fd34_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_left,
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_right,
BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_return_output);

-- t16_MUX_uxn_opcodes_h_l1998_c7_a592
t16_MUX_uxn_opcodes_h_l1998_c7_a592 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1998_c7_a592_cond,
t16_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue,
t16_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse,
t16_MUX_uxn_opcodes_h_l1998_c7_a592_return_output);

-- n16_MUX_uxn_opcodes_h_l1998_c7_a592
n16_MUX_uxn_opcodes_h_l1998_c7_a592 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1998_c7_a592_cond,
n16_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue,
n16_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse,
n16_MUX_uxn_opcodes_h_l1998_c7_a592_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592
result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_cond,
result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_left,
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_right,
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_return_output);

-- t16_MUX_uxn_opcodes_h_l2001_c7_926e
t16_MUX_uxn_opcodes_h_l2001_c7_926e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2001_c7_926e_cond,
t16_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue,
t16_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse,
t16_MUX_uxn_opcodes_h_l2001_c7_926e_return_output);

-- n16_MUX_uxn_opcodes_h_l2001_c7_926e
n16_MUX_uxn_opcodes_h_l2001_c7_926e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2001_c7_926e_cond,
n16_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue,
n16_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse,
n16_MUX_uxn_opcodes_h_l2001_c7_926e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_left,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_right,
BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_return_output);

-- t16_MUX_uxn_opcodes_h_l2006_c7_2851
t16_MUX_uxn_opcodes_h_l2006_c7_2851 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2006_c7_2851_cond,
t16_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue,
t16_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse,
t16_MUX_uxn_opcodes_h_l2006_c7_2851_return_output);

-- n16_MUX_uxn_opcodes_h_l2006_c7_2851
n16_MUX_uxn_opcodes_h_l2006_c7_2851 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2006_c7_2851_cond,
n16_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue,
n16_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse,
n16_MUX_uxn_opcodes_h_l2006_c7_2851_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_cond,
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_left,
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_right,
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_return_output);

-- t16_MUX_uxn_opcodes_h_l2009_c7_36bf
t16_MUX_uxn_opcodes_h_l2009_c7_36bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2009_c7_36bf_cond,
t16_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue,
t16_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse,
t16_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output);

-- n16_MUX_uxn_opcodes_h_l2009_c7_36bf
n16_MUX_uxn_opcodes_h_l2009_c7_36bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2009_c7_36bf_cond,
n16_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue,
n16_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse,
n16_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_cond,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb
BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_left,
BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_right,
BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_left,
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_right,
BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_return_output);

-- n16_MUX_uxn_opcodes_h_l2013_c7_606a
n16_MUX_uxn_opcodes_h_l2013_c7_606a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2013_c7_606a_cond,
n16_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue,
n16_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse,
n16_MUX_uxn_opcodes_h_l2013_c7_606a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a
result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a
result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a
result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a
result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_left,
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_right,
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_return_output);

-- n16_MUX_uxn_opcodes_h_l2016_c7_6e24
n16_MUX_uxn_opcodes_h_l2016_c7_6e24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2016_c7_6e24_cond,
n16_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue,
n16_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse,
n16_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24
result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24
result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24
result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_cond,
result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_left,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_right,
BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_return_output);

-- n16_MUX_uxn_opcodes_h_l2021_c7_da81
n16_MUX_uxn_opcodes_h_l2021_c7_da81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2021_c7_da81_cond,
n16_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue,
n16_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse,
n16_MUX_uxn_opcodes_h_l2021_c7_da81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_cond,
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_left,
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_right,
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_return_output);

-- n16_MUX_uxn_opcodes_h_l2024_c7_3cb0
n16_MUX_uxn_opcodes_h_l2024_c7_3cb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond,
n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue,
n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse,
n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7
BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_left,
BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_right,
BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248
BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_left,
BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_right,
BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a
BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_left,
BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_right,
BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_return_output);

-- MUX_uxn_opcodes_h_l2027_c32_321d
MUX_uxn_opcodes_h_l2027_c32_321d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2027_c32_321d_cond,
MUX_uxn_opcodes_h_l2027_c32_321d_iftrue,
MUX_uxn_opcodes_h_l2027_c32_321d_iffalse,
MUX_uxn_opcodes_h_l2027_c32_321d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_left,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_right,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22
BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_left,
BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_right,
BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_return_output);

-- MUX_uxn_opcodes_h_l2033_c24_4e0f
MUX_uxn_opcodes_h_l2033_c24_4e0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2033_c24_4e0f_cond,
MUX_uxn_opcodes_h_l2033_c24_4e0f_iftrue,
MUX_uxn_opcodes_h_l2033_c24_4e0f_iffalse,
MUX_uxn_opcodes_h_l2033_c24_4e0f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_left,
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_right,
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71
CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_return_output,
 t16_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output,
 n16_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_return_output,
 t16_MUX_uxn_opcodes_h_l1998_c7_a592_return_output,
 n16_MUX_uxn_opcodes_h_l1998_c7_a592_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_return_output,
 t16_MUX_uxn_opcodes_h_l2001_c7_926e_return_output,
 n16_MUX_uxn_opcodes_h_l2001_c7_926e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_return_output,
 t16_MUX_uxn_opcodes_h_l2006_c7_2851_return_output,
 n16_MUX_uxn_opcodes_h_l2006_c7_2851_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_return_output,
 t16_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output,
 n16_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_return_output,
 n16_MUX_uxn_opcodes_h_l2013_c7_606a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_return_output,
 n16_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_return_output,
 n16_MUX_uxn_opcodes_h_l2021_c7_da81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_return_output,
 n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_return_output,
 MUX_uxn_opcodes_h_l2027_c32_321d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_return_output,
 MUX_uxn_opcodes_h_l2033_c24_4e0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1995_c3_708b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1994_c3_fd34_uxn_opcodes_h_l1994_c3_fd34_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1999_c3_b3fb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2004_c3_44e6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2007_c3_40be : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2013_c7_606a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2011_c3_e6c9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2013_c7_606a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_3652 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_da81_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2016_c7_6e24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_b36f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c7_da81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2022_c3_894f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2027_c32_321d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2027_c32_321d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2027_c32_321d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2027_c32_321d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2032_c3_c897 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2033_c24_4e0f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2033_c24_4e0f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2033_c24_4e0f_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2033_c24_4e0f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2035_l2006_l2001_l2024_DUPLICATE_28e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_DUPLICATE_6354_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2001_l2024_DUPLICATE_9557_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_l2024_DUPLICATE_af94_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1998_l2021_l2016_l2013_l2009_l2035_l2006_l2029_l2001_l2024_DUPLICATE_fb45_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2002_l2017_l2025_l2010_DUPLICATE_41e3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2024_DUPLICATE_8838_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2040_l1989_DUPLICATE_c42b_return_output : opcode_result_t;
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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1995_c3_708b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1995_c3_708b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2011_c3_e6c9 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2011_c3_e6c9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2004_c3_44e6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2004_c3_44e6;
     VAR_MUX_uxn_opcodes_h_l2033_c24_4e0f_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_opcodes_h_l2033_c24_4e0f_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2027_c32_321d_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_b36f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2019_c3_b36f;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2027_c32_321d_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1999_c3_b3fb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1999_c3_b3fb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_3652 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_3652;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2022_c3_894f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2022_c3_894f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2007_c3_40be := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2007_c3_40be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2032_c3_c897 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2032_c3_c897;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2016_c11_8d9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2002_l2017_l2025_l2010_DUPLICATE_41e3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2002_l2017_l2025_l2010_DUPLICATE_41e3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_44cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2009_c11_b4bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2024_c11_8e62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_left;
     BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_return_output := BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1998_l2021_l2016_l2013_l2009_l2035_l2006_l2029_l2001_l2024_DUPLICATE_fb45 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1998_l2021_l2016_l2013_l2009_l2035_l2006_l2029_l2001_l2024_DUPLICATE_fb45_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_DUPLICATE_6354 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_DUPLICATE_6354_return_output := result.is_sp_shift;

     -- BIN_OP_GT[uxn_opcodes_h_l2033_c24_1c22] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_left;
     BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_return_output := BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2001_c11_3779] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_left;
     BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_return_output := BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1998_c11_ac8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2006_c11_8287] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_left;
     BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_return_output := BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2035_c11_9144] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_left;
     BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_return_output := BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2021_c11_3f4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2035_l2006_l2001_l2024_DUPLICATE_28e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2035_l2006_l2001_l2024_DUPLICATE_28e9_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2024_DUPLICATE_8838 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2024_DUPLICATE_8838_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2013_c11_a711] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_left;
     BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_return_output := BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1993_c6_8d40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_left;
     BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output := BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2027_c32_a248] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_left;
     BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_return_output := BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_l2024_DUPLICATE_af94 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_l2024_DUPLICATE_af94_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2001_l2024_DUPLICATE_9557 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2001_l2024_DUPLICATE_9557_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2027_c32_a248_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1993_c2_ba61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c2_ba61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1993_c6_8d40_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1998_c11_ac8a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2001_c7_926e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2001_c7_926e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_3779_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_2851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2006_c7_2851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2006_c11_8287_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2009_c7_36bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2009_c7_36bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_b4bd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2013_c7_606a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2013_c11_a711_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2016_c7_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_8d9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_da81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c11_3f4f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_8e62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_44cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_9144_return_output;
     VAR_MUX_uxn_opcodes_h_l2033_c24_4e0f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2033_c24_1c22_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2002_l2017_l2025_l2010_DUPLICATE_41e3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2002_l2017_l2025_l2010_DUPLICATE_41e3_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2002_l2017_l2025_l2010_DUPLICATE_41e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2001_l2024_DUPLICATE_9557_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2001_l2024_DUPLICATE_9557_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2001_l2024_DUPLICATE_9557_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2001_l2024_DUPLICATE_9557_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2001_l2024_DUPLICATE_9557_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2001_l2024_DUPLICATE_9557_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2001_l2024_DUPLICATE_9557_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2001_l2024_DUPLICATE_9557_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2001_l2024_DUPLICATE_9557_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1998_l2021_l2016_l2013_l2009_l2035_l2006_l2029_l2001_l2024_DUPLICATE_fb45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1998_l2021_l2016_l2013_l2009_l2035_l2006_l2029_l2001_l2024_DUPLICATE_fb45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1998_l2021_l2016_l2013_l2009_l2035_l2006_l2029_l2001_l2024_DUPLICATE_fb45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1998_l2021_l2016_l2013_l2009_l2035_l2006_l2029_l2001_l2024_DUPLICATE_fb45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1998_l2021_l2016_l2013_l2009_l2035_l2006_l2029_l2001_l2024_DUPLICATE_fb45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1998_l2021_l2016_l2013_l2009_l2035_l2006_l2029_l2001_l2024_DUPLICATE_fb45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1998_l2021_l2016_l2013_l2009_l2035_l2006_l2029_l2001_l2024_DUPLICATE_fb45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1998_l2021_l2016_l2013_l2009_l2035_l2006_l2029_l2001_l2024_DUPLICATE_fb45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1998_l2021_l2016_l2013_l2009_l2035_l2006_l2029_l2001_l2024_DUPLICATE_fb45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1998_l2021_l2016_l2013_l2009_l2035_l2006_l2029_l2001_l2024_DUPLICATE_fb45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_DUPLICATE_6354_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_DUPLICATE_6354_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_DUPLICATE_6354_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_DUPLICATE_6354_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_DUPLICATE_6354_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_DUPLICATE_6354_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_DUPLICATE_6354_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_DUPLICATE_6354_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_DUPLICATE_6354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2035_l2006_l2001_l2024_DUPLICATE_28e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2035_l2006_l2001_l2024_DUPLICATE_28e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2035_l2006_l2001_l2024_DUPLICATE_28e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2035_l2006_l2001_l2024_DUPLICATE_28e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2035_l2006_l2001_l2024_DUPLICATE_28e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2035_l2006_l2001_l2024_DUPLICATE_28e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2035_l2006_l2001_l2024_DUPLICATE_28e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2035_l2006_l2001_l2024_DUPLICATE_28e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2035_l2006_l2001_l2024_DUPLICATE_28e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2035_l2006_l2001_l2024_DUPLICATE_28e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2024_DUPLICATE_8838_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2024_DUPLICATE_8838_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_l2024_DUPLICATE_af94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_l2024_DUPLICATE_af94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_l2024_DUPLICATE_af94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_l2024_DUPLICATE_af94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_l2024_DUPLICATE_af94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_l2024_DUPLICATE_af94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_l2024_DUPLICATE_af94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_l2024_DUPLICATE_af94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_l2024_DUPLICATE_af94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1998_l2021_l1993_l2016_l2013_l2009_l2006_l2029_l2001_l2024_DUPLICATE_af94_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2025_c3_b2a7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_left;
     BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_return_output := BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2035_c7_5fd0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2035_c7_5fd0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_f8a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2029_c7_f8a0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output;

     -- MUX[uxn_opcodes_h_l2033_c24_4e0f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2033_c24_4e0f_cond <= VAR_MUX_uxn_opcodes_h_l2033_c24_4e0f_cond;
     MUX_uxn_opcodes_h_l2033_c24_4e0f_iftrue <= VAR_MUX_uxn_opcodes_h_l2033_c24_4e0f_iftrue;
     MUX_uxn_opcodes_h_l2033_c24_4e0f_iffalse <= VAR_MUX_uxn_opcodes_h_l2033_c24_4e0f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2033_c24_4e0f_return_output := MUX_uxn_opcodes_h_l2033_c24_4e0f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1993_c1_10e2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2010_c3_74bb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_left;
     BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_return_output := BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2027_c32_465a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_left;
     BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_return_output := BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2027_c32_321d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2027_c32_465a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2010_c3_74bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2025_c3_b2a7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2003_l2018_DUPLICATE_6c71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue := VAR_MUX_uxn_opcodes_h_l2033_c24_4e0f_return_output;
     VAR_printf_uxn_opcodes_h_l1994_c3_fd34_uxn_opcodes_h_l1994_c3_fd34_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1993_c1_10e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_5fd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_5fd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2024_c7_3cb0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output;

     -- printf_uxn_opcodes_h_l1994_c3_fd34[uxn_opcodes_h_l1994_c3_fd34] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1994_c3_fd34_uxn_opcodes_h_l1994_c3_fd34_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1994_c3_fd34_uxn_opcodes_h_l1994_c3_fd34_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l2009_c7_36bf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2009_c7_36bf_cond <= VAR_t16_MUX_uxn_opcodes_h_l2009_c7_36bf_cond;
     t16_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue;
     t16_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output := t16_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2024_c7_3cb0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2024_c7_3cb0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond;
     n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue;
     n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output := n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_f8a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output;

     -- MUX[uxn_opcodes_h_l2027_c32_321d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2027_c32_321d_cond <= VAR_MUX_uxn_opcodes_h_l2027_c32_321d_cond;
     MUX_uxn_opcodes_h_l2027_c32_321d_iftrue <= VAR_MUX_uxn_opcodes_h_l2027_c32_321d_iftrue;
     MUX_uxn_opcodes_h_l2027_c32_321d_iffalse <= VAR_MUX_uxn_opcodes_h_l2027_c32_321d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2027_c32_321d_return_output := MUX_uxn_opcodes_h_l2027_c32_321d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2029_c7_f8a0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_f8a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue := VAR_MUX_uxn_opcodes_h_l2027_c32_321d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_f8a0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;
     -- n16_MUX[uxn_opcodes_h_l2021_c7_da81] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2021_c7_da81_cond <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_da81_cond;
     n16_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue;
     n16_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2021_c7_da81_return_output := n16_MUX_uxn_opcodes_h_l2021_c7_da81_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2024_c7_3cb0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2006_c7_2851] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2006_c7_2851_cond <= VAR_t16_MUX_uxn_opcodes_h_l2006_c7_2851_cond;
     t16_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue;
     t16_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2006_c7_2851_return_output := t16_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2024_c7_3cb0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c7_da81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2024_c7_3cb0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2021_c7_da81] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2024_c7_3cb0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2021_c7_da81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2021_c7_da81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c7_da81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_3cb0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c7_da81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2016_c7_6e24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output;

     -- t16_MUX[uxn_opcodes_h_l2001_c7_926e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2001_c7_926e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2001_c7_926e_cond;
     t16_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue;
     t16_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2001_c7_926e_return_output := t16_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2021_c7_da81] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_return_output := result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2016_c7_6e24] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output;

     -- n16_MUX[uxn_opcodes_h_l2016_c7_6e24] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2016_c7_6e24_cond <= VAR_n16_MUX_uxn_opcodes_h_l2016_c7_6e24_cond;
     n16_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue;
     n16_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output := n16_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c7_da81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c7_da81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c7_da81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c7_da81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c7_da81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2021_c7_da81_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2013_c7_606a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2016_c7_6e24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2013_c7_606a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1998_c7_a592] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1998_c7_a592_cond <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a592_cond;
     t16_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue;
     t16_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a592_return_output := t16_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2016_c7_6e24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output;

     -- n16_MUX[uxn_opcodes_h_l2013_c7_606a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2013_c7_606a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2013_c7_606a_cond;
     n16_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue;
     n16_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2013_c7_606a_return_output := n16_MUX_uxn_opcodes_h_l2013_c7_606a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2016_c7_6e24] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2016_c7_6e24] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output := result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2013_c7_606a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2013_c7_606a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2013_c7_606a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2016_c7_6e24_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2013_c7_606a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2009_c7_36bf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2009_c7_36bf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2009_c7_36bf_cond;
     n16_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue;
     n16_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output := n16_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2013_c7_606a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1993_c2_ba61] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1993_c2_ba61_cond <= VAR_t16_MUX_uxn_opcodes_h_l1993_c2_ba61_cond;
     t16_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue;
     t16_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output := t16_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2013_c7_606a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2009_c7_36bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2009_c7_36bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2013_c7_606a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2013_c7_606a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2013_c7_606a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2013_c7_606a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2013_c7_606a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2006_c7_2851] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;

     -- n16_MUX[uxn_opcodes_h_l2006_c7_2851] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2006_c7_2851_cond <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_2851_cond;
     n16_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue;
     n16_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2006_c7_2851_return_output := n16_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2009_c7_36bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2009_c7_36bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2006_c7_2851] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2009_c7_36bf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output := result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2009_c7_36bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_36bf_return_output;
     -- n16_MUX[uxn_opcodes_h_l2001_c7_926e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2001_c7_926e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2001_c7_926e_cond;
     n16_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue;
     n16_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2001_c7_926e_return_output := n16_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2006_c7_2851] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2006_c7_2851] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2006_c7_2851] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_return_output := result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2006_c7_2851] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2001_c7_926e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2001_c7_926e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2006_c7_2851_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2001_c7_926e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2001_c7_926e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1998_c7_a592] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1998_c7_a592_cond <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a592_cond;
     n16_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue;
     n16_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a592_return_output := n16_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1998_c7_a592] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2001_c7_926e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2001_c7_926e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1998_c7_a592] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_926e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1998_c7_a592] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_return_output := result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;

     -- n16_MUX[uxn_opcodes_h_l1993_c2_ba61] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1993_c2_ba61_cond <= VAR_n16_MUX_uxn_opcodes_h_l1993_c2_ba61_cond;
     n16_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue;
     n16_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output := n16_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1998_c7_a592] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1998_c7_a592] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1993_c2_ba61] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1993_c2_ba61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1998_c7_a592] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1998_c7_a592_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1993_c2_ba61] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output := result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1993_c2_ba61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1993_c2_ba61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1993_c2_ba61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2040_l1989_DUPLICATE_c42b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2040_l1989_DUPLICATE_c42b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1993_c2_ba61_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2040_l1989_DUPLICATE_c42b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2040_l1989_DUPLICATE_c42b_return_output;
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
