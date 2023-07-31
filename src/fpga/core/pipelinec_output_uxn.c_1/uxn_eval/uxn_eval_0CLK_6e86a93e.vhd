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
-- pc_get[uxn_c_l30_c7_2659]
signal pc_get_uxn_c_l30_c7_2659_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_c_l30_c7_2659_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l31_c15_f496]
signal BIN_OP_EQ_uxn_c_l31_c15_f496_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c15_f496_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c15_f496_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l31_c15_ae5f]
signal MUX_uxn_c_l31_c15_ae5f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l31_c15_ae5f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l31_c15_ae5f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l31_c15_ae5f_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_c_l32_c17_62dd]
signal device_ram_read_uxn_c_l32_c17_62dd_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_c_l32_c17_62dd_address : unsigned(7 downto 0);
signal device_ram_read_uxn_c_l32_c17_62dd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l33_c22_0940]
signal BIN_OP_EQ_uxn_c_l33_c22_0940_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l33_c22_0940_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l33_c22_0940_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l33_c22_5630]
signal MUX_uxn_c_l33_c22_5630_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l33_c22_5630_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l33_c22_5630_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l33_c22_5630_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l34_c16_9517]
signal BIN_OP_AND_uxn_c_l34_c16_9517_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l34_c16_9517_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l34_c16_9517_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_3134]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l36_c2_19e1]
signal ins_MUX_uxn_c_l36_c2_19e1_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l36_c2_19e1_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l36_c2_19e1_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l36_c2_19e1_return_output : unsigned(7 downto 0);

-- opc_MUX[uxn_c_l36_c2_19e1]
signal opc_MUX_uxn_c_l36_c2_19e1_cond : unsigned(0 downto 0);
signal opc_MUX_uxn_c_l36_c2_19e1_iftrue : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l36_c2_19e1_iffalse : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l36_c2_19e1_return_output : unsigned(7 downto 0);

-- error_MUX[uxn_c_l36_c2_19e1]
signal error_MUX_uxn_c_l36_c2_19e1_cond : unsigned(0 downto 0);
signal error_MUX_uxn_c_l36_c2_19e1_iftrue : unsigned(0 downto 0);
signal error_MUX_uxn_c_l36_c2_19e1_iffalse : unsigned(0 downto 0);
signal error_MUX_uxn_c_l36_c2_19e1_return_output : unsigned(0 downto 0);

-- s_MUX[uxn_c_l36_c2_19e1]
signal s_MUX_uxn_c_l36_c2_19e1_cond : unsigned(0 downto 0);
signal s_MUX_uxn_c_l36_c2_19e1_iftrue : unsigned(0 downto 0);
signal s_MUX_uxn_c_l36_c2_19e1_iffalse : unsigned(0 downto 0);
signal s_MUX_uxn_c_l36_c2_19e1_return_output : unsigned(0 downto 0);

-- k_MUX[uxn_c_l36_c2_19e1]
signal k_MUX_uxn_c_l36_c2_19e1_cond : unsigned(0 downto 0);
signal k_MUX_uxn_c_l36_c2_19e1_iftrue : unsigned(7 downto 0);
signal k_MUX_uxn_c_l36_c2_19e1_iffalse : unsigned(7 downto 0);
signal k_MUX_uxn_c_l36_c2_19e1_return_output : unsigned(7 downto 0);

-- main_ram_read[uxn_c_l37_c9_b034]
signal main_ram_read_uxn_c_l37_c9_b034_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_read_uxn_c_l37_c9_b034_address : unsigned(15 downto 0);
signal main_ram_read_uxn_c_l37_c9_b034_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l37_c9_842a]
signal BIN_OP_AND_uxn_c_l37_c9_842a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l37_c9_842a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l37_c9_842a_return_output : unsigned(7 downto 0);

-- pc_add[uxn_c_l38_c3_51e8]
signal pc_add_uxn_c_l38_c3_51e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_c_l38_c3_51e8_adjustment : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l39_c7_d281]
signal BIN_OP_AND_uxn_c_l39_c7_d281_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_d281_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_d281_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l39_c7_11c2]
signal MUX_uxn_c_l39_c7_11c2_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_11c2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l39_c7_11c2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l39_c7_11c2_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l40_c7_7e9c]
signal BIN_OP_AND_uxn_c_l40_c7_7e9c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c7_7e9c_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_c_l40_c7_7e9c_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l40_c7_e722]
signal MUX_uxn_c_l40_c7_e722_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l40_c7_e722_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l40_c7_e722_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l40_c7_e722_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l41_c11_253e]
signal BIN_OP_AND_uxn_c_l41_c11_253e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l41_c11_253e_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_c_l41_c11_253e_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l41_c11_1cf2]
signal UNARY_OP_NOT_uxn_c_l41_c11_1cf2_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_c_l41_c11_1cf2_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_c_l41_c31_52c2]
signal CONST_SR_5_uxn_c_l41_c31_52c2_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_c_l41_c31_52c2_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l41_c26_feb2]
signal BIN_OP_MINUS_uxn_c_l41_c26_feb2_left : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l41_c26_feb2_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l41_c26_feb2_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l41_c26_429f]
signal BIN_OP_AND_uxn_c_l41_c26_429f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l41_c26_429f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l41_c26_429f_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l41_c51_27e5]
signal BIN_OP_AND_uxn_c_l41_c51_27e5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l41_c51_27e5_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_c_l41_c51_27e5_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l41_c11_c190]
signal MUX_uxn_c_l41_c11_c190_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l41_c11_c190_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l41_c11_c190_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l41_c11_c190_return_output : unsigned(7 downto 0);

-- eval_opcode[uxn_c_l42_c11_91fe]
signal eval_opcode_uxn_c_l42_c11_91fe_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l42_c11_91fe_stack_index : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l42_c11_91fe_opcode : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l42_c11_91fe_ins : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l42_c11_91fe_k : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l42_c11_91fe_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l46_c6_ca20]
signal BIN_OP_EQ_uxn_c_l46_c6_ca20_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l46_c6_ca20_right : unsigned(22 downto 0);
signal BIN_OP_EQ_uxn_c_l46_c6_ca20_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l46_c2_f883]
signal result_MUX_uxn_c_l46_c2_f883_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l46_c2_f883_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_c_l46_c2_f883_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_c_l46_c2_f883_return_output : unsigned(7 downto 0);

-- counter_MUX[uxn_c_l46_c2_f883]
signal counter_MUX_uxn_c_l46_c2_f883_cond : unsigned(0 downto 0);
signal counter_MUX_uxn_c_l46_c2_f883_iftrue : unsigned(31 downto 0);
signal counter_MUX_uxn_c_l46_c2_f883_iffalse : unsigned(31 downto 0);
signal counter_MUX_uxn_c_l46_c2_f883_return_output : unsigned(31 downto 0);

-- BIN_OP_XOR[uxn_c_l48_c12_dc89]
signal BIN_OP_XOR_uxn_c_l48_c12_dc89_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l48_c12_dc89_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l48_c12_dc89_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l49_c12_f545]
signal BIN_OP_XOR_uxn_c_l49_c12_f545_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l49_c12_f545_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l49_c12_f545_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l50_c12_a76c]
signal BIN_OP_XOR_uxn_c_l50_c12_a76c_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l50_c12_a76c_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l50_c12_a76c_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l51_c12_308d]
signal BIN_OP_XOR_uxn_c_l51_c12_308d_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l51_c12_308d_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l51_c12_308d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l54_c3_7a5f]
signal BIN_OP_PLUS_uxn_c_l54_c3_7a5f_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l54_c3_7a5f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l54_c3_7a5f_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l57_c6_08f1]
signal BIN_OP_EQ_uxn_c_l57_c6_08f1_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l57_c6_08f1_right : unsigned(22 downto 0);
signal BIN_OP_EQ_uxn_c_l57_c6_08f1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l57_c2_1915]
signal result_MUX_uxn_c_l57_c2_1915_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l57_c2_1915_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_c_l57_c2_1915_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_c_l57_c2_1915_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l58_c12_dd63]
signal BIN_OP_XOR_uxn_c_l58_c12_dd63_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l58_c12_dd63_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l58_c12_dd63_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l61_c6_6216]
signal BIN_OP_EQ_uxn_c_l61_c6_6216_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l61_c6_6216_right : unsigned(21 downto 0);
signal BIN_OP_EQ_uxn_c_l61_c6_6216_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l61_c2_0b81]
signal result_MUX_uxn_c_l61_c2_0b81_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l61_c2_0b81_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_c_l61_c2_0b81_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_c_l61_c2_0b81_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l62_c12_2b10]
signal BIN_OP_XOR_uxn_c_l62_c12_2b10_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l62_c12_2b10_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l62_c12_2b10_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l63_c12_a791]
signal BIN_OP_XOR_uxn_c_l63_c12_a791_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l63_c12_a791_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l63_c12_a791_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l66_c6_5114]
signal BIN_OP_EQ_uxn_c_l66_c6_5114_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l66_c6_5114_right : unsigned(20 downto 0);
signal BIN_OP_EQ_uxn_c_l66_c6_5114_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l66_c2_1a86]
signal result_MUX_uxn_c_l66_c2_1a86_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l66_c2_1a86_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_c_l66_c2_1a86_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_c_l66_c2_1a86_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l67_c12_71e3]
signal BIN_OP_XOR_uxn_c_l67_c12_71e3_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l67_c12_71e3_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l67_c12_71e3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l70_c6_0354]
signal BIN_OP_EQ_uxn_c_l70_c6_0354_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l70_c6_0354_right : unsigned(21 downto 0);
signal BIN_OP_EQ_uxn_c_l70_c6_0354_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l70_c2_ec4c]
signal result_MUX_uxn_c_l70_c2_ec4c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l70_c2_ec4c_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_c_l70_c2_ec4c_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_c_l70_c2_ec4c_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l71_c12_1372]
signal BIN_OP_XOR_uxn_c_l71_c12_1372_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l71_c12_1372_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l71_c12_1372_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l74_c6_f64d]
signal BIN_OP_EQ_uxn_c_l74_c6_f64d_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c6_f64d_right : unsigned(20 downto 0);
signal BIN_OP_EQ_uxn_c_l74_c6_f64d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l74_c2_a90d]
signal result_MUX_uxn_c_l74_c2_a90d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l74_c2_a90d_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_c_l74_c2_a90d_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_c_l74_c2_a90d_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_c_l75_c12_9ae2]
signal BIN_OP_XOR_uxn_c_l75_c12_9ae2_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l75_c12_9ae2_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_c_l75_c12_9ae2_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l78_c12_5c88]
signal BIN_OP_AND_uxn_c_l78_c12_5c88_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l78_c12_5c88_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_c_l78_c12_5c88_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l78_c36_2a82]
signal MUX_uxn_c_l78_c36_2a82_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l78_c36_2a82_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l78_c36_2a82_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l78_c36_2a82_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_c_l78_c12_9c6e]
signal BIN_OP_OR_uxn_c_l78_c12_9c6e_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_c_l78_c12_9c6e_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_c_l78_c12_9c6e_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_c_l30_c7_2659
pc_get_uxn_c_l30_c7_2659 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_c_l30_c7_2659_CLOCK_ENABLE,
pc_get_uxn_c_l30_c7_2659_return_output);

