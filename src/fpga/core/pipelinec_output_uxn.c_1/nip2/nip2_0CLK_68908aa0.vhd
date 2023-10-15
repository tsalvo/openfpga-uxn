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
-- Submodules: 64
entity nip2_0CLK_68908aa0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip2_0CLK_68908aa0;
architecture arch of nip2_0CLK_68908aa0 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2364_c6_b3bf]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c2_63f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2364_c2_63f0]
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c2_63f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c2_63f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c2_63f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c2_63f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2364_c2_63f0]
signal t16_MUX_uxn_opcodes_h_l2364_c2_63f0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2369_c11_e349]
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2369_c7_5db5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2369_c7_5db5]
signal result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2369_c7_5db5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2369_c7_5db5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2369_c7_5db5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2369_c7_5db5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2369_c7_5db5]
signal t16_MUX_uxn_opcodes_h_l2369_c7_5db5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_7d77]
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_65ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2372_c7_65ec]
signal result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_65ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2372_c7_65ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2372_c7_65ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_65ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2372_c7_65ec]
signal t16_MUX_uxn_opcodes_h_l2372_c7_65ec_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2374_c3_b64e]
signal CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2377_c11_a5af]
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2377_c7_5277]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2377_c7_5277]
signal result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2377_c7_5277]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2377_c7_5277]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2377_c7_5277]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2377_c7_5277]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2377_c7_5277]
signal t16_MUX_uxn_opcodes_h_l2377_c7_5277_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2377_c7_5277_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2380_c11_bce0]
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2380_c7_7c86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2380_c7_7c86]
signal result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2380_c7_7c86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2380_c7_7c86]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2380_c7_7c86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2380_c7_7c86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2380_c7_7c86]
signal t16_MUX_uxn_opcodes_h_l2380_c7_7c86_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2381_c3_ca11]
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2383_c32_4401]
signal BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2383_c32_49a7]
signal BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2383_c32_63dd]
signal MUX_uxn_opcodes_h_l2383_c32_63dd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2383_c32_63dd_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2383_c32_63dd_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2383_c32_63dd_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2385_c11_f10b]
signal BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2385_c7_a2bf]
signal result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2385_c7_a2bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2385_c7_a2bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2385_c7_a2bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2385_c7_a2bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2391_c11_0cc9]
signal BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2391_c7_17ea]
signal result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2391_c7_17ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2391_c7_17ea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2391_c7_17ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2393_c34_9ba4]
signal CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2395_c11_c05c]
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2395_c7_e54c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2395_c7_e54c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf
BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output);

-- t16_MUX_uxn_opcodes_h_l2364_c2_63f0
t16_MUX_uxn_opcodes_h_l2364_c2_63f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2364_c2_63f0_cond,
t16_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue,
t16_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse,
t16_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_left,
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_right,
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5
result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output);

-- t16_MUX_uxn_opcodes_h_l2369_c7_5db5
t16_MUX_uxn_opcodes_h_l2369_c7_5db5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2369_c7_5db5_cond,
t16_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue,
t16_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse,
t16_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_left,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_right,
BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_cond,
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output);

-- t16_MUX_uxn_opcodes_h_l2372_c7_65ec
t16_MUX_uxn_opcodes_h_l2372_c7_65ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2372_c7_65ec_cond,
t16_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue,
t16_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse,
t16_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e
CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e_x,
CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_left,
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_right,
BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_cond,
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277
result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_return_output);

-- t16_MUX_uxn_opcodes_h_l2377_c7_5277
t16_MUX_uxn_opcodes_h_l2377_c7_5277 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2377_c7_5277_cond,
t16_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue,
t16_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse,
t16_MUX_uxn_opcodes_h_l2377_c7_5277_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_left,
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_right,
BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_cond,
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output);

-- t16_MUX_uxn_opcodes_h_l2380_c7_7c86
t16_MUX_uxn_opcodes_h_l2380_c7_7c86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2380_c7_7c86_cond,
t16_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue,
t16_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse,
t16_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11
BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_left,
BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_right,
BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401
BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_left,
BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_right,
BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7
BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_left,
BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_right,
BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_return_output);

