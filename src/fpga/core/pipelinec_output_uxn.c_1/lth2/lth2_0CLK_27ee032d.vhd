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
-- Submodules: 89
entity lth2_0CLK_27ee032d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_27ee032d;
architecture arch of lth2_0CLK_27ee032d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2043_c6_2738]
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2043_c2_a52a]
signal n16_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2043_c2_a52a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2043_c2_a52a]
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2043_c2_a52a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2043_c2_a52a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2043_c2_a52a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2043_c2_a52a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2043_c2_a52a]
signal t16_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_b03f]
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2048_c7_838f]
signal n16_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2048_c7_838f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2048_c7_838f]
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_838f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_838f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2048_c7_838f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c7_838f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2048_c7_838f]
signal t16_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2051_c11_9354]
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2051_c7_c4b3]
signal n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2051_c7_c4b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2051_c7_c4b3]
signal result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2051_c7_c4b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2051_c7_c4b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2051_c7_c4b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2051_c7_c4b3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2051_c7_c4b3]
signal t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_65af]
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2056_c7_e9f5]
signal n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2056_c7_e9f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2056_c7_e9f5]
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2056_c7_e9f5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2056_c7_e9f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2056_c7_e9f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2056_c7_e9f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2056_c7_e9f5]
signal t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_1bfe]
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2059_c7_4790]
signal n16_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2059_c7_4790]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2059_c7_4790]
signal result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2059_c7_4790]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2059_c7_4790]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2059_c7_4790]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2059_c7_4790]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2059_c7_4790]
signal t16_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2060_c3_447d]
signal BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2063_c11_ab1b]
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2063_c7_756a]
signal n16_MUX_uxn_opcodes_h_l2063_c7_756a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2063_c7_756a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2063_c7_756a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2063_c7_756a]
signal result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2063_c7_756a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2063_c7_756a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2063_c7_756a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2063_c7_756a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2066_c11_94cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2066_c7_ff3c]
signal n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2066_c7_ff3c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2066_c7_ff3c]
signal result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2066_c7_ff3c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2066_c7_ff3c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2066_c7_ff3c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2066_c7_ff3c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_70c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2071_c7_c5df]
signal n16_MUX_uxn_opcodes_h_l2071_c7_c5df_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2071_c7_c5df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2071_c7_c5df]
signal result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2071_c7_c5df]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2071_c7_c5df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2071_c7_c5df]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2071_c7_c5df]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2074_c11_d3bc]
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2074_c7_a9d3]
signal n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2074_c7_a9d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2074_c7_a9d3]
signal result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2074_c7_a9d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2074_c7_a9d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2074_c7_a9d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2074_c7_a9d3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2075_c3_22db]
signal BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2077_c30_1dd6]
signal sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2080_c21_c456]
signal BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2080_c21_fde6]
signal MUX_uxn_opcodes_h_l2080_c21_fde6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2080_c21_fde6_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2080_c21_fde6_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2080_c21_fde6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2082_c11_3658]
signal BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2082_c7_f789]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2082_c7_f789]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2082_c7_f789]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738
BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_left,
BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_right,
BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_return_output);

-- n16_MUX_uxn_opcodes_h_l2043_c2_a52a
n16_MUX_uxn_opcodes_h_l2043_c2_a52a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2043_c2_a52a_cond,
n16_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue,
n16_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse,
n16_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a
result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a
result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output);

-- t16_MUX_uxn_opcodes_h_l2043_c2_a52a
t16_MUX_uxn_opcodes_h_l2043_c2_a52a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2043_c2_a52a_cond,
t16_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue,
t16_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse,
t16_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_left,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_right,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_return_output);

-- n16_MUX_uxn_opcodes_h_l2048_c7_838f
n16_MUX_uxn_opcodes_h_l2048_c7_838f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2048_c7_838f_cond,
n16_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue,
n16_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse,
n16_MUX_uxn_opcodes_h_l2048_c7_838f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_return_output);

-- t16_MUX_uxn_opcodes_h_l2048_c7_838f
t16_MUX_uxn_opcodes_h_l2048_c7_838f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2048_c7_838f_cond,
t16_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue,
t16_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse,
t16_MUX_uxn_opcodes_h_l2048_c7_838f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_left,
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_right,
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_return_output);

-- n16_MUX_uxn_opcodes_h_l2051_c7_c4b3
n16_MUX_uxn_opcodes_h_l2051_c7_c4b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond,
n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue,
n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse,
n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3
result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output);