-- BIN_OP_EQ_uxn_c_l31_c15_f496
BIN_OP_EQ_uxn_c_l31_c15_f496 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l31_c15_f496_left,
BIN_OP_EQ_uxn_c_l31_c15_f496_right,
BIN_OP_EQ_uxn_c_l31_c15_f496_return_output);

-- MUX_uxn_c_l31_c15_ae5f
MUX_uxn_c_l31_c15_ae5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l31_c15_ae5f_cond,
MUX_uxn_c_l31_c15_ae5f_iftrue,
MUX_uxn_c_l31_c15_ae5f_iffalse,
MUX_uxn_c_l31_c15_ae5f_return_output);

-- device_ram_read_uxn_c_l32_c17_62dd
device_ram_read_uxn_c_l32_c17_62dd : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_c_l32_c17_62dd_CLOCK_ENABLE,
device_ram_read_uxn_c_l32_c17_62dd_address,
device_ram_read_uxn_c_l32_c17_62dd_return_output);

-- BIN_OP_EQ_uxn_c_l33_c22_0940
BIN_OP_EQ_uxn_c_l33_c22_0940 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l33_c22_0940_left,
BIN_OP_EQ_uxn_c_l33_c22_0940_right,
BIN_OP_EQ_uxn_c_l33_c22_0940_return_output);

-- MUX_uxn_c_l33_c22_5630
MUX_uxn_c_l33_c22_5630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l33_c22_5630_cond,
MUX_uxn_c_l33_c22_5630_iftrue,
MUX_uxn_c_l33_c22_5630_iffalse,
MUX_uxn_c_l33_c22_5630_return_output);

-- BIN_OP_AND_uxn_c_l34_c16_9517
BIN_OP_AND_uxn_c_l34_c16_9517 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l34_c16_9517_left,
BIN_OP_AND_uxn_c_l34_c16_9517_right,
BIN_OP_AND_uxn_c_l34_c16_9517_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_return_output);

-- ins_MUX_uxn_c_l36_c2_19e1
ins_MUX_uxn_c_l36_c2_19e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l36_c2_19e1_cond,
ins_MUX_uxn_c_l36_c2_19e1_iftrue,
ins_MUX_uxn_c_l36_c2_19e1_iffalse,
ins_MUX_uxn_c_l36_c2_19e1_return_output);

-- opc_MUX_uxn_c_l36_c2_19e1
opc_MUX_uxn_c_l36_c2_19e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
opc_MUX_uxn_c_l36_c2_19e1_cond,
opc_MUX_uxn_c_l36_c2_19e1_iftrue,
opc_MUX_uxn_c_l36_c2_19e1_iffalse,
opc_MUX_uxn_c_l36_c2_19e1_return_output);

-- error_MUX_uxn_c_l36_c2_19e1
error_MUX_uxn_c_l36_c2_19e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
error_MUX_uxn_c_l36_c2_19e1_cond,
error_MUX_uxn_c_l36_c2_19e1_iftrue,
error_MUX_uxn_c_l36_c2_19e1_iffalse,
error_MUX_uxn_c_l36_c2_19e1_return_output);

-- s_MUX_uxn_c_l36_c2_19e1
s_MUX_uxn_c_l36_c2_19e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
s_MUX_uxn_c_l36_c2_19e1_cond,
s_MUX_uxn_c_l36_c2_19e1_iftrue,
s_MUX_uxn_c_l36_c2_19e1_iffalse,
s_MUX_uxn_c_l36_c2_19e1_return_output);

-- k_MUX_uxn_c_l36_c2_19e1
k_MUX_uxn_c_l36_c2_19e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
k_MUX_uxn_c_l36_c2_19e1_cond,
k_MUX_uxn_c_l36_c2_19e1_iftrue,
k_MUX_uxn_c_l36_c2_19e1_iffalse,
k_MUX_uxn_c_l36_c2_19e1_return_output);

-- main_ram_read_uxn_c_l37_c9_b034
main_ram_read_uxn_c_l37_c9_b034 : entity work.main_ram_read_0CLK_8ab28aec port map (
clk,
main_ram_read_uxn_c_l37_c9_b034_CLOCK_ENABLE,
main_ram_read_uxn_c_l37_c9_b034_address,
main_ram_read_uxn_c_l37_c9_b034_return_output);

-- BIN_OP_AND_uxn_c_l37_c9_842a
BIN_OP_AND_uxn_c_l37_c9_842a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l37_c9_842a_left,
BIN_OP_AND_uxn_c_l37_c9_842a_right,
BIN_OP_AND_uxn_c_l37_c9_842a_return_output);

-- pc_add_uxn_c_l38_c3_51e8
pc_add_uxn_c_l38_c3_51e8 : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_c_l38_c3_51e8_CLOCK_ENABLE,
pc_add_uxn_c_l38_c3_51e8_adjustment);

-- BIN_OP_AND_uxn_c_l39_c7_d281
BIN_OP_AND_uxn_c_l39_c7_d281 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l39_c7_d281_left,
BIN_OP_AND_uxn_c_l39_c7_d281_right,
BIN_OP_AND_uxn_c_l39_c7_d281_return_output);

-- MUX_uxn_c_l39_c7_11c2
MUX_uxn_c_l39_c7_11c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l39_c7_11c2_cond,
MUX_uxn_c_l39_c7_11c2_iftrue,
MUX_uxn_c_l39_c7_11c2_iffalse,
MUX_uxn_c_l39_c7_11c2_return_output);

-- BIN_OP_AND_uxn_c_l40_c7_7e9c
BIN_OP_AND_uxn_c_l40_c7_7e9c : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c7_7e9c_left,
BIN_OP_AND_uxn_c_l40_c7_7e9c_right,
BIN_OP_AND_uxn_c_l40_c7_7e9c_return_output);

-- MUX_uxn_c_l40_c7_e722
MUX_uxn_c_l40_c7_e722 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l40_c7_e722_cond,
MUX_uxn_c_l40_c7_e722_iftrue,
MUX_uxn_c_l40_c7_e722_iffalse,
MUX_uxn_c_l40_c7_e722_return_output);

-- BIN_OP_AND_uxn_c_l41_c11_253e
BIN_OP_AND_uxn_c_l41_c11_253e : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l41_c11_253e_left,
BIN_OP_AND_uxn_c_l41_c11_253e_right,
BIN_OP_AND_uxn_c_l41_c11_253e_return_output);

-- UNARY_OP_NOT_uxn_c_l41_c11_1cf2
UNARY_OP_NOT_uxn_c_l41_c11_1cf2 : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l41_c11_1cf2_expr,
UNARY_OP_NOT_uxn_c_l41_c11_1cf2_return_output);

-- CONST_SR_5_uxn_c_l41_c31_52c2
CONST_SR_5_uxn_c_l41_c31_52c2 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_c_l41_c31_52c2_x,
CONST_SR_5_uxn_c_l41_c31_52c2_return_output);

-- BIN_OP_MINUS_uxn_c_l41_c26_feb2
BIN_OP_MINUS_uxn_c_l41_c26_feb2 : entity work.BIN_OP_MINUS_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l41_c26_feb2_left,
BIN_OP_MINUS_uxn_c_l41_c26_feb2_right,
BIN_OP_MINUS_uxn_c_l41_c26_feb2_return_output);

-- BIN_OP_AND_uxn_c_l41_c26_429f
BIN_OP_AND_uxn_c_l41_c26_429f : entity work.BIN_OP_AND_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l41_c26_429f_left,
BIN_OP_AND_uxn_c_l41_c26_429f_right,
BIN_OP_AND_uxn_c_l41_c26_429f_return_output);

-- BIN_OP_AND_uxn_c_l41_c51_27e5
BIN_OP_AND_uxn_c_l41_c51_27e5 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l41_c51_27e5_left,
BIN_OP_AND_uxn_c_l41_c51_27e5_right,
BIN_OP_AND_uxn_c_l41_c51_27e5_return_output);

-- MUX_uxn_c_l41_c11_c190
MUX_uxn_c_l41_c11_c190 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l41_c11_c190_cond,
MUX_uxn_c_l41_c11_c190_iftrue,
MUX_uxn_c_l41_c11_c190_iffalse,
MUX_uxn_c_l41_c11_c190_return_output);

-- eval_opcode_uxn_c_l42_c11_91fe
eval_opcode_uxn_c_l42_c11_91fe : entity work.eval_opcode_0CLK_44dad49a port map (
clk,
eval_opcode_uxn_c_l42_c11_91fe_CLOCK_ENABLE,
eval_opcode_uxn_c_l42_c11_91fe_stack_index,
eval_opcode_uxn_c_l42_c11_91fe_opcode,
eval_opcode_uxn_c_l42_c11_91fe_ins,
eval_opcode_uxn_c_l42_c11_91fe_k,
eval_opcode_uxn_c_l42_c11_91fe_return_output);

-- BIN_OP_EQ_uxn_c_l46_c6_ca20
BIN_OP_EQ_uxn_c_l46_c6_ca20 : entity work.BIN_OP_EQ_uint32_t_uint23_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l46_c6_ca20_left,
BIN_OP_EQ_uxn_c_l46_c6_ca20_right,
BIN_OP_EQ_uxn_c_l46_c6_ca20_return_output);

-- result_MUX_uxn_c_l46_c2_f883
result_MUX_uxn_c_l46_c2_f883 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l46_c2_f883_cond,
result_MUX_uxn_c_l46_c2_f883_iftrue,
result_MUX_uxn_c_l46_c2_f883_iffalse,
result_MUX_uxn_c_l46_c2_f883_return_output);

