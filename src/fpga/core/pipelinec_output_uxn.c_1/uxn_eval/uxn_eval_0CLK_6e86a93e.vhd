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
-- Submodules: 55
entity uxn_eval_0CLK_6e86a93e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 return_output : out unsigned(7 downto 0));
end uxn_eval_0CLK_6e86a93e;
architecture arch of uxn_eval_0CLK_6e86a93e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal led_error : unsigned(7 downto 0) := to_unsigned(16, 8);
signal led_blink : unsigned(7 downto 0) := to_unsigned(8, 8);
signal led_r : unsigned(7 downto 0) := to_unsigned(4, 8);
signal led_g : unsigned(7 downto 0) := to_unsigned(2, 8);
signal led_b : unsigned(7 downto 0) := to_unsigned(1, 8);
signal result : unsigned(7 downto 0) := to_unsigned(0, 8);
signal counter : unsigned(31 downto 0) := to_unsigned(0, 32);
signal s : unsigned(0 downto 0) := to_unsigned(0, 1);
signal pc_nonzero : unsigned(0 downto 0) := to_unsigned(0, 1);
signal system_state_zero : unsigned(0 downto 0) := to_unsigned(0, 1);
signal should_eval : unsigned(0 downto 0) := to_unsigned(0, 1);
signal error : unsigned(0 downto 0) := to_unsigned(0, 1);
signal k : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ins : unsigned(7 downto 0) := to_unsigned(0, 8);
signal system_state : unsigned(7 downto 0) := to_unsigned(0, 8);
signal pc : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_led_error : unsigned(7 downto 0);
signal REG_COMB_led_blink : unsigned(7 downto 0);
signal REG_COMB_led_r : unsigned(7 downto 0);
signal REG_COMB_led_g : unsigned(7 downto 0);
signal REG_COMB_led_b : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(7 downto 0);
signal REG_COMB_counter : unsigned(31 downto 0);
signal REG_COMB_s : unsigned(0 downto 0);
signal REG_COMB_pc_nonzero : unsigned(0 downto 0);
signal REG_COMB_system_state_zero : unsigned(0 downto 0);
signal REG_COMB_should_eval : unsigned(0 downto 0);
signal REG_COMB_error : unsigned(0 downto 0);
signal REG_COMB_k : unsigned(7 downto 0);
signal REG_COMB_opc : unsigned(7 downto 0);
signal REG_COMB_ins : unsigned(7 downto 0);
signal REG_COMB_system_state : unsigned(7 downto 0);
signal REG_COMB_pc : unsigned(15 downto 0);

-- Each function instance gets signals
-- pc_get[uxn_c_l30_c7_7701]
signal pc_get_uxn_c_l30_c7_7701_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_c_l30_c7_7701_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l31_c15_f990]
signal BIN_OP_EQ_uxn_c_l31_c15_f990_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c15_f990_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c15_f990_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l31_c15_4659]
signal MUX_uxn_c_l31_c15_4659_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l31_c15_4659_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l31_c15_4659_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l31_c15_4659_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_c_l32_c17_68f6]
signal device_ram_read_uxn_c_l32_c17_68f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_c_l32_c17_68f6_address : unsigned(7 downto 0);
signal device_ram_read_uxn_c_l32_c17_68f6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l33_c22_dde7]
signal BIN_OP_EQ_uxn_c_l33_c22_dde7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l33_c22_dde7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l33_c22_dde7_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l33_c22_c15d]
signal MUX_uxn_c_l33_c22_c15d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l33_c22_c15d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l33_c22_c15d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l33_c22_c15d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l34_c16_d671]
signal BIN_OP_AND_uxn_c_l34_c16_d671_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l34_c16_d671_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l34_c16_d671_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_8202]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_return_output : unsigned(0 downto 0);

-- s_MUX[uxn_c_l36_c2_2fb1]
signal s_MUX_uxn_c_l36_c2_2fb1_cond : unsigned(0 downto 0);
signal s_MUX_uxn_c_l36_c2_2fb1_iftrue : unsigned(0 downto 0);
signal s_MUX_uxn_c_l36_c2_2fb1_iffalse : unsigned(0 downto 0);
signal s_MUX_uxn_c_l36_c2_2fb1_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l36_c2_2fb1]
signal ins_MUX_uxn_c_l36_c2_2fb1_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l36_c2_2fb1_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l36_c2_2fb1_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l36_c2_2fb1_return_output : unsigned(7 downto 0);

-- error_MUX[uxn_c_l36_c2_2fb1]
signal error_MUX_uxn_c_l36_c2_2fb1_cond : unsigned(0 downto 0);
signal error_MUX_uxn_c_l36_c2_2fb1_iftrue : unsigned(0 downto 0);
signal error_MUX_uxn_c_l36_c2_2fb1_iffalse : unsigned(0 downto 0);
signal error_MUX_uxn_c_l36_c2_2fb1_return_output : unsigned(0 downto 0);

-- opc_MUX[uxn_c_l36_c2_2fb1]
signal opc_MUX_uxn_c_l36_c2_2fb1_cond : unsigned(0 downto 0);
signal opc_MUX_uxn_c_l36_c2_2fb1_iftrue : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l36_c2_2fb1_iffalse : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l36_c2_2fb1_return_output : unsigned(7 downto 0);

-- k_MUX[uxn_c_l36_c2_2fb1]
signal k_MUX_uxn_c_l36_c2_2fb1_cond : unsigned(0 downto 0);
signal k_MUX_uxn_c_l36_c2_2fb1_iftrue : unsigned(7 downto 0);
signal k_MUX_uxn_c_l36_c2_2fb1_iffalse : unsigned(7 downto 0);
signal k_MUX_uxn_c_l36_c2_2fb1_return_output : unsigned(7 downto 0);

-- main_ram_read[uxn_c_l37_c9_223d]
signal main_ram_read_uxn_c_l37_c9_223d_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_read_uxn_c_l37_c9_223d_address : unsigned(15 downto 0);
signal main_ram_read_uxn_c_l37_c9_223d_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l37_c9_50d0]
signal BIN_OP_AND_uxn_c_l37_c9_50d0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l37_c9_50d0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l37_c9_50d0_return_output : unsigned(7 downto 0);

-- pc_add[uxn_c_l38_c3_0e56]
signal pc_add_uxn_c_l38_c3_0e56_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_c_l38_c3_0e56_adjustment : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l39_c7_a24d]
signal BIN_OP_AND_uxn_c_l39_c7_a24d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_a24d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_a24d_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l39_c7_b7f7]
signal MUX_uxn_c_l39_c7_b7f7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_b7f7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l39_c7_b7f7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l39_c7_b7f7_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l40_c7_e7e9]
signal BIN_OP_AND_uxn_c_l40_c7_e7e9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c7_e7e9_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_c_l40_c7_e7e9_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l40_c7_4b48]
signal MUX_uxn_c_l40_c7_4b48_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l40_c7_4b48_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l40_c7_4b48_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l40_c7_4b48_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l41_c11_da79]
signal BIN_OP_AND_uxn_c_l41_c11_da79_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l41_c11_da79_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_c_l41_c11_da79_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l41_c11_fa0a]
signal UNARY_OP_NOT_uxn_c_l41_c11_fa0a_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_c_l41_c11_fa0a_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_c_l41_c31_a679]
signal CONST_SR_5_uxn_c_l41_c31_a679_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_c_l41_c31_a679_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l41_c26_0cd7]
signal BIN_OP_MINUS_uxn_c_l41_c26_0cd7_left : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l41_c26_0cd7_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l41_c26_0cd7_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l41_c26_bc56]
signal BIN_OP_AND_uxn_c_l41_c26_bc56_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l41_c26_bc56_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l41_c26_bc56_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l41_c51_3506]
signal BIN_OP_AND_uxn_c_l41_c51_3506_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l41_c51_3506_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_c_l41_c51_3506_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l41_c11_6383]
signal MUX_uxn_c_l41_c11_6383_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l41_c11_6383_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l41_c11_6383_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l41_c11_6383_return_output : unsigned(7 downto 0);

-- eval_opcode[uxn_c_l42_c11_7bc6]
signal eval_opcode_uxn_c_l42_c11_7bc6_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l42_c11_7bc6_stack_index : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l42_c11_7bc6_opcode : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l42_c11_7bc6_ins : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l42_c11_7bc6_k : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l42_c11_7bc6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l46_c6_6600]
signal BIN_OP_EQ_uxn_c_l46_c6_6600_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l46_c6_6600_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l46_c6_6600_return_output : unsigned(0 downto 0);

-- counter_MUX[uxn_c_l46_c2_03f6]
signal counter_MUX_uxn_c_l46_c2_03f6_cond : unsigned(0 downto 0);
signal counter_MUX_uxn_c_l46_c2_03f6_iftrue : unsigned(31 downto 0);
signal counter_MUX_uxn_c_l46_c2_03f6_iffalse : unsigned(31 downto 0);
signal counter_MUX_uxn_c_l46_c2_03f6_return_output : unsigned(31 downto 0);

