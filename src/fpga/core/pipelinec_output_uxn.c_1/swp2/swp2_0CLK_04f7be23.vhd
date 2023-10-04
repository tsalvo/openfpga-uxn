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
-- Submodules: 128
entity swp2_0CLK_04f7be23 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_04f7be23;
architecture arch of swp2_0CLK_04f7be23 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2351_c6_a69c]
signal BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2351_c1_ad00]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2351_c2_056e]
signal t16_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2351_c2_056e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2351_c2_056e]
signal result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2351_c2_056e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2351_c2_056e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2351_c2_056e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2351_c2_056e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2351_c2_056e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2351_c2_056e]
signal n16_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2352_c3_76fd[uxn_opcodes_h_l2352_c3_76fd]
signal printf_uxn_opcodes_h_l2352_c3_76fd_uxn_opcodes_h_l2352_c3_76fd_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2357_c11_c75d]
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2357_c7_b31a]
signal t16_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2357_c7_b31a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2357_c7_b31a]
signal result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2357_c7_b31a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2357_c7_b31a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2357_c7_b31a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2357_c7_b31a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2357_c7_b31a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2357_c7_b31a]
signal n16_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_884f]
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2360_c7_8dde]
signal t16_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2360_c7_8dde]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2360_c7_8dde]
signal result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_8dde]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2360_c7_8dde]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_8dde]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_8dde]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2360_c7_8dde]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2360_c7_8dde]
signal n16_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2365_c11_0a33]
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2365_c7_073e]
signal t16_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2365_c7_073e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2365_c7_073e]
signal result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2365_c7_073e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2365_c7_073e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2365_c7_073e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2365_c7_073e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2365_c7_073e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2365_c7_073e]
signal n16_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2368_c11_66ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2368_c7_12f5]
signal t16_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2368_c7_12f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2368_c7_12f5]
signal result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2368_c7_12f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2368_c7_12f5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2368_c7_12f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2368_c7_12f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2368_c7_12f5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2368_c7_12f5]
signal n16_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2369_c3_d123]
signal BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_49f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2372_c7_9d8e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2372_c7_9d8e]
signal result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_9d8e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2372_c7_9d8e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_9d8e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_9d8e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2372_c7_9d8e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2372_c7_9d8e]
signal n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2375_c11_8bef]
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2375_c7_394a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2375_c7_394a]
signal result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2375_c7_394a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2375_c7_394a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2375_c7_394a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2375_c7_394a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2375_c7_394a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2375_c7_394a]
signal n16_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2380_c11_3f2a]
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2380_c7_c4bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2380_c7_c4bf]
signal result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2380_c7_c4bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2380_c7_c4bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2380_c7_c4bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2380_c7_c4bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2380_c7_c4bf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2380_c7_c4bf]
signal n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2383_c11_7e70]
signal BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2383_c7_96c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2383_c7_96c9]
signal result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2383_c7_96c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2383_c7_96c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2383_c7_96c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2383_c7_96c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2383_c7_96c9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2383_c7_96c9]
signal n16_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2384_c3_62c9]
signal BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2387_c32_7d79]
signal BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2387_c32_4795]
signal BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2387_c32_9c08]
signal MUX_uxn_opcodes_h_l2387_c32_9c08_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2387_c32_9c08_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2387_c32_9c08_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2387_c32_9c08_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2389_c11_b427]
signal BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2389_c7_87b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2389_c7_87b0]
signal result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2389_c7_87b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2389_c7_87b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2389_c7_87b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2395_c11_9c97]
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2395_c7_4ec9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2395_c7_4ec9]
signal result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2395_c7_4ec9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2395_c7_4ec9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2395_c7_4ec9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2397_c34_4059]
signal CONST_SR_8_uxn_opcodes_h_l2397_c34_4059_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2397_c34_4059_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2399_c11_2fc2]
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2399_c7_2aad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2399_c7_2aad]
signal result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2399_c7_2aad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2399_c7_2aad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2399_c7_2aad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2404_c11_92b8]
signal BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2404_c7_7d96]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2404_c7_7d96]
signal result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2404_c7_7d96]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2404_c7_7d96]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2406_c34_caab]
signal CONST_SR_8_uxn_opcodes_h_l2406_c34_caab_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2406_c34_caab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2408_c11_c8f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2408_c7_f711]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2408_c7_f711]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c
BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_left,
BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_right,
BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_return_output);

