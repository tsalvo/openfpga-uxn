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
-- Submodules: 123
entity add2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_201aeef3;
architecture arch of add2_0CLK_201aeef3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l728_c6_325e]
signal BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l728_c1_c80b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l728_c2_6c2c]
signal tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l728_c2_6c2c]
signal t16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l728_c2_6c2c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l728_c2_6c2c]
signal result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l728_c2_6c2c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l728_c2_6c2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l728_c2_6c2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l728_c2_6c2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l728_c2_6c2c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l728_c2_6c2c]
signal n16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l729_c3_ed13[uxn_opcodes_h_l729_c3_ed13]
signal printf_uxn_opcodes_h_l729_c3_ed13_uxn_opcodes_h_l729_c3_ed13_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l734_c11_ca69]
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l734_c7_a974]
signal tmp16_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l734_c7_a974]
signal t16_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l734_c7_a974]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l734_c7_a974]
signal result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l734_c7_a974]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l734_c7_a974]
signal result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l734_c7_a974]
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l734_c7_a974]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l734_c7_a974]
signal result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l734_c7_a974]
signal n16_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l737_c11_48b3]
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l737_c7_2c02]
signal tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l737_c7_2c02]
signal t16_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l737_c7_2c02]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l737_c7_2c02]
signal result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l737_c7_2c02]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l737_c7_2c02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l737_c7_2c02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l737_c7_2c02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l737_c7_2c02]
signal result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l737_c7_2c02]
signal n16_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l742_c11_5af3]
signal BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l742_c7_6aa4]
signal tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l742_c7_6aa4]
signal t16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l742_c7_6aa4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l742_c7_6aa4]
signal result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l742_c7_6aa4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l742_c7_6aa4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l742_c7_6aa4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l742_c7_6aa4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l742_c7_6aa4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l742_c7_6aa4]
signal n16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l745_c11_3200]
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l745_c7_ca2c]
signal tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l745_c7_ca2c]
signal t16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l745_c7_ca2c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l745_c7_ca2c]
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l745_c7_ca2c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l745_c7_ca2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l745_c7_ca2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l745_c7_ca2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l745_c7_ca2c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l745_c7_ca2c]
signal n16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l746_c3_9e9a]
signal BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l749_c11_4696]
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l749_c7_48e1]
signal tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l749_c7_48e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l749_c7_48e1]
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l749_c7_48e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l749_c7_48e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l749_c7_48e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l749_c7_48e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l749_c7_48e1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l749_c7_48e1]
signal n16_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l752_c11_3cc3]
signal BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l752_c7_196e]
signal tmp16_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l752_c7_196e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l752_c7_196e]
signal result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l752_c7_196e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l752_c7_196e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l752_c7_196e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l752_c7_196e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l752_c7_196e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l752_c7_196e]
signal n16_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l757_c11_8b89]
signal BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l757_c7_c68c]
signal tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l757_c7_c68c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l757_c7_c68c]
signal result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l757_c7_c68c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l757_c7_c68c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l757_c7_c68c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l757_c7_c68c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l757_c7_c68c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l757_c7_c68c]
signal n16_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l760_c11_133a]
signal BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l760_c7_a663]
signal tmp16_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l760_c7_a663]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l760_c7_a663]
signal result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l760_c7_a663]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l760_c7_a663]
signal result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l760_c7_a663]
signal result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l760_c7_a663]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l760_c7_a663]
signal result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l760_c7_a663]
signal n16_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l761_c3_5c63]
signal BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l762_c11_76a6]
signal BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l765_c32_2df8]
signal BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l765_c32_3462]
signal BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l765_c32_acf9]
signal MUX_uxn_opcodes_h_l765_c32_acf9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l765_c32_acf9_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l765_c32_acf9_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l765_c32_acf9_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l767_c11_4d41]
signal BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l767_c7_346d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l767_c7_346d]
signal result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l767_c7_346d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l767_c7_346d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l767_c7_346d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l773_c11_586a]
signal BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l773_c7_f016]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l773_c7_f016]
signal result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l773_c7_f016]
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l773_c7_f016]
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l775_c34_9b24]
signal CONST_SR_8_uxn_opcodes_h_l775_c34_9b24_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l775_c34_9b24_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l777_c11_6b13]
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_c664]
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_c664]
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e
BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_left,
BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_right,
BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c
tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond,
tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue,
tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse,
tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output);

