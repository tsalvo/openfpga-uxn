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
-- Submodules: 107
entity gth2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_3a9c1537;
architecture arch of gth2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1661_c6_dc5b]
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1661_c1_15a6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1661_c2_e722]
signal n16_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1661_c2_e722]
signal result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1661_c2_e722]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c2_e722]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1661_c2_e722]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1661_c2_e722]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1661_c2_e722]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c2_e722]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1661_c2_e722]
signal t16_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1662_c3_3c5f[uxn_opcodes_h_l1662_c3_3c5f]
signal printf_uxn_opcodes_h_l1662_c3_3c5f_uxn_opcodes_h_l1662_c3_3c5f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1667_c11_c655]
signal BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1667_c7_d12e]
signal n16_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1667_c7_d12e]
signal result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1667_c7_d12e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1667_c7_d12e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1667_c7_d12e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1667_c7_d12e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1667_c7_d12e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1667_c7_d12e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1667_c7_d12e]
signal t16_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1670_c11_3513]
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1670_c7_5a6d]
signal n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1670_c7_5a6d]
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1670_c7_5a6d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1670_c7_5a6d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1670_c7_5a6d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1670_c7_5a6d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1670_c7_5a6d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1670_c7_5a6d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1670_c7_5a6d]
signal t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1675_c11_fc33]
signal BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1675_c7_157a]
signal n16_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1675_c7_157a]
signal result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1675_c7_157a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1675_c7_157a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1675_c7_157a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1675_c7_157a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1675_c7_157a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1675_c7_157a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1675_c7_157a]
signal t16_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1678_c11_a705]
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1678_c7_7398]
signal n16_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1678_c7_7398]
signal result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1678_c7_7398]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1678_c7_7398]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1678_c7_7398]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1678_c7_7398]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1678_c7_7398]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1678_c7_7398]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1678_c7_7398]
signal t16_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1679_c3_ff69]
signal BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1682_c11_edc6]
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1682_c7_888c]
signal n16_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1682_c7_888c]
signal result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c7_888c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1682_c7_888c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1682_c7_888c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1682_c7_888c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c7_888c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c7_888c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1685_c11_9f13]
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1685_c7_9375]
signal n16_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1685_c7_9375]
signal result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1685_c7_9375]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1685_c7_9375]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1685_c7_9375]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1685_c7_9375]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1685_c7_9375]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1685_c7_9375]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1690_c11_a3a9]
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1690_c7_203e]
signal n16_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1690_c7_203e]
signal result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1690_c7_203e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1690_c7_203e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1690_c7_203e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1690_c7_203e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1690_c7_203e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1690_c7_203e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1693_c11_c02c]
signal BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1693_c7_502a]
signal n16_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1693_c7_502a]
signal result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1693_c7_502a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1693_c7_502a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1693_c7_502a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1693_c7_502a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1693_c7_502a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1693_c7_502a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1694_c3_5729]
signal BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1697_c32_52ac]
signal BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1697_c32_14c4]
signal BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1697_c32_bf67]
signal MUX_uxn_opcodes_h_l1697_c32_bf67_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1697_c32_bf67_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1697_c32_bf67_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1697_c32_bf67_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1699_c11_53ba]
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1699_c7_5b5e]
signal result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1699_c7_5b5e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1699_c7_5b5e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1699_c7_5b5e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c7_5b5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1703_c24_5f5a]
signal BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1703_c24_19d0]
signal MUX_uxn_opcodes_h_l1703_c24_19d0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1703_c24_19d0_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1703_c24_19d0_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1703_c24_19d0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1705_c11_8750]
signal BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1705_c7_9d86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1705_c7_9d86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b
BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_left,
BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_right,
BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_return_output);

-- n16_MUX_uxn_opcodes_h_l1661_c2_e722
n16_MUX_uxn_opcodes_h_l1661_c2_e722 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1661_c2_e722_cond,
n16_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue,
n16_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse,
n16_MUX_uxn_opcodes_h_l1661_c2_e722_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722
result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_cond,
result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722
result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_return_output);

