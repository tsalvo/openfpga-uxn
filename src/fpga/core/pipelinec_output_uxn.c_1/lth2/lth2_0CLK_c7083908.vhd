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
entity lth2_0CLK_c7083908 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_c7083908;
architecture arch of lth2_0CLK_c7083908 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2085_c6_db2e]
signal BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2085_c2_9874]
signal t16_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2085_c2_9874]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2085_c2_9874]
signal result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2085_c2_9874]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2085_c2_9874]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2085_c2_9874]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2085_c2_9874]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2085_c2_9874]
signal n16_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2090_c11_a9ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2090_c7_e3da]
signal t16_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c7_e3da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2090_c7_e3da]
signal result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c7_e3da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2090_c7_e3da]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c7_e3da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c7_e3da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2090_c7_e3da]
signal n16_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2093_c11_7639]
signal BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2093_c7_5877]
signal t16_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2093_c7_5877]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2093_c7_5877]
signal result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2093_c7_5877]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2093_c7_5877]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2093_c7_5877]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2093_c7_5877]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2093_c7_5877]
signal n16_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2098_c11_c4bf]
signal BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2098_c7_7926]
signal t16_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2098_c7_7926]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2098_c7_7926]
signal result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2098_c7_7926]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2098_c7_7926]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2098_c7_7926]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2098_c7_7926]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2098_c7_7926]
signal n16_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2101_c11_2de6]
signal BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2101_c7_c0ab]
signal t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2101_c7_c0ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2101_c7_c0ab]
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2101_c7_c0ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2101_c7_c0ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2101_c7_c0ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2101_c7_c0ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2101_c7_c0ab]
signal n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2102_c3_9d40]
signal BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2105_c11_cc30]
signal BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2105_c7_aea3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2105_c7_aea3]
signal result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2105_c7_aea3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2105_c7_aea3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2105_c7_aea3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2105_c7_aea3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2105_c7_aea3]
signal n16_MUX_uxn_opcodes_h_l2105_c7_aea3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2108_c11_1813]
signal BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2108_c7_e4eb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2108_c7_e4eb]
signal result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2108_c7_e4eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2108_c7_e4eb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2108_c7_e4eb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2108_c7_e4eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2108_c7_e4eb]
signal n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2113_c11_977c]
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2113_c7_d004]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2113_c7_d004]
signal result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2113_c7_d004]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2113_c7_d004]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2113_c7_d004]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2113_c7_d004]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2113_c7_d004]
signal n16_MUX_uxn_opcodes_h_l2113_c7_d004_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2113_c7_d004_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_e369]
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_f14a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2116_c7_f14a]
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_f14a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2116_c7_f14a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_f14a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_f14a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2116_c7_f14a]
signal n16_MUX_uxn_opcodes_h_l2116_c7_f14a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2117_c3_3dda]
signal BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2119_c32_8672]
signal BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2119_c32_67f2]
signal BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2119_c32_8f76]
signal MUX_uxn_opcodes_h_l2119_c32_8f76_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2119_c32_8f76_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2119_c32_8f76_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2119_c32_8f76_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_2cbb]
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2121_c7_b1e7]
signal result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2121_c7_b1e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2121_c7_b1e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2121_c7_b1e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2121_c7_b1e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2125_c24_1be4]
signal BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2125_c24_3331]
signal MUX_uxn_opcodes_h_l2125_c24_3331_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2125_c24_3331_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2125_c24_3331_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2125_c24_3331_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_3ebb]
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2127_c7_c40e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_c40e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e
BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_left,
BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_right,
BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_return_output);

-- t16_MUX_uxn_opcodes_h_l2085_c2_9874
t16_MUX_uxn_opcodes_h_l2085_c2_9874 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2085_c2_9874_cond,
t16_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue,
t16_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse,
t16_MUX_uxn_opcodes_h_l2085_c2_9874_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874
result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_cond,
result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_return_output);

