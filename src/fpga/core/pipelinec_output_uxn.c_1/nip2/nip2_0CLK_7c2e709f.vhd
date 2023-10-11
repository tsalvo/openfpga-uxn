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
-- BIN_OP_EQ[uxn_opcodes_h_l2364_c6_6736]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2364_c1_8fa8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2364_c2_f8a7]
signal t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c2_f8a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c2_f8a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c2_f8a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c2_f8a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2364_c2_f8a7]
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c2_f8a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2365_c3_c30d[uxn_opcodes_h_l2365_c3_c30d]
signal printf_uxn_opcodes_h_l2365_c3_c30d_uxn_opcodes_h_l2365_c3_c30d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2369_c11_61e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2369_c7_9ba0]
signal t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2369_c7_9ba0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2369_c7_9ba0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2369_c7_9ba0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2369_c7_9ba0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2369_c7_9ba0]
signal result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2369_c7_9ba0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_5ee4]
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2372_c7_0fb3]
signal t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2372_c7_0fb3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2372_c7_0fb3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_0fb3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_0fb3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2372_c7_0fb3]
signal result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_0fb3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2374_c3_b392]
signal CONST_SL_8_uxn_opcodes_h_l2374_c3_b392_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2374_c3_b392_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2377_c11_b944]
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2377_c7_ef3e]
signal t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2377_c7_ef3e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2377_c7_ef3e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2377_c7_ef3e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2377_c7_ef3e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2377_c7_ef3e]
signal result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2377_c7_ef3e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2380_c11_f307]
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2380_c7_1780]
signal t16_MUX_uxn_opcodes_h_l2380_c7_1780_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_1780_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2380_c7_1780]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2380_c7_1780]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2380_c7_1780]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2380_c7_1780]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2380_c7_1780]
signal result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2380_c7_1780]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2381_c3_a8e0]
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2383_c32_c86c]
signal BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2383_c32_8edb]
signal BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2383_c32_9d1b]
signal MUX_uxn_opcodes_h_l2383_c32_9d1b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2383_c32_9d1b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2383_c32_9d1b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2383_c32_9d1b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2385_c11_3c25]
signal BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2385_c7_5993]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2385_c7_5993]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2385_c7_5993]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2385_c7_5993]
signal result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2385_c7_5993]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2391_c11_a1ef]
signal BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2391_c7_c252]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2391_c7_c252]
signal result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2391_c7_c252]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2391_c7_c252]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2393_c34_11b8]
signal CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2395_c11_df9b]
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2395_c7_b4ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2395_c7_b4ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736
BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_return_output);

-- t16_MUX_uxn_opcodes_h_l2364_c2_f8a7
t16_MUX_uxn_opcodes_h_l2364_c2_f8a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond,
t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue,
t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse,
t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output);

-- printf_uxn_opcodes_h_l2365_c3_c30d_uxn_opcodes_h_l2365_c3_c30d
printf_uxn_opcodes_h_l2365_c3_c30d_uxn_opcodes_h_l2365_c3_c30d : entity work.printf_uxn_opcodes_h_l2365_c3_c30d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2365_c3_c30d_uxn_opcodes_h_l2365_c3_c30d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_return_output);

-- t16_MUX_uxn_opcodes_h_l2369_c7_9ba0
t16_MUX_uxn_opcodes_h_l2369_c7_9ba0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond,
t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue,
t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse,
t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0
result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_left,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_right,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_return_output);

-- t16_MUX_uxn_opcodes_h_l2372_c7_0fb3
t16_MUX_uxn_opcodes_h_l2372_c7_0fb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond,
t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue,
t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse,
t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2374_c3_b392
CONST_SL_8_uxn_opcodes_h_l2374_c3_b392 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2374_c3_b392_x,
CONST_SL_8_uxn_opcodes_h_l2374_c3_b392_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_left,
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_right,
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_return_output);

-- t16_MUX_uxn_opcodes_h_l2377_c7_ef3e
t16_MUX_uxn_opcodes_h_l2377_c7_ef3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond,
t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue,
t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse,
t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e
result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_left,
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_right,
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_return_output);

-- t16_MUX_uxn_opcodes_h_l2380_c7_1780
t16_MUX_uxn_opcodes_h_l2380_c7_1780 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2380_c7_1780_cond,
t16_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue,
t16_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse,
t16_MUX_uxn_opcodes_h_l2380_c7_1780_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_cond,
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0
BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_left,
BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_right,
BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c
BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_left,
BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_right,
BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb
BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_left,
BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_right,
BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_return_output);

