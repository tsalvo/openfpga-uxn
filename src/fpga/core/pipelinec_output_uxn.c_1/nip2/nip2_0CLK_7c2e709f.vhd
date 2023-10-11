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
-- Submodules: 66
entity nip2_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip2_0CLK_7c2e709f;
architecture arch of nip2_0CLK_7c2e709f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2360_c6_d59b]
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2360_c1_bc7a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2360_c2_2574]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c2_2574]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c2_2574]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c2_2574]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2360_c2_2574]
signal result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2360_c2_2574]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2360_c2_2574]
signal t16_MUX_uxn_opcodes_h_l2360_c2_2574_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c2_2574_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2361_c3_5790[uxn_opcodes_h_l2361_c3_5790]
signal printf_uxn_opcodes_h_l2361_c3_5790_uxn_opcodes_h_l2361_c3_5790_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2365_c11_7016]
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2365_c7_0c47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2365_c7_0c47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2365_c7_0c47]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2365_c7_0c47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2365_c7_0c47]
signal result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2365_c7_0c47]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2365_c7_0c47]
signal t16_MUX_uxn_opcodes_h_l2365_c7_0c47_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2368_c11_2d8b]
signal BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2368_c7_4f47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2368_c7_4f47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2368_c7_4f47]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2368_c7_4f47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2368_c7_4f47]
signal result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2368_c7_4f47]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2368_c7_4f47]
signal t16_MUX_uxn_opcodes_h_l2368_c7_4f47_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2370_c3_6db5]
signal CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2373_c11_e3eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2373_c7_c2c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2373_c7_c2c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2373_c7_c2c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2373_c7_c2c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2373_c7_c2c0]
signal result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2373_c7_c2c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2373_c7_c2c0]
signal t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2376_c11_902e]
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2376_c7_f613]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2376_c7_f613]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2376_c7_f613]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2376_c7_f613]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2376_c7_f613]
signal result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2376_c7_f613]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2376_c7_f613]
signal t16_MUX_uxn_opcodes_h_l2376_c7_f613_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2376_c7_f613_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2377_c3_7f4a]
signal BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2379_c32_67ca]
signal BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2379_c32_d82f]
signal BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2379_c32_15db]
signal MUX_uxn_opcodes_h_l2379_c32_15db_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2379_c32_15db_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2379_c32_15db_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2379_c32_15db_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2381_c11_b5fd]
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2381_c7_228a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2381_c7_228a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2381_c7_228a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2381_c7_228a]
signal result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2381_c7_228a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2387_c11_c1fe]
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2387_c7_4f2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2387_c7_4f2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2387_c7_4f2e]
signal result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2387_c7_4f2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2389_c34_cab9]
signal CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2391_c11_4561]
signal BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2391_c7_ee11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2391_c7_ee11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b
BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_left,
BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_right,
BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574
result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_cond,
result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_return_output);

-- t16_MUX_uxn_opcodes_h_l2360_c2_2574
t16_MUX_uxn_opcodes_h_l2360_c2_2574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2360_c2_2574_cond,
t16_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue,
t16_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse,
t16_MUX_uxn_opcodes_h_l2360_c2_2574_return_output);

-- printf_uxn_opcodes_h_l2361_c3_5790_uxn_opcodes_h_l2361_c3_5790
printf_uxn_opcodes_h_l2361_c3_5790_uxn_opcodes_h_l2361_c3_5790 : entity work.printf_uxn_opcodes_h_l2361_c3_5790_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2361_c3_5790_uxn_opcodes_h_l2361_c3_5790_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_left,
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_right,
BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47
result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47
result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_cond,
result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47
result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output);

-- t16_MUX_uxn_opcodes_h_l2365_c7_0c47
t16_MUX_uxn_opcodes_h_l2365_c7_0c47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2365_c7_0c47_cond,
t16_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue,
t16_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse,
t16_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b
BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_left,
BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_right,
BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47
result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_cond,
result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output);