-- result_MUX[uxn_c_l46_c2_03f6]
signal result_MUX_uxn_c_l46_c2_03f6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l46_c2_03f6_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_c_l46_c2_03f6_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_c_l46_c2_03f6_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l48_c12_9e2a]
signal BIN_OP_XOR_uxn_c_l48_c12_9e2a_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l48_c12_9e2a_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l48_c12_9e2a_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l49_c12_7a11]
signal BIN_OP_XOR_uxn_c_l49_c12_7a11_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l49_c12_7a11_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l49_c12_7a11_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l50_c12_9dc1]
signal BIN_OP_XOR_uxn_c_l50_c12_9dc1_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l50_c12_9dc1_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l50_c12_9dc1_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l51_c12_cb75]
signal BIN_OP_XOR_uxn_c_l51_c12_cb75_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l51_c12_cb75_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l51_c12_cb75_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l54_c3_56b3]
signal BIN_OP_PLUS_uxn_c_l54_c3_56b3_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l54_c3_56b3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l54_c3_56b3_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l57_c6_7a96]
signal BIN_OP_EQ_uxn_c_l57_c6_7a96_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l57_c6_7a96_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l57_c6_7a96_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l57_c2_4c05]
signal result_MUX_uxn_c_l57_c2_4c05_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l57_c2_4c05_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_c_l57_c2_4c05_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_c_l57_c2_4c05_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l58_c12_2538]
signal BIN_OP_XOR_uxn_c_l58_c12_2538_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l58_c12_2538_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l58_c12_2538_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l61_c6_6ced]
signal BIN_OP_EQ_uxn_c_l61_c6_6ced_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l61_c6_6ced_right : unsigned(22 downto 0);
signal BIN_OP_EQ_uxn_c_l61_c6_6ced_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l61_c2_2e4f]
signal result_MUX_uxn_c_l61_c2_2e4f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l61_c2_2e4f_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_c_l61_c2_2e4f_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_c_l61_c2_2e4f_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l62_c12_632c]
signal BIN_OP_XOR_uxn_c_l62_c12_632c_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l62_c12_632c_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l62_c12_632c_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l63_c12_4819]
signal BIN_OP_XOR_uxn_c_l63_c12_4819_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l63_c12_4819_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l63_c12_4819_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l66_c6_977d]
signal BIN_OP_EQ_uxn_c_l66_c6_977d_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l66_c6_977d_right : unsigned(21 downto 0);
signal BIN_OP_EQ_uxn_c_l66_c6_977d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l66_c2_9562]
signal result_MUX_uxn_c_l66_c2_9562_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l66_c2_9562_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_c_l66_c2_9562_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_c_l66_c2_9562_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l67_c12_cfcc]
signal BIN_OP_XOR_uxn_c_l67_c12_cfcc_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l67_c12_cfcc_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l67_c12_cfcc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l70_c6_f819]
signal BIN_OP_EQ_uxn_c_l70_c6_f819_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l70_c6_f819_right : unsigned(22 downto 0);
signal BIN_OP_EQ_uxn_c_l70_c6_f819_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l70_c2_7d0c]
signal result_MUX_uxn_c_l70_c2_7d0c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l70_c2_7d0c_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_c_l70_c2_7d0c_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_c_l70_c2_7d0c_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l71_c12_321f]
signal BIN_OP_XOR_uxn_c_l71_c12_321f_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l71_c12_321f_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l71_c12_321f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l74_c6_7721]
signal BIN_OP_EQ_uxn_c_l74_c6_7721_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c6_7721_right : unsigned(21 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c6_7721_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l74_c2_9646]
signal result_MUX_uxn_c_l74_c2_9646_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l74_c2_9646_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_c_l74_c2_9646_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_c_l74_c2_9646_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l75_c12_0549]
signal BIN_OP_XOR_uxn_c_l75_c12_0549_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l75_c12_0549_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l75_c12_0549_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l78_c12_b433]
signal BIN_OP_AND_uxn_c_l78_c12_b433_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l78_c12_b433_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_c_l78_c12_b433_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l78_c36_8acb]
signal MUX_uxn_c_l78_c36_8acb_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l78_c36_8acb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l78_c36_8acb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l78_c36_8acb_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_c_l78_c12_40ed]
signal BIN_OP_OR_uxn_c_l78_c12_40ed_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_c_l78_c12_40ed_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_c_l78_c12_40ed_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_c_l30_c7_7701
pc_get_uxn_c_l30_c7_7701 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_c_l30_c7_7701_CLOCK_ENABLE,
pc_get_uxn_c_l30_c7_7701_return_output);

-- BIN_OP_EQ_uxn_c_l31_c15_f990
BIN_OP_EQ_uxn_c_l31_c15_f990 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l31_c15_f990_left,
BIN_OP_EQ_uxn_c_l31_c15_f990_right,
BIN_OP_EQ_uxn_c_l31_c15_f990_return_output);

-- MUX_uxn_c_l31_c15_4659
MUX_uxn_c_l31_c15_4659 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l31_c15_4659_cond,
MUX_uxn_c_l31_c15_4659_iftrue,
MUX_uxn_c_l31_c15_4659_iffalse,
MUX_uxn_c_l31_c15_4659_return_output);

-- device_ram_read_uxn_c_l32_c17_68f6
device_ram_read_uxn_c_l32_c17_68f6 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_c_l32_c17_68f6_CLOCK_ENABLE,
device_ram_read_uxn_c_l32_c17_68f6_address,
device_ram_read_uxn_c_l32_c17_68f6_return_output);

-- BIN_OP_EQ_uxn_c_l33_c22_dde7
BIN_OP_EQ_uxn_c_l33_c22_dde7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l33_c22_dde7_left,
BIN_OP_EQ_uxn_c_l33_c22_dde7_right,
BIN_OP_EQ_uxn_c_l33_c22_dde7_return_output);

-- MUX_uxn_c_l33_c22_c15d
MUX_uxn_c_l33_c22_c15d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l33_c22_c15d_cond,
MUX_uxn_c_l33_c22_c15d_iftrue,
MUX_uxn_c_l33_c22_c15d_iffalse,
MUX_uxn_c_l33_c22_c15d_return_output);

-- BIN_OP_AND_uxn_c_l34_c16_d671
BIN_OP_AND_uxn_c_l34_c16_d671 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l34_c16_d671_left,
BIN_OP_AND_uxn_c_l34_c16_d671_right,
BIN_OP_AND_uxn_c_l34_c16_d671_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_return_output);

-- s_MUX_uxn_c_l36_c2_2fb1
s_MUX_uxn_c_l36_c2_2fb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
s_MUX_uxn_c_l36_c2_2fb1_cond,
s_MUX_uxn_c_l36_c2_2fb1_iftrue,
s_MUX_uxn_c_l36_c2_2fb1_iffalse,
s_MUX_uxn_c_l36_c2_2fb1_return_output);

-- ins_MUX_uxn_c_l36_c2_2fb1
ins_MUX_uxn_c_l36_c2_2fb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l36_c2_2fb1_cond,
ins_MUX_uxn_c_l36_c2_2fb1_iftrue,
ins_MUX_uxn_c_l36_c2_2fb1_iffalse,
ins_MUX_uxn_c_l36_c2_2fb1_return_output);

-- error_MUX_uxn_c_l36_c2_2fb1
error_MUX_uxn_c_l36_c2_2fb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
error_MUX_uxn_c_l36_c2_2fb1_cond,
error_MUX_uxn_c_l36_c2_2fb1_iftrue,
error_MUX_uxn_c_l36_c2_2fb1_iffalse,
error_MUX_uxn_c_l36_c2_2fb1_return_output);

-- opc_MUX_uxn_c_l36_c2_2fb1
opc_MUX_uxn_c_l36_c2_2fb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
opc_MUX_uxn_c_l36_c2_2fb1_cond,
opc_MUX_uxn_c_l36_c2_2fb1_iftrue,
opc_MUX_uxn_c_l36_c2_2fb1_iffalse,
opc_MUX_uxn_c_l36_c2_2fb1_return_output);

-- k_MUX_uxn_c_l36_c2_2fb1
k_MUX_uxn_c_l36_c2_2fb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
k_MUX_uxn_c_l36_c2_2fb1_cond,
k_MUX_uxn_c_l36_c2_2fb1_iftrue,
k_MUX_uxn_c_l36_c2_2fb1_iffalse,
k_MUX_uxn_c_l36_c2_2fb1_return_output);

-- main_ram_read_uxn_c_l37_c9_223d
main_ram_read_uxn_c_l37_c9_223d : entity work.main_ram_read_0CLK_8ab28aec port map (
clk,
main_ram_read_uxn_c_l37_c9_223d_CLOCK_ENABLE,
main_ram_read_uxn_c_l37_c9_223d_address,
main_ram_read_uxn_c_l37_c9_223d_return_output);

-- BIN_OP_AND_uxn_c_l37_c9_50d0
BIN_OP_AND_uxn_c_l37_c9_50d0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l37_c9_50d0_left,
BIN_OP_AND_uxn_c_l37_c9_50d0_right,
BIN_OP_AND_uxn_c_l37_c9_50d0_return_output);

-- pc_add_uxn_c_l38_c3_0e56
pc_add_uxn_c_l38_c3_0e56 : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_c_l38_c3_0e56_CLOCK_ENABLE,
pc_add_uxn_c_l38_c3_0e56_adjustment);

-- BIN_OP_AND_uxn_c_l39_c7_a24d
BIN_OP_AND_uxn_c_l39_c7_a24d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l39_c7_a24d_left,
BIN_OP_AND_uxn_c_l39_c7_a24d_right,
BIN_OP_AND_uxn_c_l39_c7_a24d_return_output);

-- MUX_uxn_c_l39_c7_b7f7
MUX_uxn_c_l39_c7_b7f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l39_c7_b7f7_cond,
MUX_uxn_c_l39_c7_b7f7_iftrue,
MUX_uxn_c_l39_c7_b7f7_iffalse,
MUX_uxn_c_l39_c7_b7f7_return_output);

-- BIN_OP_AND_uxn_c_l40_c7_e7e9
BIN_OP_AND_uxn_c_l40_c7_e7e9 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c7_e7e9_left,
BIN_OP_AND_uxn_c_l40_c7_e7e9_right,
BIN_OP_AND_uxn_c_l40_c7_e7e9_return_output);

-- MUX_uxn_c_l40_c7_4b48
MUX_uxn_c_l40_c7_4b48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l40_c7_4b48_cond,
MUX_uxn_c_l40_c7_4b48_iftrue,
MUX_uxn_c_l40_c7_4b48_iffalse,
MUX_uxn_c_l40_c7_4b48_return_output);

-- BIN_OP_AND_uxn_c_l41_c11_da79
BIN_OP_AND_uxn_c_l41_c11_da79 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l41_c11_da79_left,
BIN_OP_AND_uxn_c_l41_c11_da79_right,
BIN_OP_AND_uxn_c_l41_c11_da79_return_output);

-- UNARY_OP_NOT_uxn_c_l41_c11_fa0a
UNARY_OP_NOT_uxn_c_l41_c11_fa0a : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l41_c11_fa0a_expr,
UNARY_OP_NOT_uxn_c_l41_c11_fa0a_return_output);

-- CONST_SR_5_uxn_c_l41_c31_a679
CONST_SR_5_uxn_c_l41_c31_a679 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_c_l41_c31_a679_x,
CONST_SR_5_uxn_c_l41_c31_a679_return_output);

-- BIN_OP_MINUS_uxn_c_l41_c26_0cd7
BIN_OP_MINUS_uxn_c_l41_c26_0cd7 : entity work.BIN_OP_MINUS_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l41_c26_0cd7_left,
BIN_OP_MINUS_uxn_c_l41_c26_0cd7_right,
BIN_OP_MINUS_uxn_c_l41_c26_0cd7_return_output);

-- BIN_OP_AND_uxn_c_l41_c26_bc56
BIN_OP_AND_uxn_c_l41_c26_bc56 : entity work.BIN_OP_AND_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l41_c26_bc56_left,
BIN_OP_AND_uxn_c_l41_c26_bc56_right,
BIN_OP_AND_uxn_c_l41_c26_bc56_return_output);

-- BIN_OP_AND_uxn_c_l41_c51_3506
BIN_OP_AND_uxn_c_l41_c51_3506 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l41_c51_3506_left,
BIN_OP_AND_uxn_c_l41_c51_3506_right,
BIN_OP_AND_uxn_c_l41_c51_3506_return_output);

-- MUX_uxn_c_l41_c11_6383
MUX_uxn_c_l41_c11_6383 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l41_c11_6383_cond,
MUX_uxn_c_l41_c11_6383_iftrue,
MUX_uxn_c_l41_c11_6383_iffalse,
MUX_uxn_c_l41_c11_6383_return_output);

-- eval_opcode_uxn_c_l42_c11_7bc6
eval_opcode_uxn_c_l42_c11_7bc6 : entity work.eval_opcode_0CLK_44dad49a port map (
clk,
eval_opcode_uxn_c_l42_c11_7bc6_CLOCK_ENABLE,
eval_opcode_uxn_c_l42_c11_7bc6_stack_index,
eval_opcode_uxn_c_l42_c11_7bc6_opcode,
eval_opcode_uxn_c_l42_c11_7bc6_ins,
eval_opcode_uxn_c_l42_c11_7bc6_k,
eval_opcode_uxn_c_l42_c11_7bc6_return_output);

