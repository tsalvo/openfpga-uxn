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
-- Submodules: 86
entity swp2_0CLK_e768ce5a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_e768ce5a;
architecture arch of swp2_0CLK_e768ce5a is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2450_c6_637f]
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2450_c1_4546]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2450_c2_8efb]
signal n16_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c2_8efb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2450_c2_8efb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c2_8efb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c2_8efb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c2_8efb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2450_c2_8efb]
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2450_c2_8efb]
signal t16_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2451_c3_6bbe[uxn_opcodes_h_l2451_c3_6bbe]
signal printf_uxn_opcodes_h_l2451_c3_6bbe_uxn_opcodes_h_l2451_c3_6bbe_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2455_c11_8f69]
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2455_c7_1862]
signal n16_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2455_c7_1862]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2455_c7_1862]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2455_c7_1862]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2455_c7_1862]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2455_c7_1862]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2455_c7_1862]
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2455_c7_1862]
signal t16_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2458_c11_a999]
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2458_c7_604d]
signal n16_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2458_c7_604d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2458_c7_604d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2458_c7_604d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2458_c7_604d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2458_c7_604d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2458_c7_604d]
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2458_c7_604d]
signal t16_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_0d87]
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2463_c7_caa2]
signal n16_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2463_c7_caa2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2463_c7_caa2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2463_c7_caa2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2463_c7_caa2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_caa2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2463_c7_caa2]
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2463_c7_caa2]
signal t16_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2464_c3_8903]
signal BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2467_c11_3246]
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2467_c7_5140]
signal n16_MUX_uxn_opcodes_h_l2467_c7_5140_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2467_c7_5140_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2467_c7_5140]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2467_c7_5140]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2467_c7_5140]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2467_c7_5140]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2467_c7_5140]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2467_c7_5140]
signal result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2471_c11_0cf5]
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2471_c7_0bc6]
signal n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2471_c7_0bc6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2471_c7_0bc6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2471_c7_0bc6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2471_c7_0bc6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2471_c7_0bc6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2471_c7_0bc6]
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2472_c3_fb7c]
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2474_c30_cd57]
signal sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2479_c11_fe07]
signal BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2479_c7_478d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2479_c7_478d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2479_c7_478d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2479_c7_478d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2479_c7_478d]
signal result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2482_c31_457e]
signal CONST_SR_8_uxn_opcodes_h_l2482_c31_457e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2482_c31_457e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2484_c11_b4f1]
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2484_c7_4763]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2484_c7_4763]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2484_c7_4763]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2484_c7_4763]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2484_c7_4763]
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2489_c11_a035]
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2489_c7_36b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2489_c7_36b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2489_c7_36b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2489_c7_36b8]
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2491_c31_5698]
signal CONST_SR_8_uxn_opcodes_h_l2491_c31_5698_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2491_c31_5698_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2493_c11_70fc]
signal BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2493_c7_e8d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2493_c7_e8d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f
BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_left,
BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_right,
BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_return_output);

-- n16_MUX_uxn_opcodes_h_l2450_c2_8efb
n16_MUX_uxn_opcodes_h_l2450_c2_8efb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2450_c2_8efb_cond,
n16_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue,
n16_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse,
n16_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output);

-- t16_MUX_uxn_opcodes_h_l2450_c2_8efb
t16_MUX_uxn_opcodes_h_l2450_c2_8efb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2450_c2_8efb_cond,
t16_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue,
t16_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse,
t16_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output);

-- printf_uxn_opcodes_h_l2451_c3_6bbe_uxn_opcodes_h_l2451_c3_6bbe
printf_uxn_opcodes_h_l2451_c3_6bbe_uxn_opcodes_h_l2451_c3_6bbe : entity work.printf_uxn_opcodes_h_l2451_c3_6bbe_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2451_c3_6bbe_uxn_opcodes_h_l2451_c3_6bbe_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_left,
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_right,
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_return_output);

-- n16_MUX_uxn_opcodes_h_l2455_c7_1862
n16_MUX_uxn_opcodes_h_l2455_c7_1862 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2455_c7_1862_cond,
n16_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue,
n16_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse,
n16_MUX_uxn_opcodes_h_l2455_c7_1862_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_cond,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_return_output);

-- t16_MUX_uxn_opcodes_h_l2455_c7_1862
t16_MUX_uxn_opcodes_h_l2455_c7_1862 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2455_c7_1862_cond,
t16_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue,
t16_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse,
t16_MUX_uxn_opcodes_h_l2455_c7_1862_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_left,
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_right,
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_return_output);

-- n16_MUX_uxn_opcodes_h_l2458_c7_604d
n16_MUX_uxn_opcodes_h_l2458_c7_604d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2458_c7_604d_cond,
n16_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue,
n16_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse,
n16_MUX_uxn_opcodes_h_l2458_c7_604d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_return_output);