-- t16_MUX_uxn_opcodes_h_l2368_c7_4f47
t16_MUX_uxn_opcodes_h_l2368_c7_4f47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2368_c7_4f47_cond,
t16_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue,
t16_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse,
t16_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5
CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5_x,
CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output);

-- t16_MUX_uxn_opcodes_h_l2373_c7_c2c0
t16_MUX_uxn_opcodes_h_l2373_c7_c2c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond,
t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue,
t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse,
t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_left,
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_right,
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613
result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_cond,
result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_return_output);

-- t16_MUX_uxn_opcodes_h_l2376_c7_f613
t16_MUX_uxn_opcodes_h_l2376_c7_f613 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2376_c7_f613_cond,
t16_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue,
t16_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse,
t16_MUX_uxn_opcodes_h_l2376_c7_f613_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a
BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_left,
BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_right,
BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca
BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_left,
BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_right,
BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f
BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_left,
BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_right,
BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_return_output);

-- MUX_uxn_opcodes_h_l2379_c32_15db
MUX_uxn_opcodes_h_l2379_c32_15db : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2379_c32_15db_cond,
MUX_uxn_opcodes_h_l2379_c32_15db_iftrue,
MUX_uxn_opcodes_h_l2379_c32_15db_iffalse,
MUX_uxn_opcodes_h_l2379_c32_15db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_left,
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_right,
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a
result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe
BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_left,
BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_right,
BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e
result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9
CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9_x,
CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561
BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_left,
BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_right,
BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_return_output,
 t16_MUX_uxn_opcodes_h_l2360_c2_2574_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output,
 t16_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output,
 t16_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output,
 CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output,
 t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_return_output,
 t16_MUX_uxn_opcodes_h_l2376_c7_f613_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_return_output,
 MUX_uxn_opcodes_h_l2379_c32_15db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output,
 CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_a2e3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c2_2574_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c2_2574_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2361_c3_5790_uxn_opcodes_h_l2361_c3_5790_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_27ae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2365_c7_0c47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2371_c3_4d66 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2368_c7_4f47_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2374_c3_0c07 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2376_c7_f613_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2376_c7_f613_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2379_c32_15db_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2379_c32_15db_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2379_c32_15db_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2379_c32_15db_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2384_c3_16e2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2385_c24_dc7f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2388_c3_195e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2389_c24_7b73_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2391_l2360_DUPLICATE_d2ef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2376_l2373_l2368_l2365_l2360_DUPLICATE_f57e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2360_DUPLICATE_df0e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2381_l2373_l2368_l2365_l2360_DUPLICATE_0261_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2387_l2381_l2376_l2373_l2368_l2365_l2391_DUPLICATE_ad7e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2377_l2369_DUPLICATE_3391_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2387_l2376_DUPLICATE_9b64_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2356_l2396_DUPLICATE_ba7d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2374_c3_0c07 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2374_c3_0c07;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2379_c32_15db_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2379_c32_15db_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2388_c3_195e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2388_c3_195e;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_27ae := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_27ae;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_a2e3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_a2e3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2371_c3_4d66 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2371_c3_4d66;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2384_c3_16e2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2384_c3_16e2;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2377_l2369_DUPLICATE_3391 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2377_l2369_DUPLICATE_3391_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2381_c11_b5fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2376_l2373_l2368_l2365_l2360_DUPLICATE_f57e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2376_l2373_l2368_l2365_l2360_DUPLICATE_f57e_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2385_c24_dc7f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2385_c24_dc7f_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_SR_8[uxn_opcodes_h_l2389_c34_cab9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9_return_output := CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2391_l2360_DUPLICATE_d2ef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2391_l2360_DUPLICATE_d2ef_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l2379_c32_67ca] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_left;
     BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_return_output := BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2387_l2376_DUPLICATE_9b64 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2387_l2376_DUPLICATE_9b64_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2387_c11_c1fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2376_c11_902e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2391_c11_4561] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_left;
     BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_return_output := BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2373_c11_e3eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2365_c11_7016] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_left;
     BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_return_output := BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2360_c6_d59b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2360_DUPLICATE_df0e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2360_DUPLICATE_df0e_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2381_l2373_l2368_l2365_l2360_DUPLICATE_0261 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2381_l2373_l2368_l2365_l2360_DUPLICATE_0261_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2368_c11_2d8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2387_l2381_l2376_l2373_l2368_l2365_l2391_DUPLICATE_ad7e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2387_l2381_l2376_l2373_l2368_l2365_l2391_DUPLICATE_ad7e_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2379_c32_67ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c2_2574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c6_d59b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2365_c7_0c47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2365_c11_7016_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2368_c7_4f47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2368_c11_2d8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_e3eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2376_c7_f613_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_902e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_b5fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2387_c11_c1fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_4561_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2377_l2369_DUPLICATE_3391_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2377_l2369_DUPLICATE_3391_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2385_c24_dc7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2376_l2373_l2368_l2365_l2360_DUPLICATE_f57e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2376_l2373_l2368_l2365_l2360_DUPLICATE_f57e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2376_l2373_l2368_l2365_l2360_DUPLICATE_f57e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2376_l2373_l2368_l2365_l2360_DUPLICATE_f57e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2376_l2373_l2368_l2365_l2360_DUPLICATE_f57e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2387_l2381_l2376_l2373_l2368_l2365_l2391_DUPLICATE_ad7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2387_l2381_l2376_l2373_l2368_l2365_l2391_DUPLICATE_ad7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2387_l2381_l2376_l2373_l2368_l2365_l2391_DUPLICATE_ad7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2387_l2381_l2376_l2373_l2368_l2365_l2391_DUPLICATE_ad7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2387_l2381_l2376_l2373_l2368_l2365_l2391_DUPLICATE_ad7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2387_l2381_l2376_l2373_l2368_l2365_l2391_DUPLICATE_ad7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2387_l2381_l2376_l2373_l2368_l2365_l2391_DUPLICATE_ad7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2381_l2373_l2368_l2365_l2360_DUPLICATE_0261_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2381_l2373_l2368_l2365_l2360_DUPLICATE_0261_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2381_l2373_l2368_l2365_l2360_DUPLICATE_0261_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2381_l2373_l2368_l2365_l2360_DUPLICATE_0261_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2381_l2373_l2368_l2365_l2360_DUPLICATE_0261_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2391_l2360_DUPLICATE_d2ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2391_l2360_DUPLICATE_d2ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2391_l2360_DUPLICATE_d2ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2391_l2360_DUPLICATE_d2ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2391_l2360_DUPLICATE_d2ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2391_l2360_DUPLICATE_d2ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2391_l2360_DUPLICATE_d2ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2387_l2376_DUPLICATE_9b64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2387_l2376_DUPLICATE_9b64_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2360_DUPLICATE_df0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2360_DUPLICATE_df0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2360_DUPLICATE_df0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2360_DUPLICATE_df0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2360_DUPLICATE_df0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2387_l2376_l2373_l2368_l2365_l2360_DUPLICATE_df0e_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2389_c24_7b73] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2389_c24_7b73_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2389_c34_cab9_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l2370_c3_6db5] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5_return_output := CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2387_c7_4f2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2377_c3_7f4a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_left;
     BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_return_output := BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2391_c7_ee11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2381_c7_228a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2360_c1_bc7a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2391_c7_ee11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2379_c32_d82f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_left;
     BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_return_output := BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2379_c32_15db_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2379_c32_d82f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2377_c3_7f4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2389_c24_7b73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2370_c3_6db5_return_output;
     VAR_printf_uxn_opcodes_h_l2361_c3_5790_uxn_opcodes_h_l2361_c3_5790_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2360_c1_bc7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_ee11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_228a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_ee11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2387_c7_4f2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2376_c7_f613] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_return_output;

     -- t16_MUX[uxn_opcodes_h_l2376_c7_f613] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2376_c7_f613_cond <= VAR_t16_MUX_uxn_opcodes_h_l2376_c7_f613_cond;
     t16_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue;
     t16_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2376_c7_f613_return_output := t16_MUX_uxn_opcodes_h_l2376_c7_f613_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2387_c7_4f2e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output;

     -- printf_uxn_opcodes_h_l2361_c3_5790[uxn_opcodes_h_l2361_c3_5790] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2361_c3_5790_uxn_opcodes_h_l2361_c3_5790_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2361_c3_5790_uxn_opcodes_h_l2361_c3_5790_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l2379_c32_15db] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2379_c32_15db_cond <= VAR_MUX_uxn_opcodes_h_l2379_c32_15db_cond;
     MUX_uxn_opcodes_h_l2379_c32_15db_iftrue <= VAR_MUX_uxn_opcodes_h_l2379_c32_15db_iftrue;
     MUX_uxn_opcodes_h_l2379_c32_15db_iffalse <= VAR_MUX_uxn_opcodes_h_l2379_c32_15db_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2379_c32_15db_return_output := MUX_uxn_opcodes_h_l2379_c32_15db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2381_c7_228a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2387_c7_4f2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue := VAR_MUX_uxn_opcodes_h_l2379_c32_15db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2376_c7_f613_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_228a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2387_c7_4f2e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2376_c7_f613_return_output;
     -- t16_MUX[uxn_opcodes_h_l2373_c7_c2c0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond;
     t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue;
     t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output := t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2376_c7_f613] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2381_c7_228a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2381_c7_228a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2381_c7_228a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2373_c7_c2c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2376_c7_f613] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_228a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_228a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2376_c7_f613_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2376_c7_f613_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_228a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2376_c7_f613] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2376_c7_f613] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_return_output := result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2368_c7_4f47] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2373_c7_c2c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2373_c7_c2c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2376_c7_f613] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_return_output;

     -- t16_MUX[uxn_opcodes_h_l2368_c7_4f47] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2368_c7_4f47_cond <= VAR_t16_MUX_uxn_opcodes_h_l2368_c7_4f47_cond;
     t16_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue;
     t16_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output := t16_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_f613_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_f613_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2376_c7_f613_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2373_c7_c2c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2368_c7_4f47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output;

     -- t16_MUX[uxn_opcodes_h_l2365_c7_0c47] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2365_c7_0c47_cond <= VAR_t16_MUX_uxn_opcodes_h_l2365_c7_0c47_cond;
     t16_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue;
     t16_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output := t16_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2368_c7_4f47] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2365_c7_0c47] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2373_c7_c2c0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2373_c7_c2c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_c2c0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2360_c2_2574] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2365_c7_0c47] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2368_c7_4f47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2368_c7_4f47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2365_c7_0c47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output;

     -- t16_MUX[uxn_opcodes_h_l2360_c2_2574] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2360_c2_2574_cond <= VAR_t16_MUX_uxn_opcodes_h_l2360_c2_2574_cond;
     t16_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue;
     t16_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2360_c2_2574_return_output := t16_MUX_uxn_opcodes_h_l2360_c2_2574_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2368_c7_4f47] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output := result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2368_c7_4f47_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2360_c2_2574_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2365_c7_0c47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c2_2574] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2365_c7_0c47] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output := result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2365_c7_0c47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c2_2574] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2365_c7_0c47_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2360_c2_2574] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2360_c2_2574] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_return_output := result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c2_2574] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2356_l2396_DUPLICATE_ba7d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2356_l2396_DUPLICATE_ba7d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c2_2574_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c2_2574_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c2_2574_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c2_2574_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c2_2574_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c2_2574_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2356_l2396_DUPLICATE_ba7d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2356_l2396_DUPLICATE_ba7d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