-- t16_MUX_uxn_opcodes_h_l2351_c2_056e
t16_MUX_uxn_opcodes_h_l2351_c2_056e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2351_c2_056e_cond,
t16_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue,
t16_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse,
t16_MUX_uxn_opcodes_h_l2351_c2_056e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e
result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e
result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e
result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e
result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e
result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_return_output);

-- n16_MUX_uxn_opcodes_h_l2351_c2_056e
n16_MUX_uxn_opcodes_h_l2351_c2_056e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2351_c2_056e_cond,
n16_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue,
n16_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse,
n16_MUX_uxn_opcodes_h_l2351_c2_056e_return_output);

-- printf_uxn_opcodes_h_l2352_c3_76fd_uxn_opcodes_h_l2352_c3_76fd
printf_uxn_opcodes_h_l2352_c3_76fd_uxn_opcodes_h_l2352_c3_76fd : entity work.printf_uxn_opcodes_h_l2352_c3_76fd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2352_c3_76fd_uxn_opcodes_h_l2352_c3_76fd_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_left,
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_right,
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output);

-- t16_MUX_uxn_opcodes_h_l2357_c7_b31a
t16_MUX_uxn_opcodes_h_l2357_c7_b31a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2357_c7_b31a_cond,
t16_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue,
t16_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse,
t16_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output);

-- n16_MUX_uxn_opcodes_h_l2357_c7_b31a
n16_MUX_uxn_opcodes_h_l2357_c7_b31a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2357_c7_b31a_cond,
n16_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue,
n16_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse,
n16_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_left,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_right,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output);

-- t16_MUX_uxn_opcodes_h_l2360_c7_8dde
t16_MUX_uxn_opcodes_h_l2360_c7_8dde : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2360_c7_8dde_cond,
t16_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue,
t16_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse,
t16_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde
result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_cond,
result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde
result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output);

-- n16_MUX_uxn_opcodes_h_l2360_c7_8dde
n16_MUX_uxn_opcodes_h_l2360_c7_8dde : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2360_c7_8dde_cond,
n16_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue,
n16_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse,
n16_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_left,
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_right,
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output);

-- t16_MUX_uxn_opcodes_h_l2365_c7_073e
t16_MUX_uxn_opcodes_h_l2365_c7_073e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2365_c7_073e_cond,
t16_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue,
t16_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse,
t16_MUX_uxn_opcodes_h_l2365_c7_073e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e
result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e
result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e
result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e
result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_return_output);

-- n16_MUX_uxn_opcodes_h_l2365_c7_073e
n16_MUX_uxn_opcodes_h_l2365_c7_073e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2365_c7_073e_cond,
n16_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue,
n16_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse,
n16_MUX_uxn_opcodes_h_l2365_c7_073e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae
BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output);

-- t16_MUX_uxn_opcodes_h_l2368_c7_12f5
t16_MUX_uxn_opcodes_h_l2368_c7_12f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2368_c7_12f5_cond,
t16_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue,
t16_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse,
t16_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5
result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5
result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output);

-- n16_MUX_uxn_opcodes_h_l2368_c7_12f5
n16_MUX_uxn_opcodes_h_l2368_c7_12f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2368_c7_12f5_cond,
n16_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue,
n16_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse,
n16_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123
BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_left,
BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_right,
BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e
result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output);

-- n16_MUX_uxn_opcodes_h_l2372_c7_9d8e
n16_MUX_uxn_opcodes_h_l2372_c7_9d8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond,
n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue,
n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse,
n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_left,
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_right,
BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a
result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a
result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_return_output);