-- t16_MUX_uxn_opcodes_h_l2458_c7_604d
t16_MUX_uxn_opcodes_h_l2458_c7_604d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2458_c7_604d_cond,
t16_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue,
t16_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse,
t16_MUX_uxn_opcodes_h_l2458_c7_604d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_left,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_right,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_return_output);

-- n16_MUX_uxn_opcodes_h_l2463_c7_caa2
n16_MUX_uxn_opcodes_h_l2463_c7_caa2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2463_c7_caa2_cond,
n16_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue,
n16_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse,
n16_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output);

-- t16_MUX_uxn_opcodes_h_l2463_c7_caa2
t16_MUX_uxn_opcodes_h_l2463_c7_caa2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2463_c7_caa2_cond,
t16_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue,
t16_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse,
t16_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903
BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_left,
BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_right,
BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_left,
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_right,
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_return_output);

-- n16_MUX_uxn_opcodes_h_l2467_c7_5140
n16_MUX_uxn_opcodes_h_l2467_c7_5140 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2467_c7_5140_cond,
n16_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue,
n16_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse,
n16_MUX_uxn_opcodes_h_l2467_c7_5140_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_cond,
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_left,
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_right,
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_return_output);

-- n16_MUX_uxn_opcodes_h_l2471_c7_0bc6
n16_MUX_uxn_opcodes_h_l2471_c7_0bc6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond,
n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue,
n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse,
n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c
BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_left,
BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_right,
BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57
sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_ins,
sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_x,
sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_y,
sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_left,
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_right,
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2482_c31_457e
CONST_SR_8_uxn_opcodes_h_l2482_c31_457e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2482_c31_457e_x,
CONST_SR_8_uxn_opcodes_h_l2482_c31_457e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_left,
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_right,
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_cond,
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_left,
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_right,
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2491_c31_5698
CONST_SR_8_uxn_opcodes_h_l2491_c31_5698 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2491_c31_5698_x,
CONST_SR_8_uxn_opcodes_h_l2491_c31_5698_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc
BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_left,
BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_right,
BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5
CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_return_output,
 n16_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output,
 t16_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_return_output,
 n16_MUX_uxn_opcodes_h_l2455_c7_1862_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_return_output,
 t16_MUX_uxn_opcodes_h_l2455_c7_1862_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_return_output,
 n16_MUX_uxn_opcodes_h_l2458_c7_604d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_return_output,
 t16_MUX_uxn_opcodes_h_l2458_c7_604d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_return_output,
 n16_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output,
 t16_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_return_output,
 n16_MUX_uxn_opcodes_h_l2467_c7_5140_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_return_output,
 n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_return_output,
 sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_return_output,
 CONST_SR_8_uxn_opcodes_h_l2482_c31_457e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output,
 CONST_SR_8_uxn_opcodes_h_l2491_c31_5698_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_dcd2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_1862_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c2_8efb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2451_c3_6bbe_uxn_opcodes_h_l2451_c3_6bbe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_4d54 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_604d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_1862_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_bb23 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_604d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5140_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_5112 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2463_c7_caa2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5140_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_afe1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2477_c21_c2b5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2481_c3_5b68 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_457e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_457e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2482_c21_b595_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2486_c3_9243 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2487_c21_4471_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_3ca8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_5698_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_5698_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2491_c21_efc4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2450_l2467_l2463_l2493_l2458_l2489_DUPLICATE_ea71_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2484_l2455_l2450_l2467_l2463_l2458_DUPLICATE_6f01_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2471_l2467_l2463_l2458_DUPLICATE_aed0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2467_l2463_l2458_l2489_DUPLICATE_5b5a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2471_l2467_l2463_l2493_l2458_l2489_DUPLICATE_3dc4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2468_l2459_l2472_l2464_DUPLICATE_fe27_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2467_l2489_DUPLICATE_937a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2498_l2446_DUPLICATE_e6cc_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2486_c3_9243 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2486_c3_9243;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_3ca8 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_3ca8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_dcd2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_dcd2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_5112 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_5112;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_right := to_unsigned(9, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_bb23 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_bb23;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_4d54 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_4d54;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2481_c3_5b68 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2481_c3_5b68;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_afe1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_afe1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_457e_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_5698_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l2474_c30_cd57] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_ins;
     sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_x;
     sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_return_output := sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_0d87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_left;
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_return_output := BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2487_c21_4471] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2487_c21_4471_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2450_l2467_l2463_l2493_l2458_l2489_DUPLICATE_ea71 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2450_l2467_l2463_l2493_l2458_l2489_DUPLICATE_ea71_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2471_c11_0cf5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2468_l2459_l2472_l2464_DUPLICATE_fe27 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2468_l2459_l2472_l2464_DUPLICATE_fe27_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2471_l2467_l2463_l2493_l2458_l2489_DUPLICATE_3dc4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2471_l2467_l2463_l2493_l2458_l2489_DUPLICATE_3dc4_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2467_l2463_l2458_l2489_DUPLICATE_5b5a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2467_l2463_l2458_l2489_DUPLICATE_5b5a_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2471_l2467_l2463_l2458_DUPLICATE_aed0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2471_l2467_l2463_l2458_DUPLICATE_aed0_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2455_c11_8f69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_left;
     BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_return_output := BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2479_c11_fe07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_left;
     BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_return_output := BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2450_c6_637f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2493_c11_70fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2484_l2455_l2450_l2467_l2463_l2458_DUPLICATE_6f01 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2484_l2455_l2450_l2467_l2463_l2458_DUPLICATE_6f01_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2482_c31_457e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2482_c31_457e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_457e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_457e_return_output := CONST_SR_8_uxn_opcodes_h_l2482_c31_457e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2489_c11_a035] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_left;
     BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_return_output := BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2484_c11_b4f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2467_l2489_DUPLICATE_937a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2467_l2489_DUPLICATE_937a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2458_c11_a999] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_left;
     BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_return_output := BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2467_c11_3246] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_left;
     BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_return_output := BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2491_c31_5698] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2491_c31_5698_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_5698_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_5698_return_output := CONST_SR_8_uxn_opcodes_h_l2491_c31_5698_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2450_c2_8efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c2_8efb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_637f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_1862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_1862_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_8f69_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2458_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_604d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a999_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_caa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2463_c7_caa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_0d87_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3246_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_0cf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_fe07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_b4f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_a035_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_70fc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2468_l2459_l2472_l2464_DUPLICATE_fe27_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2468_l2459_l2472_l2464_DUPLICATE_fe27_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2468_l2459_l2472_l2464_DUPLICATE_fe27_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2487_c21_4471_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2471_l2467_l2463_l2458_DUPLICATE_aed0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2471_l2467_l2463_l2458_DUPLICATE_aed0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2471_l2467_l2463_l2458_DUPLICATE_aed0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2471_l2467_l2463_l2458_DUPLICATE_aed0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2471_l2467_l2463_l2458_DUPLICATE_aed0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2455_l2450_l2471_l2467_l2463_l2458_DUPLICATE_aed0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2471_l2467_l2463_l2493_l2458_l2489_DUPLICATE_3dc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2471_l2467_l2463_l2493_l2458_l2489_DUPLICATE_3dc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2471_l2467_l2463_l2493_l2458_l2489_DUPLICATE_3dc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2471_l2467_l2463_l2493_l2458_l2489_DUPLICATE_3dc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2471_l2467_l2463_l2493_l2458_l2489_DUPLICATE_3dc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2471_l2467_l2463_l2493_l2458_l2489_DUPLICATE_3dc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2471_l2467_l2463_l2493_l2458_l2489_DUPLICATE_3dc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2471_l2467_l2463_l2493_l2458_l2489_DUPLICATE_3dc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2471_l2467_l2463_l2493_l2458_l2489_DUPLICATE_3dc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2484_l2455_l2450_l2467_l2463_l2458_DUPLICATE_6f01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2484_l2455_l2450_l2467_l2463_l2458_DUPLICATE_6f01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2484_l2455_l2450_l2467_l2463_l2458_DUPLICATE_6f01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2484_l2455_l2450_l2467_l2463_l2458_DUPLICATE_6f01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2484_l2455_l2450_l2467_l2463_l2458_DUPLICATE_6f01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2484_l2455_l2450_l2467_l2463_l2458_DUPLICATE_6f01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2450_l2467_l2463_l2493_l2458_l2489_DUPLICATE_ea71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2450_l2467_l2463_l2493_l2458_l2489_DUPLICATE_ea71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2450_l2467_l2463_l2493_l2458_l2489_DUPLICATE_ea71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2450_l2467_l2463_l2493_l2458_l2489_DUPLICATE_ea71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2450_l2467_l2463_l2493_l2458_l2489_DUPLICATE_ea71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2450_l2467_l2463_l2493_l2458_l2489_DUPLICATE_ea71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2450_l2467_l2463_l2493_l2458_l2489_DUPLICATE_ea71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2450_l2467_l2463_l2493_l2458_l2489_DUPLICATE_ea71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2455_l2479_l2450_l2467_l2463_l2493_l2458_l2489_DUPLICATE_ea71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2467_l2489_DUPLICATE_937a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2467_l2489_DUPLICATE_937a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2467_l2463_l2458_l2489_DUPLICATE_5b5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2467_l2463_l2458_l2489_DUPLICATE_5b5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2467_l2463_l2458_l2489_DUPLICATE_5b5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2467_l2463_l2458_l2489_DUPLICATE_5b5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2467_l2463_l2458_l2489_DUPLICATE_5b5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2455_l2450_l2467_l2463_l2458_l2489_DUPLICATE_5b5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_cd57_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2464_c3_8903] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_left;
     BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_return_output := BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2491_c21_efc4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2491_c21_efc4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_5698_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2493_c7_e8d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2471_c7_0bc6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2484_c7_4763] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2472_c3_fb7c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_left;
     BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_return_output := BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2450_c1_4546] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2482_c21_b595] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2482_c21_b595_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_457e_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2489_c7_36b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2493_c7_e8d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_8903_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2482_c21_b595_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2491_c21_efc4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_50f5_return_output;
     VAR_printf_uxn_opcodes_h_l2451_c3_6bbe_uxn_opcodes_h_l2451_c3_6bbe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_4546_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_e8d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_4763_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_e8d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2467_c7_5140] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2489_c7_36b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2463_c7_caa2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2463_c7_caa2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2463_c7_caa2_cond;
     t16_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue;
     t16_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output := t16_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2479_c7_478d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2484_c7_4763] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_return_output;

     -- printf_uxn_opcodes_h_l2451_c3_6bbe[uxn_opcodes_h_l2451_c3_6bbe] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2451_c3_6bbe_uxn_opcodes_h_l2451_c3_6bbe_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2451_c3_6bbe_uxn_opcodes_h_l2451_c3_6bbe_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l2489_c7_36b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2477_c21_c2b5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2477_c21_c2b5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_fb7c_return_output);

     -- n16_MUX[uxn_opcodes_h_l2471_c7_0bc6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond;
     n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue;
     n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output := n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2489_c7_36b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2477_c21_c2b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_478d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_5140_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_4763_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_36b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2484_c7_4763] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_return_output := result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2479_c7_478d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2458_c7_604d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2458_c7_604d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2458_c7_604d_cond;
     t16_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue;
     t16_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_604d_return_output := t16_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2467_c7_5140] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2467_c7_5140_cond <= VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5140_cond;
     n16_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue;
     n16_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5140_return_output := n16_MUX_uxn_opcodes_h_l2467_c7_5140_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2484_c7_4763] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2463_c7_caa2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2471_c7_0bc6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2484_c7_4763] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2467_c7_5140_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_4763_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_4763_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_478d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_4763_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2479_c7_478d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2463_c7_caa2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2463_c7_caa2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_caa2_cond;
     n16_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue;
     n16_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output := n16_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2479_c7_478d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2467_c7_5140] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_return_output;

     -- t16_MUX[uxn_opcodes_h_l2455_c7_1862] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2455_c7_1862_cond <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_1862_cond;
     t16_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue;
     t16_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_1862_return_output := t16_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2471_c7_0bc6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2458_c7_604d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2479_c7_478d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_478d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_5140_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_478d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_478d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;
     -- t16_MUX[uxn_opcodes_h_l2450_c2_8efb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2450_c2_8efb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2450_c2_8efb_cond;
     t16_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue;
     t16_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output := t16_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2471_c7_0bc6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2471_c7_0bc6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2455_c7_1862] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2467_c7_5140] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2471_c7_0bc6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2458_c7_604d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2458_c7_604d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2458_c7_604d_cond;
     n16_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue;
     n16_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2458_c7_604d_return_output := n16_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2463_c7_caa2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_5140_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_0bc6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2458_c7_604d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c2_8efb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2467_c7_5140] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_return_output := result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2467_c7_5140] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2463_c7_caa2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2455_c7_1862] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2455_c7_1862_cond <= VAR_n16_MUX_uxn_opcodes_h_l2455_c7_1862_cond;
     n16_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue;
     n16_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_1862_return_output := n16_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2467_c7_5140] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_5140_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_5140_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_5140_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2455_c7_1862] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2458_c7_604d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2450_c2_8efb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2450_c2_8efb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2450_c2_8efb_cond;
     n16_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue;
     n16_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output := n16_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2463_c7_caa2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_caa2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2463_c7_caa2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_caa2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2458_c7_604d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2455_c7_1862] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c2_8efb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2458_c7_604d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2458_c7_604d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_604d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2455_c7_1862] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c2_8efb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2455_c7_1862] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2455_c7_1862] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_return_output := result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_1862_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c2_8efb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2450_c2_8efb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2450_c2_8efb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2498_l2446_DUPLICATE_e6cc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2498_l2446_DUPLICATE_e6cc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_8efb_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2498_l2446_DUPLICATE_e6cc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2498_l2446_DUPLICATE_e6cc_return_output;
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