-- t16_MUX_uxn_opcodes_h_l1661_c2_e722
t16_MUX_uxn_opcodes_h_l1661_c2_e722 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1661_c2_e722_cond,
t16_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue,
t16_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse,
t16_MUX_uxn_opcodes_h_l1661_c2_e722_return_output);

-- printf_uxn_opcodes_h_l1662_c3_3c5f_uxn_opcodes_h_l1662_c3_3c5f
printf_uxn_opcodes_h_l1662_c3_3c5f_uxn_opcodes_h_l1662_c3_3c5f : entity work.printf_uxn_opcodes_h_l1662_c3_3c5f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1662_c3_3c5f_uxn_opcodes_h_l1662_c3_3c5f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655
BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_left,
BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_right,
BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output);

-- n16_MUX_uxn_opcodes_h_l1667_c7_d12e
n16_MUX_uxn_opcodes_h_l1667_c7_d12e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1667_c7_d12e_cond,
n16_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue,
n16_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse,
n16_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e
result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e
result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e
result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e
result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output);

-- t16_MUX_uxn_opcodes_h_l1667_c7_d12e
t16_MUX_uxn_opcodes_h_l1667_c7_d12e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1667_c7_d12e_cond,
t16_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue,
t16_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse,
t16_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513
BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_left,
BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_right,
BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output);

-- n16_MUX_uxn_opcodes_h_l1670_c7_5a6d
n16_MUX_uxn_opcodes_h_l1670_c7_5a6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond,
n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue,
n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse,
n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d
result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output);

-- t16_MUX_uxn_opcodes_h_l1670_c7_5a6d
t16_MUX_uxn_opcodes_h_l1670_c7_5a6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond,
t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue,
t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse,
t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33
BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_left,
BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_right,
BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output);

-- n16_MUX_uxn_opcodes_h_l1675_c7_157a
n16_MUX_uxn_opcodes_h_l1675_c7_157a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1675_c7_157a_cond,
n16_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue,
n16_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse,
n16_MUX_uxn_opcodes_h_l1675_c7_157a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a
result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a
result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a
result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_return_output);

-- t16_MUX_uxn_opcodes_h_l1675_c7_157a
t16_MUX_uxn_opcodes_h_l1675_c7_157a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1675_c7_157a_cond,
t16_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue,
t16_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse,
t16_MUX_uxn_opcodes_h_l1675_c7_157a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705
BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_left,
BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_right,
BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output);

-- n16_MUX_uxn_opcodes_h_l1678_c7_7398
n16_MUX_uxn_opcodes_h_l1678_c7_7398 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1678_c7_7398_cond,
n16_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue,
n16_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse,
n16_MUX_uxn_opcodes_h_l1678_c7_7398_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398
result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_cond,
result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398
result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_return_output);

-- t16_MUX_uxn_opcodes_h_l1678_c7_7398
t16_MUX_uxn_opcodes_h_l1678_c7_7398 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1678_c7_7398_cond,
t16_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue,
t16_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse,
t16_MUX_uxn_opcodes_h_l1678_c7_7398_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69
BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_left,
BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_right,
BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_left,
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_right,
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_return_output);

-- n16_MUX_uxn_opcodes_h_l1682_c7_888c
n16_MUX_uxn_opcodes_h_l1682_c7_888c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1682_c7_888c_cond,
n16_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue,
n16_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse,
n16_MUX_uxn_opcodes_h_l1682_c7_888c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c
result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c
result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c
result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_left,
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_right,
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_return_output);

-- n16_MUX_uxn_opcodes_h_l1685_c7_9375
n16_MUX_uxn_opcodes_h_l1685_c7_9375 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1685_c7_9375_cond,
n16_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue,
n16_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse,
n16_MUX_uxn_opcodes_h_l1685_c7_9375_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375
result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_cond,
result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375
result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_left,
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_right,
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_return_output);