-- n16_MUX_uxn_opcodes_h_l2375_c7_394a
n16_MUX_uxn_opcodes_h_l2375_c7_394a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2375_c7_394a_cond,
n16_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue,
n16_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse,
n16_MUX_uxn_opcodes_h_l2375_c7_394a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_left,
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_right,
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond,
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf
result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output);

-- n16_MUX_uxn_opcodes_h_l2380_c7_c4bf
n16_MUX_uxn_opcodes_h_l2380_c7_c4bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond,
n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue,
n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse,
n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70
BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_left,
BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_right,
BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9
result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9
result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9
result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9
result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output);

-- n16_MUX_uxn_opcodes_h_l2383_c7_96c9
n16_MUX_uxn_opcodes_h_l2383_c7_96c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2383_c7_96c9_cond,
n16_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue,
n16_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse,
n16_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9
BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_left,
BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_right,
BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79
BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_left,
BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_right,
BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795
BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_left,
BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_right,
BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_return_output);

-- MUX_uxn_opcodes_h_l2387_c32_9c08
MUX_uxn_opcodes_h_l2387_c32_9c08 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2387_c32_9c08_cond,
MUX_uxn_opcodes_h_l2387_c32_9c08_iftrue,
MUX_uxn_opcodes_h_l2387_c32_9c08_iffalse,
MUX_uxn_opcodes_h_l2387_c32_9c08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_left,
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_right,
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0
result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_left,
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_right,
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9
result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2397_c34_4059
CONST_SR_8_uxn_opcodes_h_l2397_c34_4059 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2397_c34_4059_x,
CONST_SR_8_uxn_opcodes_h_l2397_c34_4059_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_left,
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_right,
BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad
result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_cond,
result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8
BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_left,
BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_right,
BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96
result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_cond,
result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2406_c34_caab
CONST_SR_8_uxn_opcodes_h_l2406_c34_caab : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2406_c34_caab_x,
CONST_SR_8_uxn_opcodes_h_l2406_c34_caab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4
BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8
CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_return_output,
 t16_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
 n16_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output,
 t16_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output,
 n16_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output,
 t16_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output,
 n16_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output,
 t16_MUX_uxn_opcodes_h_l2365_c7_073e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_return_output,
 n16_MUX_uxn_opcodes_h_l2365_c7_073e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output,
 t16_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output,
 n16_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output,
 n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_return_output,
 n16_MUX_uxn_opcodes_h_l2375_c7_394a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output,
 n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output,
 n16_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_return_output,
 MUX_uxn_opcodes_h_l2387_c32_9c08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output,
 CONST_SR_8_uxn_opcodes_h_l2397_c34_4059_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output,
 CONST_SR_8_uxn_opcodes_h_l2406_c34_caab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_1e1b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2351_c2_056e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2351_c2_056e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2352_c3_76fd_uxn_opcodes_h_l2352_c3_76fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_2d60 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2357_c7_b31a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_517c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2365_c7_073e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2360_c7_8dde_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_1535 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2365_c7_073e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_bca5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2368_c7_12f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_88eb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_394a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_1deb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2375_c7_394a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2381_c3_88b1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2383_c7_96c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2387_c32_9c08_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2387_c32_9c08_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2387_c32_9c08_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2387_c32_9c08_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2392_c3_f3a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2393_c24_8a53_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_b856 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2397_c34_4059_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2397_c34_4059_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2397_c24_ce6c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2401_c3_6eba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2402_c24_8dc4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2405_c3_f0d1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2406_c34_caab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2406_c34_caab_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2406_c24_0f24_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2357_l2380_l2351_l2375_DUPLICATE_91ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_l2404_DUPLICATE_bc09_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_DUPLICATE_90a3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2375_DUPLICATE_33ca_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2369_l2384_l2376_DUPLICATE_629d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2383_l2404_DUPLICATE_b69e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2347_l2413_DUPLICATE_b9ed_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_517c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2363_c3_517c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_1deb := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_1deb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_bca5 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_bca5;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2387_c32_9c08_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_1535 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_1535;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_2d60 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_2d60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l2387_c32_9c08_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_88eb := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_88eb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2381_c3_88b1 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2381_c3_88b1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2392_c3_f3a0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2392_c3_f3a0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2401_c3_6eba := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2401_c3_6eba;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_right := to_unsigned(10, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_right := to_unsigned(13, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_1e1b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_1e1b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_b856 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2396_c3_b856;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2405_c3_f0d1 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2405_c3_f0d1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_right := to_unsigned(7, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_right := to_unsigned(128, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2397_c34_4059_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2406_c34_caab_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse := t16;
     -- BIN_OP_AND[uxn_opcodes_h_l2387_c32_7d79] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_left;
     BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_return_output := BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_DUPLICATE_90a3 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_DUPLICATE_90a3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2368_c11_66ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_49f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_l2404_DUPLICATE_bc09 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_l2404_DUPLICATE_bc09_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2375_c11_8bef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2383_c11_7e70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_left;
     BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_return_output := BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2408_c11_c8f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2404_c11_92b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2375_DUPLICATE_33ca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2375_DUPLICATE_33ca_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2399_c11_2fc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2351_c6_a69c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2357_l2380_l2351_l2375_DUPLICATE_91ec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2357_l2380_l2351_l2375_DUPLICATE_91ec_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2393_c24_8a53] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2393_c24_8a53_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2365_c11_0a33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_left;
     BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output := BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2357_c11_c75d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2369_l2384_l2376_DUPLICATE_629d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2369_l2384_l2376_DUPLICATE_629d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2380_c11_3f2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2402_c24_8dc4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2402_c24_8dc4_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_884f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2389_c11_b427] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_left;
     BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_return_output := BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2383_l2404_DUPLICATE_b69e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2383_l2404_DUPLICATE_b69e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l2406_c34_caab] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2406_c34_caab_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2406_c34_caab_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2406_c34_caab_return_output := CONST_SR_8_uxn_opcodes_h_l2406_c34_caab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2395_c11_9c97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_left;
     BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_return_output := BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2397_c34_4059] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2397_c34_4059_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2397_c34_4059_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2397_c34_4059_return_output := CONST_SR_8_uxn_opcodes_h_l2397_c34_4059_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2387_c32_7d79_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2351_c2_056e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2351_c2_056e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_a69c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2357_c7_b31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2357_c7_b31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_c75d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2360_c7_8dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_8dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_884f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2365_c7_073e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2365_c7_073e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_0a33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2368_c7_12f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2368_c7_12f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_66ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_49f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_394a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2375_c11_8bef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_3f2a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2383_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2383_c11_7e70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_b427_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_9c97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2399_c11_2fc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c11_92b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c11_c8f4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2369_l2384_l2376_DUPLICATE_629d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2369_l2384_l2376_DUPLICATE_629d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2369_l2384_l2376_DUPLICATE_629d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2393_c24_8a53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2402_c24_8dc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_DUPLICATE_90a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_DUPLICATE_90a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_DUPLICATE_90a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_DUPLICATE_90a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_DUPLICATE_90a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_DUPLICATE_90a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_DUPLICATE_90a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_DUPLICATE_90a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_DUPLICATE_90a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2389_l2360_l2383_l2357_l2380_l2408_l2375_l2404_DUPLICATE_dc88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2357_l2380_l2351_l2375_DUPLICATE_91ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2357_l2380_l2351_l2375_DUPLICATE_91ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2357_l2380_l2351_l2375_DUPLICATE_91ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2357_l2380_l2351_l2375_DUPLICATE_91ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2357_l2380_l2351_l2375_DUPLICATE_91ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2357_l2380_l2351_l2375_DUPLICATE_91ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2357_l2380_l2351_l2375_DUPLICATE_91ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2357_l2380_l2351_l2375_DUPLICATE_91ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2357_l2380_l2351_l2375_DUPLICATE_91ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2357_l2380_l2351_l2375_DUPLICATE_91ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2375_DUPLICATE_33ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2375_DUPLICATE_33ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2375_DUPLICATE_33ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2375_DUPLICATE_33ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2375_DUPLICATE_33ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2375_DUPLICATE_33ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2375_DUPLICATE_33ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2375_DUPLICATE_33ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2372_l2399_l2368_l2395_l2365_l2360_l2383_l2357_l2380_l2408_l2351_l2375_l2404_DUPLICATE_874e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2383_l2404_DUPLICATE_b69e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2383_l2404_DUPLICATE_b69e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_l2404_DUPLICATE_bc09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_l2404_DUPLICATE_bc09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_l2404_DUPLICATE_bc09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_l2404_DUPLICATE_bc09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_l2404_DUPLICATE_bc09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_l2404_DUPLICATE_bc09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_l2404_DUPLICATE_bc09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_l2404_DUPLICATE_bc09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_l2404_DUPLICATE_bc09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2372_l2368_l2365_l2360_l2383_l2357_l2380_l2351_l2375_l2404_DUPLICATE_bc09_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2408_c7_f711] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2397_c24_ce6c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2397_c24_ce6c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2397_c34_4059_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2399_c7_2aad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2384_c3_62c9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_left;
     BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_return_output := BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2369_c3_d123] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_left;
     BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_return_output := BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2387_c32_4795] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_left;
     BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_return_output := BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2351_c1_ad00] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2406_c24_0f24] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2406_c24_0f24_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2406_c34_caab_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2383_c7_96c9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2404_c7_7d96] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2408_c7_f711] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2387_c32_9c08_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2387_c32_4795_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2369_c3_d123_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2384_c3_62c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2397_c24_ce6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2406_c24_0f24_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2362_l2377_DUPLICATE_f2c8_return_output;
     VAR_printf_uxn_opcodes_h_l2352_c3_76fd_uxn_opcodes_h_l2352_c3_76fd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_ad00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c7_f711_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c7_f711_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output;
     -- n16_MUX[uxn_opcodes_h_l2383_c7_96c9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2383_c7_96c9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2383_c7_96c9_cond;
     n16_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue;
     n16_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output := n16_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2399_c7_2aad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2404_c7_7d96] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2380_c7_c4bf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;

     -- t16_MUX[uxn_opcodes_h_l2368_c7_12f5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2368_c7_12f5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2368_c7_12f5_cond;
     t16_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue;
     t16_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output := t16_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;

     -- MUX[uxn_opcodes_h_l2387_c32_9c08] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2387_c32_9c08_cond <= VAR_MUX_uxn_opcodes_h_l2387_c32_9c08_cond;
     MUX_uxn_opcodes_h_l2387_c32_9c08_iftrue <= VAR_MUX_uxn_opcodes_h_l2387_c32_9c08_iftrue;
     MUX_uxn_opcodes_h_l2387_c32_9c08_iffalse <= VAR_MUX_uxn_opcodes_h_l2387_c32_9c08_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2387_c32_9c08_return_output := MUX_uxn_opcodes_h_l2387_c32_9c08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2404_c7_7d96] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2395_c7_4ec9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2404_c7_7d96] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output := result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output;

     -- printf_uxn_opcodes_h_l2352_c3_76fd[uxn_opcodes_h_l2352_c3_76fd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2352_c3_76fd_uxn_opcodes_h_l2352_c3_76fd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2352_c3_76fd_uxn_opcodes_h_l2352_c3_76fd_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue := VAR_MUX_uxn_opcodes_h_l2387_c32_9c08_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c7_7d96_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2375_c7_394a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2399_c7_2aad] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output := result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output;

     -- n16_MUX[uxn_opcodes_h_l2380_c7_c4bf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond;
     n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue;
     n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output := n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2389_c7_87b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2383_c7_96c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2399_c7_2aad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2399_c7_2aad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output;

     -- t16_MUX[uxn_opcodes_h_l2365_c7_073e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2365_c7_073e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2365_c7_073e_cond;
     t16_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue;
     t16_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2365_c7_073e_return_output := t16_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2395_c7_4ec9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2399_c7_2aad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;
     -- t16_MUX[uxn_opcodes_h_l2360_c7_8dde] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2360_c7_8dde_cond <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_8dde_cond;
     t16_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue;
     t16_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output := t16_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;

     -- n16_MUX[uxn_opcodes_h_l2375_c7_394a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2375_c7_394a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2375_c7_394a_cond;
     n16_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue;
     n16_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2375_c7_394a_return_output := n16_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2372_c7_9d8e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2395_c7_4ec9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2383_c7_96c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2389_c7_87b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2395_c7_4ec9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2395_c7_4ec9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2380_c7_c4bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2395_c7_4ec9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2383_c7_96c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2389_c7_87b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2372_c7_9d8e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond;
     n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue;
     n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output := n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2389_c7_87b0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2375_c7_394a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2368_c7_12f5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2357_c7_b31a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2357_c7_b31a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2357_c7_b31a_cond;
     t16_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue;
     t16_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output := t16_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2380_c7_c4bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2389_c7_87b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2389_c7_87b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;
     -- t16_MUX[uxn_opcodes_h_l2351_c2_056e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2351_c2_056e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2351_c2_056e_cond;
     t16_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue;
     t16_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2351_c2_056e_return_output := t16_MUX_uxn_opcodes_h_l2351_c2_056e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2383_c7_96c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2365_c7_073e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2375_c7_394a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2383_c7_96c9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2380_c7_c4bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_9d8e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2383_c7_96c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2368_c7_12f5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2368_c7_12f5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2368_c7_12f5_cond;
     n16_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue;
     n16_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output := n16_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2383_c7_96c9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2351_c2_056e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2380_c7_c4bf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output := result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2380_c7_c4bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2375_c7_394a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2372_c7_9d8e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2368_c7_12f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2380_c7_c4bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2360_c7_8dde] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;

     -- n16_MUX[uxn_opcodes_h_l2365_c7_073e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2365_c7_073e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2365_c7_073e_cond;
     n16_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue;
     n16_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2365_c7_073e_return_output := n16_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_c4bf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_9d8e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2365_c7_073e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2357_c7_b31a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2360_c7_8dde] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2360_c7_8dde_cond <= VAR_n16_MUX_uxn_opcodes_h_l2360_c7_8dde_cond;
     n16_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue;
     n16_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output := n16_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2375_c7_394a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2368_c7_12f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2375_c7_394a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2375_c7_394a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2375_c7_394a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2365_c7_073e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2372_c7_9d8e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2357_c7_b31a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2357_c7_b31a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2357_c7_b31a_cond;
     n16_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue;
     n16_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output := n16_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2372_c7_9d8e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_9d8e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2351_c2_056e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2368_c7_12f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_8dde] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_9d8e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2368_c7_12f5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2365_c7_073e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2357_c7_b31a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2360_c7_8dde] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;

     -- n16_MUX[uxn_opcodes_h_l2351_c2_056e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2351_c2_056e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2351_c2_056e_cond;
     n16_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue;
     n16_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2351_c2_056e_return_output := n16_MUX_uxn_opcodes_h_l2351_c2_056e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2368_c7_12f5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2368_c7_12f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2351_c2_056e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_12f5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2365_c7_073e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2365_c7_073e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2365_c7_073e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_8dde] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2357_c7_b31a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2351_c2_056e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_073e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2357_c7_b31a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2351_c2_056e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2360_c7_8dde] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2360_c7_8dde] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output := result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_8dde] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_8dde_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2351_c2_056e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2357_c7_b31a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2357_c7_b31a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2357_c7_b31a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_b31a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2351_c2_056e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2351_c2_056e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2351_c2_056e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2347_l2413_DUPLICATE_b9ed LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2347_l2413_DUPLICATE_b9ed_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_056e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_056e_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2347_l2413_DUPLICATE_b9ed_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2347_l2413_DUPLICATE_b9ed_return_output;
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
