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
-- Submodules: 71
entity nip2_0CLK_50a1b8d0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip2_0CLK_50a1b8d0;
architecture arch of nip2_0CLK_50a1b8d0 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2048_c6_830d]
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2048_c1_e510]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2048_c2_4441]
signal result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2048_c2_4441]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c2_4441]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2048_c2_4441]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2048_c2_4441]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c2_4441]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c2_4441]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2048_c2_4441]
signal t16_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2049_c3_3da4[uxn_opcodes_h_l2049_c3_3da4]
signal printf_uxn_opcodes_h_l2049_c3_3da4_uxn_opcodes_h_l2049_c3_3da4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2054_c11_d37d]
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2054_c7_972e]
signal result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2054_c7_972e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2054_c7_972e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2054_c7_972e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2054_c7_972e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2054_c7_972e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2054_c7_972e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2054_c7_972e]
signal t16_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2057_c11_3cbe]
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2057_c7_9f45]
signal result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2057_c7_9f45]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2057_c7_9f45]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2057_c7_9f45]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2057_c7_9f45]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2057_c7_9f45]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2057_c7_9f45]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2057_c7_9f45]
signal t16_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2059_c3_95c2]
signal CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2062_c11_376c]
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2062_c7_91e4]
signal result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2062_c7_91e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2062_c7_91e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2062_c7_91e4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2062_c7_91e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2062_c7_91e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2062_c7_91e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2062_c7_91e4]
signal t16_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2065_c11_daa9]
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2065_c7_61c5]
signal result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2065_c7_61c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2065_c7_61c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2065_c7_61c5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2065_c7_61c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2065_c7_61c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2065_c7_61c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2065_c7_61c5]
signal t16_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2066_c3_288f]
signal BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2069_c32_8d6f]
signal BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2069_c32_05bc]
signal BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2069_c32_e155]
signal MUX_uxn_opcodes_h_l2069_c32_e155_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2069_c32_e155_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2069_c32_e155_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2069_c32_e155_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_ff5d]
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2071_c7_dfec]
signal result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2071_c7_dfec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2071_c7_dfec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2071_c7_dfec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2071_c7_dfec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2077_c11_3380]
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2077_c7_a48c]
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2077_c7_a48c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2077_c7_a48c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2077_c7_a48c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2079_c34_fbcc]
signal CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2081_c11_30bd]
signal BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2081_c7_d5e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2081_c7_d5e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d
BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_left,
BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_right,
BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441
result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_cond,
result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441
result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_return_output);

-- t16_MUX_uxn_opcodes_h_l2048_c2_4441
t16_MUX_uxn_opcodes_h_l2048_c2_4441 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2048_c2_4441_cond,
t16_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue,
t16_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse,
t16_MUX_uxn_opcodes_h_l2048_c2_4441_return_output);

-- printf_uxn_opcodes_h_l2049_c3_3da4_uxn_opcodes_h_l2049_c3_3da4
printf_uxn_opcodes_h_l2049_c3_3da4_uxn_opcodes_h_l2049_c3_3da4 : entity work.printf_uxn_opcodes_h_l2049_c3_3da4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2049_c3_3da4_uxn_opcodes_h_l2049_c3_3da4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_left,
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_right,
BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e
result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e
result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e
result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e
result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e
result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_return_output);

-- t16_MUX_uxn_opcodes_h_l2054_c7_972e
t16_MUX_uxn_opcodes_h_l2054_c7_972e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2054_c7_972e_cond,
t16_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue,
t16_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse,
t16_MUX_uxn_opcodes_h_l2054_c7_972e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_left,
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_right,
BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45
result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_cond,
result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45
result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45
result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45
result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45
result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45
result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output);

-- t16_MUX_uxn_opcodes_h_l2057_c7_9f45
t16_MUX_uxn_opcodes_h_l2057_c7_9f45 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2057_c7_9f45_cond,
t16_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue,
t16_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse,
t16_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2
CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2_x,
CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_left,
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_right,
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4
result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output);

-- t16_MUX_uxn_opcodes_h_l2062_c7_91e4
t16_MUX_uxn_opcodes_h_l2062_c7_91e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2062_c7_91e4_cond,
t16_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue,
t16_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse,
t16_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_left,
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_right,
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5
result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5
result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5
result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5
result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5
result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output);

-- t16_MUX_uxn_opcodes_h_l2065_c7_61c5
t16_MUX_uxn_opcodes_h_l2065_c7_61c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2065_c7_61c5_cond,
t16_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue,
t16_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse,
t16_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f
BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_left,
BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_right,
BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f
BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_left,
BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_right,
BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc
BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_left,
BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_right,
BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_return_output);