-- t16_MUX_uxn_opcodes_h_l728_c2_6c2c
t16_MUX_uxn_opcodes_h_l728_c2_6c2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond,
t16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue,
t16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse,
t16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c
result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_cond,
result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c
result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c
result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output);

-- n16_MUX_uxn_opcodes_h_l728_c2_6c2c
n16_MUX_uxn_opcodes_h_l728_c2_6c2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond,
n16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue,
n16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse,
n16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output);

-- printf_uxn_opcodes_h_l729_c3_ed13_uxn_opcodes_h_l729_c3_ed13
printf_uxn_opcodes_h_l729_c3_ed13_uxn_opcodes_h_l729_c3_ed13 : entity work.printf_uxn_opcodes_h_l729_c3_ed13_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l729_c3_ed13_uxn_opcodes_h_l729_c3_ed13_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69
BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_left,
BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_right,
BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output);

-- tmp16_MUX_uxn_opcodes_h_l734_c7_a974
tmp16_MUX_uxn_opcodes_h_l734_c7_a974 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l734_c7_a974_cond,
tmp16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue,
tmp16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse,
tmp16_MUX_uxn_opcodes_h_l734_c7_a974_return_output);

-- t16_MUX_uxn_opcodes_h_l734_c7_a974
t16_MUX_uxn_opcodes_h_l734_c7_a974 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l734_c7_a974_cond,
t16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue,
t16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse,
t16_MUX_uxn_opcodes_h_l734_c7_a974_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974
result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_cond,
result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974
result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974
result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_return_output);

-- n16_MUX_uxn_opcodes_h_l734_c7_a974
n16_MUX_uxn_opcodes_h_l734_c7_a974 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l734_c7_a974_cond,
n16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue,
n16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse,
n16_MUX_uxn_opcodes_h_l734_c7_a974_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3
BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_left,
BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_right,
BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l737_c7_2c02
tmp16_MUX_uxn_opcodes_h_l737_c7_2c02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_cond,
tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue,
tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse,
tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output);

-- t16_MUX_uxn_opcodes_h_l737_c7_2c02
t16_MUX_uxn_opcodes_h_l737_c7_2c02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l737_c7_2c02_cond,
t16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue,
t16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse,
t16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02
result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_cond,
result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02
result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02
result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_return_output);

-- n16_MUX_uxn_opcodes_h_l737_c7_2c02
n16_MUX_uxn_opcodes_h_l737_c7_2c02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l737_c7_2c02_cond,
n16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue,
n16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse,
n16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3
BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_left,
BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_right,
BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4
tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond,
tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue,
tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse,
tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output);

-- t16_MUX_uxn_opcodes_h_l742_c7_6aa4
t16_MUX_uxn_opcodes_h_l742_c7_6aa4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond,
t16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue,
t16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse,
t16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4
result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_cond,
result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4
result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4
result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output);

-- n16_MUX_uxn_opcodes_h_l742_c7_6aa4
n16_MUX_uxn_opcodes_h_l742_c7_6aa4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond,
n16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue,
n16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse,
n16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200
BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_left,
BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_right,
BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output);

-- tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c
tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond,
tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue,
tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse,
tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output);

-- t16_MUX_uxn_opcodes_h_l745_c7_ca2c
t16_MUX_uxn_opcodes_h_l745_c7_ca2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond,
t16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue,
t16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse,
t16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c
result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_cond,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output);