-- BIN_OP_EQ_uxn_c_l46_c6_6600
BIN_OP_EQ_uxn_c_l46_c6_6600 : entity work.BIN_OP_EQ_uint32_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l46_c6_6600_left,
BIN_OP_EQ_uxn_c_l46_c6_6600_right,
BIN_OP_EQ_uxn_c_l46_c6_6600_return_output);

-- counter_MUX_uxn_c_l46_c2_03f6
counter_MUX_uxn_c_l46_c2_03f6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
counter_MUX_uxn_c_l46_c2_03f6_cond,
counter_MUX_uxn_c_l46_c2_03f6_iftrue,
counter_MUX_uxn_c_l46_c2_03f6_iffalse,
counter_MUX_uxn_c_l46_c2_03f6_return_output);

-- result_MUX_uxn_c_l46_c2_03f6
result_MUX_uxn_c_l46_c2_03f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l46_c2_03f6_cond,
result_MUX_uxn_c_l46_c2_03f6_iftrue,
result_MUX_uxn_c_l46_c2_03f6_iffalse,
result_MUX_uxn_c_l46_c2_03f6_return_output);

-- BIN_OP_XOR_uxn_c_l48_c12_9e2a
BIN_OP_XOR_uxn_c_l48_c12_9e2a : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l48_c12_9e2a_left,
BIN_OP_XOR_uxn_c_l48_c12_9e2a_right,
BIN_OP_XOR_uxn_c_l48_c12_9e2a_return_output);

-- BIN_OP_XOR_uxn_c_l49_c12_7a11
BIN_OP_XOR_uxn_c_l49_c12_7a11 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l49_c12_7a11_left,
BIN_OP_XOR_uxn_c_l49_c12_7a11_right,
BIN_OP_XOR_uxn_c_l49_c12_7a11_return_output);

-- BIN_OP_XOR_uxn_c_l50_c12_9dc1
BIN_OP_XOR_uxn_c_l50_c12_9dc1 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l50_c12_9dc1_left,
BIN_OP_XOR_uxn_c_l50_c12_9dc1_right,
BIN_OP_XOR_uxn_c_l50_c12_9dc1_return_output);

-- BIN_OP_XOR_uxn_c_l51_c12_cb75
BIN_OP_XOR_uxn_c_l51_c12_cb75 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l51_c12_cb75_left,
BIN_OP_XOR_uxn_c_l51_c12_cb75_right,
BIN_OP_XOR_uxn_c_l51_c12_cb75_return_output);

-- BIN_OP_PLUS_uxn_c_l54_c3_56b3
BIN_OP_PLUS_uxn_c_l54_c3_56b3 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l54_c3_56b3_left,
BIN_OP_PLUS_uxn_c_l54_c3_56b3_right,
BIN_OP_PLUS_uxn_c_l54_c3_56b3_return_output);

-- BIN_OP_EQ_uxn_c_l57_c6_7a96
BIN_OP_EQ_uxn_c_l57_c6_7a96 : entity work.BIN_OP_EQ_uint32_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l57_c6_7a96_left,
BIN_OP_EQ_uxn_c_l57_c6_7a96_right,
BIN_OP_EQ_uxn_c_l57_c6_7a96_return_output);

-- result_MUX_uxn_c_l57_c2_4c05
result_MUX_uxn_c_l57_c2_4c05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l57_c2_4c05_cond,
result_MUX_uxn_c_l57_c2_4c05_iftrue,
result_MUX_uxn_c_l57_c2_4c05_iffalse,
result_MUX_uxn_c_l57_c2_4c05_return_output);

-- BIN_OP_XOR_uxn_c_l58_c12_2538
BIN_OP_XOR_uxn_c_l58_c12_2538 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l58_c12_2538_left,
BIN_OP_XOR_uxn_c_l58_c12_2538_right,
BIN_OP_XOR_uxn_c_l58_c12_2538_return_output);

-- BIN_OP_EQ_uxn_c_l61_c6_6ced
BIN_OP_EQ_uxn_c_l61_c6_6ced : entity work.BIN_OP_EQ_uint32_t_uint23_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l61_c6_6ced_left,
BIN_OP_EQ_uxn_c_l61_c6_6ced_right,
BIN_OP_EQ_uxn_c_l61_c6_6ced_return_output);

-- result_MUX_uxn_c_l61_c2_2e4f
result_MUX_uxn_c_l61_c2_2e4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l61_c2_2e4f_cond,
result_MUX_uxn_c_l61_c2_2e4f_iftrue,
result_MUX_uxn_c_l61_c2_2e4f_iffalse,
result_MUX_uxn_c_l61_c2_2e4f_return_output);

-- BIN_OP_XOR_uxn_c_l62_c12_632c
BIN_OP_XOR_uxn_c_l62_c12_632c : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l62_c12_632c_left,
BIN_OP_XOR_uxn_c_l62_c12_632c_right,
BIN_OP_XOR_uxn_c_l62_c12_632c_return_output);

-- BIN_OP_XOR_uxn_c_l63_c12_4819
BIN_OP_XOR_uxn_c_l63_c12_4819 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l63_c12_4819_left,
BIN_OP_XOR_uxn_c_l63_c12_4819_right,
BIN_OP_XOR_uxn_c_l63_c12_4819_return_output);

-- BIN_OP_EQ_uxn_c_l66_c6_977d
BIN_OP_EQ_uxn_c_l66_c6_977d : entity work.BIN_OP_EQ_uint32_t_uint22_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l66_c6_977d_left,
BIN_OP_EQ_uxn_c_l66_c6_977d_right,
BIN_OP_EQ_uxn_c_l66_c6_977d_return_output);

-- result_MUX_uxn_c_l66_c2_9562
result_MUX_uxn_c_l66_c2_9562 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l66_c2_9562_cond,
result_MUX_uxn_c_l66_c2_9562_iftrue,
result_MUX_uxn_c_l66_c2_9562_iffalse,
result_MUX_uxn_c_l66_c2_9562_return_output);

-- BIN_OP_XOR_uxn_c_l67_c12_cfcc
BIN_OP_XOR_uxn_c_l67_c12_cfcc : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l67_c12_cfcc_left,
BIN_OP_XOR_uxn_c_l67_c12_cfcc_right,
BIN_OP_XOR_uxn_c_l67_c12_cfcc_return_output);

-- BIN_OP_EQ_uxn_c_l70_c6_f819
BIN_OP_EQ_uxn_c_l70_c6_f819 : entity work.BIN_OP_EQ_uint32_t_uint23_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l70_c6_f819_left,
BIN_OP_EQ_uxn_c_l70_c6_f819_right,
BIN_OP_EQ_uxn_c_l70_c6_f819_return_output);

-- result_MUX_uxn_c_l70_c2_7d0c
result_MUX_uxn_c_l70_c2_7d0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l70_c2_7d0c_cond,
result_MUX_uxn_c_l70_c2_7d0c_iftrue,
result_MUX_uxn_c_l70_c2_7d0c_iffalse,
result_MUX_uxn_c_l70_c2_7d0c_return_output);

-- BIN_OP_XOR_uxn_c_l71_c12_321f
BIN_OP_XOR_uxn_c_l71_c12_321f : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l71_c12_321f_left,
BIN_OP_XOR_uxn_c_l71_c12_321f_right,
BIN_OP_XOR_uxn_c_l71_c12_321f_return_output);

-- BIN_OP_EQ_uxn_c_l74_c6_7721
BIN_OP_EQ_uxn_c_l74_c6_7721 : entity work.BIN_OP_EQ_uint32_t_uint22_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l74_c6_7721_left,
BIN_OP_EQ_uxn_c_l74_c6_7721_right,
BIN_OP_EQ_uxn_c_l74_c6_7721_return_output);

-- result_MUX_uxn_c_l74_c2_9646
result_MUX_uxn_c_l74_c2_9646 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l74_c2_9646_cond,
result_MUX_uxn_c_l74_c2_9646_iftrue,
result_MUX_uxn_c_l74_c2_9646_iffalse,
result_MUX_uxn_c_l74_c2_9646_return_output);

-- BIN_OP_XOR_uxn_c_l75_c12_0549
BIN_OP_XOR_uxn_c_l75_c12_0549 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l75_c12_0549_left,
BIN_OP_XOR_uxn_c_l75_c12_0549_right,
BIN_OP_XOR_uxn_c_l75_c12_0549_return_output);

-- BIN_OP_AND_uxn_c_l78_c12_b433
BIN_OP_AND_uxn_c_l78_c12_b433 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l78_c12_b433_left,
BIN_OP_AND_uxn_c_l78_c12_b433_right,
BIN_OP_AND_uxn_c_l78_c12_b433_return_output);

-- MUX_uxn_c_l78_c36_8acb
MUX_uxn_c_l78_c36_8acb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l78_c36_8acb_cond,
MUX_uxn_c_l78_c36_8acb_iftrue,
MUX_uxn_c_l78_c36_8acb_iffalse,
MUX_uxn_c_l78_c36_8acb_return_output);