-- MUX_uxn_opcodes_h_l2383_c32_9d1b
MUX_uxn_opcodes_h_l2383_c32_9d1b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2383_c32_9d1b_cond,
MUX_uxn_opcodes_h_l2383_c32_9d1b_iftrue,
MUX_uxn_opcodes_h_l2383_c32_9d1b_iffalse,
MUX_uxn_opcodes_h_l2383_c32_9d1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_left,
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_right,
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_cond,
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef
BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_left,
BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_right,
BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252
result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_cond,
result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8
CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8_x,
CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_left,
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_right,
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_return_output,
 t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_return_output,
 t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_return_output,
 t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output,
 CONST_SL_8_uxn_opcodes_h_l2374_c3_b392_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_return_output,
 t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_return_output,
 t16_MUX_uxn_opcodes_h_l2380_c7_1780_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_return_output,
 MUX_uxn_opcodes_h_l2383_c32_9d1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_return_output,
 CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_32f8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2365_c3_c30d_uxn_opcodes_h_l2365_c3_c30d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_576a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_b102 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_b392_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_b392_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_1780_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_2c9d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_1780_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2383_c32_9d1b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2383_c32_9d1b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2383_c32_9d1b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2383_c32_9d1b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2388_c3_fd25 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2389_c24_fab5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2392_c3_2b27 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2393_c24_dd6a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2364_l2391_DUPLICATE_9332_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2364_l2385_DUPLICATE_c952_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_DUPLICATE_fe2b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_l2391_DUPLICATE_3b82_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2391_l2385_DUPLICATE_2a2e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2381_DUPLICATE_2515_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2391_l2380_DUPLICATE_e0ca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2400_l2360_DUPLICATE_af55_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_b102 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_b102;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2383_c32_9d1b_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2392_c3_2b27 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2392_c3_2b27;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2388_c3_fd25 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2388_c3_fd25;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_576a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_576a;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2383_c32_9d1b_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_32f8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_32f8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_2c9d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_2c9d;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c6_6736] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2391_c11_a1ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2369_c11_61e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2395_c11_df9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2391_l2385_DUPLICATE_2a2e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2391_l2385_DUPLICATE_2a2e_return_output := result.is_opc_done;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2389_c24_fab5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2389_c24_fab5_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2391_l2380_DUPLICATE_e0ca LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2391_l2380_DUPLICATE_e0ca_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_5ee4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_DUPLICATE_fe2b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_DUPLICATE_fe2b_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2393_c34_11b8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8_return_output := CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2377_c11_b944] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_left;
     BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_return_output := BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2381_DUPLICATE_2515 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2381_DUPLICATE_2515_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_l2391_DUPLICATE_3b82 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_l2391_DUPLICATE_3b82_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2364_l2391_DUPLICATE_9332 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2364_l2391_DUPLICATE_9332_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2385_c11_3c25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_left;
     BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_return_output := BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2380_c11_f307] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_left;
     BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_return_output := BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2364_l2385_DUPLICATE_c952 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2364_l2385_DUPLICATE_c952_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2383_c32_c86c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_left;
     BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_return_output := BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_c86c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_6736_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_61e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_5ee4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_b944_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_1780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_f307_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_3c25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_a1ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_df9b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2381_DUPLICATE_2515_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_b392_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2381_DUPLICATE_2515_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2389_c24_fab5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_DUPLICATE_fe2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_DUPLICATE_fe2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_DUPLICATE_fe2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_DUPLICATE_fe2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_DUPLICATE_fe2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2391_l2385_DUPLICATE_2a2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2391_l2385_DUPLICATE_2a2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2391_l2385_DUPLICATE_2a2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2391_l2385_DUPLICATE_2a2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2391_l2385_DUPLICATE_2a2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2391_l2385_DUPLICATE_2a2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2391_l2385_DUPLICATE_2a2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2364_l2385_DUPLICATE_c952_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2364_l2385_DUPLICATE_c952_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2364_l2385_DUPLICATE_c952_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2364_l2385_DUPLICATE_c952_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2377_l2372_l2369_l2364_l2385_DUPLICATE_c952_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2364_l2391_DUPLICATE_9332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2364_l2391_DUPLICATE_9332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2364_l2391_DUPLICATE_9332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2364_l2391_DUPLICATE_9332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2364_l2391_DUPLICATE_9332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2364_l2391_DUPLICATE_9332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2395_l2364_l2391_DUPLICATE_9332_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2391_l2380_DUPLICATE_e0ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2391_l2380_DUPLICATE_e0ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_l2391_DUPLICATE_3b82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_l2391_DUPLICATE_3b82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_l2391_DUPLICATE_3b82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_l2391_DUPLICATE_3b82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_l2391_DUPLICATE_3b82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2380_l2377_l2372_l2369_l2364_l2391_DUPLICATE_3b82_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2381_c3_a8e0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_left;
     BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_return_output := BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2395_c7_b4ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2391_c7_c252] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2364_c1_8fa8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2374_c3_b392] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2374_c3_b392_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_b392_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_b392_return_output := CONST_SL_8_uxn_opcodes_h_l2374_c3_b392_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2385_c7_5993] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2383_c32_8edb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_left;
     BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_return_output := BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2395_c7_b4ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2393_c24_dd6a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2393_c24_dd6a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2393_c34_11b8_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2383_c32_9d1b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_8edb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_a8e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2393_c24_dd6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_b392_return_output;
     VAR_printf_uxn_opcodes_h_l2365_c3_c30d_uxn_opcodes_h_l2365_c3_c30d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_8fa8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_b4ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_5993_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_b4ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_c252_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2391_c7_c252] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_return_output := result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2391_c7_c252] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_return_output;

     -- t16_MUX[uxn_opcodes_h_l2380_c7_1780] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2380_c7_1780_cond <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_1780_cond;
     t16_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue;
     t16_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_1780_return_output := t16_MUX_uxn_opcodes_h_l2380_c7_1780_return_output;

     -- MUX[uxn_opcodes_h_l2383_c32_9d1b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2383_c32_9d1b_cond <= VAR_MUX_uxn_opcodes_h_l2383_c32_9d1b_cond;
     MUX_uxn_opcodes_h_l2383_c32_9d1b_iftrue <= VAR_MUX_uxn_opcodes_h_l2383_c32_9d1b_iftrue;
     MUX_uxn_opcodes_h_l2383_c32_9d1b_iffalse <= VAR_MUX_uxn_opcodes_h_l2383_c32_9d1b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2383_c32_9d1b_return_output := MUX_uxn_opcodes_h_l2383_c32_9d1b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2385_c7_5993] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2391_c7_c252] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_return_output;

     -- printf_uxn_opcodes_h_l2365_c3_c30d[uxn_opcodes_h_l2365_c3_c30d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2365_c3_c30d_uxn_opcodes_h_l2365_c3_c30d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2365_c3_c30d_uxn_opcodes_h_l2365_c3_c30d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2380_c7_1780] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue := VAR_MUX_uxn_opcodes_h_l2383_c32_9d1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_c252_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_1780_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_c252_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_5993_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_c252_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2380_c7_1780_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2377_c7_ef3e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2385_c7_5993] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_return_output := result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2385_c7_5993] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_return_output;

     -- t16_MUX[uxn_opcodes_h_l2377_c7_ef3e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond;
     t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue;
     t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output := t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2380_c7_1780] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2385_c7_5993] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2380_c7_1780] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_5993_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_5993_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_1780_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_1780_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_5993_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output;
     -- t16_MUX[uxn_opcodes_h_l2372_c7_0fb3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond;
     t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue;
     t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output := t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2377_c7_ef3e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2380_c7_1780] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2372_c7_0fb3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2380_c7_1780] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2377_c7_ef3e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2380_c7_1780] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_return_output := result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_1780_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_1780_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_1780_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2369_c7_9ba0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2377_c7_ef3e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_0fb3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2377_c7_ef3e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_0fb3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2369_c7_9ba0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond;
     t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue;
     t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output := t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2377_c7_ef3e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_ef3e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2372_c7_0fb3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2364_c2_f8a7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond;
     t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue;
     t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output := t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c2_f8a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2369_c7_9ba0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2372_c7_0fb3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_0fb3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2369_c7_9ba0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_0fb3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2369_c7_9ba0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c2_f8a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c2_f8a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2369_c7_9ba0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2369_c7_9ba0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_9ba0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c2_f8a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c2_f8a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2364_c2_f8a7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2400_l2360_DUPLICATE_af55 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2400_l2360_DUPLICATE_af55_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_f8a7_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2400_l2360_DUPLICATE_af55_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2400_l2360_DUPLICATE_af55_return_output;
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