-- n16_MUX_uxn_opcodes_h_l745_c7_ca2c
n16_MUX_uxn_opcodes_h_l745_c7_ca2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond,
n16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue,
n16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse,
n16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a
BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_left,
BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_right,
BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696
BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_left,
BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_right,
BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output);

-- tmp16_MUX_uxn_opcodes_h_l749_c7_48e1
tmp16_MUX_uxn_opcodes_h_l749_c7_48e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_cond,
tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue,
tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse,
tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1
result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_cond,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_return_output);

-- n16_MUX_uxn_opcodes_h_l749_c7_48e1
n16_MUX_uxn_opcodes_h_l749_c7_48e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l749_c7_48e1_cond,
n16_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue,
n16_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse,
n16_MUX_uxn_opcodes_h_l749_c7_48e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3
BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_left,
BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_right,
BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l752_c7_196e
tmp16_MUX_uxn_opcodes_h_l752_c7_196e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l752_c7_196e_cond,
tmp16_MUX_uxn_opcodes_h_l752_c7_196e_iftrue,
tmp16_MUX_uxn_opcodes_h_l752_c7_196e_iffalse,
tmp16_MUX_uxn_opcodes_h_l752_c7_196e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e
result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e
result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_cond,
result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e
result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e
result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e
result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e
result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_return_output);

-- n16_MUX_uxn_opcodes_h_l752_c7_196e
n16_MUX_uxn_opcodes_h_l752_c7_196e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l752_c7_196e_cond,
n16_MUX_uxn_opcodes_h_l752_c7_196e_iftrue,
n16_MUX_uxn_opcodes_h_l752_c7_196e_iffalse,
n16_MUX_uxn_opcodes_h_l752_c7_196e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89
BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_left,
BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_right,
BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output);

-- tmp16_MUX_uxn_opcodes_h_l757_c7_c68c
tmp16_MUX_uxn_opcodes_h_l757_c7_c68c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_cond,
tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue,
tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse,
tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c
result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c
result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_cond,
result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c
result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c
result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c
result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c
result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_return_output);

-- n16_MUX_uxn_opcodes_h_l757_c7_c68c
n16_MUX_uxn_opcodes_h_l757_c7_c68c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l757_c7_c68c_cond,
n16_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue,
n16_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse,
n16_MUX_uxn_opcodes_h_l757_c7_c68c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a
BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_left,
BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_right,
BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l760_c7_a663
tmp16_MUX_uxn_opcodes_h_l760_c7_a663 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l760_c7_a663_cond,
tmp16_MUX_uxn_opcodes_h_l760_c7_a663_iftrue,
tmp16_MUX_uxn_opcodes_h_l760_c7_a663_iffalse,
tmp16_MUX_uxn_opcodes_h_l760_c7_a663_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663
result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663
result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_cond,
result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663
result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663
result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663
result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663
result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_return_output);

-- n16_MUX_uxn_opcodes_h_l760_c7_a663
n16_MUX_uxn_opcodes_h_l760_c7_a663 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l760_c7_a663_cond,
n16_MUX_uxn_opcodes_h_l760_c7_a663_iftrue,
n16_MUX_uxn_opcodes_h_l760_c7_a663_iffalse,
n16_MUX_uxn_opcodes_h_l760_c7_a663_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63
BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_left,
BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_right,
BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6
BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_left,
BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_right,
BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8
BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_left,
BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_right,
BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l765_c32_3462
BIN_OP_GT_uxn_opcodes_h_l765_c32_3462 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_left,
BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_right,
BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_return_output);

-- MUX_uxn_opcodes_h_l765_c32_acf9
MUX_uxn_opcodes_h_l765_c32_acf9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l765_c32_acf9_cond,
MUX_uxn_opcodes_h_l765_c32_acf9_iftrue,
MUX_uxn_opcodes_h_l765_c32_acf9_iffalse,
MUX_uxn_opcodes_h_l765_c32_acf9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41
BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_left,
BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_right,
BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d
result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_cond,
result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d
result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d
result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a
BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_left,
BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_right,
BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016
result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_cond,
result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016
result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016
result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_return_output);

