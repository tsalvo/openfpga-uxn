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
entity and2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_201aeef3;
architecture arch of and2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1034_c6_f485]
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_3edc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1034_c2_d74b]
signal n16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1034_c2_d74b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1034_c2_d74b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1034_c2_d74b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1034_c2_d74b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1034_c2_d74b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1034_c2_d74b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1034_c2_d74b]
signal result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1034_c2_d74b]
signal t16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1034_c2_d74b]
signal tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1035_c3_5238[uxn_opcodes_h_l1035_c3_5238]
signal printf_uxn_opcodes_h_l1035_c3_5238_uxn_opcodes_h_l1035_c3_5238_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_2539]
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1040_c7_e284]
signal n16_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1040_c7_e284]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1040_c7_e284]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1040_c7_e284]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1040_c7_e284]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1040_c7_e284]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1040_c7_e284]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1040_c7_e284]
signal result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1040_c7_e284]
signal t16_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1040_c7_e284]
signal tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_6b14]
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1043_c7_d457]
signal n16_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1043_c7_d457]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1043_c7_d457]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1043_c7_d457]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1043_c7_d457]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1043_c7_d457]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1043_c7_d457]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1043_c7_d457]
signal result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1043_c7_d457]
signal t16_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1043_c7_d457]
signal tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_1a69]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1048_c7_a7bb]
signal n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1048_c7_a7bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1048_c7_a7bb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1048_c7_a7bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1048_c7_a7bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1048_c7_a7bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1048_c7_a7bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1048_c7_a7bb]
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1048_c7_a7bb]
signal t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1048_c7_a7bb]
signal tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_4922]
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1051_c7_54b8]
signal n16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1051_c7_54b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1051_c7_54b8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1051_c7_54b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1051_c7_54b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1051_c7_54b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1051_c7_54b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1051_c7_54b8]
signal result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1051_c7_54b8]
signal t16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1051_c7_54b8]
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1052_c3_f408]
signal BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_3803]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1055_c7_fcda]
signal n16_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1055_c7_fcda]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1055_c7_fcda]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_fcda]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_fcda]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_fcda]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_fcda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1055_c7_fcda]
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1055_c7_fcda]
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_d97e]
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1058_c7_aa39]
signal n16_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1058_c7_aa39]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1058_c7_aa39]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1058_c7_aa39]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1058_c7_aa39]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1058_c7_aa39]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1058_c7_aa39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1058_c7_aa39]
signal result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1058_c7_aa39]
signal tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_ec30]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1063_c7_8d6c]
signal n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1063_c7_8d6c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1063_c7_8d6c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_8d6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1063_c7_8d6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_8d6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_8d6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1063_c7_8d6c]
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1063_c7_8d6c]
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_b040]
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1066_c7_a47e]
signal n16_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1066_c7_a47e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1066_c7_a47e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1066_c7_a47e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1066_c7_a47e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1066_c7_a47e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1066_c7_a47e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1066_c7_a47e]
signal result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1066_c7_a47e]
signal tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1067_c3_52db]
signal BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1068_c11_5b59]
signal BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1071_c32_3ff8]
signal BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1071_c32_6166]
signal BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1071_c32_5a8e]
signal MUX_uxn_opcodes_h_l1071_c32_5a8e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1071_c32_5a8e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1071_c32_5a8e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1071_c32_5a8e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1073_c11_12da]
signal BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1073_c7_ab2f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1073_c7_ab2f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1073_c7_ab2f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1073_c7_ab2f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1073_c7_ab2f]
signal result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1079_c11_f13b]
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1079_c7_4d4d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c7_4d4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c7_4d4d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1079_c7_4d4d]
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1081_c34_9bfc]
signal CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1083_c11_d9c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1083_c7_f742]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1083_c7_f742]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485
BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_left,
BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_right,
BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_return_output);

-- n16_MUX_uxn_opcodes_h_l1034_c2_d74b
n16_MUX_uxn_opcodes_h_l1034_c2_d74b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond,
n16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue,
n16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse,
n16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b
result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b
result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b
result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b
result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b
result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output);