-- n16_MUX_uxn_opcodes_h_l1690_c7_203e
n16_MUX_uxn_opcodes_h_l1690_c7_203e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1690_c7_203e_cond,
n16_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue,
n16_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse,
n16_MUX_uxn_opcodes_h_l1690_c7_203e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e
result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e
result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c
BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_left,
BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_right,
BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_return_output);

-- n16_MUX_uxn_opcodes_h_l1693_c7_502a
n16_MUX_uxn_opcodes_h_l1693_c7_502a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1693_c7_502a_cond,
n16_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue,
n16_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse,
n16_MUX_uxn_opcodes_h_l1693_c7_502a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a
result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a
result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a
result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a
result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a
result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729
BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_left,
BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_right,
BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac
BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_left,
BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_right,
BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4
BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_left,
BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_right,
BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_return_output);

-- MUX_uxn_opcodes_h_l1697_c32_bf67
MUX_uxn_opcodes_h_l1697_c32_bf67 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1697_c32_bf67_cond,
MUX_uxn_opcodes_h_l1697_c32_bf67_iftrue,
MUX_uxn_opcodes_h_l1697_c32_bf67_iffalse,
MUX_uxn_opcodes_h_l1697_c32_bf67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_left,
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_right,
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a
BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_left,
BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_right,
BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_return_output);