-- t16_MUX_uxn_opcodes_h_l2051_c7_c4b3
t16_MUX_uxn_opcodes_h_l2051_c7_c4b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond,
t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue,
t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse,
t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_left,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_right,
BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_return_output);

-- n16_MUX_uxn_opcodes_h_l2056_c7_e9f5
n16_MUX_uxn_opcodes_h_l2056_c7_e9f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond,
n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue,
n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse,
n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output);

-- t16_MUX_uxn_opcodes_h_l2056_c7_e9f5
t16_MUX_uxn_opcodes_h_l2056_c7_e9f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond,
t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue,
t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse,
t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_left,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_right,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_return_output);

-- n16_MUX_uxn_opcodes_h_l2059_c7_4790
n16_MUX_uxn_opcodes_h_l2059_c7_4790 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2059_c7_4790_cond,
n16_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue,
n16_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse,
n16_MUX_uxn_opcodes_h_l2059_c7_4790_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790
result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_cond,
result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_return_output);

-- t16_MUX_uxn_opcodes_h_l2059_c7_4790
t16_MUX_uxn_opcodes_h_l2059_c7_4790 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2059_c7_4790_cond,
t16_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue,
t16_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse,
t16_MUX_uxn_opcodes_h_l2059_c7_4790_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d
BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_left,
BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_right,
BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_left,
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_right,
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_return_output);

-- n16_MUX_uxn_opcodes_h_l2063_c7_756a
n16_MUX_uxn_opcodes_h_l2063_c7_756a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2063_c7_756a_cond,
n16_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue,
n16_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse,
n16_MUX_uxn_opcodes_h_l2063_c7_756a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_return_output);

-- n16_MUX_uxn_opcodes_h_l2066_c7_ff3c
n16_MUX_uxn_opcodes_h_l2066_c7_ff3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond,
n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue,
n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse,
n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c
result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c
result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c
result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_return_output);

-- n16_MUX_uxn_opcodes_h_l2071_c7_c5df
n16_MUX_uxn_opcodes_h_l2071_c7_c5df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2071_c7_c5df_cond,
n16_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue,
n16_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse,
n16_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_cond,
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_left,
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_right,
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_return_output);

-- n16_MUX_uxn_opcodes_h_l2074_c7_a9d3
n16_MUX_uxn_opcodes_h_l2074_c7_a9d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond,
n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue,
n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse,
n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3
result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3
result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3
result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3
result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db
BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_left,
BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_right,
BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6
sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_ins,
sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_x,
sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_y,
sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456
BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_left,
BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_right,
BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_return_output);