-- t16_MUX_uxn_opcodes_h_l1034_c2_d74b
t16_MUX_uxn_opcodes_h_l1034_c2_d74b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond,
t16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue,
t16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse,
t16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b
tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond,
tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output);

-- printf_uxn_opcodes_h_l1035_c3_5238_uxn_opcodes_h_l1035_c3_5238
printf_uxn_opcodes_h_l1035_c3_5238_uxn_opcodes_h_l1035_c3_5238 : entity work.printf_uxn_opcodes_h_l1035_c3_5238_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1035_c3_5238_uxn_opcodes_h_l1035_c3_5238_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_left,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_right,
BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output);

-- n16_MUX_uxn_opcodes_h_l1040_c7_e284
n16_MUX_uxn_opcodes_h_l1040_c7_e284 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1040_c7_e284_cond,
n16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue,
n16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse,
n16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284
result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284
result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284
result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_cond,
result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_return_output);

-- t16_MUX_uxn_opcodes_h_l1040_c7_e284
t16_MUX_uxn_opcodes_h_l1040_c7_e284 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1040_c7_e284_cond,
t16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue,
t16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse,
t16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1040_c7_e284
tmp16_MUX_uxn_opcodes_h_l1040_c7_e284 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_cond,
tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue,
tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse,
tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_left,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_right,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output);

-- n16_MUX_uxn_opcodes_h_l1043_c7_d457
n16_MUX_uxn_opcodes_h_l1043_c7_d457 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1043_c7_d457_cond,
n16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue,
n16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse,
n16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457
result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457
result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457
result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_cond,
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_return_output);

-- t16_MUX_uxn_opcodes_h_l1043_c7_d457
t16_MUX_uxn_opcodes_h_l1043_c7_d457 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1043_c7_d457_cond,
t16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue,
t16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse,
t16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1043_c7_d457
tmp16_MUX_uxn_opcodes_h_l1043_c7_d457 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_cond,
tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue,
tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse,
tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output);

-- n16_MUX_uxn_opcodes_h_l1048_c7_a7bb
n16_MUX_uxn_opcodes_h_l1048_c7_a7bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond,
n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue,
n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse,
n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output);

-- t16_MUX_uxn_opcodes_h_l1048_c7_a7bb
t16_MUX_uxn_opcodes_h_l1048_c7_a7bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond,
t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue,
t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse,
t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb
tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond,
tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_left,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_right,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output);

-- n16_MUX_uxn_opcodes_h_l1051_c7_54b8
n16_MUX_uxn_opcodes_h_l1051_c7_54b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond,
n16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue,
n16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse,
n16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8
result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8
result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8
result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output);

-- t16_MUX_uxn_opcodes_h_l1051_c7_54b8
t16_MUX_uxn_opcodes_h_l1051_c7_54b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond,
t16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue,
t16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse,
t16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8
tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond,
tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408
BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_left,
BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_right,
BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output);

-- n16_MUX_uxn_opcodes_h_l1055_c7_fcda
n16_MUX_uxn_opcodes_h_l1055_c7_fcda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1055_c7_fcda_cond,
n16_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue,
n16_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse,
n16_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_cond,
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda
tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_cond,
tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue,
tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse,
tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_left,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_right,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output);

-- n16_MUX_uxn_opcodes_h_l1058_c7_aa39
n16_MUX_uxn_opcodes_h_l1058_c7_aa39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1058_c7_aa39_cond,
n16_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue,
n16_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse,
n16_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39
result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39
result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39
result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_cond,
result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39
tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_cond,
tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue,
tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse,
tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output);

-- n16_MUX_uxn_opcodes_h_l1063_c7_8d6c
n16_MUX_uxn_opcodes_h_l1063_c7_8d6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond,
n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue,
n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse,
n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c
tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond,
tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_left,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_right,
BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output);

-- n16_MUX_uxn_opcodes_h_l1066_c7_a47e
n16_MUX_uxn_opcodes_h_l1066_c7_a47e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1066_c7_a47e_cond,
n16_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue,
n16_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse,
n16_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e
result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e
result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e
result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e
result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e
result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e
tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_cond,
tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db
BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_left,
BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_right,
BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59
BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_left,
BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_right,
BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8
BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_left,
BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_right,
BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166
BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_left,
BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_right,
BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_return_output);