-- MUX_uxn_opcodes_h_l2069_c32_e155
MUX_uxn_opcodes_h_l2069_c32_e155 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2069_c32_e155_cond,
MUX_uxn_opcodes_h_l2069_c32_e155_iftrue,
MUX_uxn_opcodes_h_l2069_c32_e155_iffalse,
MUX_uxn_opcodes_h_l2069_c32_e155_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_left,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_right,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec
result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_cond,
result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_left,
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_right,
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc
CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc_x,
CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd
BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_left,
BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_right,
BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6
result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_return_output,
 t16_MUX_uxn_opcodes_h_l2048_c2_4441_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_return_output,
 t16_MUX_uxn_opcodes_h_l2054_c7_972e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output,
 t16_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output,
 CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output,
 t16_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output,
 t16_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_return_output,
 MUX_uxn_opcodes_h_l2069_c32_e155_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output,
 CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2051_c3_6339 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2054_c7_972e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c2_4441_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c2_4441_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2049_c3_3da4_uxn_opcodes_h_l2049_c3_3da4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2055_c3_f18f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2054_c7_972e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_4491 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2057_c7_9f45_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2063_c3_1e01 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2062_c7_91e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2065_c7_61c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2069_c32_e155_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2069_c32_e155_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2069_c32_e155_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2069_c32_e155_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2074_c3_0e6e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2075_c24_f40e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2078_c3_38ef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2079_c24_0b45_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2077_l2065_DUPLICATE_e82f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2071_DUPLICATE_c964_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2065_DUPLICATE_33f2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2048_l2077_l2065_DUPLICATE_d518_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2057_l2062_l2054_l2065_DUPLICATE_18ae_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2077_l2071_l2065_DUPLICATE_f931_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2058_l2066_DUPLICATE_eb1a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2077_l2065_DUPLICATE_7181_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2086_l2044_DUPLICATE_21ae_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2078_c3_38ef := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2078_c3_38ef;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2063_c3_1e01 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2063_c3_1e01;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2069_c32_e155_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_MUX_uxn_opcodes_h_l2069_c32_e155_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2051_c3_6339 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2051_c3_6339;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_4491 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_4491;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2055_c3_f18f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2055_c3_f18f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2074_c3_0e6e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2074_c3_0e6e;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2077_c11_3380] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_left;
     BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_return_output := BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2057_c11_3cbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2048_c6_830d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2057_l2062_l2054_l2065_DUPLICATE_18ae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2057_l2062_l2054_l2065_DUPLICATE_18ae_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2077_l2065_DUPLICATE_7181 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2077_l2065_DUPLICATE_7181_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2079_c34_fbcc] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc_return_output := CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2069_c32_8d6f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_left;
     BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_return_output := BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2065_c11_daa9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2081_c11_30bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_ff5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2054_c11_d37d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2075_c24_f40e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2075_c24_f40e_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2077_l2065_DUPLICATE_e82f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2077_l2065_DUPLICATE_e82f_return_output := result.stack_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2058_l2066_DUPLICATE_eb1a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2058_l2066_DUPLICATE_eb1a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2071_DUPLICATE_c964 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2071_DUPLICATE_c964_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2062_c11_376c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2077_l2071_l2065_DUPLICATE_f931 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2077_l2071_l2065_DUPLICATE_f931_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2065_DUPLICATE_33f2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2065_DUPLICATE_33f2_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2048_l2077_l2065_DUPLICATE_d518 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2048_l2077_l2065_DUPLICATE_d518_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2069_c32_8d6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c2_4441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c6_830d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2054_c7_972e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2054_c11_d37d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2057_c7_9f45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2057_c11_3cbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2062_c7_91e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_376c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2065_c7_61c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_daa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_ff5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_3380_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2081_c11_30bd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2058_l2066_DUPLICATE_eb1a_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2058_l2066_DUPLICATE_eb1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2075_c24_f40e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2065_DUPLICATE_33f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2065_DUPLICATE_33f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2065_DUPLICATE_33f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2065_DUPLICATE_33f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2065_DUPLICATE_33f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2077_l2071_l2065_DUPLICATE_f931_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2077_l2071_l2065_DUPLICATE_f931_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2077_l2071_l2065_DUPLICATE_f931_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2077_l2071_l2065_DUPLICATE_f931_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2077_l2071_l2065_DUPLICATE_f931_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2077_l2071_l2065_DUPLICATE_f931_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2077_l2071_l2065_DUPLICATE_f931_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2071_DUPLICATE_c964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2071_DUPLICATE_c964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2071_DUPLICATE_c964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2071_DUPLICATE_c964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2071_DUPLICATE_c964_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2057_l2062_l2054_l2065_DUPLICATE_18ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2057_l2062_l2054_l2065_DUPLICATE_18ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2057_l2062_l2054_l2065_DUPLICATE_18ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2057_l2062_l2054_l2065_DUPLICATE_18ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2048_l2077_l2065_DUPLICATE_d518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2048_l2077_l2065_DUPLICATE_d518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2048_l2077_l2065_DUPLICATE_d518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2048_l2077_l2065_DUPLICATE_d518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2048_l2077_l2065_DUPLICATE_d518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2048_l2077_l2065_DUPLICATE_d518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2081_l2048_l2077_l2065_DUPLICATE_d518_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2077_l2065_DUPLICATE_7181_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2077_l2065_DUPLICATE_7181_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2077_l2065_DUPLICATE_e82f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2077_l2065_DUPLICATE_e82f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2077_l2065_DUPLICATE_e82f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2077_l2065_DUPLICATE_e82f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2077_l2065_DUPLICATE_e82f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2062_l2057_l2054_l2048_l2077_l2065_DUPLICATE_e82f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2081_c7_d5e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2081_c7_d5e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2066_c3_288f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_left;
     BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_return_output := BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2048_c1_e510] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2065_c7_61c5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2071_c7_dfec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2069_c32_05bc] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_left;
     BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_return_output := BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2077_c7_a48c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2059_c3_95c2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2_return_output := CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2079_c24_0b45] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2079_c24_0b45_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2079_c34_fbcc_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2069_c32_e155_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2069_c32_05bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2066_c3_288f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2079_c24_0b45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2059_c3_95c2_return_output;
     VAR_printf_uxn_opcodes_h_l2049_c3_3da4_uxn_opcodes_h_l2049_c3_3da4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2048_c1_e510_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2081_c7_d5e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2081_c7_d5e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output;
     -- t16_MUX[uxn_opcodes_h_l2065_c7_61c5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2065_c7_61c5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2065_c7_61c5_cond;
     t16_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue;
     t16_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output := t16_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2062_c7_91e4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;

     -- MUX[uxn_opcodes_h_l2069_c32_e155] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2069_c32_e155_cond <= VAR_MUX_uxn_opcodes_h_l2069_c32_e155_cond;
     MUX_uxn_opcodes_h_l2069_c32_e155_iftrue <= VAR_MUX_uxn_opcodes_h_l2069_c32_e155_iftrue;
     MUX_uxn_opcodes_h_l2069_c32_e155_iffalse <= VAR_MUX_uxn_opcodes_h_l2069_c32_e155_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2069_c32_e155_return_output := MUX_uxn_opcodes_h_l2069_c32_e155_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2065_c7_61c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;

     -- printf_uxn_opcodes_h_l2049_c3_3da4[uxn_opcodes_h_l2049_c3_3da4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2049_c3_3da4_uxn_opcodes_h_l2049_c3_3da4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2049_c3_3da4_uxn_opcodes_h_l2049_c3_3da4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l2077_c7_a48c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2077_c7_a48c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2071_c7_dfec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2077_c7_a48c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue := VAR_MUX_uxn_opcodes_h_l2069_c32_e155_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_a48c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;
     -- t16_MUX[uxn_opcodes_h_l2062_c7_91e4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2062_c7_91e4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2062_c7_91e4_cond;
     t16_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue;
     t16_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output := t16_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2065_c7_61c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2062_c7_91e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2071_c7_dfec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2071_c7_dfec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output := result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2065_c7_61c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2071_c7_dfec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2057_c7_9f45] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c7_dfec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2054_c7_972e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2062_c7_91e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2065_c7_61c5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2065_c7_61c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2062_c7_91e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2057_c7_9f45] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;

     -- t16_MUX[uxn_opcodes_h_l2057_c7_9f45] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2057_c7_9f45_cond <= VAR_t16_MUX_uxn_opcodes_h_l2057_c7_9f45_cond;
     t16_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue;
     t16_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output := t16_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2065_c7_61c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2065_c7_61c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;
     -- t16_MUX[uxn_opcodes_h_l2054_c7_972e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2054_c7_972e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2054_c7_972e_cond;
     t16_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue;
     t16_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2054_c7_972e_return_output := t16_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2062_c7_91e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2057_c7_9f45] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2062_c7_91e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2048_c2_4441] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2062_c7_91e4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2057_c7_9f45] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2054_c7_972e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_91e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2054_c7_972e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2054_c7_972e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2057_c7_9f45] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2057_c7_9f45] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output := result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2057_c7_9f45] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c2_4441] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_return_output;

     -- t16_MUX[uxn_opcodes_h_l2048_c2_4441] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2048_c2_4441_cond <= VAR_t16_MUX_uxn_opcodes_h_l2048_c2_4441_cond;
     t16_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue;
     t16_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2048_c2_4441_return_output := t16_MUX_uxn_opcodes_h_l2048_c2_4441_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2057_c7_9f45_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2048_c2_4441_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2054_c7_972e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2048_c2_4441] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2054_c7_972e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2048_c2_4441] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2054_c7_972e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2054_c7_972e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2048_c2_4441] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_return_output := result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c2_4441] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c2_4441] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2086_l2044_DUPLICATE_21ae LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2086_l2044_DUPLICATE_21ae_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c2_4441_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c2_4441_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c2_4441_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2048_c2_4441_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c2_4441_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c2_4441_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c2_4441_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2086_l2044_DUPLICATE_21ae_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2086_l2044_DUPLICATE_21ae_return_output;
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