-- n16_MUX_uxn_opcodes_h_l2085_c2_9874
n16_MUX_uxn_opcodes_h_l2085_c2_9874 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2085_c2_9874_cond,
n16_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue,
n16_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse,
n16_MUX_uxn_opcodes_h_l2085_c2_9874_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac
BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_return_output);

-- t16_MUX_uxn_opcodes_h_l2090_c7_e3da
t16_MUX_uxn_opcodes_h_l2090_c7_e3da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2090_c7_e3da_cond,
t16_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue,
t16_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse,
t16_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da
result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_cond,
result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da
result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output);

-- n16_MUX_uxn_opcodes_h_l2090_c7_e3da
n16_MUX_uxn_opcodes_h_l2090_c7_e3da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2090_c7_e3da_cond,
n16_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue,
n16_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse,
n16_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639
BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_left,
BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_right,
BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_return_output);

-- t16_MUX_uxn_opcodes_h_l2093_c7_5877
t16_MUX_uxn_opcodes_h_l2093_c7_5877 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2093_c7_5877_cond,
t16_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue,
t16_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse,
t16_MUX_uxn_opcodes_h_l2093_c7_5877_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877
result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_cond,
result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877
result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_return_output);

-- n16_MUX_uxn_opcodes_h_l2093_c7_5877
n16_MUX_uxn_opcodes_h_l2093_c7_5877 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2093_c7_5877_cond,
n16_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue,
n16_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse,
n16_MUX_uxn_opcodes_h_l2093_c7_5877_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf
BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_left,
BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_right,
BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_return_output);

-- t16_MUX_uxn_opcodes_h_l2098_c7_7926
t16_MUX_uxn_opcodes_h_l2098_c7_7926 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2098_c7_7926_cond,
t16_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue,
t16_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse,
t16_MUX_uxn_opcodes_h_l2098_c7_7926_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926
result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926
result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_cond,
result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926
result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926
result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926
result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_return_output);

-- n16_MUX_uxn_opcodes_h_l2098_c7_7926
n16_MUX_uxn_opcodes_h_l2098_c7_7926 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2098_c7_7926_cond,
n16_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue,
n16_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse,
n16_MUX_uxn_opcodes_h_l2098_c7_7926_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_left,
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_right,
BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_return_output);

-- t16_MUX_uxn_opcodes_h_l2101_c7_c0ab
t16_MUX_uxn_opcodes_h_l2101_c7_c0ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond,
t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue,
t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse,
t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond,
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output);

-- n16_MUX_uxn_opcodes_h_l2101_c7_c0ab
n16_MUX_uxn_opcodes_h_l2101_c7_c0ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond,
n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue,
n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse,
n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40
BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_left,
BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_right,
BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30
BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_left,
BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_right,
BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3
result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3
result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3
result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3
result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output);

-- n16_MUX_uxn_opcodes_h_l2105_c7_aea3
n16_MUX_uxn_opcodes_h_l2105_c7_aea3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2105_c7_aea3_cond,
n16_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue,
n16_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse,
n16_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813
BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_left,
BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_right,
BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb
result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb
result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output);

-- n16_MUX_uxn_opcodes_h_l2108_c7_e4eb
n16_MUX_uxn_opcodes_h_l2108_c7_e4eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond,
n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue,
n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse,
n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_left,
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_right,
BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_cond,
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_return_output);

-- n16_MUX_uxn_opcodes_h_l2113_c7_d004
n16_MUX_uxn_opcodes_h_l2113_c7_d004 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2113_c7_d004_cond,
n16_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue,
n16_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse,
n16_MUX_uxn_opcodes_h_l2113_c7_d004_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_left,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_right,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output);