-- CONST_SR_8_uxn_opcodes_h_l775_c34_9b24
CONST_SR_8_uxn_opcodes_h_l775_c34_9b24 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l775_c34_9b24_x,
CONST_SR_8_uxn_opcodes_h_l775_c34_9b24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13
BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_left,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_right,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5
CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_return_output,
 tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
 t16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
 n16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output,
 tmp16_MUX_uxn_opcodes_h_l734_c7_a974_return_output,
 t16_MUX_uxn_opcodes_h_l734_c7_a974_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_return_output,
 n16_MUX_uxn_opcodes_h_l734_c7_a974_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output,
 tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output,
 t16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_return_output,
 n16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output,
 tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output,
 t16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output,
 n16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output,
 tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output,
 t16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output,
 n16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output,
 tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_return_output,
 n16_MUX_uxn_opcodes_h_l749_c7_48e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output,
 tmp16_MUX_uxn_opcodes_h_l752_c7_196e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_return_output,
 n16_MUX_uxn_opcodes_h_l752_c7_196e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output,
 tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_return_output,
 n16_MUX_uxn_opcodes_h_l757_c7_c68c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output,
 tmp16_MUX_uxn_opcodes_h_l760_c7_a663_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_return_output,
 n16_MUX_uxn_opcodes_h_l760_c7_a663_return_output,
 BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_return_output,
 MUX_uxn_opcodes_h_l765_c32_acf9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_return_output,
 CONST_SR_8_uxn_opcodes_h_l775_c34_9b24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l731_c3_022e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l734_c7_a974_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l729_c3_ed13_uxn_opcodes_h_l729_c3_ed13_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_ddb6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l734_c7_a974_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l740_c3_133e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l737_c7_2c02_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_b3b2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_5870 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_48e1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l750_c3_8514 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l752_c7_196e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l749_c7_48e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_9aaf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l752_c7_196e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l752_c7_196e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l757_c7_c68c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l752_c7_196e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l758_c3_119d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l760_c7_a663_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l757_c7_c68c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l762_c3_82f0 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l760_c7_a663_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l760_c7_a663_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l760_c7_a663_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l765_c32_acf9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l765_c32_acf9_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l765_c32_acf9_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l765_c32_acf9_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l770_c3_0205 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l771_c24_c8e6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_76bd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_9b24_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_9b24_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c24_2bef_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l737_l767_l745_l734_l742_l752_l728_l757_DUPLICATE_ff72_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_8eac_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l728_l757_DUPLICATE_635a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_5658_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l749_l737_l767_l745_l773_l734_l760_l742_l752_l757_DUPLICATE_6459_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l757_DUPLICATE_1b52_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l746_l761_l738_l753_DUPLICATE_db95_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l773_l760_DUPLICATE_9f36_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l724_l782_DUPLICATE_217c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_5870 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l747_c3_5870;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l750_c3_8514 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l750_c3_8514;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_76bd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_76bd;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l758_c3_119d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l758_c3_119d;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_b3b2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l743_c3_b3b2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l770_c3_0205 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l770_c3_0205;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_ddb6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_ddb6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_9aaf := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_9aaf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_right := to_unsigned(11, 4);
     VAR_MUX_uxn_opcodes_h_l765_c32_acf9_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_right := to_unsigned(10, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l740_c3_133e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l740_c3_133e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l731_c3_022e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l731_c3_022e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l765_c32_acf9_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l760_c7_a663_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_9b24_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l752_c7_196e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l760_c7_a663_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l775_c34_9b24] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l775_c34_9b24_x <= VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_9b24_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_9b24_return_output := CONST_SR_8_uxn_opcodes_h_l775_c34_9b24_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l737_l767_l745_l734_l742_l752_l728_l757_DUPLICATE_ff72 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l737_l767_l745_l734_l742_l752_l728_l757_DUPLICATE_ff72_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l773_l760_DUPLICATE_9f36 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l773_l760_DUPLICATE_9f36_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l728_c6_325e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_left;
     BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output := BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l765_c32_2df8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_left;
     BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_return_output := BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l734_c11_ca69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_left;
     BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output := BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l728_l757_DUPLICATE_635a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l728_l757_DUPLICATE_635a_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l746_l761_l738_l753_DUPLICATE_db95 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l746_l761_l738_l753_DUPLICATE_db95_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l742_c11_5af3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_left;
     BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output := BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l767_c11_4d41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_left;
     BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_return_output := BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_5658 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_5658_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l760_c11_133a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_left;
     BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output := BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l749_c11_4696] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_left;
     BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output := BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l757_c11_8b89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_left;
     BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output := BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l773_c11_586a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_left;
     BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_return_output := BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l745_c11_3200] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_left;
     BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output := BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l771_c24_c8e6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l771_c24_c8e6_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l777_c11_6b13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_left;
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_return_output := BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_8eac LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_8eac_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l757_DUPLICATE_1b52 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l757_DUPLICATE_1b52_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l752_c11_3cc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l737_c11_48b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l749_l737_l767_l745_l773_l734_l760_l742_l752_l757_DUPLICATE_6459 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l749_l737_l767_l745_l773_l734_l760_l742_l752_l757_DUPLICATE_6459_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_left := VAR_BIN_OP_AND_uxn_opcodes_h_l765_c32_2df8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c6_325e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l734_c7_a974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_a974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l734_c7_a974_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_ca69_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l737_c7_2c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_2c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_48b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c11_5af3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l745_c11_3200_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_48e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c11_4696_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l752_c7_196e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l752_c7_196e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c11_3cc3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l757_c7_c68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l757_c11_8b89_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l760_c7_a663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l760_c7_a663_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l760_c11_133a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l767_c11_4d41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_586a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_6b13_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l746_l761_l738_l753_DUPLICATE_db95_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l746_l761_l738_l753_DUPLICATE_db95_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l746_l761_l738_l753_DUPLICATE_db95_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l771_c24_c8e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l728_l757_DUPLICATE_635a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l728_l757_DUPLICATE_635a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l728_l757_DUPLICATE_635a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l728_l757_DUPLICATE_635a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l728_l757_DUPLICATE_635a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l728_l757_DUPLICATE_635a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l728_l757_DUPLICATE_635a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l728_l757_DUPLICATE_635a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l728_l757_DUPLICATE_635a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l749_l737_l767_l745_l773_l734_l760_l742_l752_l757_DUPLICATE_6459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l749_l737_l767_l745_l773_l734_l760_l742_l752_l757_DUPLICATE_6459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l749_l737_l767_l745_l773_l734_l760_l742_l752_l757_DUPLICATE_6459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l749_l737_l767_l745_l773_l734_l760_l742_l752_l757_DUPLICATE_6459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l749_l737_l767_l745_l773_l734_l760_l742_l752_l757_DUPLICATE_6459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l749_l737_l767_l745_l773_l734_l760_l742_l752_l757_DUPLICATE_6459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l749_l737_l767_l745_l773_l734_l760_l742_l752_l757_DUPLICATE_6459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l749_l737_l767_l745_l773_l734_l760_l742_l752_l757_DUPLICATE_6459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l749_l737_l767_l745_l773_l734_l760_l742_l752_l757_DUPLICATE_6459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l749_l737_l767_l745_l773_l734_l760_l742_l752_l757_DUPLICATE_6459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l777_l749_l737_l767_l745_l773_l734_l760_l742_l752_l757_DUPLICATE_6459_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l737_l767_l745_l734_l742_l752_l728_l757_DUPLICATE_ff72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l737_l767_l745_l734_l742_l752_l728_l757_DUPLICATE_ff72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l737_l767_l745_l734_l742_l752_l728_l757_DUPLICATE_ff72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l737_l767_l745_l734_l742_l752_l728_l757_DUPLICATE_ff72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l737_l767_l745_l734_l742_l752_l728_l757_DUPLICATE_ff72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l737_l767_l745_l734_l742_l752_l728_l757_DUPLICATE_ff72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l737_l767_l745_l734_l742_l752_l728_l757_DUPLICATE_ff72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l737_l767_l745_l734_l742_l752_l728_l757_DUPLICATE_ff72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l749_l737_l767_l745_l734_l742_l752_l728_l757_DUPLICATE_ff72_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l757_DUPLICATE_1b52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l757_DUPLICATE_1b52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l757_DUPLICATE_1b52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l757_DUPLICATE_1b52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l757_DUPLICATE_1b52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l757_DUPLICATE_1b52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l757_DUPLICATE_1b52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l749_l737_l745_l734_l760_l742_l752_l757_DUPLICATE_1b52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_5658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_5658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_5658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_5658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_5658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_5658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_5658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_5658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_5658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_5658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l777_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_5658_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l773_l760_DUPLICATE_9f36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l773_l760_DUPLICATE_9f36_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_8eac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_8eac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_8eac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_8eac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_8eac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_8eac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_8eac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_8eac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_8eac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l749_l737_l745_l773_l734_l760_l742_l752_l728_l757_DUPLICATE_8eac_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l765_c32_3462] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_left;
     BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_return_output := BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l761_c3_5c63] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_left;
     BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_return_output := BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l773_c7_f016] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l760_c7_a663] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l775_c24_2bef] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c24_2bef_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l775_c34_9b24_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_c664] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l746_c3_9e9a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_left;
     BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_return_output := BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l767_c7_346d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_c664] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l728_c1_c80b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l765_c32_acf9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l765_c32_3462_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l746_c3_9e9a_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_right := VAR_BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l760_c7_a663_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l761_c3_5c63_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c24_2bef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l752_c7_196e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l739_l754_DUPLICATE_dfa5_return_output;
     VAR_printf_uxn_opcodes_h_l729_c3_ed13_uxn_opcodes_h_l729_c3_ed13_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l728_c1_c80b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_c664_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l767_c7_346d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l760_c7_a663_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_c664_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f016_return_output;
     -- t16_MUX[uxn_opcodes_h_l745_c7_ca2c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond <= VAR_t16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond;
     t16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue;
     t16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output := t16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l773_c7_f016] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_cond;
     result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_return_output := result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l757_c7_c68c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l767_c7_346d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l762_c11_76a6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_return_output;

     -- printf_uxn_opcodes_h_l729_c3_ed13[uxn_opcodes_h_l729_c3_ed13] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l729_c3_ed13_uxn_opcodes_h_l729_c3_ed13_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l729_c3_ed13_uxn_opcodes_h_l729_c3_ed13_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l773_c7_f016] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_return_output;

     -- MUX[uxn_opcodes_h_l765_c32_acf9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l765_c32_acf9_cond <= VAR_MUX_uxn_opcodes_h_l765_c32_acf9_cond;
     MUX_uxn_opcodes_h_l765_c32_acf9_iftrue <= VAR_MUX_uxn_opcodes_h_l765_c32_acf9_iftrue;
     MUX_uxn_opcodes_h_l765_c32_acf9_iffalse <= VAR_MUX_uxn_opcodes_h_l765_c32_acf9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l765_c32_acf9_return_output := MUX_uxn_opcodes_h_l765_c32_acf9_return_output;

     -- n16_MUX[uxn_opcodes_h_l760_c7_a663] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l760_c7_a663_cond <= VAR_n16_MUX_uxn_opcodes_h_l760_c7_a663_cond;
     n16_MUX_uxn_opcodes_h_l760_c7_a663_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l760_c7_a663_iftrue;
     n16_MUX_uxn_opcodes_h_l760_c7_a663_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l760_c7_a663_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l760_c7_a663_return_output := n16_MUX_uxn_opcodes_h_l760_c7_a663_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l760_c7_a663] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l773_c7_f016] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l762_c3_82f0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l762_c11_76a6_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_iftrue := VAR_MUX_uxn_opcodes_h_l765_c32_acf9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l760_c7_a663_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f016_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l760_c7_a663_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f016_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l767_c7_346d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l773_c7_f016_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l760_c7_a663_iftrue := VAR_tmp16_uxn_opcodes_h_l762_c3_82f0;
     -- tmp16_MUX[uxn_opcodes_h_l760_c7_a663] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l760_c7_a663_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l760_c7_a663_cond;
     tmp16_MUX_uxn_opcodes_h_l760_c7_a663_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l760_c7_a663_iftrue;
     tmp16_MUX_uxn_opcodes_h_l760_c7_a663_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l760_c7_a663_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l760_c7_a663_return_output := tmp16_MUX_uxn_opcodes_h_l760_c7_a663_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l752_c7_196e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_return_output;

     -- n16_MUX[uxn_opcodes_h_l757_c7_c68c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l757_c7_c68c_cond <= VAR_n16_MUX_uxn_opcodes_h_l757_c7_c68c_cond;
     n16_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue;
     n16_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l757_c7_c68c_return_output := n16_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l767_c7_346d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l767_c7_346d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_return_output := result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l757_c7_c68c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l760_c7_a663] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l760_c7_a663] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_return_output;

     -- t16_MUX[uxn_opcodes_h_l742_c7_6aa4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond <= VAR_t16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond;
     t16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue;
     t16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output := t16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l767_c7_346d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l752_c7_196e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l767_c7_346d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l752_c7_196e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l767_c7_346d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l760_c7_a663_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l760_c7_a663_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l767_c7_346d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse := VAR_t16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l760_c7_a663_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l749_c7_48e1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;

     -- t16_MUX[uxn_opcodes_h_l737_c7_2c02] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l737_c7_2c02_cond <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_2c02_cond;
     t16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue;
     t16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output := t16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;

     -- n16_MUX[uxn_opcodes_h_l752_c7_196e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l752_c7_196e_cond <= VAR_n16_MUX_uxn_opcodes_h_l752_c7_196e_cond;
     n16_MUX_uxn_opcodes_h_l752_c7_196e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l752_c7_196e_iftrue;
     n16_MUX_uxn_opcodes_h_l752_c7_196e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l752_c7_196e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l752_c7_196e_return_output := n16_MUX_uxn_opcodes_h_l752_c7_196e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l760_c7_a663] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l760_c7_a663] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l757_c7_c68c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l760_c7_a663] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_cond;
     result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_return_output := result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l757_c7_c68c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_cond;
     tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_return_output := tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l752_c7_196e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l757_c7_c68c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l752_c7_196e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l760_c7_a663_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l752_c7_196e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l760_c7_a663_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l760_c7_a663_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse := VAR_t16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l752_c7_196e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;
     -- t16_MUX[uxn_opcodes_h_l734_c7_a974] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l734_c7_a974_cond <= VAR_t16_MUX_uxn_opcodes_h_l734_c7_a974_cond;
     t16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue;
     t16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_a974_return_output := t16_MUX_uxn_opcodes_h_l734_c7_a974_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l757_c7_c68c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_return_output := result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l757_c7_c68c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l757_c7_c68c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l752_c7_196e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l752_c7_196e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l749_c7_48e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;

     -- n16_MUX[uxn_opcodes_h_l749_c7_48e1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l749_c7_48e1_cond <= VAR_n16_MUX_uxn_opcodes_h_l749_c7_48e1_cond;
     n16_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue;
     n16_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l749_c7_48e1_return_output := n16_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l745_c7_ca2c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l752_c7_196e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l752_c7_196e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l752_c7_196e_cond;
     tmp16_MUX_uxn_opcodes_h_l752_c7_196e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l752_c7_196e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l752_c7_196e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l752_c7_196e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l752_c7_196e_return_output := tmp16_MUX_uxn_opcodes_h_l752_c7_196e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l752_c7_196e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l752_c7_196e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l757_c7_c68c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l734_c7_a974_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l752_c7_196e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l752_c7_196e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_return_output;

     -- t16_MUX[uxn_opcodes_h_l728_c2_6c2c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond <= VAR_t16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond;
     t16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue;
     t16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output := t16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l742_c7_6aa4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l749_c7_48e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l749_c7_48e1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_cond;
     tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_return_output := tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l749_c7_48e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l745_c7_ca2c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l752_c7_196e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l752_c7_196e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_return_output := result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_return_output;

     -- n16_MUX[uxn_opcodes_h_l745_c7_ca2c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond <= VAR_n16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond;
     n16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue;
     n16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output := n16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l752_c7_196e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l752_c7_196e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l752_c7_196e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l742_c7_6aa4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l737_c7_2c02] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l749_c7_48e1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_return_output := result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l745_c7_ca2c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l745_c7_ca2c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_cond;
     tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output := tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;

     -- n16_MUX[uxn_opcodes_h_l742_c7_6aa4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond <= VAR_n16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond;
     n16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue;
     n16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output := n16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l749_c7_48e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l749_c7_48e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l745_c7_ca2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse := VAR_n16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l749_c7_48e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l737_c7_2c02] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l742_c7_6aa4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_cond;
     tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output := tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l742_c7_6aa4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l745_c7_ca2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l742_c7_6aa4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l734_c7_a974] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l745_c7_ca2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;

     -- n16_MUX[uxn_opcodes_h_l737_c7_2c02] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l737_c7_2c02_cond <= VAR_n16_MUX_uxn_opcodes_h_l737_c7_2c02_cond;
     n16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue;
     n16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output := n16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l745_c7_ca2c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output := result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse := VAR_n16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l734_c7_a974_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l745_c7_ca2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l734_c7_a974] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l737_c7_2c02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l742_c7_6aa4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l737_c7_2c02] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_cond;
     tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue;
     tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output := tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l742_c7_6aa4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output := result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l728_c2_6c2c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l737_c7_2c02] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;

     -- n16_MUX[uxn_opcodes_h_l734_c7_a974] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l734_c7_a974_cond <= VAR_n16_MUX_uxn_opcodes_h_l734_c7_a974_cond;
     n16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue;
     n16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l734_c7_a974_return_output := n16_MUX_uxn_opcodes_h_l734_c7_a974_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l742_c7_6aa4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l734_c7_a974_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_a974_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l742_c7_6aa4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l737_c7_2c02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l737_c7_2c02] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_cond;
     result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_return_output := result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l728_c2_6c2c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l734_c7_a974] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_return_output;

     -- n16_MUX[uxn_opcodes_h_l728_c2_6c2c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond <= VAR_n16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond;
     n16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue;
     n16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output := n16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l734_c7_a974] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l737_c7_2c02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l734_c7_a974] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l734_c7_a974_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l734_c7_a974_cond;
     tmp16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l734_c7_a974_iftrue;
     tmp16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l734_c7_a974_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l734_c7_a974_return_output := tmp16_MUX_uxn_opcodes_h_l734_c7_a974_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_a974_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_a974_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c7_2c02_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l734_c7_a974_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l734_c7_a974] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l734_c7_a974] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l728_c2_6c2c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l734_c7_a974] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_cond;
     result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_return_output := result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l728_c2_6c2c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_cond;
     tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output := tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l728_c2_6c2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_a974_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l734_c7_a974_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l734_c7_a974_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l728_c2_6c2c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output := result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l728_c2_6c2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l728_c2_6c2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l724_l782_DUPLICATE_217c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l724_l782_DUPLICATE_217c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l728_c2_6c2c_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l724_l782_DUPLICATE_217c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l724_l782_DUPLICATE_217c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