-- counter_MUX_uxn_c_l46_c2_f883
counter_MUX_uxn_c_l46_c2_f883 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
counter_MUX_uxn_c_l46_c2_f883_cond,
counter_MUX_uxn_c_l46_c2_f883_iftrue,
counter_MUX_uxn_c_l46_c2_f883_iffalse,
counter_MUX_uxn_c_l46_c2_f883_return_output);

-- BIN_OP_XOR_uxn_c_l48_c12_dc89
BIN_OP_XOR_uxn_c_l48_c12_dc89 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l48_c12_dc89_left,
BIN_OP_XOR_uxn_c_l48_c12_dc89_right,
BIN_OP_XOR_uxn_c_l48_c12_dc89_return_output);

-- BIN_OP_XOR_uxn_c_l49_c12_f545
BIN_OP_XOR_uxn_c_l49_c12_f545 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l49_c12_f545_left,
BIN_OP_XOR_uxn_c_l49_c12_f545_right,
BIN_OP_XOR_uxn_c_l49_c12_f545_return_output);

-- BIN_OP_XOR_uxn_c_l50_c12_a76c
BIN_OP_XOR_uxn_c_l50_c12_a76c : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l50_c12_a76c_left,
BIN_OP_XOR_uxn_c_l50_c12_a76c_right,
BIN_OP_XOR_uxn_c_l50_c12_a76c_return_output);

-- BIN_OP_XOR_uxn_c_l51_c12_308d
BIN_OP_XOR_uxn_c_l51_c12_308d : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l51_c12_308d_left,
BIN_OP_XOR_uxn_c_l51_c12_308d_right,
BIN_OP_XOR_uxn_c_l51_c12_308d_return_output);

-- BIN_OP_PLUS_uxn_c_l54_c3_7a5f
BIN_OP_PLUS_uxn_c_l54_c3_7a5f : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l54_c3_7a5f_left,
BIN_OP_PLUS_uxn_c_l54_c3_7a5f_right,
BIN_OP_PLUS_uxn_c_l54_c3_7a5f_return_output);

-- BIN_OP_EQ_uxn_c_l57_c6_08f1
BIN_OP_EQ_uxn_c_l57_c6_08f1 : entity work.BIN_OP_EQ_uint32_t_uint23_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l57_c6_08f1_left,
BIN_OP_EQ_uxn_c_l57_c6_08f1_right,
BIN_OP_EQ_uxn_c_l57_c6_08f1_return_output);

-- result_MUX_uxn_c_l57_c2_1915
result_MUX_uxn_c_l57_c2_1915 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l57_c2_1915_cond,
result_MUX_uxn_c_l57_c2_1915_iftrue,
result_MUX_uxn_c_l57_c2_1915_iffalse,
result_MUX_uxn_c_l57_c2_1915_return_output);

-- BIN_OP_XOR_uxn_c_l58_c12_dd63
BIN_OP_XOR_uxn_c_l58_c12_dd63 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l58_c12_dd63_left,
BIN_OP_XOR_uxn_c_l58_c12_dd63_right,
BIN_OP_XOR_uxn_c_l58_c12_dd63_return_output);

-- BIN_OP_EQ_uxn_c_l61_c6_6216
BIN_OP_EQ_uxn_c_l61_c6_6216 : entity work.BIN_OP_EQ_uint32_t_uint22_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l61_c6_6216_left,
BIN_OP_EQ_uxn_c_l61_c6_6216_right,
BIN_OP_EQ_uxn_c_l61_c6_6216_return_output);

-- result_MUX_uxn_c_l61_c2_0b81
result_MUX_uxn_c_l61_c2_0b81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l61_c2_0b81_cond,
result_MUX_uxn_c_l61_c2_0b81_iftrue,
result_MUX_uxn_c_l61_c2_0b81_iffalse,
result_MUX_uxn_c_l61_c2_0b81_return_output);

-- BIN_OP_XOR_uxn_c_l62_c12_2b10
BIN_OP_XOR_uxn_c_l62_c12_2b10 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l62_c12_2b10_left,
BIN_OP_XOR_uxn_c_l62_c12_2b10_right,
BIN_OP_XOR_uxn_c_l62_c12_2b10_return_output);

-- BIN_OP_XOR_uxn_c_l63_c12_a791
BIN_OP_XOR_uxn_c_l63_c12_a791 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l63_c12_a791_left,
BIN_OP_XOR_uxn_c_l63_c12_a791_right,
BIN_OP_XOR_uxn_c_l63_c12_a791_return_output);

-- BIN_OP_EQ_uxn_c_l66_c6_5114
BIN_OP_EQ_uxn_c_l66_c6_5114 : entity work.BIN_OP_EQ_uint32_t_uint21_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l66_c6_5114_left,
BIN_OP_EQ_uxn_c_l66_c6_5114_right,
BIN_OP_EQ_uxn_c_l66_c6_5114_return_output);

-- result_MUX_uxn_c_l66_c2_1a86
result_MUX_uxn_c_l66_c2_1a86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l66_c2_1a86_cond,
result_MUX_uxn_c_l66_c2_1a86_iftrue,
result_MUX_uxn_c_l66_c2_1a86_iffalse,
result_MUX_uxn_c_l66_c2_1a86_return_output);

-- BIN_OP_XOR_uxn_c_l67_c12_71e3
BIN_OP_XOR_uxn_c_l67_c12_71e3 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l67_c12_71e3_left,
BIN_OP_XOR_uxn_c_l67_c12_71e3_right,
BIN_OP_XOR_uxn_c_l67_c12_71e3_return_output);

-- BIN_OP_EQ_uxn_c_l70_c6_0354
BIN_OP_EQ_uxn_c_l70_c6_0354 : entity work.BIN_OP_EQ_uint32_t_uint22_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l70_c6_0354_left,
BIN_OP_EQ_uxn_c_l70_c6_0354_right,
BIN_OP_EQ_uxn_c_l70_c6_0354_return_output);

-- result_MUX_uxn_c_l70_c2_ec4c
result_MUX_uxn_c_l70_c2_ec4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l70_c2_ec4c_cond,
result_MUX_uxn_c_l70_c2_ec4c_iftrue,
result_MUX_uxn_c_l70_c2_ec4c_iffalse,
result_MUX_uxn_c_l70_c2_ec4c_return_output);

-- BIN_OP_XOR_uxn_c_l71_c12_1372
BIN_OP_XOR_uxn_c_l71_c12_1372 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l71_c12_1372_left,
BIN_OP_XOR_uxn_c_l71_c12_1372_right,
BIN_OP_XOR_uxn_c_l71_c12_1372_return_output);

-- BIN_OP_EQ_uxn_c_l74_c6_f64d
BIN_OP_EQ_uxn_c_l74_c6_f64d : entity work.BIN_OP_EQ_uint32_t_uint21_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l74_c6_f64d_left,
BIN_OP_EQ_uxn_c_l74_c6_f64d_right,
BIN_OP_EQ_uxn_c_l74_c6_f64d_return_output);

-- result_MUX_uxn_c_l74_c2_a90d
result_MUX_uxn_c_l74_c2_a90d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l74_c2_a90d_cond,
result_MUX_uxn_c_l74_c2_a90d_iftrue,
result_MUX_uxn_c_l74_c2_a90d_iffalse,
result_MUX_uxn_c_l74_c2_a90d_return_output);

-- BIN_OP_XOR_uxn_c_l75_c12_9ae2
BIN_OP_XOR_uxn_c_l75_c12_9ae2 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_c_l75_c12_9ae2_left,
BIN_OP_XOR_uxn_c_l75_c12_9ae2_right,
BIN_OP_XOR_uxn_c_l75_c12_9ae2_return_output);

-- BIN_OP_AND_uxn_c_l78_c12_5c88
BIN_OP_AND_uxn_c_l78_c12_5c88 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l78_c12_5c88_left,
BIN_OP_AND_uxn_c_l78_c12_5c88_right,
BIN_OP_AND_uxn_c_l78_c12_5c88_return_output);

-- MUX_uxn_c_l78_c36_2a82
MUX_uxn_c_l78_c36_2a82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l78_c36_2a82_cond,
MUX_uxn_c_l78_c36_2a82_iftrue,
MUX_uxn_c_l78_c36_2a82_iffalse,
MUX_uxn_c_l78_c36_2a82_return_output);