-- MUX_uxn_opcodes_h_l2383_c32_63dd
MUX_uxn_opcodes_h_l2383_c32_63dd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2383_c32_63dd_cond,
MUX_uxn_opcodes_h_l2383_c32_63dd_iftrue,
MUX_uxn_opcodes_h_l2383_c32_63dd_iffalse,
MUX_uxn_opcodes_h_l2383_c32_63dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_left,
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_right,
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond,
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9
BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_left,
BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_right,
BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea
result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_cond,
result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4
CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4_x,
CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_left,
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_right,
BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output,
 t16_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output,
 t16_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output,
 t16_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output,
 CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_return_output,
 t16_MUX_uxn_opcodes_h_l2377_c7_5277_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output,
 t16_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_return_output,
 MUX_uxn_opcodes_h_l2383_c32_63dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output,
 CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_1991 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c2_63f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_ddd5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2369_c7_5db5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_3ead : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_5277_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2372_c7_65ec_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_e6f1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2377_c7_5277_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2380_c7_7c86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2383_c32_63dd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2383_c32_63dd_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2383_c32_63dd_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2383_c32_63dd_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2388_c3_543a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2389_c24_ecd4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2392_c3_4c62 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2393_c24_5155_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2369_l2364_l2380_l2377_l2372_DUPLICATE_16af_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2369_l2364_l2391_l2380_l2377_l2372_DUPLICATE_c91f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2369_l2364_l2385_l2377_l2372_DUPLICATE_e885_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2369_l2395_l2364_l2391_l2380_l2377_l2372_DUPLICATE_dfae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2369_l2395_l2391_l2385_l2380_l2377_l2372_DUPLICATE_b475_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2381_DUPLICATE_33b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2391_l2380_DUPLICATE_b7a9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2360_l2400_DUPLICATE_d165_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2383_c32_63dd_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_right := to_unsigned(7, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_e6f1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2378_c3_e6f1;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_1991 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2366_c3_1991;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2392_c3_4c62 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2392_c3_4c62;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2388_c3_543a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2388_c3_543a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_ddd5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_ddd5;
     VAR_MUX_uxn_opcodes_h_l2383_c32_63dd_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_3ead := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_3ead;

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2381_DUPLICATE_33b6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2381_DUPLICATE_33b6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2391_c11_0cc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2385_c11_f10b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2391_l2380_DUPLICATE_b7a9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2391_l2380_DUPLICATE_b7a9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l2383_c32_4401] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_left;
     BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_return_output := BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2393_c34_9ba4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4_return_output := CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2369_l2395_l2364_l2391_l2380_l2377_l2372_DUPLICATE_dfae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2369_l2395_l2364_l2391_l2380_l2377_l2372_DUPLICATE_dfae_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2389_c24_ecd4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2389_c24_ecd4_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2369_l2364_l2391_l2380_l2377_l2372_DUPLICATE_c91f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2369_l2364_l2391_l2380_l2377_l2372_DUPLICATE_c91f_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2369_c11_e349] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_left;
     BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_return_output := BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c6_b3bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2369_l2364_l2385_l2377_l2372_DUPLICATE_e885 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2369_l2364_l2385_l2377_l2372_DUPLICATE_e885_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2380_c11_bce0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2377_c11_a5af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2372_c11_7d77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_left;
     BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_return_output := BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2369_l2364_l2380_l2377_l2372_DUPLICATE_16af LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2369_l2364_l2380_l2377_l2372_DUPLICATE_16af_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2395_c11_c05c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2369_l2395_l2391_l2385_l2380_l2377_l2372_DUPLICATE_b475 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2369_l2395_l2391_l2385_l2380_l2377_l2372_DUPLICATE_b475_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2383_c32_4401_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2364_c2_63f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b3bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_5db5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_e349_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_65ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2372_c11_7d77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_5277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2377_c11_a5af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_7c86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2380_c11_bce0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f10b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2391_c11_0cc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2395_c11_c05c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2381_DUPLICATE_33b6_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2373_l2381_DUPLICATE_33b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2389_c24_ecd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2369_l2364_l2380_l2377_l2372_DUPLICATE_16af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2369_l2364_l2380_l2377_l2372_DUPLICATE_16af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2369_l2364_l2380_l2377_l2372_DUPLICATE_16af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2369_l2364_l2380_l2377_l2372_DUPLICATE_16af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2369_l2364_l2380_l2377_l2372_DUPLICATE_16af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2369_l2395_l2391_l2385_l2380_l2377_l2372_DUPLICATE_b475_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2369_l2395_l2391_l2385_l2380_l2377_l2372_DUPLICATE_b475_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2369_l2395_l2391_l2385_l2380_l2377_l2372_DUPLICATE_b475_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2369_l2395_l2391_l2385_l2380_l2377_l2372_DUPLICATE_b475_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2369_l2395_l2391_l2385_l2380_l2377_l2372_DUPLICATE_b475_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2369_l2395_l2391_l2385_l2380_l2377_l2372_DUPLICATE_b475_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2369_l2395_l2391_l2385_l2380_l2377_l2372_DUPLICATE_b475_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2369_l2364_l2385_l2377_l2372_DUPLICATE_e885_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2369_l2364_l2385_l2377_l2372_DUPLICATE_e885_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2369_l2364_l2385_l2377_l2372_DUPLICATE_e885_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2369_l2364_l2385_l2377_l2372_DUPLICATE_e885_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2369_l2364_l2385_l2377_l2372_DUPLICATE_e885_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2369_l2395_l2364_l2391_l2380_l2377_l2372_DUPLICATE_dfae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2369_l2395_l2364_l2391_l2380_l2377_l2372_DUPLICATE_dfae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2369_l2395_l2364_l2391_l2380_l2377_l2372_DUPLICATE_dfae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2369_l2395_l2364_l2391_l2380_l2377_l2372_DUPLICATE_dfae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2369_l2395_l2364_l2391_l2380_l2377_l2372_DUPLICATE_dfae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2369_l2395_l2364_l2391_l2380_l2377_l2372_DUPLICATE_dfae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2369_l2395_l2364_l2391_l2380_l2377_l2372_DUPLICATE_dfae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2391_l2380_DUPLICATE_b7a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2391_l2380_DUPLICATE_b7a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2369_l2364_l2391_l2380_l2377_l2372_DUPLICATE_c91f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2369_l2364_l2391_l2380_l2377_l2372_DUPLICATE_c91f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2369_l2364_l2391_l2380_l2377_l2372_DUPLICATE_c91f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2369_l2364_l2391_l2380_l2377_l2372_DUPLICATE_c91f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2369_l2364_l2391_l2380_l2377_l2372_DUPLICATE_c91f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2369_l2364_l2391_l2380_l2377_l2372_DUPLICATE_c91f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2395_c7_e54c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2391_c7_17ea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2383_c32_49a7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_left;
     BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_return_output := BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2381_c3_ca11] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_left;
     BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_return_output := BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2374_c3_b64e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e_return_output := CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2385_c7_a2bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2393_c24_5155] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2393_c24_5155_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2393_c34_9ba4_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2395_c7_e54c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2383_c32_63dd_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2383_c32_49a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2381_c3_ca11_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2393_c24_5155_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2374_c3_b64e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2395_c7_e54c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2395_c7_e54c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2391_c7_17ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2391_c7_17ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2380_c7_7c86] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2385_c7_a2bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output;

     -- MUX[uxn_opcodes_h_l2383_c32_63dd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2383_c32_63dd_cond <= VAR_MUX_uxn_opcodes_h_l2383_c32_63dd_cond;
     MUX_uxn_opcodes_h_l2383_c32_63dd_iftrue <= VAR_MUX_uxn_opcodes_h_l2383_c32_63dd_iftrue;
     MUX_uxn_opcodes_h_l2383_c32_63dd_iffalse <= VAR_MUX_uxn_opcodes_h_l2383_c32_63dd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2383_c32_63dd_return_output := MUX_uxn_opcodes_h_l2383_c32_63dd_return_output;

     -- t16_MUX[uxn_opcodes_h_l2380_c7_7c86] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2380_c7_7c86_cond <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_7c86_cond;
     t16_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue;
     t16_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output := t16_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2391_c7_17ea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output := result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue := VAR_MUX_uxn_opcodes_h_l2383_c32_63dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2391_c7_17ea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output;
     -- t16_MUX[uxn_opcodes_h_l2377_c7_5277] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2377_c7_5277_cond <= VAR_t16_MUX_uxn_opcodes_h_l2377_c7_5277_cond;
     t16_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue;
     t16_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2377_c7_5277_return_output := t16_MUX_uxn_opcodes_h_l2377_c7_5277_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2385_c7_a2bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2377_c7_5277] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2380_c7_7c86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2380_c7_7c86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2385_c7_a2bf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output := result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2385_c7_a2bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2377_c7_5277_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_a2bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2377_c7_5277_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2372_c7_65ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2377_c7_5277] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2380_c7_7c86] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output := result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output;

     -- t16_MUX[uxn_opcodes_h_l2372_c7_65ec] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2372_c7_65ec_cond <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_65ec_cond;
     t16_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue;
     t16_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output := t16_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2377_c7_5277] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2380_c7_7c86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2380_c7_7c86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2377_c7_5277_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2377_c7_5277_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2380_c7_7c86_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2372_c7_65ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output;

     -- t16_MUX[uxn_opcodes_h_l2369_c7_5db5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2369_c7_5db5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2369_c7_5db5_cond;
     t16_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue;
     t16_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output := t16_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2377_c7_5277] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_return_output := result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2369_c7_5db5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2377_c7_5277] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2377_c7_5277] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2372_c7_65ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2377_c7_5277_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2377_c7_5277_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2377_c7_5277_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2372_c7_65ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2372_c7_65ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2369_c7_5db5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2369_c7_5db5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2372_c7_65ec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output := result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output;

     -- t16_MUX[uxn_opcodes_h_l2364_c2_63f0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2364_c2_63f0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2364_c2_63f0_cond;
     t16_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue;
     t16_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output := t16_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c2_63f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2372_c7_65ec_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c2_63f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c2_63f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2369_c7_5db5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2369_c7_5db5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2369_c7_5db5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2369_c7_5db5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c2_63f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c2_63f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2364_c2_63f0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2360_l2400_DUPLICATE_d165 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2360_l2400_DUPLICATE_d165_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_63f0_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2360_l2400_DUPLICATE_d165_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2360_l2400_DUPLICATE_d165_return_output;
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