-- MUX_uxn_opcodes_h_l2080_c21_fde6
MUX_uxn_opcodes_h_l2080_c21_fde6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2080_c21_fde6_cond,
MUX_uxn_opcodes_h_l2080_c21_fde6_iftrue,
MUX_uxn_opcodes_h_l2080_c21_fde6_iffalse,
MUX_uxn_opcodes_h_l2080_c21_fde6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658
BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_left,
BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_right,
BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789
result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789
result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789
result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06
CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_return_output,
 n16_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output,
 t16_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_return_output,
 n16_MUX_uxn_opcodes_h_l2048_c7_838f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_return_output,
 t16_MUX_uxn_opcodes_h_l2048_c7_838f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_return_output,
 n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output,
 t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_return_output,
 n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output,
 t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_return_output,
 n16_MUX_uxn_opcodes_h_l2059_c7_4790_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_return_output,
 t16_MUX_uxn_opcodes_h_l2059_c7_4790_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_return_output,
 n16_MUX_uxn_opcodes_h_l2063_c7_756a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_return_output,
 n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_return_output,
 n16_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_return_output,
 n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_return_output,
 sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_return_output,
 MUX_uxn_opcodes_h_l2080_c21_fde6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_0c0c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_838f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c2_a52a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2049_c3_db36 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2048_c7_838f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2054_c3_8a33 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2057_c3_7651 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2059_c7_4790_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2063_c7_756a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_7c1e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2059_c7_4790_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2063_c7_756a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2064_c3_24c3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2069_c3_b969 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c5df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2072_c3_83e5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2079_c3_0380 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2074_c7_a9d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2080_c21_fde6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2080_c21_fde6_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2080_c21_fde6_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2080_c21_fde6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_b47b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_27c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_340e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_ad08_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2082_l2051_l2074_l2048_l2071_l2066_l2063_l2059_l2056_DUPLICATE_1d1c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2052_l2060_l2067_l2075_DUPLICATE_4b25_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2039_l2088_DUPLICATE_a0c6_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2049_c3_db36 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2049_c3_db36;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2064_c3_24c3 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2064_c3_24c3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_0c0c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_0c0c;
     VAR_sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2054_c3_8a33 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2054_c3_8a33;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2080_c21_fde6_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2069_c3_b969 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2069_c3_b969;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2072_c3_83e5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2072_c3_83e5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_7c1e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_7c1e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l2080_c21_fde6_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2057_c3_7651 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2057_c3_7651;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2079_c3_0380 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2079_c3_0380;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2056_c11_65af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2052_l2060_l2067_l2075_DUPLICATE_4b25 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2052_l2060_l2067_l2075_DUPLICATE_4b25_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_b03f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_340e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_340e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2071_c11_70c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2074_c11_d3bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2077_c30_1dd6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_ins;
     sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_x;
     sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_return_output := sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2066_c11_94cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2043_c6_2738] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_left;
     BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_return_output := BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2051_c11_9354] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_left;
     BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_return_output := BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_27c5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_27c5_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_1bfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2082_l2051_l2074_l2048_l2071_l2066_l2063_l2059_l2056_DUPLICATE_1d1c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2082_l2051_l2074_l2048_l2071_l2066_l2063_l2059_l2056_DUPLICATE_1d1c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2082_c11_3658] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_left;
     BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_return_output := BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_b47b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_b47b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2063_c11_ab1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_ad08 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_ad08_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2074_c7_a9d3] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2074_c7_a9d3_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2043_c2_a52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2043_c2_a52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_2738_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_838f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_838f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_b03f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_9354_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2056_c11_65af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2059_c7_4790_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2059_c7_4790_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_1bfe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2063_c7_756a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_ab1b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_94cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c11_70c3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_d3bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2082_c11_3658_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2052_l2060_l2067_l2075_DUPLICATE_4b25_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2052_l2060_l2067_l2075_DUPLICATE_4b25_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2052_l2060_l2067_l2075_DUPLICATE_4b25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_340e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_340e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_340e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_340e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_340e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_340e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_340e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_340e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_340e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2082_l2051_l2074_l2048_l2071_l2066_l2063_l2059_l2056_DUPLICATE_1d1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2082_l2051_l2074_l2048_l2071_l2066_l2063_l2059_l2056_DUPLICATE_1d1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2082_l2051_l2074_l2048_l2071_l2066_l2063_l2059_l2056_DUPLICATE_1d1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2082_l2051_l2074_l2048_l2071_l2066_l2063_l2059_l2056_DUPLICATE_1d1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2082_l2051_l2074_l2048_l2071_l2066_l2063_l2059_l2056_DUPLICATE_1d1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2082_l2051_l2074_l2048_l2071_l2066_l2063_l2059_l2056_DUPLICATE_1d1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2082_l2051_l2074_l2048_l2071_l2066_l2063_l2059_l2056_DUPLICATE_1d1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2082_l2051_l2074_l2048_l2071_l2066_l2063_l2059_l2056_DUPLICATE_1d1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2082_l2051_l2074_l2048_l2071_l2066_l2063_l2059_l2056_DUPLICATE_1d1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_ad08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_ad08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_ad08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_ad08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_ad08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_ad08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_ad08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_ad08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_ad08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_27c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_27c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_27c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_27c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_27c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_27c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_27c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_27c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2082_l2051_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_27c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_b47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_b47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_b47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_b47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_b47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_b47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_b47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_b47b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2051_l2074_l2048_l2071_l2043_l2066_l2063_l2059_l2056_DUPLICATE_b47b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2074_c7_a9d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2077_c30_1dd6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2074_c7_a9d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2082_c7_f789] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2075_c3_22db] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_left;
     BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_return_output := BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2060_c3_447d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_left;
     BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_return_output := BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2082_c7_f789] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2082_c7_f789] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2074_c7_a9d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2060_c3_447d_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2075_c3_22db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2053_l2068_DUPLICATE_3a06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2082_c7_f789_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2082_c7_f789_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2082_c7_f789_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2074_c7_a9d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2074_c7_a9d3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond;
     n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue;
     n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output := n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2059_c7_4790] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2059_c7_4790_cond <= VAR_t16_MUX_uxn_opcodes_h_l2059_c7_4790_cond;
     t16_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue;
     t16_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2059_c7_4790_return_output := t16_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2074_c7_a9d3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2071_c7_c5df] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2071_c7_c5df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2074_c7_a9d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l2080_c21_c456] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_left;
     BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_return_output := BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2080_c21_fde6_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2080_c21_c456_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2066_c7_ff3c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2071_c7_c5df] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2071_c7_c5df_cond <= VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c5df_cond;
     n16_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue;
     n16_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output := n16_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2071_c7_c5df] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output;

     -- MUX[uxn_opcodes_h_l2080_c21_fde6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2080_c21_fde6_cond <= VAR_MUX_uxn_opcodes_h_l2080_c21_fde6_cond;
     MUX_uxn_opcodes_h_l2080_c21_fde6_iftrue <= VAR_MUX_uxn_opcodes_h_l2080_c21_fde6_iftrue;
     MUX_uxn_opcodes_h_l2080_c21_fde6_iffalse <= VAR_MUX_uxn_opcodes_h_l2080_c21_fde6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2080_c21_fde6_return_output := MUX_uxn_opcodes_h_l2080_c21_fde6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2071_c7_c5df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output;

     -- t16_MUX[uxn_opcodes_h_l2056_c7_e9f5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond;
     t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue;
     t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output := t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2066_c7_ff3c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2071_c7_c5df] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue := VAR_MUX_uxn_opcodes_h_l2080_c21_fde6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2074_c7_a9d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2066_c7_ff3c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2066_c7_ff3c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2066_c7_ff3c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2063_c7_756a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2063_c7_756a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2066_c7_ff3c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond;
     n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue;
     n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output := n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2051_c7_c4b3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond;
     t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue;
     t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output := t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2063_c7_756a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_756a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2074_c7_a9d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2059_c7_4790] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2071_c7_c5df] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output := result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2063_c7_756a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2063_c7_756a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2063_c7_756a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2063_c7_756a_cond;
     n16_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue;
     n16_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2063_c7_756a_return_output := n16_MUX_uxn_opcodes_h_l2063_c7_756a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2063_c7_756a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2059_c7_4790] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2063_c7_756a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2048_c7_838f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2048_c7_838f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_838f_cond;
     t16_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue;
     t16_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2048_c7_838f_return_output := t16_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2063_c7_756a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_756a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_756a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_756a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2071_c7_c5df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2059_c7_4790] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2059_c7_4790] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2066_c7_ff3c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2056_c7_e9f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2043_c2_a52a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2043_c2_a52a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2043_c2_a52a_cond;
     t16_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue;
     t16_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output := t16_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2059_c7_4790] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;

     -- n16_MUX[uxn_opcodes_h_l2059_c7_4790] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2059_c7_4790_cond <= VAR_n16_MUX_uxn_opcodes_h_l2059_c7_4790_cond;
     n16_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue;
     n16_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2059_c7_4790_return_output := n16_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2056_c7_e9f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2066_c7_ff3c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2056_c7_e9f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2056_c7_e9f5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond;
     n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue;
     n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output := n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2056_c7_e9f5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2051_c7_c4b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2063_c7_756a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2051_c7_c4b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2056_c7_e9f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2063_c7_756a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2051_c7_c4b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2048_c7_838f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2059_c7_4790] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_return_output := result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2051_c7_c4b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2048_c7_838f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2051_c7_c4b3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2051_c7_c4b3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond;
     n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue;
     n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output := n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_4790_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2043_c2_a52a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2056_c7_e9f5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2043_c2_a52a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2048_c7_838f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2048_c7_838f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_838f_cond;
     n16_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue;
     n16_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2048_c7_838f_return_output := n16_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c7_838f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_838f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_838f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2056_c7_e9f5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2051_c7_c4b3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2043_c2_a52a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2043_c2_a52a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2043_c2_a52a_cond;
     n16_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue;
     n16_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output := n16_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2043_c2_a52a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2043_c2_a52a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2043_c2_a52a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_c4b3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2048_c7_838f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2048_c7_838f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2043_c2_a52a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2039_l2088_DUPLICATE_a0c6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2039_l2088_DUPLICATE_a0c6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_a52a_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2039_l2088_DUPLICATE_a0c6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2039_l2088_DUPLICATE_a0c6_return_output;
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