-- n16_MUX_uxn_opcodes_h_l2116_c7_f14a
n16_MUX_uxn_opcodes_h_l2116_c7_f14a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2116_c7_f14a_cond,
n16_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue,
n16_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse,
n16_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda
BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_left,
BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_right,
BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672
BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_left,
BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_right,
BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2
BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_left,
BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_right,
BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_return_output);

-- MUX_uxn_opcodes_h_l2119_c32_8f76
MUX_uxn_opcodes_h_l2119_c32_8f76 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2119_c32_8f76_cond,
MUX_uxn_opcodes_h_l2119_c32_8f76_iftrue,
MUX_uxn_opcodes_h_l2119_c32_8f76_iffalse,
MUX_uxn_opcodes_h_l2119_c32_8f76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_left,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_right,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7
result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7
result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4
BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_left,
BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_right,
BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_return_output);

-- MUX_uxn_opcodes_h_l2125_c24_3331
MUX_uxn_opcodes_h_l2125_c24_3331 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2125_c24_3331_cond,
MUX_uxn_opcodes_h_l2125_c24_3331_iftrue,
MUX_uxn_opcodes_h_l2125_c24_3331_iffalse,
MUX_uxn_opcodes_h_l2125_c24_3331_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_left,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_right,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e
CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_return_output,
 t16_MUX_uxn_opcodes_h_l2085_c2_9874_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_return_output,
 n16_MUX_uxn_opcodes_h_l2085_c2_9874_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_return_output,
 t16_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output,
 n16_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_return_output,
 t16_MUX_uxn_opcodes_h_l2093_c7_5877_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_return_output,
 n16_MUX_uxn_opcodes_h_l2093_c7_5877_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_return_output,
 t16_MUX_uxn_opcodes_h_l2098_c7_7926_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_return_output,
 n16_MUX_uxn_opcodes_h_l2098_c7_7926_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_return_output,
 t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output,
 n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output,
 n16_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output,
 n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_return_output,
 n16_MUX_uxn_opcodes_h_l2113_c7_d004_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output,
 n16_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_return_output,
 MUX_uxn_opcodes_h_l2119_c32_8f76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_return_output,
 MUX_uxn_opcodes_h_l2125_c24_3331_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2087_c3_134f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2085_c2_9874_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2085_c2_9874_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2091_c3_75d2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2093_c7_5877_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c7_e3da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2096_c3_ff9d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2098_c7_7926_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2093_c7_5877_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2099_c3_5af2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2098_c7_7926_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2103_c3_1553 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2106_c3_3089 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2105_c7_aea3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2111_c3_2f40 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c7_d004_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_a4cb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c7_d004_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2116_c7_f14a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2119_c32_8f76_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2119_c32_8f76_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2119_c32_8f76_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2119_c32_8f76_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_117e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2125_c24_3331_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2125_c24_3331_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2125_c24_3331_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2125_c24_3331_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_1058_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2116_l2090_l2113_l2085_DUPLICATE_ffbd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2090_l2113_l2085_DUPLICATE_b54d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_a4a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2121_l2093_l2116_l2090_l2113_DUPLICATE_205e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2109_l2094_l2117_l2102_DUPLICATE_7677_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2121_l2116_DUPLICATE_b4f4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2132_l2081_DUPLICATE_b71a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2103_c3_1553 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2103_c3_1553;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2096_c3_ff9d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2096_c3_ff9d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2087_c3_134f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2087_c3_134f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2111_c3_2f40 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2111_c3_2f40;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2091_c3_75d2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2091_c3_75d2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l2125_c24_3331_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l2119_c32_8f76_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2099_c3_5af2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2099_c3_5af2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2106_c3_3089 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2106_c3_3089;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2125_c24_3331_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_a4cb := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2114_c3_a4cb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_117e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_117e;
     VAR_MUX_uxn_opcodes_h_l2119_c32_8f76_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2105_c11_cc30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_left;
     BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_return_output := BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_3ebb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2090_c11_a9ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2116_l2090_l2113_l2085_DUPLICATE_ffbd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2116_l2090_l2113_l2085_DUPLICATE_ffbd_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2113_c11_977c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2093_c11_7639] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_left;
     BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_return_output := BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2119_c32_8672] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_left;
     BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_return_output := BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2109_l2094_l2117_l2102_DUPLICATE_7677 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2109_l2094_l2117_l2102_DUPLICATE_7677_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_2cbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_1058 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_1058_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2121_l2093_l2116_l2090_l2113_DUPLICATE_205e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2121_l2093_l2116_l2090_l2113_DUPLICATE_205e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2101_c11_2de6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2098_c11_c4bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2085_c6_db2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2090_l2113_l2085_DUPLICATE_b54d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2090_l2113_l2085_DUPLICATE_b54d_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_a4a4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_a4a4_return_output := result.is_stack_write;

     -- BIN_OP_LT[uxn_opcodes_h_l2125_c24_1be4] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_left;
     BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_return_output := BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2121_l2116_DUPLICATE_b4f4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2121_l2116_DUPLICATE_b4f4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_e369] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_left;
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_return_output := BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2108_c11_1813] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_left;
     BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_return_output := BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2119_c32_8672_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2085_c2_9874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2085_c2_9874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c6_db2e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2090_c7_e3da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c7_e3da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c11_a9ac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2093_c7_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2093_c7_5877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c11_7639_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2098_c7_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2098_c7_7926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2098_c11_c4bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2101_c11_2de6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2105_c7_aea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2105_c11_cc30_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2108_c11_1813_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2113_c7_d004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c11_977c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_f14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_e369_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_2cbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_3ebb_return_output;
     VAR_MUX_uxn_opcodes_h_l2125_c24_3331_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2125_c24_1be4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2109_l2094_l2117_l2102_DUPLICATE_7677_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2109_l2094_l2117_l2102_DUPLICATE_7677_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2109_l2094_l2117_l2102_DUPLICATE_7677_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_1058_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_1058_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_1058_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_1058_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_1058_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_1058_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_1058_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_1058_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_1058_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2121_l2093_l2116_l2090_l2113_DUPLICATE_205e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2121_l2093_l2116_l2090_l2113_DUPLICATE_205e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2121_l2093_l2116_l2090_l2113_DUPLICATE_205e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2121_l2093_l2116_l2090_l2113_DUPLICATE_205e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2121_l2093_l2116_l2090_l2113_DUPLICATE_205e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2121_l2093_l2116_l2090_l2113_DUPLICATE_205e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2121_l2093_l2116_l2090_l2113_DUPLICATE_205e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2121_l2093_l2116_l2090_l2113_DUPLICATE_205e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2121_l2093_l2116_l2090_l2113_DUPLICATE_205e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2121_l2093_l2116_l2090_l2113_DUPLICATE_205e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2090_l2113_l2085_DUPLICATE_b54d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2090_l2113_l2085_DUPLICATE_b54d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2090_l2113_l2085_DUPLICATE_b54d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2090_l2113_l2085_DUPLICATE_b54d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2090_l2113_l2085_DUPLICATE_b54d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2090_l2113_l2085_DUPLICATE_b54d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2090_l2113_l2085_DUPLICATE_b54d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2090_l2113_l2085_DUPLICATE_b54d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2090_l2113_l2085_DUPLICATE_b54d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_a4a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_a4a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_a4a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_a4a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_a4a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_a4a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_a4a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_a4a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_a4a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2127_l2098_l2093_l2116_l2090_l2113_l2085_DUPLICATE_a4a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2121_l2116_DUPLICATE_b4f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2121_l2116_DUPLICATE_b4f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2116_l2090_l2113_l2085_DUPLICATE_ffbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2116_l2090_l2113_l2085_DUPLICATE_ffbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2116_l2090_l2113_l2085_DUPLICATE_ffbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2116_l2090_l2113_l2085_DUPLICATE_ffbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2116_l2090_l2113_l2085_DUPLICATE_ffbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2116_l2090_l2113_l2085_DUPLICATE_ffbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2116_l2090_l2113_l2085_DUPLICATE_ffbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2116_l2090_l2113_l2085_DUPLICATE_ffbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2116_l2090_l2113_l2085_DUPLICATE_ffbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2108_l2105_l2101_l2098_l2121_l2093_l2116_l2090_l2113_l2085_DUPLICATE_ffbd_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_c40e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_return_output;

     -- MUX[uxn_opcodes_h_l2125_c24_3331] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2125_c24_3331_cond <= VAR_MUX_uxn_opcodes_h_l2125_c24_3331_cond;
     MUX_uxn_opcodes_h_l2125_c24_3331_iftrue <= VAR_MUX_uxn_opcodes_h_l2125_c24_3331_iftrue;
     MUX_uxn_opcodes_h_l2125_c24_3331_iffalse <= VAR_MUX_uxn_opcodes_h_l2125_c24_3331_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2125_c24_3331_return_output := MUX_uxn_opcodes_h_l2125_c24_3331_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2119_c32_67f2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_left;
     BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_return_output := BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2117_c3_3dda] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_left;
     BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_return_output := BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2102_c3_9d40] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_left;
     BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_return_output := BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2121_c7_b1e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2121_c7_b1e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2127_c7_c40e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2119_c32_8f76_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2119_c32_67f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2102_c3_9d40_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2117_c3_3dda_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2110_l2095_DUPLICATE_823e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue := VAR_MUX_uxn_opcodes_h_l2125_c24_3331_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_c40e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2127_c7_c40e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output;
     -- t16_MUX[uxn_opcodes_h_l2101_c7_c0ab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond <= VAR_t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond;
     t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue;
     t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output := t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2121_c7_b1e7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output;

     -- MUX[uxn_opcodes_h_l2119_c32_8f76] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2119_c32_8f76_cond <= VAR_MUX_uxn_opcodes_h_l2119_c32_8f76_cond;
     MUX_uxn_opcodes_h_l2119_c32_8f76_iftrue <= VAR_MUX_uxn_opcodes_h_l2119_c32_8f76_iftrue;
     MUX_uxn_opcodes_h_l2119_c32_8f76_iffalse <= VAR_MUX_uxn_opcodes_h_l2119_c32_8f76_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2119_c32_8f76_return_output := MUX_uxn_opcodes_h_l2119_c32_8f76_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2121_c7_b1e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_f14a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2116_c7_f14a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2116_c7_f14a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_f14a_cond;
     n16_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue;
     n16_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output := n16_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2116_c7_f14a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2121_c7_b1e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue := VAR_MUX_uxn_opcodes_h_l2119_c32_8f76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2121_c7_b1e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2116_c7_f14a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2098_c7_7926] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2098_c7_7926_cond <= VAR_t16_MUX_uxn_opcodes_h_l2098_c7_7926_cond;
     t16_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue;
     t16_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2098_c7_7926_return_output := t16_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;

     -- n16_MUX[uxn_opcodes_h_l2113_c7_d004] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2113_c7_d004_cond <= VAR_n16_MUX_uxn_opcodes_h_l2113_c7_d004_cond;
     n16_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue;
     n16_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2113_c7_d004_return_output := n16_MUX_uxn_opcodes_h_l2113_c7_d004_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2116_c7_f14a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_f14a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_f14a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2113_c7_d004] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2113_c7_d004] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2113_c7_d004_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2113_c7_d004_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c7_d004_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_f14a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2113_c7_d004] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_return_output;

     -- t16_MUX[uxn_opcodes_h_l2093_c7_5877] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2093_c7_5877_cond <= VAR_t16_MUX_uxn_opcodes_h_l2093_c7_5877_cond;
     t16_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue;
     t16_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2093_c7_5877_return_output := t16_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2113_c7_d004] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_return_output := result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2113_c7_d004] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2113_c7_d004] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2108_c7_e4eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2108_c7_e4eb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond;
     n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue;
     n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output := n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2108_c7_e4eb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c7_d004_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c7_d004_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c7_d004_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2113_c7_d004_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2108_c7_e4eb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2105_c7_aea3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2105_c7_aea3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2105_c7_aea3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2105_c7_aea3_cond;
     n16_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue;
     n16_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output := n16_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2108_c7_e4eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2108_c7_e4eb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2108_c7_e4eb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2105_c7_aea3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2090_c7_e3da] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2090_c7_e3da_cond <= VAR_t16_MUX_uxn_opcodes_h_l2090_c7_e3da_cond;
     t16_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue;
     t16_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output := t16_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2108_c7_e4eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;
     -- t16_MUX[uxn_opcodes_h_l2085_c2_9874] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2085_c2_9874_cond <= VAR_t16_MUX_uxn_opcodes_h_l2085_c2_9874_cond;
     t16_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue;
     t16_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2085_c2_9874_return_output := t16_MUX_uxn_opcodes_h_l2085_c2_9874_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2105_c7_aea3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2105_c7_aea3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2101_c7_c0ab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond <= VAR_n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond;
     n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue;
     n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output := n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2101_c7_c0ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2105_c7_aea3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2101_c7_c0ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2105_c7_aea3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2105_c7_aea3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2085_c2_9874_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2098_c7_7926] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;

     -- n16_MUX[uxn_opcodes_h_l2098_c7_7926] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2098_c7_7926_cond <= VAR_n16_MUX_uxn_opcodes_h_l2098_c7_7926_cond;
     n16_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue;
     n16_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2098_c7_7926_return_output := n16_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2101_c7_c0ab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output := result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2101_c7_c0ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2098_c7_7926] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2101_c7_c0ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2101_c7_c0ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2101_c7_c0ab_return_output;
     -- n16_MUX[uxn_opcodes_h_l2093_c7_5877] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2093_c7_5877_cond <= VAR_n16_MUX_uxn_opcodes_h_l2093_c7_5877_cond;
     n16_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue;
     n16_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2093_c7_5877_return_output := n16_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2098_c7_7926] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2098_c7_7926] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2093_c7_5877] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2098_c7_7926] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2093_c7_5877] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2098_c7_7926] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_return_output := result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2098_c7_7926_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2093_c7_5877] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2093_c7_5877] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_return_output := result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2090_c7_e3da] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;

     -- n16_MUX[uxn_opcodes_h_l2090_c7_e3da] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2090_c7_e3da_cond <= VAR_n16_MUX_uxn_opcodes_h_l2090_c7_e3da_cond;
     n16_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue;
     n16_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output := n16_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c7_e3da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2093_c7_5877] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2093_c7_5877] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2093_c7_5877_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2090_c7_e3da] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output := result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;

     -- n16_MUX[uxn_opcodes_h_l2085_c2_9874] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2085_c2_9874_cond <= VAR_n16_MUX_uxn_opcodes_h_l2085_c2_9874_cond;
     n16_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue;
     n16_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2085_c2_9874_return_output := n16_MUX_uxn_opcodes_h_l2085_c2_9874_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2085_c2_9874] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c7_e3da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c7_e3da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c7_e3da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2085_c2_9874] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2085_c2_9874_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2090_c7_e3da_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2085_c2_9874] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2085_c2_9874] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_return_output := result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2085_c2_9874] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2085_c2_9874] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2132_l2081_DUPLICATE_b71a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2132_l2081_DUPLICATE_b71a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c2_9874_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c2_9874_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c2_9874_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c2_9874_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c2_9874_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c2_9874_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2132_l2081_DUPLICATE_b71a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2132_l2081_DUPLICATE_b71a_return_output;
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