-- MUX_uxn_opcodes_h_l1071_c32_5a8e
MUX_uxn_opcodes_h_l1071_c32_5a8e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1071_c32_5a8e_cond,
MUX_uxn_opcodes_h_l1071_c32_5a8e_iftrue,
MUX_uxn_opcodes_h_l1071_c32_5a8e_iffalse,
MUX_uxn_opcodes_h_l1071_c32_5a8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_left,
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_right,
BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f
result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f
result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_left,
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_right,
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc
CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc_x,
CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4
BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742
result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742
result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c
CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_return_output,
 n16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
 t16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output,
 n16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_return_output,
 t16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output,
 tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output,
 n16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_return_output,
 t16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output,
 tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output,
 n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output,
 t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output,
 n16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output,
 t16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output,
 n16_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output,
 tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output,
 n16_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output,
 tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output,
 n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output,
 n16_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_return_output,
 MUX_uxn_opcodes_h_l1071_c32_5a8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output,
 CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1037_c3_31a1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1035_c3_5238_uxn_opcodes_h_l1035_c3_5238_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1041_c3_1c54 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1046_c3_64f5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_08dc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_bfd0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1056_c3_5fd2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_5af7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_25ee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1071_c32_5a8e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1071_c32_5a8e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1071_c32_5a8e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1071_c32_5a8e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1076_c3_7aae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1077_c24_5aeb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1080_c3_b606 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1081_c24_1fb0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1063_l1034_l1073_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_cee4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_ff6d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1063_l1083_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7248_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_4714_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1063_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_8cc2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1083_l1066_l1073_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7211_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1067_l1052_l1044_l1059_DUPLICATE_504f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1066_l1079_DUPLICATE_acf1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1030_l1088_DUPLICATE_7f04_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1071_c32_5a8e_iffalse := resize(to_signed(-2, 3), 8);
     VAR_MUX_uxn_opcodes_h_l1071_c32_5a8e_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1076_c3_7aae := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1076_c3_7aae;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1080_c3_b606 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1080_c3_b606;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_25ee := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_25ee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1046_c3_64f5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1046_c3_64f5;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1041_c3_1c54 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1041_c3_1c54;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_bfd0 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1053_c3_bfd0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_08dc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_08dc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1056_c3_5fd2 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1056_c3_5fd2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1037_c3_31a1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1037_c3_31a1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_5af7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_5af7;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1081_c34_9bfc] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc_return_output := CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1083_c11_d9c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1077_c24_5aeb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1077_c24_5aeb_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1083_l1066_l1073_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7211 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1083_l1066_l1073_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7211_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_4922] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_left;
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output := BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1079_c11_f13b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1066_c11_b040] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_left;
     BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output := BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1034_c6_f485] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_left;
     BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output := BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1066_l1079_DUPLICATE_acf1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1066_l1079_DUPLICATE_acf1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_6b14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_left;
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output := BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1071_c32_3ff8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_left;
     BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_return_output := BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_4714 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_4714_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1063_l1083_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7248 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1063_l1083_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7248_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_d97e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1063_l1034_l1073_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_cee4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1063_l1034_l1073_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_cee4_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1040_c11_2539] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_left;
     BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output := BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_ec30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1067_l1052_l1044_l1059_DUPLICATE_504f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1067_l1052_l1044_l1059_DUPLICATE_504f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1073_c11_12da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_ff6d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_ff6d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1063_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_8cc2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1063_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_8cc2_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_3803] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_1a69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1071_c32_3ff8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1034_c6_f485_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1040_c7_e284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1040_c7_e284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1040_c11_2539_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1043_c7_d457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1043_c7_d457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_6b14_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_1a69_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_4922_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_fcda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_3803_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1058_c7_aa39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_d97e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_ec30_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1066_c7_a47e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1066_c11_b040_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1073_c11_12da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_f13b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1083_c11_d9c4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1067_l1052_l1044_l1059_DUPLICATE_504f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1067_l1052_l1044_l1059_DUPLICATE_504f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1067_l1052_l1044_l1059_DUPLICATE_504f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1077_c24_5aeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_ff6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_ff6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_ff6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_ff6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_ff6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_ff6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_ff6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_ff6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_ff6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1083_l1066_l1073_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1083_l1066_l1073_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1083_l1066_l1073_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1083_l1066_l1073_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1083_l1066_l1073_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1083_l1066_l1073_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1083_l1066_l1073_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1083_l1066_l1073_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1083_l1066_l1073_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1083_l1066_l1073_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1083_l1066_l1073_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7211_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1063_l1034_l1073_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_cee4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1063_l1034_l1073_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_cee4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1063_l1034_l1073_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_cee4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1063_l1034_l1073_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_cee4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1063_l1034_l1073_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_cee4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1063_l1034_l1073_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_cee4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1063_l1034_l1073_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_cee4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1063_l1034_l1073_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_cee4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1063_l1034_l1073_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_cee4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1063_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_8cc2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1063_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_8cc2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1063_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_8cc2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1063_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_8cc2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1063_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_8cc2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1063_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_8cc2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1063_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_8cc2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1063_l1066_l1040_l1051_l1043_l1058_l1048_l1055_DUPLICATE_8cc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1063_l1083_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1063_l1083_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1063_l1083_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1063_l1083_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1063_l1083_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1063_l1083_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1063_l1083_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1063_l1083_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1063_l1083_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1063_l1083_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7248_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1063_l1083_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_7248_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1066_l1079_DUPLICATE_acf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1066_l1079_DUPLICATE_acf1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_4714_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_4714_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_4714_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_4714_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_4714_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_4714_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_4714_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_4714_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_4714_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1063_l1034_l1066_l1040_l1051_l1043_l1058_l1048_l1055_l1079_DUPLICATE_4714_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1052_c3_f408] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_left;
     BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_return_output := BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1071_c32_6166] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_left;
     BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_return_output := BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1083_c7_f742] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1066_c7_a47e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1034_c1_3edc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1081_c24_1fb0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1081_c24_1fb0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1081_c34_9bfc_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1067_c3_52db] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_left;
     BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_return_output := BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1083_c7_f742] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1073_c7_ab2f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c7_4d4d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1071_c32_5a8e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1071_c32_6166_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1052_c3_f408_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1067_c3_52db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1081_c24_1fb0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1045_DUPLICATE_da4c_return_output;
     VAR_printf_uxn_opcodes_h_l1035_c3_5238_uxn_opcodes_h_l1035_c3_5238_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1034_c1_3edc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1083_c7_f742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1083_c7_f742_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1073_c7_ab2f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c7_4d4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1051_c7_54b8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond;
     t16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue;
     t16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output := t16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1079_c7_4d4d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1066_c7_a47e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1066_c7_a47e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1066_c7_a47e_cond;
     n16_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue;
     n16_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output := n16_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1079_c7_4d4d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1068_c11_5b59] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_left;
     BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_return_output := BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_return_output;

     -- MUX[uxn_opcodes_h_l1071_c32_5a8e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1071_c32_5a8e_cond <= VAR_MUX_uxn_opcodes_h_l1071_c32_5a8e_cond;
     MUX_uxn_opcodes_h_l1071_c32_5a8e_iftrue <= VAR_MUX_uxn_opcodes_h_l1071_c32_5a8e_iftrue;
     MUX_uxn_opcodes_h_l1071_c32_5a8e_iffalse <= VAR_MUX_uxn_opcodes_h_l1071_c32_5a8e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1071_c32_5a8e_return_output := MUX_uxn_opcodes_h_l1071_c32_5a8e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1066_c7_a47e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;

     -- printf_uxn_opcodes_h_l1035_c3_5238[uxn_opcodes_h_l1035_c3_5238] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1035_c3_5238_uxn_opcodes_h_l1035_c3_5238_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1035_c3_5238_uxn_opcodes_h_l1035_c3_5238_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1063_c7_8d6c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l1068_c11_5b59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue := VAR_MUX_uxn_opcodes_h_l1071_c32_5a8e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4d4d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1066_c7_a47e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1058_c7_aa39] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1073_c7_ab2f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1048_c7_a7bb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond;
     t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue;
     t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output := t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1073_c7_ab2f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1063_c7_8d6c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1066_c7_a47e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_cond;
     tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output := tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1073_c7_ab2f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1063_c7_8d6c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond;
     n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue;
     n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output := n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1066_c7_a47e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1073_c7_ab2f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1066_c7_a47e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1058_c7_aa39] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1066_c7_a47e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1058_c7_aa39] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1058_c7_aa39_cond <= VAR_n16_MUX_uxn_opcodes_h_l1058_c7_aa39_cond;
     n16_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue;
     n16_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output := n16_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_8d6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1043_c7_d457] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1043_c7_d457_cond <= VAR_t16_MUX_uxn_opcodes_h_l1043_c7_d457_cond;
     t16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue;
     t16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output := t16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1063_c7_8d6c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond;
     tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output := tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1066_c7_a47e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1055_c7_fcda] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_8d6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1066_c7_a47e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1058_c7_aa39] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1058_c7_aa39] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_cond;
     tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output := tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_8d6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1040_c7_e284] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1040_c7_e284_cond <= VAR_t16_MUX_uxn_opcodes_h_l1040_c7_e284_cond;
     t16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue;
     t16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output := t16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1058_c7_aa39] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1051_c7_54b8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1055_c7_fcda] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1063_c7_8d6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1055_c7_fcda] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1055_c7_fcda_cond <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_fcda_cond;
     n16_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue;
     n16_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output := n16_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1063_c7_8d6c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_8d6c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1058_c7_aa39] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1055_c7_fcda] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_cond;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output := tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;

     -- t16_MUX[uxn_opcodes_h_l1034_c2_d74b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond;
     t16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue;
     t16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output := t16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1058_c7_aa39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_fcda] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1048_c7_a7bb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1051_c7_54b8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond;
     n16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue;
     n16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output := n16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1051_c7_54b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1058_c7_aa39] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output := result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_fcda] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1058_c7_aa39_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1048_c7_a7bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_fcda] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1055_c7_fcda] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output := result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_fcda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1043_c7_d457] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;

     -- n16_MUX[uxn_opcodes_h_l1048_c7_a7bb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond;
     n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue;
     n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output := n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1051_c7_54b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1051_c7_54b8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_cond;
     tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output := tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1051_c7_54b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c7_fcda_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1051_c7_54b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1040_c7_e284] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1051_c7_54b8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1048_c7_a7bb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond;
     tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output := tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1051_c7_54b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1043_c7_d457] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1048_c7_a7bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1043_c7_d457] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1043_c7_d457_cond <= VAR_n16_MUX_uxn_opcodes_h_l1043_c7_d457_cond;
     n16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue;
     n16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output := n16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1048_c7_a7bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1051_c7_54b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1043_c7_d457] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_cond;
     tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output := tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1043_c7_d457] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1034_c2_d74b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1048_c7_a7bb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1040_c7_e284] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1048_c7_a7bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1040_c7_e284] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1040_c7_e284_cond <= VAR_n16_MUX_uxn_opcodes_h_l1040_c7_e284_cond;
     n16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue;
     n16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output := n16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1048_c7_a7bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1043_c7_d457] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_a7bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1034_c2_d74b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1043_c7_d457] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1043_c7_d457] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_return_output := result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1040_c7_e284] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1040_c7_e284] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1040_c7_e284] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_cond;
     tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output := tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;

     -- n16_MUX[uxn_opcodes_h_l1034_c2_d74b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond;
     n16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue;
     n16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output := n16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1043_c7_d457] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_d457_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1040_c7_e284] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1034_c2_d74b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1040_c7_e284] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_return_output := result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1034_c2_d74b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_cond;
     tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output := tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1040_c7_e284] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1034_c2_d74b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1040_c7_e284_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1034_c2_d74b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1034_c2_d74b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1034_c2_d74b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1030_l1088_DUPLICATE_7f04 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1030_l1088_DUPLICATE_7f04_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1034_c2_d74b_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1030_l1088_DUPLICATE_7f04_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1030_l1088_DUPLICATE_7f04_return_output;
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