-- BIN_OP_OR_uxn_c_l78_c12_40ed
BIN_OP_OR_uxn_c_l78_c12_40ed : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l78_c12_40ed_left,
BIN_OP_OR_uxn_c_l78_c12_40ed_right,
BIN_OP_OR_uxn_c_l78_c12_40ed_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Registers
 led_error,
 led_blink,
 led_r,
 led_g,
 led_b,
 result,
 counter,
 s,
 pc_nonzero,
 system_state_zero,
 should_eval,
 error,
 k,
 opc,
 ins,
 system_state,
 pc,
 -- All submodule outputs
 pc_get_uxn_c_l30_c7_7701_return_output,
 BIN_OP_EQ_uxn_c_l31_c15_f990_return_output,
 MUX_uxn_c_l31_c15_4659_return_output,
 device_ram_read_uxn_c_l32_c17_68f6_return_output,
 BIN_OP_EQ_uxn_c_l33_c22_dde7_return_output,
 MUX_uxn_c_l33_c22_c15d_return_output,
 BIN_OP_AND_uxn_c_l34_c16_d671_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_return_output,
 s_MUX_uxn_c_l36_c2_2fb1_return_output,
 ins_MUX_uxn_c_l36_c2_2fb1_return_output,
 error_MUX_uxn_c_l36_c2_2fb1_return_output,
 opc_MUX_uxn_c_l36_c2_2fb1_return_output,
 k_MUX_uxn_c_l36_c2_2fb1_return_output,
 main_ram_read_uxn_c_l37_c9_223d_return_output,
 BIN_OP_AND_uxn_c_l37_c9_50d0_return_output,
 BIN_OP_AND_uxn_c_l39_c7_a24d_return_output,
 MUX_uxn_c_l39_c7_b7f7_return_output,
 BIN_OP_AND_uxn_c_l40_c7_e7e9_return_output,
 MUX_uxn_c_l40_c7_4b48_return_output,
 BIN_OP_AND_uxn_c_l41_c11_da79_return_output,
 UNARY_OP_NOT_uxn_c_l41_c11_fa0a_return_output,
 CONST_SR_5_uxn_c_l41_c31_a679_return_output,
 BIN_OP_MINUS_uxn_c_l41_c26_0cd7_return_output,
 BIN_OP_AND_uxn_c_l41_c26_bc56_return_output,
 BIN_OP_AND_uxn_c_l41_c51_3506_return_output,
 MUX_uxn_c_l41_c11_6383_return_output,
 eval_opcode_uxn_c_l42_c11_7bc6_return_output,
 BIN_OP_EQ_uxn_c_l46_c6_6600_return_output,
 counter_MUX_uxn_c_l46_c2_03f6_return_output,
 result_MUX_uxn_c_l46_c2_03f6_return_output,
 BIN_OP_XOR_uxn_c_l48_c12_9e2a_return_output,
 BIN_OP_XOR_uxn_c_l49_c12_7a11_return_output,
 BIN_OP_XOR_uxn_c_l50_c12_9dc1_return_output,
 BIN_OP_XOR_uxn_c_l51_c12_cb75_return_output,
 BIN_OP_PLUS_uxn_c_l54_c3_56b3_return_output,
 BIN_OP_EQ_uxn_c_l57_c6_7a96_return_output,
 result_MUX_uxn_c_l57_c2_4c05_return_output,
 BIN_OP_XOR_uxn_c_l58_c12_2538_return_output,
 BIN_OP_EQ_uxn_c_l61_c6_6ced_return_output,
 result_MUX_uxn_c_l61_c2_2e4f_return_output,
 BIN_OP_XOR_uxn_c_l62_c12_632c_return_output,
 BIN_OP_XOR_uxn_c_l63_c12_4819_return_output,
 BIN_OP_EQ_uxn_c_l66_c6_977d_return_output,
 result_MUX_uxn_c_l66_c2_9562_return_output,
 BIN_OP_XOR_uxn_c_l67_c12_cfcc_return_output,
 BIN_OP_EQ_uxn_c_l70_c6_f819_return_output,
 result_MUX_uxn_c_l70_c2_7d0c_return_output,
 BIN_OP_XOR_uxn_c_l71_c12_321f_return_output,
 BIN_OP_EQ_uxn_c_l74_c6_7721_return_output,
 result_MUX_uxn_c_l74_c2_9646_return_output,
 BIN_OP_XOR_uxn_c_l75_c12_0549_return_output,
 BIN_OP_AND_uxn_c_l78_c12_b433_return_output,
 MUX_uxn_c_l78_c36_8acb_return_output,
 BIN_OP_OR_uxn_c_l78_c12_40ed_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_pc_get_uxn_c_l30_c7_7701_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_c_l30_c7_7701_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l31_c15_4659_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l31_c15_4659_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l31_c15_4659_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c15_f990_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c15_f990_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c15_f990_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l31_c15_4659_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_c_l32_c17_68f6_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_c_l32_c17_68f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_c_l32_c17_68f6_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l33_c22_c15d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l33_c22_c15d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l33_c22_c15d_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l33_c22_dde7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l33_c22_dde7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l33_c22_dde7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l33_c22_c15d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l34_c16_d671_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l34_c16_d671_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l34_c16_d671_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_iffalse : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l36_c2_2fb1_iftrue : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l36_c2_2fb1_iffalse : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l36_c2_2fb1_return_output : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l36_c2_2fb1_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l36_c2_2fb1_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l36_c2_2fb1_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l36_c2_2fb1_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l36_c2_2fb1_cond : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l36_c2_2fb1_iftrue : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l36_c2_2fb1_iffalse : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l36_c2_2fb1_return_output : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l36_c2_2fb1_cond : unsigned(0 downto 0);
 variable VAR_opc_MUX_uxn_c_l36_c2_2fb1_iftrue : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l36_c2_2fb1_iffalse : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l36_c2_2fb1_return_output : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l36_c2_2fb1_cond : unsigned(0 downto 0);
 variable VAR_k_MUX_uxn_c_l36_c2_2fb1_iftrue : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l36_c2_2fb1_iffalse : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l36_c2_2fb1_return_output : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l36_c2_2fb1_cond : unsigned(0 downto 0);
 variable VAR_main_ram_read_uxn_c_l37_c9_223d_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_left : unsigned(7 downto 0);
 variable VAR_main_ram_read_uxn_c_l37_c9_223d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_read_uxn_c_l37_c9_223d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_return_output : unsigned(7 downto 0);
 variable VAR_pc_add_uxn_c_l38_c3_0e56_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_c_l38_c3_0e56_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_b7f7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_b7f7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_b7f7_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_a24d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_a24d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_a24d_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_b7f7_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c7_4b48_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c7_4b48_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c7_4b48_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c7_e7e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c7_e7e9_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c7_e7e9_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c7_4b48_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l41_c11_6383_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l41_c11_6383_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l41_c11_6383_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c11_da79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c11_da79_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c11_da79_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l41_c11_fa0a_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l41_c11_fa0a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l41_c26_0cd7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l41_c26_0cd7_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l41_c31_a679_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l41_c31_a679_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l41_c26_0cd7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c26_bc56_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c26_bc56_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c26_bc56_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c51_3506_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c51_3506_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c51_3506_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l41_c11_6383_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l42_c11_7bc6_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l42_c11_7bc6_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l42_c11_7bc6_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l42_c11_7bc6_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l42_c11_7bc6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l42_c11_7bc6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l46_c6_6600_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l46_c6_6600_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l46_c6_6600_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_uxn_c_l46_c2_03f6_iftrue : unsigned(31 downto 0);
 variable VAR_counter_uxn_c_l52_c3_3601 : unsigned(31 downto 0);
 variable VAR_counter_MUX_uxn_c_l46_c2_03f6_iffalse : unsigned(31 downto 0);
 variable VAR_counter_uxn_c_l54_c3_a61c : unsigned(31 downto 0);
 variable VAR_counter_MUX_uxn_c_l46_c2_03f6_return_output : unsigned(31 downto 0);
 variable VAR_counter_MUX_uxn_c_l46_c2_03f6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l46_c2_03f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l46_c2_03f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l46_c2_03f6_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l46_c2_03f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l48_c12_9e2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l48_c12_9e2a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l48_c12_9e2a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l49_c12_7a11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l49_c12_7a11_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l49_c12_7a11_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l50_c12_9dc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l50_c12_9dc1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l50_c12_9dc1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l51_c12_cb75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l51_c12_cb75_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l51_c12_cb75_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l54_c3_56b3_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l54_c3_56b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l54_c3_56b3_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l57_c6_7a96_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l57_c6_7a96_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l57_c6_7a96_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l57_c2_4c05_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l57_c2_4c05_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l57_c2_4c05_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l57_c2_4c05_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l58_c12_2538_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l58_c12_2538_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l58_c12_2538_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l61_c6_6ced_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l61_c6_6ced_right : unsigned(22 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l61_c6_6ced_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l61_c2_2e4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l61_c2_2e4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l61_c2_2e4f_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l61_c2_2e4f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l62_c12_632c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l62_c12_632c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l62_c12_632c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l63_c12_4819_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l63_c12_4819_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l63_c12_4819_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l66_c6_977d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l66_c6_977d_right : unsigned(21 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l66_c6_977d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l66_c2_9562_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l66_c2_9562_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l66_c2_9562_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l66_c2_9562_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l67_c12_cfcc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l67_c12_cfcc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l67_c12_cfcc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_f819_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_f819_right : unsigned(22 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_f819_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l70_c2_7d0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l70_c2_7d0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l70_c2_7d0c_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l70_c2_7d0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l71_c12_321f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l71_c12_321f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l71_c12_321f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_7721_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_7721_right : unsigned(21 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_7721_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l74_c2_9646_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l74_c2_9646_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l74_c2_9646_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l74_c2_9646_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l75_c12_0549_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l75_c12_0549_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l75_c12_0549_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l78_c12_b433_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l78_c12_b433_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l78_c12_b433_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l78_c12_40ed_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l78_c36_8acb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l78_c36_8acb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l78_c36_8acb_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l78_c36_8acb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l78_c12_40ed_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l78_c12_40ed_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_led_error : unsigned(7 downto 0);
variable REG_VAR_led_blink : unsigned(7 downto 0);
variable REG_VAR_led_r : unsigned(7 downto 0);
variable REG_VAR_led_g : unsigned(7 downto 0);
variable REG_VAR_led_b : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(7 downto 0);
variable REG_VAR_counter : unsigned(31 downto 0);
variable REG_VAR_s : unsigned(0 downto 0);
variable REG_VAR_pc_nonzero : unsigned(0 downto 0);
variable REG_VAR_system_state_zero : unsigned(0 downto 0);
variable REG_VAR_should_eval : unsigned(0 downto 0);
variable REG_VAR_error : unsigned(0 downto 0);
variable REG_VAR_k : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(7 downto 0);
variable REG_VAR_ins : unsigned(7 downto 0);
variable REG_VAR_system_state : unsigned(7 downto 0);
variable REG_VAR_pc : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_led_error := led_error;
  REG_VAR_led_blink := led_blink;
  REG_VAR_led_r := led_r;
  REG_VAR_led_g := led_g;
  REG_VAR_led_b := led_b;
  REG_VAR_result := result;
  REG_VAR_counter := counter;
  REG_VAR_s := s;
  REG_VAR_pc_nonzero := pc_nonzero;
  REG_VAR_system_state_zero := system_state_zero;
  REG_VAR_should_eval := should_eval;
  REG_VAR_error := error;
  REG_VAR_k := k;
  REG_VAR_opc := opc;
  REG_VAR_ins := ins;
  REG_VAR_system_state := system_state;
  REG_VAR_pc := pc;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_c_l33_c22_c15d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l78_c12_b433_right := to_unsigned(15, 4);
     VAR_BIN_OP_PLUS_uxn_c_l54_c3_56b3_right := to_unsigned(1, 1);
     VAR_device_ram_read_uxn_c_l32_c17_68f6_address := resize(to_unsigned(15, 4), 8);
     VAR_BIN_OP_AND_uxn_c_l41_c26_bc56_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l31_c15_f990_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l31_c15_4659_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l40_c7_4b48_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l74_c6_7721_right := to_unsigned(3071999, 22);
     VAR_BIN_OP_AND_uxn_c_l41_c51_3506_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_c_l66_c6_977d_right := to_unsigned(4095999, 22);
     VAR_MUX_uxn_c_l33_c22_c15d_iftrue := to_unsigned(1, 1);
     VAR_pc_add_uxn_c_l38_c3_0e56_adjustment := resize(to_unsigned(1, 1), 16);
     VAR_MUX_uxn_c_l39_c7_b7f7_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_AND_uxn_c_l40_c7_e7e9_right := to_unsigned(64, 7);
     VAR_MUX_uxn_c_l39_c7_b7f7_iftrue := to_unsigned(255, 8);
     VAR_MUX_uxn_c_l78_c36_8acb_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_c_l70_c6_f819_right := to_unsigned(8191999, 23);
     VAR_error_MUX_uxn_c_l36_c2_2fb1_iffalse := to_unsigned(0, 1);
     VAR_counter_uxn_c_l52_c3_3601 := resize(to_unsigned(0, 1), 32);
     VAR_counter_MUX_uxn_c_l46_c2_03f6_iftrue := VAR_counter_uxn_c_l52_c3_3601;
     VAR_BIN_OP_EQ_uxn_c_l57_c6_7a96_right := to_unsigned(9215999, 24);
     VAR_BIN_OP_EQ_uxn_c_l61_c6_6ced_right := to_unsigned(6143999, 23);
     VAR_MUX_uxn_c_l31_c15_4659_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l39_c7_a24d_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_c_l33_c22_dde7_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l41_c26_0cd7_left := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l40_c7_4b48_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l46_c6_6600_right := to_unsigned(12287998, 24);
     VAR_BIN_OP_AND_uxn_c_l41_c11_da79_right := to_unsigned(31, 5);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_read_uxn_c_l32_c17_68f6_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_c_l30_c7_7701_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l46_c6_6600_left := counter;
     VAR_BIN_OP_PLUS_uxn_c_l54_c3_56b3_left := counter;
     VAR_ins_MUX_uxn_c_l36_c2_2fb1_iffalse := ins;
     VAR_k_MUX_uxn_c_l36_c2_2fb1_iffalse := k;
     VAR_BIN_OP_XOR_uxn_c_l51_c12_cb75_right := led_b;
     VAR_BIN_OP_XOR_uxn_c_l58_c12_2538_right := led_b;
     VAR_BIN_OP_XOR_uxn_c_l63_c12_4819_right := led_b;
     VAR_BIN_OP_XOR_uxn_c_l75_c12_0549_right := led_b;
     REG_VAR_led_b := led_b;
     VAR_BIN_OP_XOR_uxn_c_l48_c12_9e2a_right := led_blink;
     REG_VAR_led_blink := led_blink;
     VAR_MUX_uxn_c_l78_c36_8acb_iftrue := led_error;
     REG_VAR_led_error := led_error;
     VAR_BIN_OP_XOR_uxn_c_l50_c12_9dc1_right := led_g;
     VAR_BIN_OP_XOR_uxn_c_l67_c12_cfcc_right := led_g;
     VAR_BIN_OP_XOR_uxn_c_l71_c12_321f_right := led_g;
     REG_VAR_led_g := led_g;
     VAR_BIN_OP_XOR_uxn_c_l49_c12_7a11_right := led_r;
     VAR_BIN_OP_XOR_uxn_c_l62_c12_632c_right := led_r;
     REG_VAR_led_r := led_r;
     VAR_opc_MUX_uxn_c_l36_c2_2fb1_iffalse := opc;
     VAR_BIN_OP_XOR_uxn_c_l48_c12_9e2a_left := result;
     VAR_result_MUX_uxn_c_l46_c2_03f6_iffalse := result;
     VAR_s_MUX_uxn_c_l36_c2_2fb1_iffalse := s;
     -- device_ram_read[uxn_c_l32_c17_68f6] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_c_l32_c17_68f6_CLOCK_ENABLE <= VAR_device_ram_read_uxn_c_l32_c17_68f6_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_c_l32_c17_68f6_address <= VAR_device_ram_read_uxn_c_l32_c17_68f6_address;
     -- Outputs
     VAR_device_ram_read_uxn_c_l32_c17_68f6_return_output := device_ram_read_uxn_c_l32_c17_68f6_return_output;

     -- BIN_OP_EQ[uxn_c_l46_c6_6600] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l46_c6_6600_left <= VAR_BIN_OP_EQ_uxn_c_l46_c6_6600_left;
     BIN_OP_EQ_uxn_c_l46_c6_6600_right <= VAR_BIN_OP_EQ_uxn_c_l46_c6_6600_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l46_c6_6600_return_output := BIN_OP_EQ_uxn_c_l46_c6_6600_return_output;

     -- BIN_OP_PLUS[uxn_c_l54_c3_56b3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l54_c3_56b3_left <= VAR_BIN_OP_PLUS_uxn_c_l54_c3_56b3_left;
     BIN_OP_PLUS_uxn_c_l54_c3_56b3_right <= VAR_BIN_OP_PLUS_uxn_c_l54_c3_56b3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l54_c3_56b3_return_output := BIN_OP_PLUS_uxn_c_l54_c3_56b3_return_output;

     -- pc_get[uxn_c_l30_c7_7701] LATENCY=0
     -- Clock enable
     pc_get_uxn_c_l30_c7_7701_CLOCK_ENABLE <= VAR_pc_get_uxn_c_l30_c7_7701_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_c_l30_c7_7701_return_output := pc_get_uxn_c_l30_c7_7701_return_output;

     -- BIN_OP_XOR[uxn_c_l48_c12_9e2a] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l48_c12_9e2a_left <= VAR_BIN_OP_XOR_uxn_c_l48_c12_9e2a_left;
     BIN_OP_XOR_uxn_c_l48_c12_9e2a_right <= VAR_BIN_OP_XOR_uxn_c_l48_c12_9e2a_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l48_c12_9e2a_return_output := BIN_OP_XOR_uxn_c_l48_c12_9e2a_return_output;

     -- Submodule level 1
     VAR_counter_MUX_uxn_c_l46_c2_03f6_cond := VAR_BIN_OP_EQ_uxn_c_l46_c6_6600_return_output;
     VAR_result_MUX_uxn_c_l46_c2_03f6_cond := VAR_BIN_OP_EQ_uxn_c_l46_c6_6600_return_output;
     VAR_counter_uxn_c_l54_c3_a61c := resize(VAR_BIN_OP_PLUS_uxn_c_l54_c3_56b3_return_output, 32);
     VAR_BIN_OP_XOR_uxn_c_l49_c12_7a11_left := VAR_BIN_OP_XOR_uxn_c_l48_c12_9e2a_return_output;
     VAR_BIN_OP_EQ_uxn_c_l33_c22_dde7_left := VAR_device_ram_read_uxn_c_l32_c17_68f6_return_output;
     REG_VAR_system_state := VAR_device_ram_read_uxn_c_l32_c17_68f6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l31_c15_f990_left := VAR_pc_get_uxn_c_l30_c7_7701_return_output;
     VAR_main_ram_read_uxn_c_l37_c9_223d_address := VAR_pc_get_uxn_c_l30_c7_7701_return_output;
     REG_VAR_pc := VAR_pc_get_uxn_c_l30_c7_7701_return_output;
     VAR_counter_MUX_uxn_c_l46_c2_03f6_iffalse := VAR_counter_uxn_c_l54_c3_a61c;
     -- counter_MUX[uxn_c_l46_c2_03f6] LATENCY=0
     -- Inputs
     counter_MUX_uxn_c_l46_c2_03f6_cond <= VAR_counter_MUX_uxn_c_l46_c2_03f6_cond;
     counter_MUX_uxn_c_l46_c2_03f6_iftrue <= VAR_counter_MUX_uxn_c_l46_c2_03f6_iftrue;
     counter_MUX_uxn_c_l46_c2_03f6_iffalse <= VAR_counter_MUX_uxn_c_l46_c2_03f6_iffalse;
     -- Outputs
     VAR_counter_MUX_uxn_c_l46_c2_03f6_return_output := counter_MUX_uxn_c_l46_c2_03f6_return_output;

     -- BIN_OP_EQ[uxn_c_l31_c15_f990] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l31_c15_f990_left <= VAR_BIN_OP_EQ_uxn_c_l31_c15_f990_left;
     BIN_OP_EQ_uxn_c_l31_c15_f990_right <= VAR_BIN_OP_EQ_uxn_c_l31_c15_f990_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l31_c15_f990_return_output := BIN_OP_EQ_uxn_c_l31_c15_f990_return_output;

     -- BIN_OP_EQ[uxn_c_l33_c22_dde7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l33_c22_dde7_left <= VAR_BIN_OP_EQ_uxn_c_l33_c22_dde7_left;
     BIN_OP_EQ_uxn_c_l33_c22_dde7_right <= VAR_BIN_OP_EQ_uxn_c_l33_c22_dde7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l33_c22_dde7_return_output := BIN_OP_EQ_uxn_c_l33_c22_dde7_return_output;

     -- BIN_OP_XOR[uxn_c_l49_c12_7a11] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l49_c12_7a11_left <= VAR_BIN_OP_XOR_uxn_c_l49_c12_7a11_left;
     BIN_OP_XOR_uxn_c_l49_c12_7a11_right <= VAR_BIN_OP_XOR_uxn_c_l49_c12_7a11_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l49_c12_7a11_return_output := BIN_OP_XOR_uxn_c_l49_c12_7a11_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l31_c15_4659_cond := VAR_BIN_OP_EQ_uxn_c_l31_c15_f990_return_output;
     VAR_MUX_uxn_c_l33_c22_c15d_cond := VAR_BIN_OP_EQ_uxn_c_l33_c22_dde7_return_output;
     VAR_BIN_OP_XOR_uxn_c_l50_c12_9dc1_left := VAR_BIN_OP_XOR_uxn_c_l49_c12_7a11_return_output;
     VAR_BIN_OP_EQ_uxn_c_l57_c6_7a96_left := VAR_counter_MUX_uxn_c_l46_c2_03f6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l61_c6_6ced_left := VAR_counter_MUX_uxn_c_l46_c2_03f6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l66_c6_977d_left := VAR_counter_MUX_uxn_c_l46_c2_03f6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l70_c6_f819_left := VAR_counter_MUX_uxn_c_l46_c2_03f6_return_output;
     VAR_BIN_OP_EQ_uxn_c_l74_c6_7721_left := VAR_counter_MUX_uxn_c_l46_c2_03f6_return_output;
     REG_VAR_counter := VAR_counter_MUX_uxn_c_l46_c2_03f6_return_output;
     -- MUX[uxn_c_l33_c22_c15d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l33_c22_c15d_cond <= VAR_MUX_uxn_c_l33_c22_c15d_cond;
     MUX_uxn_c_l33_c22_c15d_iftrue <= VAR_MUX_uxn_c_l33_c22_c15d_iftrue;
     MUX_uxn_c_l33_c22_c15d_iffalse <= VAR_MUX_uxn_c_l33_c22_c15d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l33_c22_c15d_return_output := MUX_uxn_c_l33_c22_c15d_return_output;

     -- BIN_OP_EQ[uxn_c_l74_c6_7721] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l74_c6_7721_left <= VAR_BIN_OP_EQ_uxn_c_l74_c6_7721_left;
     BIN_OP_EQ_uxn_c_l74_c6_7721_right <= VAR_BIN_OP_EQ_uxn_c_l74_c6_7721_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l74_c6_7721_return_output := BIN_OP_EQ_uxn_c_l74_c6_7721_return_output;

     -- MUX[uxn_c_l31_c15_4659] LATENCY=0
     -- Inputs
     MUX_uxn_c_l31_c15_4659_cond <= VAR_MUX_uxn_c_l31_c15_4659_cond;
     MUX_uxn_c_l31_c15_4659_iftrue <= VAR_MUX_uxn_c_l31_c15_4659_iftrue;
     MUX_uxn_c_l31_c15_4659_iffalse <= VAR_MUX_uxn_c_l31_c15_4659_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l31_c15_4659_return_output := MUX_uxn_c_l31_c15_4659_return_output;

     -- BIN_OP_EQ[uxn_c_l66_c6_977d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l66_c6_977d_left <= VAR_BIN_OP_EQ_uxn_c_l66_c6_977d_left;
     BIN_OP_EQ_uxn_c_l66_c6_977d_right <= VAR_BIN_OP_EQ_uxn_c_l66_c6_977d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l66_c6_977d_return_output := BIN_OP_EQ_uxn_c_l66_c6_977d_return_output;

     -- BIN_OP_EQ[uxn_c_l61_c6_6ced] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l61_c6_6ced_left <= VAR_BIN_OP_EQ_uxn_c_l61_c6_6ced_left;
     BIN_OP_EQ_uxn_c_l61_c6_6ced_right <= VAR_BIN_OP_EQ_uxn_c_l61_c6_6ced_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l61_c6_6ced_return_output := BIN_OP_EQ_uxn_c_l61_c6_6ced_return_output;

     -- BIN_OP_XOR[uxn_c_l50_c12_9dc1] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l50_c12_9dc1_left <= VAR_BIN_OP_XOR_uxn_c_l50_c12_9dc1_left;
     BIN_OP_XOR_uxn_c_l50_c12_9dc1_right <= VAR_BIN_OP_XOR_uxn_c_l50_c12_9dc1_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l50_c12_9dc1_return_output := BIN_OP_XOR_uxn_c_l50_c12_9dc1_return_output;

     -- BIN_OP_EQ[uxn_c_l70_c6_f819] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l70_c6_f819_left <= VAR_BIN_OP_EQ_uxn_c_l70_c6_f819_left;
     BIN_OP_EQ_uxn_c_l70_c6_f819_right <= VAR_BIN_OP_EQ_uxn_c_l70_c6_f819_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l70_c6_f819_return_output := BIN_OP_EQ_uxn_c_l70_c6_f819_return_output;

     -- BIN_OP_EQ[uxn_c_l57_c6_7a96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l57_c6_7a96_left <= VAR_BIN_OP_EQ_uxn_c_l57_c6_7a96_left;
     BIN_OP_EQ_uxn_c_l57_c6_7a96_right <= VAR_BIN_OP_EQ_uxn_c_l57_c6_7a96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l57_c6_7a96_return_output := BIN_OP_EQ_uxn_c_l57_c6_7a96_return_output;

     -- Submodule level 3
     VAR_result_MUX_uxn_c_l57_c2_4c05_cond := VAR_BIN_OP_EQ_uxn_c_l57_c6_7a96_return_output;
     VAR_result_MUX_uxn_c_l61_c2_2e4f_cond := VAR_BIN_OP_EQ_uxn_c_l61_c6_6ced_return_output;
     VAR_result_MUX_uxn_c_l66_c2_9562_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_977d_return_output;
     VAR_result_MUX_uxn_c_l70_c2_7d0c_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_f819_return_output;
     VAR_result_MUX_uxn_c_l74_c2_9646_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_7721_return_output;
     VAR_BIN_OP_XOR_uxn_c_l51_c12_cb75_left := VAR_BIN_OP_XOR_uxn_c_l50_c12_9dc1_return_output;
     VAR_BIN_OP_AND_uxn_c_l34_c16_d671_left := VAR_MUX_uxn_c_l31_c15_4659_return_output;
     REG_VAR_pc_nonzero := VAR_MUX_uxn_c_l31_c15_4659_return_output;
     VAR_BIN_OP_AND_uxn_c_l34_c16_d671_right := VAR_MUX_uxn_c_l33_c22_c15d_return_output;
     REG_VAR_system_state_zero := VAR_MUX_uxn_c_l33_c22_c15d_return_output;
     -- BIN_OP_XOR[uxn_c_l51_c12_cb75] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l51_c12_cb75_left <= VAR_BIN_OP_XOR_uxn_c_l51_c12_cb75_left;
     BIN_OP_XOR_uxn_c_l51_c12_cb75_right <= VAR_BIN_OP_XOR_uxn_c_l51_c12_cb75_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l51_c12_cb75_return_output := BIN_OP_XOR_uxn_c_l51_c12_cb75_return_output;

     -- BIN_OP_AND[uxn_c_l34_c16_d671] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l34_c16_d671_left <= VAR_BIN_OP_AND_uxn_c_l34_c16_d671_left;
     BIN_OP_AND_uxn_c_l34_c16_d671_right <= VAR_BIN_OP_AND_uxn_c_l34_c16_d671_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l34_c16_d671_return_output := BIN_OP_AND_uxn_c_l34_c16_d671_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_cond := VAR_BIN_OP_AND_uxn_c_l34_c16_d671_return_output;
     VAR_error_MUX_uxn_c_l36_c2_2fb1_cond := VAR_BIN_OP_AND_uxn_c_l34_c16_d671_return_output;
     VAR_ins_MUX_uxn_c_l36_c2_2fb1_cond := VAR_BIN_OP_AND_uxn_c_l34_c16_d671_return_output;
     VAR_k_MUX_uxn_c_l36_c2_2fb1_cond := VAR_BIN_OP_AND_uxn_c_l34_c16_d671_return_output;
     VAR_opc_MUX_uxn_c_l36_c2_2fb1_cond := VAR_BIN_OP_AND_uxn_c_l34_c16_d671_return_output;
     VAR_s_MUX_uxn_c_l36_c2_2fb1_cond := VAR_BIN_OP_AND_uxn_c_l34_c16_d671_return_output;
     REG_VAR_should_eval := VAR_BIN_OP_AND_uxn_c_l34_c16_d671_return_output;
     VAR_result_MUX_uxn_c_l46_c2_03f6_iftrue := VAR_BIN_OP_XOR_uxn_c_l51_c12_cb75_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_8202] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_return_output;

     -- result_MUX[uxn_c_l46_c2_03f6] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l46_c2_03f6_cond <= VAR_result_MUX_uxn_c_l46_c2_03f6_cond;
     result_MUX_uxn_c_l46_c2_03f6_iftrue <= VAR_result_MUX_uxn_c_l46_c2_03f6_iftrue;
     result_MUX_uxn_c_l46_c2_03f6_iffalse <= VAR_result_MUX_uxn_c_l46_c2_03f6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l46_c2_03f6_return_output := result_MUX_uxn_c_l46_c2_03f6_return_output;

     -- Submodule level 5
     VAR_eval_opcode_uxn_c_l42_c11_7bc6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_return_output;
     VAR_main_ram_read_uxn_c_l37_c9_223d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_return_output;
     VAR_pc_add_uxn_c_l38_c3_0e56_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8202_return_output;
     VAR_BIN_OP_XOR_uxn_c_l58_c12_2538_left := VAR_result_MUX_uxn_c_l46_c2_03f6_return_output;
     VAR_result_MUX_uxn_c_l57_c2_4c05_iffalse := VAR_result_MUX_uxn_c_l46_c2_03f6_return_output;
     -- BIN_OP_XOR[uxn_c_l58_c12_2538] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l58_c12_2538_left <= VAR_BIN_OP_XOR_uxn_c_l58_c12_2538_left;
     BIN_OP_XOR_uxn_c_l58_c12_2538_right <= VAR_BIN_OP_XOR_uxn_c_l58_c12_2538_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l58_c12_2538_return_output := BIN_OP_XOR_uxn_c_l58_c12_2538_return_output;

     -- pc_add[uxn_c_l38_c3_0e56] LATENCY=0
     -- Clock enable
     pc_add_uxn_c_l38_c3_0e56_CLOCK_ENABLE <= VAR_pc_add_uxn_c_l38_c3_0e56_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_c_l38_c3_0e56_adjustment <= VAR_pc_add_uxn_c_l38_c3_0e56_adjustment;
     -- Outputs

     -- main_ram_read[uxn_c_l37_c9_223d] LATENCY=0
     -- Clock enable
     main_ram_read_uxn_c_l37_c9_223d_CLOCK_ENABLE <= VAR_main_ram_read_uxn_c_l37_c9_223d_CLOCK_ENABLE;
     -- Inputs
     main_ram_read_uxn_c_l37_c9_223d_address <= VAR_main_ram_read_uxn_c_l37_c9_223d_address;
     -- Outputs
     VAR_main_ram_read_uxn_c_l37_c9_223d_return_output := main_ram_read_uxn_c_l37_c9_223d_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_c_l57_c2_4c05_iftrue := VAR_BIN_OP_XOR_uxn_c_l58_c12_2538_return_output;
     VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_left := VAR_main_ram_read_uxn_c_l37_c9_223d_return_output;
     -- BIN_OP_AND[uxn_c_l37_c9_50d0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l37_c9_50d0_left <= VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_left;
     BIN_OP_AND_uxn_c_l37_c9_50d0_right <= VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_return_output := BIN_OP_AND_uxn_c_l37_c9_50d0_return_output;

     -- result_MUX[uxn_c_l57_c2_4c05] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l57_c2_4c05_cond <= VAR_result_MUX_uxn_c_l57_c2_4c05_cond;
     result_MUX_uxn_c_l57_c2_4c05_iftrue <= VAR_result_MUX_uxn_c_l57_c2_4c05_iftrue;
     result_MUX_uxn_c_l57_c2_4c05_iffalse <= VAR_result_MUX_uxn_c_l57_c2_4c05_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l57_c2_4c05_return_output := result_MUX_uxn_c_l57_c2_4c05_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l39_c7_a24d_left := VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_return_output;
     VAR_BIN_OP_AND_uxn_c_l40_c7_e7e9_left := VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_return_output;
     VAR_BIN_OP_AND_uxn_c_l41_c11_da79_left := VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_return_output;
     VAR_BIN_OP_AND_uxn_c_l41_c51_3506_left := VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_return_output;
     VAR_CONST_SR_5_uxn_c_l41_c31_a679_x := VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_return_output;
     VAR_eval_opcode_uxn_c_l42_c11_7bc6_ins := VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_return_output;
     VAR_ins_MUX_uxn_c_l36_c2_2fb1_iftrue := VAR_BIN_OP_AND_uxn_c_l37_c9_50d0_return_output;
     VAR_BIN_OP_XOR_uxn_c_l62_c12_632c_left := VAR_result_MUX_uxn_c_l57_c2_4c05_return_output;
     VAR_result_MUX_uxn_c_l61_c2_2e4f_iffalse := VAR_result_MUX_uxn_c_l57_c2_4c05_return_output;
     -- BIN_OP_AND[uxn_c_l41_c11_da79] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l41_c11_da79_left <= VAR_BIN_OP_AND_uxn_c_l41_c11_da79_left;
     BIN_OP_AND_uxn_c_l41_c11_da79_right <= VAR_BIN_OP_AND_uxn_c_l41_c11_da79_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l41_c11_da79_return_output := BIN_OP_AND_uxn_c_l41_c11_da79_return_output;

     -- BIN_OP_AND[uxn_c_l39_c7_a24d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l39_c7_a24d_left <= VAR_BIN_OP_AND_uxn_c_l39_c7_a24d_left;
     BIN_OP_AND_uxn_c_l39_c7_a24d_right <= VAR_BIN_OP_AND_uxn_c_l39_c7_a24d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l39_c7_a24d_return_output := BIN_OP_AND_uxn_c_l39_c7_a24d_return_output;

     -- BIN_OP_AND[uxn_c_l41_c51_3506] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l41_c51_3506_left <= VAR_BIN_OP_AND_uxn_c_l41_c51_3506_left;
     BIN_OP_AND_uxn_c_l41_c51_3506_right <= VAR_BIN_OP_AND_uxn_c_l41_c51_3506_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l41_c51_3506_return_output := BIN_OP_AND_uxn_c_l41_c51_3506_return_output;

     -- CONST_SR_5[uxn_c_l41_c31_a679] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_c_l41_c31_a679_x <= VAR_CONST_SR_5_uxn_c_l41_c31_a679_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_c_l41_c31_a679_return_output := CONST_SR_5_uxn_c_l41_c31_a679_return_output;

     -- BIN_OP_XOR[uxn_c_l62_c12_632c] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l62_c12_632c_left <= VAR_BIN_OP_XOR_uxn_c_l62_c12_632c_left;
     BIN_OP_XOR_uxn_c_l62_c12_632c_right <= VAR_BIN_OP_XOR_uxn_c_l62_c12_632c_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l62_c12_632c_return_output := BIN_OP_XOR_uxn_c_l62_c12_632c_return_output;

     -- ins_MUX[uxn_c_l36_c2_2fb1] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l36_c2_2fb1_cond <= VAR_ins_MUX_uxn_c_l36_c2_2fb1_cond;
     ins_MUX_uxn_c_l36_c2_2fb1_iftrue <= VAR_ins_MUX_uxn_c_l36_c2_2fb1_iftrue;
     ins_MUX_uxn_c_l36_c2_2fb1_iffalse <= VAR_ins_MUX_uxn_c_l36_c2_2fb1_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l36_c2_2fb1_return_output := ins_MUX_uxn_c_l36_c2_2fb1_return_output;

     -- BIN_OP_AND[uxn_c_l40_c7_e7e9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c7_e7e9_left <= VAR_BIN_OP_AND_uxn_c_l40_c7_e7e9_left;
     BIN_OP_AND_uxn_c_l40_c7_e7e9_right <= VAR_BIN_OP_AND_uxn_c_l40_c7_e7e9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c7_e7e9_return_output := BIN_OP_AND_uxn_c_l40_c7_e7e9_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l39_c7_b7f7_cond := resize(VAR_BIN_OP_AND_uxn_c_l39_c7_a24d_return_output, 1);
     VAR_MUX_uxn_c_l40_c7_4b48_cond := resize(VAR_BIN_OP_AND_uxn_c_l40_c7_e7e9_return_output, 1);
     VAR_UNARY_OP_NOT_uxn_c_l41_c11_fa0a_expr := VAR_BIN_OP_AND_uxn_c_l41_c11_da79_return_output;
     VAR_MUX_uxn_c_l41_c11_6383_iffalse := VAR_BIN_OP_AND_uxn_c_l41_c51_3506_return_output;
     VAR_BIN_OP_XOR_uxn_c_l63_c12_4819_left := VAR_BIN_OP_XOR_uxn_c_l62_c12_632c_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l41_c26_0cd7_right := VAR_CONST_SR_5_uxn_c_l41_c31_a679_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l36_c2_2fb1_return_output;
     -- BIN_OP_MINUS[uxn_c_l41_c26_0cd7] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l41_c26_0cd7_left <= VAR_BIN_OP_MINUS_uxn_c_l41_c26_0cd7_left;
     BIN_OP_MINUS_uxn_c_l41_c26_0cd7_right <= VAR_BIN_OP_MINUS_uxn_c_l41_c26_0cd7_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l41_c26_0cd7_return_output := BIN_OP_MINUS_uxn_c_l41_c26_0cd7_return_output;

     -- UNARY_OP_NOT[uxn_c_l41_c11_fa0a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l41_c11_fa0a_expr <= VAR_UNARY_OP_NOT_uxn_c_l41_c11_fa0a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l41_c11_fa0a_return_output := UNARY_OP_NOT_uxn_c_l41_c11_fa0a_return_output;

     -- MUX[uxn_c_l40_c7_4b48] LATENCY=0
     -- Inputs
     MUX_uxn_c_l40_c7_4b48_cond <= VAR_MUX_uxn_c_l40_c7_4b48_cond;
     MUX_uxn_c_l40_c7_4b48_iftrue <= VAR_MUX_uxn_c_l40_c7_4b48_iftrue;
     MUX_uxn_c_l40_c7_4b48_iffalse <= VAR_MUX_uxn_c_l40_c7_4b48_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l40_c7_4b48_return_output := MUX_uxn_c_l40_c7_4b48_return_output;

     -- MUX[uxn_c_l39_c7_b7f7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l39_c7_b7f7_cond <= VAR_MUX_uxn_c_l39_c7_b7f7_cond;
     MUX_uxn_c_l39_c7_b7f7_iftrue <= VAR_MUX_uxn_c_l39_c7_b7f7_iftrue;
     MUX_uxn_c_l39_c7_b7f7_iffalse <= VAR_MUX_uxn_c_l39_c7_b7f7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l39_c7_b7f7_return_output := MUX_uxn_c_l39_c7_b7f7_return_output;

     -- BIN_OP_XOR[uxn_c_l63_c12_4819] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l63_c12_4819_left <= VAR_BIN_OP_XOR_uxn_c_l63_c12_4819_left;
     BIN_OP_XOR_uxn_c_l63_c12_4819_right <= VAR_BIN_OP_XOR_uxn_c_l63_c12_4819_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l63_c12_4819_return_output := BIN_OP_XOR_uxn_c_l63_c12_4819_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l41_c26_bc56_left := VAR_BIN_OP_MINUS_uxn_c_l41_c26_0cd7_return_output;
     VAR_result_MUX_uxn_c_l61_c2_2e4f_iftrue := VAR_BIN_OP_XOR_uxn_c_l63_c12_4819_return_output;
     VAR_eval_opcode_uxn_c_l42_c11_7bc6_k := VAR_MUX_uxn_c_l39_c7_b7f7_return_output;
     VAR_k_MUX_uxn_c_l36_c2_2fb1_iftrue := VAR_MUX_uxn_c_l39_c7_b7f7_return_output;
     VAR_eval_opcode_uxn_c_l42_c11_7bc6_stack_index := VAR_MUX_uxn_c_l40_c7_4b48_return_output;
     VAR_s_MUX_uxn_c_l36_c2_2fb1_iftrue := VAR_MUX_uxn_c_l40_c7_4b48_return_output;
     VAR_MUX_uxn_c_l41_c11_6383_cond := resize(VAR_UNARY_OP_NOT_uxn_c_l41_c11_fa0a_return_output, 1);
     -- result_MUX[uxn_c_l61_c2_2e4f] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l61_c2_2e4f_cond <= VAR_result_MUX_uxn_c_l61_c2_2e4f_cond;
     result_MUX_uxn_c_l61_c2_2e4f_iftrue <= VAR_result_MUX_uxn_c_l61_c2_2e4f_iftrue;
     result_MUX_uxn_c_l61_c2_2e4f_iffalse <= VAR_result_MUX_uxn_c_l61_c2_2e4f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l61_c2_2e4f_return_output := result_MUX_uxn_c_l61_c2_2e4f_return_output;

     -- s_MUX[uxn_c_l36_c2_2fb1] LATENCY=0
     -- Inputs
     s_MUX_uxn_c_l36_c2_2fb1_cond <= VAR_s_MUX_uxn_c_l36_c2_2fb1_cond;
     s_MUX_uxn_c_l36_c2_2fb1_iftrue <= VAR_s_MUX_uxn_c_l36_c2_2fb1_iftrue;
     s_MUX_uxn_c_l36_c2_2fb1_iffalse <= VAR_s_MUX_uxn_c_l36_c2_2fb1_iffalse;
     -- Outputs
     VAR_s_MUX_uxn_c_l36_c2_2fb1_return_output := s_MUX_uxn_c_l36_c2_2fb1_return_output;

     -- k_MUX[uxn_c_l36_c2_2fb1] LATENCY=0
     -- Inputs
     k_MUX_uxn_c_l36_c2_2fb1_cond <= VAR_k_MUX_uxn_c_l36_c2_2fb1_cond;
     k_MUX_uxn_c_l36_c2_2fb1_iftrue <= VAR_k_MUX_uxn_c_l36_c2_2fb1_iftrue;
     k_MUX_uxn_c_l36_c2_2fb1_iffalse <= VAR_k_MUX_uxn_c_l36_c2_2fb1_iffalse;
     -- Outputs
     VAR_k_MUX_uxn_c_l36_c2_2fb1_return_output := k_MUX_uxn_c_l36_c2_2fb1_return_output;

     -- BIN_OP_AND[uxn_c_l41_c26_bc56] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l41_c26_bc56_left <= VAR_BIN_OP_AND_uxn_c_l41_c26_bc56_left;
     BIN_OP_AND_uxn_c_l41_c26_bc56_right <= VAR_BIN_OP_AND_uxn_c_l41_c26_bc56_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l41_c26_bc56_return_output := BIN_OP_AND_uxn_c_l41_c26_bc56_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l41_c11_6383_iftrue := VAR_BIN_OP_AND_uxn_c_l41_c26_bc56_return_output;
     REG_VAR_k := VAR_k_MUX_uxn_c_l36_c2_2fb1_return_output;
     VAR_BIN_OP_XOR_uxn_c_l67_c12_cfcc_left := VAR_result_MUX_uxn_c_l61_c2_2e4f_return_output;
     VAR_result_MUX_uxn_c_l66_c2_9562_iffalse := VAR_result_MUX_uxn_c_l61_c2_2e4f_return_output;
     REG_VAR_s := VAR_s_MUX_uxn_c_l36_c2_2fb1_return_output;
     -- BIN_OP_XOR[uxn_c_l67_c12_cfcc] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l67_c12_cfcc_left <= VAR_BIN_OP_XOR_uxn_c_l67_c12_cfcc_left;
     BIN_OP_XOR_uxn_c_l67_c12_cfcc_right <= VAR_BIN_OP_XOR_uxn_c_l67_c12_cfcc_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l67_c12_cfcc_return_output := BIN_OP_XOR_uxn_c_l67_c12_cfcc_return_output;

     -- MUX[uxn_c_l41_c11_6383] LATENCY=0
     -- Inputs
     MUX_uxn_c_l41_c11_6383_cond <= VAR_MUX_uxn_c_l41_c11_6383_cond;
     MUX_uxn_c_l41_c11_6383_iftrue <= VAR_MUX_uxn_c_l41_c11_6383_iftrue;
     MUX_uxn_c_l41_c11_6383_iffalse <= VAR_MUX_uxn_c_l41_c11_6383_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l41_c11_6383_return_output := MUX_uxn_c_l41_c11_6383_return_output;

     -- Submodule level 11
     VAR_result_MUX_uxn_c_l66_c2_9562_iftrue := VAR_BIN_OP_XOR_uxn_c_l67_c12_cfcc_return_output;
     VAR_eval_opcode_uxn_c_l42_c11_7bc6_opcode := VAR_MUX_uxn_c_l41_c11_6383_return_output;
     VAR_opc_MUX_uxn_c_l36_c2_2fb1_iftrue := VAR_MUX_uxn_c_l41_c11_6383_return_output;
     -- eval_opcode[uxn_c_l42_c11_7bc6] LATENCY=0
     -- Clock enable
     eval_opcode_uxn_c_l42_c11_7bc6_CLOCK_ENABLE <= VAR_eval_opcode_uxn_c_l42_c11_7bc6_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_uxn_c_l42_c11_7bc6_stack_index <= VAR_eval_opcode_uxn_c_l42_c11_7bc6_stack_index;
     eval_opcode_uxn_c_l42_c11_7bc6_opcode <= VAR_eval_opcode_uxn_c_l42_c11_7bc6_opcode;
     eval_opcode_uxn_c_l42_c11_7bc6_ins <= VAR_eval_opcode_uxn_c_l42_c11_7bc6_ins;
     eval_opcode_uxn_c_l42_c11_7bc6_k <= VAR_eval_opcode_uxn_c_l42_c11_7bc6_k;
     -- Outputs
     VAR_eval_opcode_uxn_c_l42_c11_7bc6_return_output := eval_opcode_uxn_c_l42_c11_7bc6_return_output;

     -- opc_MUX[uxn_c_l36_c2_2fb1] LATENCY=0
     -- Inputs
     opc_MUX_uxn_c_l36_c2_2fb1_cond <= VAR_opc_MUX_uxn_c_l36_c2_2fb1_cond;
     opc_MUX_uxn_c_l36_c2_2fb1_iftrue <= VAR_opc_MUX_uxn_c_l36_c2_2fb1_iftrue;
     opc_MUX_uxn_c_l36_c2_2fb1_iffalse <= VAR_opc_MUX_uxn_c_l36_c2_2fb1_iffalse;
     -- Outputs
     VAR_opc_MUX_uxn_c_l36_c2_2fb1_return_output := opc_MUX_uxn_c_l36_c2_2fb1_return_output;

     -- result_MUX[uxn_c_l66_c2_9562] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l66_c2_9562_cond <= VAR_result_MUX_uxn_c_l66_c2_9562_cond;
     result_MUX_uxn_c_l66_c2_9562_iftrue <= VAR_result_MUX_uxn_c_l66_c2_9562_iftrue;
     result_MUX_uxn_c_l66_c2_9562_iffalse <= VAR_result_MUX_uxn_c_l66_c2_9562_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l66_c2_9562_return_output := result_MUX_uxn_c_l66_c2_9562_return_output;

     -- Submodule level 12
     VAR_error_MUX_uxn_c_l36_c2_2fb1_iftrue := VAR_eval_opcode_uxn_c_l42_c11_7bc6_return_output;
     REG_VAR_opc := VAR_opc_MUX_uxn_c_l36_c2_2fb1_return_output;
     VAR_BIN_OP_XOR_uxn_c_l71_c12_321f_left := VAR_result_MUX_uxn_c_l66_c2_9562_return_output;
     VAR_result_MUX_uxn_c_l70_c2_7d0c_iffalse := VAR_result_MUX_uxn_c_l66_c2_9562_return_output;
     -- BIN_OP_XOR[uxn_c_l71_c12_321f] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l71_c12_321f_left <= VAR_BIN_OP_XOR_uxn_c_l71_c12_321f_left;
     BIN_OP_XOR_uxn_c_l71_c12_321f_right <= VAR_BIN_OP_XOR_uxn_c_l71_c12_321f_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l71_c12_321f_return_output := BIN_OP_XOR_uxn_c_l71_c12_321f_return_output;

     -- error_MUX[uxn_c_l36_c2_2fb1] LATENCY=0
     -- Inputs
     error_MUX_uxn_c_l36_c2_2fb1_cond <= VAR_error_MUX_uxn_c_l36_c2_2fb1_cond;
     error_MUX_uxn_c_l36_c2_2fb1_iftrue <= VAR_error_MUX_uxn_c_l36_c2_2fb1_iftrue;
     error_MUX_uxn_c_l36_c2_2fb1_iffalse <= VAR_error_MUX_uxn_c_l36_c2_2fb1_iffalse;
     -- Outputs
     VAR_error_MUX_uxn_c_l36_c2_2fb1_return_output := error_MUX_uxn_c_l36_c2_2fb1_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_c_l70_c2_7d0c_iftrue := VAR_BIN_OP_XOR_uxn_c_l71_c12_321f_return_output;
     VAR_MUX_uxn_c_l78_c36_8acb_cond := VAR_error_MUX_uxn_c_l36_c2_2fb1_return_output;
     REG_VAR_error := VAR_error_MUX_uxn_c_l36_c2_2fb1_return_output;
     -- MUX[uxn_c_l78_c36_8acb] LATENCY=0
     -- Inputs
     MUX_uxn_c_l78_c36_8acb_cond <= VAR_MUX_uxn_c_l78_c36_8acb_cond;
     MUX_uxn_c_l78_c36_8acb_iftrue <= VAR_MUX_uxn_c_l78_c36_8acb_iftrue;
     MUX_uxn_c_l78_c36_8acb_iffalse <= VAR_MUX_uxn_c_l78_c36_8acb_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l78_c36_8acb_return_output := MUX_uxn_c_l78_c36_8acb_return_output;

     -- result_MUX[uxn_c_l70_c2_7d0c] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l70_c2_7d0c_cond <= VAR_result_MUX_uxn_c_l70_c2_7d0c_cond;
     result_MUX_uxn_c_l70_c2_7d0c_iftrue <= VAR_result_MUX_uxn_c_l70_c2_7d0c_iftrue;
     result_MUX_uxn_c_l70_c2_7d0c_iffalse <= VAR_result_MUX_uxn_c_l70_c2_7d0c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l70_c2_7d0c_return_output := result_MUX_uxn_c_l70_c2_7d0c_return_output;

     -- Submodule level 14
     VAR_BIN_OP_OR_uxn_c_l78_c12_40ed_right := VAR_MUX_uxn_c_l78_c36_8acb_return_output;
     VAR_BIN_OP_XOR_uxn_c_l75_c12_0549_left := VAR_result_MUX_uxn_c_l70_c2_7d0c_return_output;
     VAR_result_MUX_uxn_c_l74_c2_9646_iffalse := VAR_result_MUX_uxn_c_l70_c2_7d0c_return_output;
     -- BIN_OP_XOR[uxn_c_l75_c12_0549] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l75_c12_0549_left <= VAR_BIN_OP_XOR_uxn_c_l75_c12_0549_left;
     BIN_OP_XOR_uxn_c_l75_c12_0549_right <= VAR_BIN_OP_XOR_uxn_c_l75_c12_0549_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l75_c12_0549_return_output := BIN_OP_XOR_uxn_c_l75_c12_0549_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_c_l74_c2_9646_iftrue := VAR_BIN_OP_XOR_uxn_c_l75_c12_0549_return_output;
     -- result_MUX[uxn_c_l74_c2_9646] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l74_c2_9646_cond <= VAR_result_MUX_uxn_c_l74_c2_9646_cond;
     result_MUX_uxn_c_l74_c2_9646_iftrue <= VAR_result_MUX_uxn_c_l74_c2_9646_iftrue;
     result_MUX_uxn_c_l74_c2_9646_iffalse <= VAR_result_MUX_uxn_c_l74_c2_9646_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l74_c2_9646_return_output := result_MUX_uxn_c_l74_c2_9646_return_output;

     -- Submodule level 16
     VAR_BIN_OP_AND_uxn_c_l78_c12_b433_left := VAR_result_MUX_uxn_c_l74_c2_9646_return_output;
     -- BIN_OP_AND[uxn_c_l78_c12_b433] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l78_c12_b433_left <= VAR_BIN_OP_AND_uxn_c_l78_c12_b433_left;
     BIN_OP_AND_uxn_c_l78_c12_b433_right <= VAR_BIN_OP_AND_uxn_c_l78_c12_b433_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l78_c12_b433_return_output := BIN_OP_AND_uxn_c_l78_c12_b433_return_output;

     -- Submodule level 17
     VAR_BIN_OP_OR_uxn_c_l78_c12_40ed_left := VAR_BIN_OP_AND_uxn_c_l78_c12_b433_return_output;
     -- BIN_OP_OR[uxn_c_l78_c12_40ed] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l78_c12_40ed_left <= VAR_BIN_OP_OR_uxn_c_l78_c12_40ed_left;
     BIN_OP_OR_uxn_c_l78_c12_40ed_right <= VAR_BIN_OP_OR_uxn_c_l78_c12_40ed_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l78_c12_40ed_return_output := BIN_OP_OR_uxn_c_l78_c12_40ed_return_output;

     -- Submodule level 18
     REG_VAR_result := VAR_BIN_OP_OR_uxn_c_l78_c12_40ed_return_output;
     VAR_return_output := VAR_BIN_OP_OR_uxn_c_l78_c12_40ed_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_led_error <= REG_VAR_led_error;
REG_COMB_led_blink <= REG_VAR_led_blink;
REG_COMB_led_r <= REG_VAR_led_r;
REG_COMB_led_g <= REG_VAR_led_g;
REG_COMB_led_b <= REG_VAR_led_b;
REG_COMB_result <= REG_VAR_result;
REG_COMB_counter <= REG_VAR_counter;
REG_COMB_s <= REG_VAR_s;
REG_COMB_pc_nonzero <= REG_VAR_pc_nonzero;
REG_COMB_system_state_zero <= REG_VAR_system_state_zero;
REG_COMB_should_eval <= REG_VAR_should_eval;
REG_COMB_error <= REG_VAR_error;
REG_COMB_k <= REG_VAR_k;
REG_COMB_opc <= REG_VAR_opc;
REG_COMB_ins <= REG_VAR_ins;
REG_COMB_system_state <= REG_VAR_system_state;
REG_COMB_pc <= REG_VAR_pc;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     led_error <= REG_COMB_led_error;
     led_blink <= REG_COMB_led_blink;
     led_r <= REG_COMB_led_r;
     led_g <= REG_COMB_led_g;
     led_b <= REG_COMB_led_b;
     result <= REG_COMB_result;
     counter <= REG_COMB_counter;
     s <= REG_COMB_s;
     pc_nonzero <= REG_COMB_pc_nonzero;
     system_state_zero <= REG_COMB_system_state_zero;
     should_eval <= REG_COMB_should_eval;
     error <= REG_COMB_error;
     k <= REG_COMB_k;
     opc <= REG_COMB_opc;
     ins <= REG_COMB_ins;
     system_state <= REG_COMB_system_state;
     pc <= REG_COMB_pc;
 end if;
 end if;
end process;

end arch;