-- BIN_OP_OR_uxn_c_l78_c12_9c6e
BIN_OP_OR_uxn_c_l78_c12_9c6e : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l78_c12_9c6e_left,
BIN_OP_OR_uxn_c_l78_c12_9c6e_right,
BIN_OP_OR_uxn_c_l78_c12_9c6e_return_output);



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
 pc_get_uxn_c_l30_c7_2659_return_output,
 BIN_OP_EQ_uxn_c_l31_c15_f496_return_output,
 MUX_uxn_c_l31_c15_ae5f_return_output,
 device_ram_read_uxn_c_l32_c17_62dd_return_output,
 BIN_OP_EQ_uxn_c_l33_c22_0940_return_output,
 MUX_uxn_c_l33_c22_5630_return_output,
 BIN_OP_AND_uxn_c_l34_c16_9517_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_return_output,
 ins_MUX_uxn_c_l36_c2_19e1_return_output,
 opc_MUX_uxn_c_l36_c2_19e1_return_output,
 error_MUX_uxn_c_l36_c2_19e1_return_output,
 s_MUX_uxn_c_l36_c2_19e1_return_output,
 k_MUX_uxn_c_l36_c2_19e1_return_output,
 main_ram_read_uxn_c_l37_c9_b034_return_output,
 BIN_OP_AND_uxn_c_l37_c9_842a_return_output,
 BIN_OP_AND_uxn_c_l39_c7_d281_return_output,
 MUX_uxn_c_l39_c7_11c2_return_output,
 BIN_OP_AND_uxn_c_l40_c7_7e9c_return_output,
 MUX_uxn_c_l40_c7_e722_return_output,
 BIN_OP_AND_uxn_c_l41_c11_253e_return_output,
 UNARY_OP_NOT_uxn_c_l41_c11_1cf2_return_output,
 CONST_SR_5_uxn_c_l41_c31_52c2_return_output,
 BIN_OP_MINUS_uxn_c_l41_c26_feb2_return_output,
 BIN_OP_AND_uxn_c_l41_c26_429f_return_output,
 BIN_OP_AND_uxn_c_l41_c51_27e5_return_output,
 MUX_uxn_c_l41_c11_c190_return_output,
 eval_opcode_uxn_c_l42_c11_91fe_return_output,
 BIN_OP_EQ_uxn_c_l46_c6_ca20_return_output,
 result_MUX_uxn_c_l46_c2_f883_return_output,
 counter_MUX_uxn_c_l46_c2_f883_return_output,
 BIN_OP_XOR_uxn_c_l48_c12_dc89_return_output,
 BIN_OP_XOR_uxn_c_l49_c12_f545_return_output,
 BIN_OP_XOR_uxn_c_l50_c12_a76c_return_output,
 BIN_OP_XOR_uxn_c_l51_c12_308d_return_output,
 BIN_OP_PLUS_uxn_c_l54_c3_7a5f_return_output,
 BIN_OP_EQ_uxn_c_l57_c6_08f1_return_output,
 result_MUX_uxn_c_l57_c2_1915_return_output,
 BIN_OP_XOR_uxn_c_l58_c12_dd63_return_output,
 BIN_OP_EQ_uxn_c_l61_c6_6216_return_output,
 result_MUX_uxn_c_l61_c2_0b81_return_output,
 BIN_OP_XOR_uxn_c_l62_c12_2b10_return_output,
 BIN_OP_XOR_uxn_c_l63_c12_a791_return_output,
 BIN_OP_EQ_uxn_c_l66_c6_5114_return_output,
 result_MUX_uxn_c_l66_c2_1a86_return_output,
 BIN_OP_XOR_uxn_c_l67_c12_71e3_return_output,
 BIN_OP_EQ_uxn_c_l70_c6_0354_return_output,
 result_MUX_uxn_c_l70_c2_ec4c_return_output,
 BIN_OP_XOR_uxn_c_l71_c12_1372_return_output,
 BIN_OP_EQ_uxn_c_l74_c6_f64d_return_output,
 result_MUX_uxn_c_l74_c2_a90d_return_output,
 BIN_OP_XOR_uxn_c_l75_c12_9ae2_return_output,
 BIN_OP_AND_uxn_c_l78_c12_5c88_return_output,
 MUX_uxn_c_l78_c36_2a82_return_output,
 BIN_OP_OR_uxn_c_l78_c12_9c6e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_pc_get_uxn_c_l30_c7_2659_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_c_l30_c7_2659_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l31_c15_ae5f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l31_c15_ae5f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l31_c15_ae5f_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c15_f496_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c15_f496_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c15_f496_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l31_c15_ae5f_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_c_l32_c17_62dd_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_c_l32_c17_62dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_c_l32_c17_62dd_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l33_c22_5630_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l33_c22_5630_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l33_c22_5630_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l33_c22_0940_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l33_c22_0940_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l33_c22_0940_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l33_c22_5630_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l34_c16_9517_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l34_c16_9517_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l34_c16_9517_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l36_c2_19e1_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l36_c2_19e1_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l36_c2_19e1_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l36_c2_19e1_cond : unsigned(0 downto 0);
 variable VAR_opc_MUX_uxn_c_l36_c2_19e1_iftrue : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l36_c2_19e1_iffalse : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l36_c2_19e1_return_output : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l36_c2_19e1_cond : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l36_c2_19e1_iftrue : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l36_c2_19e1_iffalse : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l36_c2_19e1_return_output : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l36_c2_19e1_cond : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l36_c2_19e1_iftrue : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l36_c2_19e1_iffalse : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l36_c2_19e1_return_output : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l36_c2_19e1_cond : unsigned(0 downto 0);
 variable VAR_k_MUX_uxn_c_l36_c2_19e1_iftrue : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l36_c2_19e1_iffalse : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l36_c2_19e1_return_output : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l36_c2_19e1_cond : unsigned(0 downto 0);
 variable VAR_main_ram_read_uxn_c_l37_c9_b034_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l37_c9_842a_left : unsigned(7 downto 0);
 variable VAR_main_ram_read_uxn_c_l37_c9_b034_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_read_uxn_c_l37_c9_b034_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l37_c9_842a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l37_c9_842a_return_output : unsigned(7 downto 0);
 variable VAR_pc_add_uxn_c_l38_c3_51e8_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_c_l38_c3_51e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_11c2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_11c2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_11c2_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_d281_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_d281_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_d281_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_11c2_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c7_e722_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c7_e722_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c7_e722_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c7_7e9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c7_7e9c_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c7_7e9c_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c7_e722_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l41_c11_c190_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l41_c11_c190_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l41_c11_c190_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c11_253e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c11_253e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c11_253e_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l41_c11_1cf2_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l41_c11_1cf2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l41_c26_feb2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l41_c26_feb2_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l41_c31_52c2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l41_c31_52c2_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l41_c26_feb2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c26_429f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c26_429f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c26_429f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c51_27e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c51_27e5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l41_c51_27e5_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l41_c11_c190_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l42_c11_91fe_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l42_c11_91fe_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l42_c11_91fe_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l42_c11_91fe_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l42_c11_91fe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l42_c11_91fe_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l46_c6_ca20_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l46_c6_ca20_right : unsigned(22 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l46_c6_ca20_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l46_c2_f883_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l46_c2_f883_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l46_c2_f883_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l46_c2_f883_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_uxn_c_l46_c2_f883_iftrue : unsigned(31 downto 0);
 variable VAR_counter_uxn_c_l52_c3_ca80 : unsigned(31 downto 0);
 variable VAR_counter_MUX_uxn_c_l46_c2_f883_iffalse : unsigned(31 downto 0);
 variable VAR_counter_uxn_c_l54_c3_22d2 : unsigned(31 downto 0);
 variable VAR_counter_MUX_uxn_c_l46_c2_f883_return_output : unsigned(31 downto 0);
 variable VAR_counter_MUX_uxn_c_l46_c2_f883_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l48_c12_dc89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l48_c12_dc89_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l48_c12_dc89_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l49_c12_f545_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l49_c12_f545_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l49_c12_f545_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l50_c12_a76c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l50_c12_a76c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l50_c12_a76c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l51_c12_308d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l51_c12_308d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l51_c12_308d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l54_c3_7a5f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l54_c3_7a5f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l54_c3_7a5f_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l57_c6_08f1_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l57_c6_08f1_right : unsigned(22 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l57_c6_08f1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l57_c2_1915_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l57_c2_1915_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l57_c2_1915_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l57_c2_1915_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l58_c12_dd63_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l58_c12_dd63_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l58_c12_dd63_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l61_c6_6216_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l61_c6_6216_right : unsigned(21 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l61_c6_6216_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l61_c2_0b81_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l61_c2_0b81_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l61_c2_0b81_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l61_c2_0b81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l62_c12_2b10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l62_c12_2b10_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l62_c12_2b10_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l63_c12_a791_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l63_c12_a791_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l63_c12_a791_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l66_c6_5114_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l66_c6_5114_right : unsigned(20 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l66_c6_5114_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l66_c2_1a86_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l66_c2_1a86_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l66_c2_1a86_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l66_c2_1a86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l67_c12_71e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l67_c12_71e3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l67_c12_71e3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_0354_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_0354_right : unsigned(21 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l70_c6_0354_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l70_c2_ec4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l70_c2_ec4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l70_c2_ec4c_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l70_c2_ec4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l71_c12_1372_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l71_c12_1372_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l71_c12_1372_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_f64d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_f64d_right : unsigned(20 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l74_c6_f64d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l74_c2_a90d_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l74_c2_a90d_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l74_c2_a90d_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_c_l74_c2_a90d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l75_c12_9ae2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l75_c12_9ae2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_c_l75_c12_9ae2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l78_c12_5c88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l78_c12_5c88_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l78_c12_5c88_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l78_c12_9c6e_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l78_c36_2a82_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l78_c36_2a82_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l78_c36_2a82_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l78_c36_2a82_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l78_c12_9c6e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l78_c12_9c6e_return_output : unsigned(7 downto 0);
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
     VAR_MUX_uxn_c_l40_c7_e722_iffalse := to_unsigned(0, 1);
     VAR_device_ram_read_uxn_c_l32_c17_62dd_address := resize(to_unsigned(15, 4), 8);
     VAR_MUX_uxn_c_l33_c22_5630_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l57_c6_08f1_right := to_unsigned(4499999, 23);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l40_c7_7e9c_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_c_l66_c6_5114_right := to_unsigned(1999999, 21);
     VAR_BIN_OP_EQ_uxn_c_l46_c6_ca20_right := to_unsigned(5999999, 23);
     VAR_BIN_OP_EQ_uxn_c_l74_c6_f64d_right := to_unsigned(1499999, 21);
     VAR_MUX_uxn_c_l78_c36_2a82_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_AND_uxn_c_l41_c11_253e_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_c_l61_c6_6216_right := to_unsigned(2999999, 22);
     VAR_MUX_uxn_c_l39_c7_11c2_iftrue := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l70_c6_0354_right := to_unsigned(3999999, 22);
     VAR_MUX_uxn_c_l39_c7_11c2_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_AND_uxn_c_l39_c7_d281_right := to_unsigned(128, 8);
     VAR_BIN_OP_MINUS_uxn_c_l41_c26_feb2_left := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l41_c51_27e5_right := to_unsigned(63, 6);
     VAR_MUX_uxn_c_l40_c7_e722_iftrue := to_unsigned(1, 1);
     VAR_pc_add_uxn_c_l38_c3_51e8_adjustment := resize(to_unsigned(1, 1), 16);
     VAR_MUX_uxn_c_l31_c15_ae5f_iffalse := to_unsigned(1, 1);
     VAR_error_MUX_uxn_c_l36_c2_19e1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l37_c9_842a_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l31_c15_f496_right := to_unsigned(0, 1);
     VAR_counter_uxn_c_l52_c3_ca80 := resize(to_unsigned(0, 1), 32);
     VAR_counter_MUX_uxn_c_l46_c2_f883_iftrue := VAR_counter_uxn_c_l52_c3_ca80;
     VAR_BIN_OP_PLUS_uxn_c_l54_c3_7a5f_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l78_c12_5c88_right := to_unsigned(15, 4);
     VAR_MUX_uxn_c_l33_c22_5630_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l31_c15_ae5f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l41_c26_429f_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l33_c22_0940_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_read_uxn_c_l32_c17_62dd_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_c_l30_c7_2659_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l46_c6_ca20_left := counter;
     VAR_BIN_OP_PLUS_uxn_c_l54_c3_7a5f_left := counter;
     VAR_ins_MUX_uxn_c_l36_c2_19e1_iffalse := ins;
     VAR_k_MUX_uxn_c_l36_c2_19e1_iffalse := k;
     VAR_BIN_OP_XOR_uxn_c_l51_c12_308d_right := led_b;
     VAR_BIN_OP_XOR_uxn_c_l58_c12_dd63_right := led_b;
     VAR_BIN_OP_XOR_uxn_c_l63_c12_a791_right := led_b;
     VAR_BIN_OP_XOR_uxn_c_l75_c12_9ae2_right := led_b;
     REG_VAR_led_b := led_b;
     VAR_BIN_OP_XOR_uxn_c_l48_c12_dc89_right := led_blink;
     REG_VAR_led_blink := led_blink;
     VAR_MUX_uxn_c_l78_c36_2a82_iftrue := led_error;
     REG_VAR_led_error := led_error;
     VAR_BIN_OP_XOR_uxn_c_l50_c12_a76c_right := led_g;
     VAR_BIN_OP_XOR_uxn_c_l67_c12_71e3_right := led_g;
     VAR_BIN_OP_XOR_uxn_c_l71_c12_1372_right := led_g;
     REG_VAR_led_g := led_g;
     VAR_BIN_OP_XOR_uxn_c_l49_c12_f545_right := led_r;
     VAR_BIN_OP_XOR_uxn_c_l62_c12_2b10_right := led_r;
     REG_VAR_led_r := led_r;
     VAR_opc_MUX_uxn_c_l36_c2_19e1_iffalse := opc;
     VAR_BIN_OP_XOR_uxn_c_l48_c12_dc89_left := result;
     VAR_result_MUX_uxn_c_l46_c2_f883_iffalse := result;
     VAR_s_MUX_uxn_c_l36_c2_19e1_iffalse := s;
     -- pc_get[uxn_c_l30_c7_2659] LATENCY=0
     -- Clock enable
     pc_get_uxn_c_l30_c7_2659_CLOCK_ENABLE <= VAR_pc_get_uxn_c_l30_c7_2659_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_c_l30_c7_2659_return_output := pc_get_uxn_c_l30_c7_2659_return_output;

     -- BIN_OP_EQ[uxn_c_l46_c6_ca20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l46_c6_ca20_left <= VAR_BIN_OP_EQ_uxn_c_l46_c6_ca20_left;
     BIN_OP_EQ_uxn_c_l46_c6_ca20_right <= VAR_BIN_OP_EQ_uxn_c_l46_c6_ca20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l46_c6_ca20_return_output := BIN_OP_EQ_uxn_c_l46_c6_ca20_return_output;

     -- BIN_OP_XOR[uxn_c_l48_c12_dc89] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l48_c12_dc89_left <= VAR_BIN_OP_XOR_uxn_c_l48_c12_dc89_left;
     BIN_OP_XOR_uxn_c_l48_c12_dc89_right <= VAR_BIN_OP_XOR_uxn_c_l48_c12_dc89_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l48_c12_dc89_return_output := BIN_OP_XOR_uxn_c_l48_c12_dc89_return_output;

     -- device_ram_read[uxn_c_l32_c17_62dd] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_c_l32_c17_62dd_CLOCK_ENABLE <= VAR_device_ram_read_uxn_c_l32_c17_62dd_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_c_l32_c17_62dd_address <= VAR_device_ram_read_uxn_c_l32_c17_62dd_address;
     -- Outputs
     VAR_device_ram_read_uxn_c_l32_c17_62dd_return_output := device_ram_read_uxn_c_l32_c17_62dd_return_output;

     -- BIN_OP_PLUS[uxn_c_l54_c3_7a5f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l54_c3_7a5f_left <= VAR_BIN_OP_PLUS_uxn_c_l54_c3_7a5f_left;
     BIN_OP_PLUS_uxn_c_l54_c3_7a5f_right <= VAR_BIN_OP_PLUS_uxn_c_l54_c3_7a5f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l54_c3_7a5f_return_output := BIN_OP_PLUS_uxn_c_l54_c3_7a5f_return_output;

     -- Submodule level 1
     VAR_counter_MUX_uxn_c_l46_c2_f883_cond := VAR_BIN_OP_EQ_uxn_c_l46_c6_ca20_return_output;
     VAR_result_MUX_uxn_c_l46_c2_f883_cond := VAR_BIN_OP_EQ_uxn_c_l46_c6_ca20_return_output;
     VAR_counter_uxn_c_l54_c3_22d2 := resize(VAR_BIN_OP_PLUS_uxn_c_l54_c3_7a5f_return_output, 32);
     VAR_BIN_OP_XOR_uxn_c_l49_c12_f545_left := VAR_BIN_OP_XOR_uxn_c_l48_c12_dc89_return_output;
     VAR_BIN_OP_EQ_uxn_c_l33_c22_0940_left := VAR_device_ram_read_uxn_c_l32_c17_62dd_return_output;
     REG_VAR_system_state := VAR_device_ram_read_uxn_c_l32_c17_62dd_return_output;
     VAR_BIN_OP_EQ_uxn_c_l31_c15_f496_left := VAR_pc_get_uxn_c_l30_c7_2659_return_output;
     VAR_main_ram_read_uxn_c_l37_c9_b034_address := VAR_pc_get_uxn_c_l30_c7_2659_return_output;
     REG_VAR_pc := VAR_pc_get_uxn_c_l30_c7_2659_return_output;
     VAR_counter_MUX_uxn_c_l46_c2_f883_iffalse := VAR_counter_uxn_c_l54_c3_22d2;
     -- BIN_OP_EQ[uxn_c_l31_c15_f496] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l31_c15_f496_left <= VAR_BIN_OP_EQ_uxn_c_l31_c15_f496_left;
     BIN_OP_EQ_uxn_c_l31_c15_f496_right <= VAR_BIN_OP_EQ_uxn_c_l31_c15_f496_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l31_c15_f496_return_output := BIN_OP_EQ_uxn_c_l31_c15_f496_return_output;

     -- BIN_OP_XOR[uxn_c_l49_c12_f545] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l49_c12_f545_left <= VAR_BIN_OP_XOR_uxn_c_l49_c12_f545_left;
     BIN_OP_XOR_uxn_c_l49_c12_f545_right <= VAR_BIN_OP_XOR_uxn_c_l49_c12_f545_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l49_c12_f545_return_output := BIN_OP_XOR_uxn_c_l49_c12_f545_return_output;

     -- BIN_OP_EQ[uxn_c_l33_c22_0940] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l33_c22_0940_left <= VAR_BIN_OP_EQ_uxn_c_l33_c22_0940_left;
     BIN_OP_EQ_uxn_c_l33_c22_0940_right <= VAR_BIN_OP_EQ_uxn_c_l33_c22_0940_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l33_c22_0940_return_output := BIN_OP_EQ_uxn_c_l33_c22_0940_return_output;

     -- counter_MUX[uxn_c_l46_c2_f883] LATENCY=0
     -- Inputs
     counter_MUX_uxn_c_l46_c2_f883_cond <= VAR_counter_MUX_uxn_c_l46_c2_f883_cond;
     counter_MUX_uxn_c_l46_c2_f883_iftrue <= VAR_counter_MUX_uxn_c_l46_c2_f883_iftrue;
     counter_MUX_uxn_c_l46_c2_f883_iffalse <= VAR_counter_MUX_uxn_c_l46_c2_f883_iffalse;
     -- Outputs
     VAR_counter_MUX_uxn_c_l46_c2_f883_return_output := counter_MUX_uxn_c_l46_c2_f883_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l31_c15_ae5f_cond := VAR_BIN_OP_EQ_uxn_c_l31_c15_f496_return_output;
     VAR_MUX_uxn_c_l33_c22_5630_cond := VAR_BIN_OP_EQ_uxn_c_l33_c22_0940_return_output;
     VAR_BIN_OP_XOR_uxn_c_l50_c12_a76c_left := VAR_BIN_OP_XOR_uxn_c_l49_c12_f545_return_output;
     VAR_BIN_OP_EQ_uxn_c_l57_c6_08f1_left := VAR_counter_MUX_uxn_c_l46_c2_f883_return_output;
     VAR_BIN_OP_EQ_uxn_c_l61_c6_6216_left := VAR_counter_MUX_uxn_c_l46_c2_f883_return_output;
     VAR_BIN_OP_EQ_uxn_c_l66_c6_5114_left := VAR_counter_MUX_uxn_c_l46_c2_f883_return_output;
     VAR_BIN_OP_EQ_uxn_c_l70_c6_0354_left := VAR_counter_MUX_uxn_c_l46_c2_f883_return_output;
     VAR_BIN_OP_EQ_uxn_c_l74_c6_f64d_left := VAR_counter_MUX_uxn_c_l46_c2_f883_return_output;
     REG_VAR_counter := VAR_counter_MUX_uxn_c_l46_c2_f883_return_output;
     -- BIN_OP_EQ[uxn_c_l61_c6_6216] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l61_c6_6216_left <= VAR_BIN_OP_EQ_uxn_c_l61_c6_6216_left;
     BIN_OP_EQ_uxn_c_l61_c6_6216_right <= VAR_BIN_OP_EQ_uxn_c_l61_c6_6216_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l61_c6_6216_return_output := BIN_OP_EQ_uxn_c_l61_c6_6216_return_output;

     -- BIN_OP_EQ[uxn_c_l70_c6_0354] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l70_c6_0354_left <= VAR_BIN_OP_EQ_uxn_c_l70_c6_0354_left;
     BIN_OP_EQ_uxn_c_l70_c6_0354_right <= VAR_BIN_OP_EQ_uxn_c_l70_c6_0354_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l70_c6_0354_return_output := BIN_OP_EQ_uxn_c_l70_c6_0354_return_output;

     -- MUX[uxn_c_l33_c22_5630] LATENCY=0
     -- Inputs
     MUX_uxn_c_l33_c22_5630_cond <= VAR_MUX_uxn_c_l33_c22_5630_cond;
     MUX_uxn_c_l33_c22_5630_iftrue <= VAR_MUX_uxn_c_l33_c22_5630_iftrue;
     MUX_uxn_c_l33_c22_5630_iffalse <= VAR_MUX_uxn_c_l33_c22_5630_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l33_c22_5630_return_output := MUX_uxn_c_l33_c22_5630_return_output;

     -- MUX[uxn_c_l31_c15_ae5f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l31_c15_ae5f_cond <= VAR_MUX_uxn_c_l31_c15_ae5f_cond;
     MUX_uxn_c_l31_c15_ae5f_iftrue <= VAR_MUX_uxn_c_l31_c15_ae5f_iftrue;
     MUX_uxn_c_l31_c15_ae5f_iffalse <= VAR_MUX_uxn_c_l31_c15_ae5f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l31_c15_ae5f_return_output := MUX_uxn_c_l31_c15_ae5f_return_output;

     -- BIN_OP_EQ[uxn_c_l74_c6_f64d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l74_c6_f64d_left <= VAR_BIN_OP_EQ_uxn_c_l74_c6_f64d_left;
     BIN_OP_EQ_uxn_c_l74_c6_f64d_right <= VAR_BIN_OP_EQ_uxn_c_l74_c6_f64d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l74_c6_f64d_return_output := BIN_OP_EQ_uxn_c_l74_c6_f64d_return_output;

     -- BIN_OP_EQ[uxn_c_l57_c6_08f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l57_c6_08f1_left <= VAR_BIN_OP_EQ_uxn_c_l57_c6_08f1_left;
     BIN_OP_EQ_uxn_c_l57_c6_08f1_right <= VAR_BIN_OP_EQ_uxn_c_l57_c6_08f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l57_c6_08f1_return_output := BIN_OP_EQ_uxn_c_l57_c6_08f1_return_output;

     -- BIN_OP_EQ[uxn_c_l66_c6_5114] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l66_c6_5114_left <= VAR_BIN_OP_EQ_uxn_c_l66_c6_5114_left;
     BIN_OP_EQ_uxn_c_l66_c6_5114_right <= VAR_BIN_OP_EQ_uxn_c_l66_c6_5114_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l66_c6_5114_return_output := BIN_OP_EQ_uxn_c_l66_c6_5114_return_output;

     -- BIN_OP_XOR[uxn_c_l50_c12_a76c] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l50_c12_a76c_left <= VAR_BIN_OP_XOR_uxn_c_l50_c12_a76c_left;
     BIN_OP_XOR_uxn_c_l50_c12_a76c_right <= VAR_BIN_OP_XOR_uxn_c_l50_c12_a76c_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l50_c12_a76c_return_output := BIN_OP_XOR_uxn_c_l50_c12_a76c_return_output;

     -- Submodule level 3
     VAR_result_MUX_uxn_c_l57_c2_1915_cond := VAR_BIN_OP_EQ_uxn_c_l57_c6_08f1_return_output;
     VAR_result_MUX_uxn_c_l61_c2_0b81_cond := VAR_BIN_OP_EQ_uxn_c_l61_c6_6216_return_output;
     VAR_result_MUX_uxn_c_l66_c2_1a86_cond := VAR_BIN_OP_EQ_uxn_c_l66_c6_5114_return_output;
     VAR_result_MUX_uxn_c_l70_c2_ec4c_cond := VAR_BIN_OP_EQ_uxn_c_l70_c6_0354_return_output;
     VAR_result_MUX_uxn_c_l74_c2_a90d_cond := VAR_BIN_OP_EQ_uxn_c_l74_c6_f64d_return_output;
     VAR_BIN_OP_XOR_uxn_c_l51_c12_308d_left := VAR_BIN_OP_XOR_uxn_c_l50_c12_a76c_return_output;
     VAR_BIN_OP_AND_uxn_c_l34_c16_9517_left := VAR_MUX_uxn_c_l31_c15_ae5f_return_output;
     REG_VAR_pc_nonzero := VAR_MUX_uxn_c_l31_c15_ae5f_return_output;
     VAR_BIN_OP_AND_uxn_c_l34_c16_9517_right := VAR_MUX_uxn_c_l33_c22_5630_return_output;
     REG_VAR_system_state_zero := VAR_MUX_uxn_c_l33_c22_5630_return_output;
     -- BIN_OP_AND[uxn_c_l34_c16_9517] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l34_c16_9517_left <= VAR_BIN_OP_AND_uxn_c_l34_c16_9517_left;
     BIN_OP_AND_uxn_c_l34_c16_9517_right <= VAR_BIN_OP_AND_uxn_c_l34_c16_9517_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l34_c16_9517_return_output := BIN_OP_AND_uxn_c_l34_c16_9517_return_output;

     -- BIN_OP_XOR[uxn_c_l51_c12_308d] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l51_c12_308d_left <= VAR_BIN_OP_XOR_uxn_c_l51_c12_308d_left;
     BIN_OP_XOR_uxn_c_l51_c12_308d_right <= VAR_BIN_OP_XOR_uxn_c_l51_c12_308d_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l51_c12_308d_return_output := BIN_OP_XOR_uxn_c_l51_c12_308d_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_cond := VAR_BIN_OP_AND_uxn_c_l34_c16_9517_return_output;
     VAR_error_MUX_uxn_c_l36_c2_19e1_cond := VAR_BIN_OP_AND_uxn_c_l34_c16_9517_return_output;
     VAR_ins_MUX_uxn_c_l36_c2_19e1_cond := VAR_BIN_OP_AND_uxn_c_l34_c16_9517_return_output;
     VAR_k_MUX_uxn_c_l36_c2_19e1_cond := VAR_BIN_OP_AND_uxn_c_l34_c16_9517_return_output;
     VAR_opc_MUX_uxn_c_l36_c2_19e1_cond := VAR_BIN_OP_AND_uxn_c_l34_c16_9517_return_output;
     VAR_s_MUX_uxn_c_l36_c2_19e1_cond := VAR_BIN_OP_AND_uxn_c_l34_c16_9517_return_output;
     REG_VAR_should_eval := VAR_BIN_OP_AND_uxn_c_l34_c16_9517_return_output;
     VAR_result_MUX_uxn_c_l46_c2_f883_iftrue := VAR_BIN_OP_XOR_uxn_c_l51_c12_308d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_3134] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_return_output;

     -- result_MUX[uxn_c_l46_c2_f883] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l46_c2_f883_cond <= VAR_result_MUX_uxn_c_l46_c2_f883_cond;
     result_MUX_uxn_c_l46_c2_f883_iftrue <= VAR_result_MUX_uxn_c_l46_c2_f883_iftrue;
     result_MUX_uxn_c_l46_c2_f883_iffalse <= VAR_result_MUX_uxn_c_l46_c2_f883_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l46_c2_f883_return_output := result_MUX_uxn_c_l46_c2_f883_return_output;

     -- Submodule level 5
     VAR_eval_opcode_uxn_c_l42_c11_91fe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_return_output;
     VAR_main_ram_read_uxn_c_l37_c9_b034_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_return_output;
     VAR_pc_add_uxn_c_l38_c3_51e8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_3134_return_output;
     VAR_BIN_OP_XOR_uxn_c_l58_c12_dd63_left := VAR_result_MUX_uxn_c_l46_c2_f883_return_output;
     VAR_result_MUX_uxn_c_l57_c2_1915_iffalse := VAR_result_MUX_uxn_c_l46_c2_f883_return_output;
     -- pc_add[uxn_c_l38_c3_51e8] LATENCY=0
     -- Clock enable
     pc_add_uxn_c_l38_c3_51e8_CLOCK_ENABLE <= VAR_pc_add_uxn_c_l38_c3_51e8_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_c_l38_c3_51e8_adjustment <= VAR_pc_add_uxn_c_l38_c3_51e8_adjustment;
     -- Outputs

     -- BIN_OP_XOR[uxn_c_l58_c12_dd63] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l58_c12_dd63_left <= VAR_BIN_OP_XOR_uxn_c_l58_c12_dd63_left;
     BIN_OP_XOR_uxn_c_l58_c12_dd63_right <= VAR_BIN_OP_XOR_uxn_c_l58_c12_dd63_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l58_c12_dd63_return_output := BIN_OP_XOR_uxn_c_l58_c12_dd63_return_output;

     -- main_ram_read[uxn_c_l37_c9_b034] LATENCY=0
     -- Clock enable
     main_ram_read_uxn_c_l37_c9_b034_CLOCK_ENABLE <= VAR_main_ram_read_uxn_c_l37_c9_b034_CLOCK_ENABLE;
     -- Inputs
     main_ram_read_uxn_c_l37_c9_b034_address <= VAR_main_ram_read_uxn_c_l37_c9_b034_address;
     -- Outputs
     VAR_main_ram_read_uxn_c_l37_c9_b034_return_output := main_ram_read_uxn_c_l37_c9_b034_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_c_l57_c2_1915_iftrue := VAR_BIN_OP_XOR_uxn_c_l58_c12_dd63_return_output;
     VAR_BIN_OP_AND_uxn_c_l37_c9_842a_left := VAR_main_ram_read_uxn_c_l37_c9_b034_return_output;
     -- BIN_OP_AND[uxn_c_l37_c9_842a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l37_c9_842a_left <= VAR_BIN_OP_AND_uxn_c_l37_c9_842a_left;
     BIN_OP_AND_uxn_c_l37_c9_842a_right <= VAR_BIN_OP_AND_uxn_c_l37_c9_842a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l37_c9_842a_return_output := BIN_OP_AND_uxn_c_l37_c9_842a_return_output;

     -- result_MUX[uxn_c_l57_c2_1915] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l57_c2_1915_cond <= VAR_result_MUX_uxn_c_l57_c2_1915_cond;
     result_MUX_uxn_c_l57_c2_1915_iftrue <= VAR_result_MUX_uxn_c_l57_c2_1915_iftrue;
     result_MUX_uxn_c_l57_c2_1915_iffalse <= VAR_result_MUX_uxn_c_l57_c2_1915_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l57_c2_1915_return_output := result_MUX_uxn_c_l57_c2_1915_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l39_c7_d281_left := VAR_BIN_OP_AND_uxn_c_l37_c9_842a_return_output;
     VAR_BIN_OP_AND_uxn_c_l40_c7_7e9c_left := VAR_BIN_OP_AND_uxn_c_l37_c9_842a_return_output;
     VAR_BIN_OP_AND_uxn_c_l41_c11_253e_left := VAR_BIN_OP_AND_uxn_c_l37_c9_842a_return_output;
     VAR_BIN_OP_AND_uxn_c_l41_c51_27e5_left := VAR_BIN_OP_AND_uxn_c_l37_c9_842a_return_output;
     VAR_CONST_SR_5_uxn_c_l41_c31_52c2_x := VAR_BIN_OP_AND_uxn_c_l37_c9_842a_return_output;
     VAR_eval_opcode_uxn_c_l42_c11_91fe_ins := VAR_BIN_OP_AND_uxn_c_l37_c9_842a_return_output;
     VAR_ins_MUX_uxn_c_l36_c2_19e1_iftrue := VAR_BIN_OP_AND_uxn_c_l37_c9_842a_return_output;
     VAR_BIN_OP_XOR_uxn_c_l62_c12_2b10_left := VAR_result_MUX_uxn_c_l57_c2_1915_return_output;
     VAR_result_MUX_uxn_c_l61_c2_0b81_iffalse := VAR_result_MUX_uxn_c_l57_c2_1915_return_output;
     -- BIN_OP_AND[uxn_c_l40_c7_7e9c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c7_7e9c_left <= VAR_BIN_OP_AND_uxn_c_l40_c7_7e9c_left;
     BIN_OP_AND_uxn_c_l40_c7_7e9c_right <= VAR_BIN_OP_AND_uxn_c_l40_c7_7e9c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c7_7e9c_return_output := BIN_OP_AND_uxn_c_l40_c7_7e9c_return_output;

     -- BIN_OP_XOR[uxn_c_l62_c12_2b10] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l62_c12_2b10_left <= VAR_BIN_OP_XOR_uxn_c_l62_c12_2b10_left;
     BIN_OP_XOR_uxn_c_l62_c12_2b10_right <= VAR_BIN_OP_XOR_uxn_c_l62_c12_2b10_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l62_c12_2b10_return_output := BIN_OP_XOR_uxn_c_l62_c12_2b10_return_output;

     -- CONST_SR_5[uxn_c_l41_c31_52c2] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_c_l41_c31_52c2_x <= VAR_CONST_SR_5_uxn_c_l41_c31_52c2_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_c_l41_c31_52c2_return_output := CONST_SR_5_uxn_c_l41_c31_52c2_return_output;

     -- BIN_OP_AND[uxn_c_l39_c7_d281] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l39_c7_d281_left <= VAR_BIN_OP_AND_uxn_c_l39_c7_d281_left;
     BIN_OP_AND_uxn_c_l39_c7_d281_right <= VAR_BIN_OP_AND_uxn_c_l39_c7_d281_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l39_c7_d281_return_output := BIN_OP_AND_uxn_c_l39_c7_d281_return_output;

     -- ins_MUX[uxn_c_l36_c2_19e1] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l36_c2_19e1_cond <= VAR_ins_MUX_uxn_c_l36_c2_19e1_cond;
     ins_MUX_uxn_c_l36_c2_19e1_iftrue <= VAR_ins_MUX_uxn_c_l36_c2_19e1_iftrue;
     ins_MUX_uxn_c_l36_c2_19e1_iffalse <= VAR_ins_MUX_uxn_c_l36_c2_19e1_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l36_c2_19e1_return_output := ins_MUX_uxn_c_l36_c2_19e1_return_output;

     -- BIN_OP_AND[uxn_c_l41_c11_253e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l41_c11_253e_left <= VAR_BIN_OP_AND_uxn_c_l41_c11_253e_left;
     BIN_OP_AND_uxn_c_l41_c11_253e_right <= VAR_BIN_OP_AND_uxn_c_l41_c11_253e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l41_c11_253e_return_output := BIN_OP_AND_uxn_c_l41_c11_253e_return_output;

     -- BIN_OP_AND[uxn_c_l41_c51_27e5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l41_c51_27e5_left <= VAR_BIN_OP_AND_uxn_c_l41_c51_27e5_left;
     BIN_OP_AND_uxn_c_l41_c51_27e5_right <= VAR_BIN_OP_AND_uxn_c_l41_c51_27e5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l41_c51_27e5_return_output := BIN_OP_AND_uxn_c_l41_c51_27e5_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l39_c7_11c2_cond := resize(VAR_BIN_OP_AND_uxn_c_l39_c7_d281_return_output, 1);
     VAR_MUX_uxn_c_l40_c7_e722_cond := resize(VAR_BIN_OP_AND_uxn_c_l40_c7_7e9c_return_output, 1);
     VAR_UNARY_OP_NOT_uxn_c_l41_c11_1cf2_expr := VAR_BIN_OP_AND_uxn_c_l41_c11_253e_return_output;
     VAR_MUX_uxn_c_l41_c11_c190_iffalse := VAR_BIN_OP_AND_uxn_c_l41_c51_27e5_return_output;
     VAR_BIN_OP_XOR_uxn_c_l63_c12_a791_left := VAR_BIN_OP_XOR_uxn_c_l62_c12_2b10_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l41_c26_feb2_right := VAR_CONST_SR_5_uxn_c_l41_c31_52c2_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l36_c2_19e1_return_output;
     -- BIN_OP_XOR[uxn_c_l63_c12_a791] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l63_c12_a791_left <= VAR_BIN_OP_XOR_uxn_c_l63_c12_a791_left;
     BIN_OP_XOR_uxn_c_l63_c12_a791_right <= VAR_BIN_OP_XOR_uxn_c_l63_c12_a791_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l63_c12_a791_return_output := BIN_OP_XOR_uxn_c_l63_c12_a791_return_output;

     -- MUX[uxn_c_l40_c7_e722] LATENCY=0
     -- Inputs
     MUX_uxn_c_l40_c7_e722_cond <= VAR_MUX_uxn_c_l40_c7_e722_cond;
     MUX_uxn_c_l40_c7_e722_iftrue <= VAR_MUX_uxn_c_l40_c7_e722_iftrue;
     MUX_uxn_c_l40_c7_e722_iffalse <= VAR_MUX_uxn_c_l40_c7_e722_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l40_c7_e722_return_output := MUX_uxn_c_l40_c7_e722_return_output;

     -- UNARY_OP_NOT[uxn_c_l41_c11_1cf2] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l41_c11_1cf2_expr <= VAR_UNARY_OP_NOT_uxn_c_l41_c11_1cf2_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l41_c11_1cf2_return_output := UNARY_OP_NOT_uxn_c_l41_c11_1cf2_return_output;

     -- MUX[uxn_c_l39_c7_11c2] LATENCY=0
     -- Inputs
     MUX_uxn_c_l39_c7_11c2_cond <= VAR_MUX_uxn_c_l39_c7_11c2_cond;
     MUX_uxn_c_l39_c7_11c2_iftrue <= VAR_MUX_uxn_c_l39_c7_11c2_iftrue;
     MUX_uxn_c_l39_c7_11c2_iffalse <= VAR_MUX_uxn_c_l39_c7_11c2_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l39_c7_11c2_return_output := MUX_uxn_c_l39_c7_11c2_return_output;

     -- BIN_OP_MINUS[uxn_c_l41_c26_feb2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l41_c26_feb2_left <= VAR_BIN_OP_MINUS_uxn_c_l41_c26_feb2_left;
     BIN_OP_MINUS_uxn_c_l41_c26_feb2_right <= VAR_BIN_OP_MINUS_uxn_c_l41_c26_feb2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l41_c26_feb2_return_output := BIN_OP_MINUS_uxn_c_l41_c26_feb2_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l41_c26_429f_left := VAR_BIN_OP_MINUS_uxn_c_l41_c26_feb2_return_output;
     VAR_result_MUX_uxn_c_l61_c2_0b81_iftrue := VAR_BIN_OP_XOR_uxn_c_l63_c12_a791_return_output;
     VAR_eval_opcode_uxn_c_l42_c11_91fe_k := VAR_MUX_uxn_c_l39_c7_11c2_return_output;
     VAR_k_MUX_uxn_c_l36_c2_19e1_iftrue := VAR_MUX_uxn_c_l39_c7_11c2_return_output;
     VAR_eval_opcode_uxn_c_l42_c11_91fe_stack_index := VAR_MUX_uxn_c_l40_c7_e722_return_output;
     VAR_s_MUX_uxn_c_l36_c2_19e1_iftrue := VAR_MUX_uxn_c_l40_c7_e722_return_output;
     VAR_MUX_uxn_c_l41_c11_c190_cond := resize(VAR_UNARY_OP_NOT_uxn_c_l41_c11_1cf2_return_output, 1);
     -- result_MUX[uxn_c_l61_c2_0b81] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l61_c2_0b81_cond <= VAR_result_MUX_uxn_c_l61_c2_0b81_cond;
     result_MUX_uxn_c_l61_c2_0b81_iftrue <= VAR_result_MUX_uxn_c_l61_c2_0b81_iftrue;
     result_MUX_uxn_c_l61_c2_0b81_iffalse <= VAR_result_MUX_uxn_c_l61_c2_0b81_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l61_c2_0b81_return_output := result_MUX_uxn_c_l61_c2_0b81_return_output;

     -- BIN_OP_AND[uxn_c_l41_c26_429f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l41_c26_429f_left <= VAR_BIN_OP_AND_uxn_c_l41_c26_429f_left;
     BIN_OP_AND_uxn_c_l41_c26_429f_right <= VAR_BIN_OP_AND_uxn_c_l41_c26_429f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l41_c26_429f_return_output := BIN_OP_AND_uxn_c_l41_c26_429f_return_output;

     -- s_MUX[uxn_c_l36_c2_19e1] LATENCY=0
     -- Inputs
     s_MUX_uxn_c_l36_c2_19e1_cond <= VAR_s_MUX_uxn_c_l36_c2_19e1_cond;
     s_MUX_uxn_c_l36_c2_19e1_iftrue <= VAR_s_MUX_uxn_c_l36_c2_19e1_iftrue;
     s_MUX_uxn_c_l36_c2_19e1_iffalse <= VAR_s_MUX_uxn_c_l36_c2_19e1_iffalse;
     -- Outputs
     VAR_s_MUX_uxn_c_l36_c2_19e1_return_output := s_MUX_uxn_c_l36_c2_19e1_return_output;

     -- k_MUX[uxn_c_l36_c2_19e1] LATENCY=0
     -- Inputs
     k_MUX_uxn_c_l36_c2_19e1_cond <= VAR_k_MUX_uxn_c_l36_c2_19e1_cond;
     k_MUX_uxn_c_l36_c2_19e1_iftrue <= VAR_k_MUX_uxn_c_l36_c2_19e1_iftrue;
     k_MUX_uxn_c_l36_c2_19e1_iffalse <= VAR_k_MUX_uxn_c_l36_c2_19e1_iffalse;
     -- Outputs
     VAR_k_MUX_uxn_c_l36_c2_19e1_return_output := k_MUX_uxn_c_l36_c2_19e1_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l41_c11_c190_iftrue := VAR_BIN_OP_AND_uxn_c_l41_c26_429f_return_output;
     REG_VAR_k := VAR_k_MUX_uxn_c_l36_c2_19e1_return_output;
     VAR_BIN_OP_XOR_uxn_c_l67_c12_71e3_left := VAR_result_MUX_uxn_c_l61_c2_0b81_return_output;
     VAR_result_MUX_uxn_c_l66_c2_1a86_iffalse := VAR_result_MUX_uxn_c_l61_c2_0b81_return_output;
     REG_VAR_s := VAR_s_MUX_uxn_c_l36_c2_19e1_return_output;
     -- MUX[uxn_c_l41_c11_c190] LATENCY=0
     -- Inputs
     MUX_uxn_c_l41_c11_c190_cond <= VAR_MUX_uxn_c_l41_c11_c190_cond;
     MUX_uxn_c_l41_c11_c190_iftrue <= VAR_MUX_uxn_c_l41_c11_c190_iftrue;
     MUX_uxn_c_l41_c11_c190_iffalse <= VAR_MUX_uxn_c_l41_c11_c190_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l41_c11_c190_return_output := MUX_uxn_c_l41_c11_c190_return_output;

     -- BIN_OP_XOR[uxn_c_l67_c12_71e3] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l67_c12_71e3_left <= VAR_BIN_OP_XOR_uxn_c_l67_c12_71e3_left;
     BIN_OP_XOR_uxn_c_l67_c12_71e3_right <= VAR_BIN_OP_XOR_uxn_c_l67_c12_71e3_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l67_c12_71e3_return_output := BIN_OP_XOR_uxn_c_l67_c12_71e3_return_output;

     -- Submodule level 11
     VAR_result_MUX_uxn_c_l66_c2_1a86_iftrue := VAR_BIN_OP_XOR_uxn_c_l67_c12_71e3_return_output;
     VAR_eval_opcode_uxn_c_l42_c11_91fe_opcode := VAR_MUX_uxn_c_l41_c11_c190_return_output;
     VAR_opc_MUX_uxn_c_l36_c2_19e1_iftrue := VAR_MUX_uxn_c_l41_c11_c190_return_output;
     -- opc_MUX[uxn_c_l36_c2_19e1] LATENCY=0
     -- Inputs
     opc_MUX_uxn_c_l36_c2_19e1_cond <= VAR_opc_MUX_uxn_c_l36_c2_19e1_cond;
     opc_MUX_uxn_c_l36_c2_19e1_iftrue <= VAR_opc_MUX_uxn_c_l36_c2_19e1_iftrue;
     opc_MUX_uxn_c_l36_c2_19e1_iffalse <= VAR_opc_MUX_uxn_c_l36_c2_19e1_iffalse;
     -- Outputs
     VAR_opc_MUX_uxn_c_l36_c2_19e1_return_output := opc_MUX_uxn_c_l36_c2_19e1_return_output;

     -- result_MUX[uxn_c_l66_c2_1a86] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l66_c2_1a86_cond <= VAR_result_MUX_uxn_c_l66_c2_1a86_cond;
     result_MUX_uxn_c_l66_c2_1a86_iftrue <= VAR_result_MUX_uxn_c_l66_c2_1a86_iftrue;
     result_MUX_uxn_c_l66_c2_1a86_iffalse <= VAR_result_MUX_uxn_c_l66_c2_1a86_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l66_c2_1a86_return_output := result_MUX_uxn_c_l66_c2_1a86_return_output;

     -- eval_opcode[uxn_c_l42_c11_91fe] LATENCY=0
     -- Clock enable
     eval_opcode_uxn_c_l42_c11_91fe_CLOCK_ENABLE <= VAR_eval_opcode_uxn_c_l42_c11_91fe_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_uxn_c_l42_c11_91fe_stack_index <= VAR_eval_opcode_uxn_c_l42_c11_91fe_stack_index;
     eval_opcode_uxn_c_l42_c11_91fe_opcode <= VAR_eval_opcode_uxn_c_l42_c11_91fe_opcode;
     eval_opcode_uxn_c_l42_c11_91fe_ins <= VAR_eval_opcode_uxn_c_l42_c11_91fe_ins;
     eval_opcode_uxn_c_l42_c11_91fe_k <= VAR_eval_opcode_uxn_c_l42_c11_91fe_k;
     -- Outputs
     VAR_eval_opcode_uxn_c_l42_c11_91fe_return_output := eval_opcode_uxn_c_l42_c11_91fe_return_output;

     -- Submodule level 12
     VAR_error_MUX_uxn_c_l36_c2_19e1_iftrue := VAR_eval_opcode_uxn_c_l42_c11_91fe_return_output;
     REG_VAR_opc := VAR_opc_MUX_uxn_c_l36_c2_19e1_return_output;
     VAR_BIN_OP_XOR_uxn_c_l71_c12_1372_left := VAR_result_MUX_uxn_c_l66_c2_1a86_return_output;
     VAR_result_MUX_uxn_c_l70_c2_ec4c_iffalse := VAR_result_MUX_uxn_c_l66_c2_1a86_return_output;
     -- error_MUX[uxn_c_l36_c2_19e1] LATENCY=0
     -- Inputs
     error_MUX_uxn_c_l36_c2_19e1_cond <= VAR_error_MUX_uxn_c_l36_c2_19e1_cond;
     error_MUX_uxn_c_l36_c2_19e1_iftrue <= VAR_error_MUX_uxn_c_l36_c2_19e1_iftrue;
     error_MUX_uxn_c_l36_c2_19e1_iffalse <= VAR_error_MUX_uxn_c_l36_c2_19e1_iffalse;
     -- Outputs
     VAR_error_MUX_uxn_c_l36_c2_19e1_return_output := error_MUX_uxn_c_l36_c2_19e1_return_output;

     -- BIN_OP_XOR[uxn_c_l71_c12_1372] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l71_c12_1372_left <= VAR_BIN_OP_XOR_uxn_c_l71_c12_1372_left;
     BIN_OP_XOR_uxn_c_l71_c12_1372_right <= VAR_BIN_OP_XOR_uxn_c_l71_c12_1372_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l71_c12_1372_return_output := BIN_OP_XOR_uxn_c_l71_c12_1372_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_c_l70_c2_ec4c_iftrue := VAR_BIN_OP_XOR_uxn_c_l71_c12_1372_return_output;
     VAR_MUX_uxn_c_l78_c36_2a82_cond := VAR_error_MUX_uxn_c_l36_c2_19e1_return_output;
     REG_VAR_error := VAR_error_MUX_uxn_c_l36_c2_19e1_return_output;
     -- MUX[uxn_c_l78_c36_2a82] LATENCY=0
     -- Inputs
     MUX_uxn_c_l78_c36_2a82_cond <= VAR_MUX_uxn_c_l78_c36_2a82_cond;
     MUX_uxn_c_l78_c36_2a82_iftrue <= VAR_MUX_uxn_c_l78_c36_2a82_iftrue;
     MUX_uxn_c_l78_c36_2a82_iffalse <= VAR_MUX_uxn_c_l78_c36_2a82_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l78_c36_2a82_return_output := MUX_uxn_c_l78_c36_2a82_return_output;

     -- result_MUX[uxn_c_l70_c2_ec4c] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l70_c2_ec4c_cond <= VAR_result_MUX_uxn_c_l70_c2_ec4c_cond;
     result_MUX_uxn_c_l70_c2_ec4c_iftrue <= VAR_result_MUX_uxn_c_l70_c2_ec4c_iftrue;
     result_MUX_uxn_c_l70_c2_ec4c_iffalse <= VAR_result_MUX_uxn_c_l70_c2_ec4c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l70_c2_ec4c_return_output := result_MUX_uxn_c_l70_c2_ec4c_return_output;

     -- Submodule level 14
     VAR_BIN_OP_OR_uxn_c_l78_c12_9c6e_right := VAR_MUX_uxn_c_l78_c36_2a82_return_output;
     VAR_BIN_OP_XOR_uxn_c_l75_c12_9ae2_left := VAR_result_MUX_uxn_c_l70_c2_ec4c_return_output;
     VAR_result_MUX_uxn_c_l74_c2_a90d_iffalse := VAR_result_MUX_uxn_c_l70_c2_ec4c_return_output;
     -- BIN_OP_XOR[uxn_c_l75_c12_9ae2] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_c_l75_c12_9ae2_left <= VAR_BIN_OP_XOR_uxn_c_l75_c12_9ae2_left;
     BIN_OP_XOR_uxn_c_l75_c12_9ae2_right <= VAR_BIN_OP_XOR_uxn_c_l75_c12_9ae2_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_c_l75_c12_9ae2_return_output := BIN_OP_XOR_uxn_c_l75_c12_9ae2_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_c_l74_c2_a90d_iftrue := VAR_BIN_OP_XOR_uxn_c_l75_c12_9ae2_return_output;
     -- result_MUX[uxn_c_l74_c2_a90d] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l74_c2_a90d_cond <= VAR_result_MUX_uxn_c_l74_c2_a90d_cond;
     result_MUX_uxn_c_l74_c2_a90d_iftrue <= VAR_result_MUX_uxn_c_l74_c2_a90d_iftrue;
     result_MUX_uxn_c_l74_c2_a90d_iffalse <= VAR_result_MUX_uxn_c_l74_c2_a90d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l74_c2_a90d_return_output := result_MUX_uxn_c_l74_c2_a90d_return_output;

     -- Submodule level 16
     VAR_BIN_OP_AND_uxn_c_l78_c12_5c88_left := VAR_result_MUX_uxn_c_l74_c2_a90d_return_output;
     -- BIN_OP_AND[uxn_c_l78_c12_5c88] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l78_c12_5c88_left <= VAR_BIN_OP_AND_uxn_c_l78_c12_5c88_left;
     BIN_OP_AND_uxn_c_l78_c12_5c88_right <= VAR_BIN_OP_AND_uxn_c_l78_c12_5c88_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l78_c12_5c88_return_output := BIN_OP_AND_uxn_c_l78_c12_5c88_return_output;

     -- Submodule level 17
     VAR_BIN_OP_OR_uxn_c_l78_c12_9c6e_left := VAR_BIN_OP_AND_uxn_c_l78_c12_5c88_return_output;
     -- BIN_OP_OR[uxn_c_l78_c12_9c6e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l78_c12_9c6e_left <= VAR_BIN_OP_OR_uxn_c_l78_c12_9c6e_left;
     BIN_OP_OR_uxn_c_l78_c12_9c6e_right <= VAR_BIN_OP_OR_uxn_c_l78_c12_9c6e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l78_c12_9c6e_return_output := BIN_OP_OR_uxn_c_l78_c12_9c6e_return_output;

     -- Submodule level 18
     REG_VAR_result := VAR_BIN_OP_OR_uxn_c_l78_c12_9c6e_return_output;
     VAR_return_output := VAR_BIN_OP_OR_uxn_c_l78_c12_9c6e_return_output;
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