-- MUX_uxn_opcodes_h_l1703_c24_19d0
MUX_uxn_opcodes_h_l1703_c24_19d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1703_c24_19d0_cond,
MUX_uxn_opcodes_h_l1703_c24_19d0_iftrue,
MUX_uxn_opcodes_h_l1703_c24_19d0_iffalse,
MUX_uxn_opcodes_h_l1703_c24_19d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750
BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_left,
BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_right,
BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86
result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86
result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb
CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_return_output,
 n16_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
 t16_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output,
 n16_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output,
 t16_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output,
 n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output,
 t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output,
 n16_MUX_uxn_opcodes_h_l1675_c7_157a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_return_output,
 t16_MUX_uxn_opcodes_h_l1675_c7_157a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output,
 n16_MUX_uxn_opcodes_h_l1678_c7_7398_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_return_output,
 t16_MUX_uxn_opcodes_h_l1678_c7_7398_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_return_output,
 n16_MUX_uxn_opcodes_h_l1682_c7_888c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_return_output,
 n16_MUX_uxn_opcodes_h_l1685_c7_9375_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_return_output,
 n16_MUX_uxn_opcodes_h_l1690_c7_203e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_return_output,
 n16_MUX_uxn_opcodes_h_l1693_c7_502a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_return_output,
 MUX_uxn_opcodes_h_l1697_c32_bf67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_return_output,
 MUX_uxn_opcodes_h_l1703_c24_19d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1664_c3_43fd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1661_c2_e722_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1661_c2_e722_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1662_c3_3c5f_uxn_opcodes_h_l1662_c3_3c5f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1668_c3_d3d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1667_c7_d12e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1673_c3_7667 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1675_c7_157a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1676_c3_ae0a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c7_7398_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1675_c7_157a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_d47a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c7_7398_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1683_c3_9d35 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1688_c3_eb14 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1691_c3_eed9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1697_c32_bf67_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1697_c32_bf67_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1697_c32_bf67_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1697_c32_bf67_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1702_c3_29af : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1703_c24_19d0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1703_c24_19d0_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1703_c24_19d0_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1703_c24_19d0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_b389_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1667_l1690_l1661_l1685_DUPLICATE_a273_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_122f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_7c04_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1685_DUPLICATE_3e1b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1699_l1670_l1693_l1667_l1690_l1685_DUPLICATE_80fd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1686_l1694_l1671_l1679_DUPLICATE_94f6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1699_l1693_DUPLICATE_2d10_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1657_l1710_DUPLICATE_8f4b_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1676_c3_ae0a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1676_c3_ae0a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_right := to_unsigned(10, 4);
     VAR_MUX_uxn_opcodes_h_l1703_c24_19d0_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1697_c32_bf67_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1691_c3_eed9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1691_c3_eed9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1702_c3_29af := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1702_c3_29af;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1688_c3_eb14 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1688_c3_eb14;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1673_c3_7667 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1673_c3_7667;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1664_c3_43fd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1664_c3_43fd;
     VAR_MUX_uxn_opcodes_h_l1697_c32_bf67_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1683_c3_9d35 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1683_c3_9d35;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1668_c3_d3d0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1668_c3_d3d0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_d47a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_d47a;
     VAR_MUX_uxn_opcodes_h_l1703_c24_19d0_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1693_c11_c02c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1685_c11_9f13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_left;
     BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_return_output := BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1667_l1690_l1661_l1685_DUPLICATE_a273 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1667_l1690_l1661_l1685_DUPLICATE_a273_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1697_c32_52ac] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_left;
     BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_return_output := BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1699_l1670_l1693_l1667_l1690_l1685_DUPLICATE_80fd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1699_l1670_l1693_l1667_l1690_l1685_DUPLICATE_80fd_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1682_c11_edc6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1675_c11_fc33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_left;
     BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output := BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1670_c11_3513] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_left;
     BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output := BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_7c04 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_7c04_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1699_l1693_DUPLICATE_2d10 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1699_l1693_DUPLICATE_2d10_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1685_DUPLICATE_3e1b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1685_DUPLICATE_3e1b_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1705_c11_8750] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_left;
     BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_return_output := BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1661_c6_dc5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1703_c24_5f5a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_left;
     BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_return_output := BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_b389 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_b389_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1699_c11_53ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1686_l1694_l1671_l1679_DUPLICATE_94f6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1686_l1694_l1671_l1679_DUPLICATE_94f6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1678_c11_a705] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_left;
     BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output := BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1690_c11_a3a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_122f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_122f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1667_c11_c655] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_left;
     BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output := BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1697_c32_52ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1661_c2_e722_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1661_c2_e722_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c6_dc5b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1667_c7_d12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1667_c7_d12e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1667_c11_c655_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_3513_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1675_c7_157a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1675_c7_157a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1675_c11_fc33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1678_c7_7398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c7_7398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c11_a705_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1682_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_edc6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1685_c7_9375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9f13_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1690_c7_203e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_a3a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1693_c7_502a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1693_c11_c02c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_53ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_8750_return_output;
     VAR_MUX_uxn_opcodes_h_l1703_c24_19d0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1703_c24_5f5a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1686_l1694_l1671_l1679_DUPLICATE_94f6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1686_l1694_l1671_l1679_DUPLICATE_94f6_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1686_l1694_l1671_l1679_DUPLICATE_94f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_122f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_122f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_122f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_122f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_122f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_122f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_122f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_122f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_122f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1699_l1670_l1693_l1667_l1690_l1685_DUPLICATE_80fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1699_l1670_l1693_l1667_l1690_l1685_DUPLICATE_80fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1699_l1670_l1693_l1667_l1690_l1685_DUPLICATE_80fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1699_l1670_l1693_l1667_l1690_l1685_DUPLICATE_80fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1699_l1670_l1693_l1667_l1690_l1685_DUPLICATE_80fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1699_l1670_l1693_l1667_l1690_l1685_DUPLICATE_80fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1699_l1670_l1693_l1667_l1690_l1685_DUPLICATE_80fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1699_l1670_l1693_l1667_l1690_l1685_DUPLICATE_80fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1699_l1670_l1693_l1667_l1690_l1685_DUPLICATE_80fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1699_l1670_l1693_l1667_l1690_l1685_DUPLICATE_80fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1667_l1690_l1661_l1685_DUPLICATE_a273_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1667_l1690_l1661_l1685_DUPLICATE_a273_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1667_l1690_l1661_l1685_DUPLICATE_a273_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1667_l1690_l1661_l1685_DUPLICATE_a273_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1667_l1690_l1661_l1685_DUPLICATE_a273_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1667_l1690_l1661_l1685_DUPLICATE_a273_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1667_l1690_l1661_l1685_DUPLICATE_a273_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1667_l1690_l1661_l1685_DUPLICATE_a273_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1667_l1690_l1661_l1685_DUPLICATE_a273_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1685_DUPLICATE_3e1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1685_DUPLICATE_3e1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1685_DUPLICATE_3e1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1685_DUPLICATE_3e1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1685_DUPLICATE_3e1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1685_DUPLICATE_3e1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1685_DUPLICATE_3e1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1670_l1693_l1667_l1690_l1685_DUPLICATE_3e1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_7c04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_7c04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_7c04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_7c04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_7c04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_7c04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_7c04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_7c04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_7c04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1682_l1678_l1705_l1675_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_7c04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1699_l1693_DUPLICATE_2d10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1699_l1693_DUPLICATE_2d10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_b389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_b389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_b389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_b389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_b389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_b389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_b389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_b389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_b389_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1682_l1678_l1675_l1699_l1670_l1693_l1667_l1690_l1661_l1685_DUPLICATE_b389_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1693_c7_502a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1705_c7_9d86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1694_c3_5729] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_left;
     BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_return_output := BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1679_c3_ff69] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_left;
     BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_return_output := BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1661_c1_15a6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1699_c7_5b5e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output;

     -- MUX[uxn_opcodes_h_l1703_c24_19d0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1703_c24_19d0_cond <= VAR_MUX_uxn_opcodes_h_l1703_c24_19d0_cond;
     MUX_uxn_opcodes_h_l1703_c24_19d0_iftrue <= VAR_MUX_uxn_opcodes_h_l1703_c24_19d0_iftrue;
     MUX_uxn_opcodes_h_l1703_c24_19d0_iffalse <= VAR_MUX_uxn_opcodes_h_l1703_c24_19d0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1703_c24_19d0_return_output := MUX_uxn_opcodes_h_l1703_c24_19d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1699_c7_5b5e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1705_c7_9d86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1697_c32_14c4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_left;
     BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_return_output := BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1697_c32_bf67_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1697_c32_14c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1679_c3_ff69_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1694_c3_5729_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1687_l1672_DUPLICATE_9dcb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue := VAR_MUX_uxn_opcodes_h_l1703_c24_19d0_return_output;
     VAR_printf_uxn_opcodes_h_l1662_c3_3c5f_uxn_opcodes_h_l1662_c3_3c5f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1661_c1_15a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_9d86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1705_c7_9d86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1690_c7_203e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1693_c7_502a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1693_c7_502a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1699_c7_5b5e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1693_c7_502a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1693_c7_502a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1693_c7_502a_cond;
     n16_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue;
     n16_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1693_c7_502a_return_output := n16_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;

     -- MUX[uxn_opcodes_h_l1697_c32_bf67] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1697_c32_bf67_cond <= VAR_MUX_uxn_opcodes_h_l1697_c32_bf67_cond;
     MUX_uxn_opcodes_h_l1697_c32_bf67_iftrue <= VAR_MUX_uxn_opcodes_h_l1697_c32_bf67_iftrue;
     MUX_uxn_opcodes_h_l1697_c32_bf67_iffalse <= VAR_MUX_uxn_opcodes_h_l1697_c32_bf67_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1697_c32_bf67_return_output := MUX_uxn_opcodes_h_l1697_c32_bf67_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1699_c7_5b5e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1678_c7_7398] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1678_c7_7398_cond <= VAR_t16_MUX_uxn_opcodes_h_l1678_c7_7398_cond;
     t16_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue;
     t16_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1678_c7_7398_return_output := t16_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c7_5b5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output;

     -- printf_uxn_opcodes_h_l1662_c3_3c5f[uxn_opcodes_h_l1662_c3_3c5f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1662_c3_3c5f_uxn_opcodes_h_l1662_c3_3c5f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1662_c3_3c5f_uxn_opcodes_h_l1662_c3_3c5f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue := VAR_MUX_uxn_opcodes_h_l1697_c32_bf67_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1699_c7_5b5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1693_c7_502a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1693_c7_502a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1693_c7_502a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1690_c7_203e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1693_c7_502a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1685_c7_9375] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;

     -- n16_MUX[uxn_opcodes_h_l1690_c7_203e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1690_c7_203e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1690_c7_203e_cond;
     n16_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue;
     n16_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1690_c7_203e_return_output := n16_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1675_c7_157a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1675_c7_157a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1675_c7_157a_cond;
     t16_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue;
     t16_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1675_c7_157a_return_output := t16_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1690_c7_203e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1693_c7_502a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1690_c7_203e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1685_c7_9375] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1690_c7_203e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1690_c7_203e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1682_c7_888c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1690_c7_203e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1670_c7_5a6d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond;
     t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue;
     t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output := t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1685_c7_9375] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1685_c7_9375_cond <= VAR_n16_MUX_uxn_opcodes_h_l1685_c7_9375_cond;
     n16_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue;
     n16_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1685_c7_9375_return_output := n16_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1685_c7_9375] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1690_c7_203e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1682_c7_888c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1685_c7_9375] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_return_output := result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c7_888c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1685_c7_9375] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1678_c7_7398] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;

     -- t16_MUX[uxn_opcodes_h_l1667_c7_d12e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1667_c7_d12e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1667_c7_d12e_cond;
     t16_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue;
     t16_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output := t16_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1685_c7_9375] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;

     -- n16_MUX[uxn_opcodes_h_l1682_c7_888c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1682_c7_888c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1682_c7_888c_cond;
     n16_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue;
     n16_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1682_c7_888c_return_output := n16_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1685_c7_9375] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1685_c7_9375_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1682_c7_888c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c7_888c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1661_c2_e722] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1661_c2_e722_cond <= VAR_t16_MUX_uxn_opcodes_h_l1661_c2_e722_cond;
     t16_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue;
     t16_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1661_c2_e722_return_output := t16_MUX_uxn_opcodes_h_l1661_c2_e722_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c7_888c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1678_c7_7398] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1682_c7_888c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1678_c7_7398] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1678_c7_7398_cond <= VAR_n16_MUX_uxn_opcodes_h_l1678_c7_7398_cond;
     n16_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue;
     n16_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1678_c7_7398_return_output := n16_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1678_c7_7398] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1675_c7_157a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_888c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1661_c2_e722_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1670_c7_5a6d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1675_c7_157a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1675_c7_157a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1675_c7_157a_cond;
     n16_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue;
     n16_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1675_c7_157a_return_output := n16_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1675_c7_157a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1675_c7_157a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1678_c7_7398] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1678_c7_7398] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1678_c7_7398] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1678_c7_7398] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_return_output := result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1678_c7_7398_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1670_c7_5a6d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1675_c7_157a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1670_c7_5a6d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond;
     n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue;
     n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output := n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1667_c7_d12e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1670_c7_5a6d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1675_c7_157a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1675_c7_157a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1675_c7_157a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1675_c7_157a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1667_c7_d12e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1670_c7_5a6d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1670_c7_5a6d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1667_c7_d12e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1667_c7_d12e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1667_c7_d12e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1667_c7_d12e_cond;
     n16_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue;
     n16_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output := n16_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1661_c2_e722] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1670_c7_5a6d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1670_c7_5a6d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5a6d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1667_c7_d12e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1667_c7_d12e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1661_c2_e722] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1667_c7_d12e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c2_e722] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_return_output;

     -- n16_MUX[uxn_opcodes_h_l1661_c2_e722] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1661_c2_e722_cond <= VAR_n16_MUX_uxn_opcodes_h_l1661_c2_e722_cond;
     n16_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue;
     n16_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1661_c2_e722_return_output := n16_MUX_uxn_opcodes_h_l1661_c2_e722_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1667_c7_d12e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1661_c2_e722_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1667_c7_d12e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c2_e722] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1661_c2_e722] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1661_c2_e722] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_return_output := result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1661_c2_e722] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1657_l1710_DUPLICATE_8f4b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1657_l1710_DUPLICATE_8f4b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1661_c2_e722_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c2_e722_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1657_l1710_DUPLICATE_8f4b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1657_l1710_DUPLICATE_8f4b_return_output;
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
