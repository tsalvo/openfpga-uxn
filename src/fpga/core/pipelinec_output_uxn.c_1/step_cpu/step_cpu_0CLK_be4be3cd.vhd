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
-- Submodules: 129
entity step_cpu_0CLK_be4be3cd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0));
end step_cpu_0CLK_be4be3cd;
architecture arch of step_cpu_0CLK_be4be3cd is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal pc : unsigned(15 downto 0) := to_unsigned(0, 16);
signal sp : unsigned(7 downto 0) := to_unsigned(0, 8);
signal sp0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal sp1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal k : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ins : unsigned(7 downto 0) := to_unsigned(0, 8);
signal system_state : unsigned(7 downto 0) := to_unsigned(0, 8);
signal cpu_phase : unsigned(3 downto 0) := to_unsigned(0, 4);
signal stack_index : unsigned(0 downto 0) := to_unsigned(0, 1);
signal pc_nonzero : unsigned(0 downto 0) := to_unsigned(0, 1);
signal system_state_zero : unsigned(0 downto 0) := to_unsigned(0, 1);
signal should_cpu_eval : unsigned(0 downto 0) := to_unsigned(0, 1);
signal eval_result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_pc : unsigned(15 downto 0);
signal REG_COMB_sp : unsigned(7 downto 0);
signal REG_COMB_sp0 : unsigned(7 downto 0);
signal REG_COMB_sp1 : unsigned(7 downto 0);
signal REG_COMB_k : unsigned(7 downto 0);
signal REG_COMB_opc : unsigned(7 downto 0);
signal REG_COMB_ins : unsigned(7 downto 0);
signal REG_COMB_system_state : unsigned(7 downto 0);
signal REG_COMB_cpu_phase : unsigned(3 downto 0);
signal REG_COMB_stack_index : unsigned(0 downto 0);
signal REG_COMB_pc_nonzero : unsigned(0 downto 0);
signal REG_COMB_system_state_zero : unsigned(0 downto 0);
signal REG_COMB_should_cpu_eval : unsigned(0 downto 0);
signal REG_COMB_eval_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_c_l48_c6_c16b]
signal BIN_OP_EQ_uxn_c_l48_c6_c16b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l48_c6_c16b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l48_c1_0adc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l56_c7_eaaf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l48_c2_9c52]
signal pc_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(15 downto 0);

-- k_MUX[uxn_c_l48_c2_9c52]
signal k_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
signal k_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(7 downto 0);
signal k_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(7 downto 0);
signal k_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_c_l48_c2_9c52]
signal sp0_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(7 downto 0);

-- system_state_zero_MUX[uxn_c_l48_c2_9c52]
signal system_state_zero_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
signal system_state_zero_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(0 downto 0);
signal system_state_zero_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(0 downto 0);
signal system_state_zero_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l48_c2_9c52]
signal ins_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(7 downto 0);

-- sp_MUX[uxn_c_l48_c2_9c52]
signal sp_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
signal sp_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(7 downto 0);
signal sp_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(7 downto 0);
signal sp_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_c_l48_c2_9c52]
signal sp1_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(7 downto 0);

-- system_state_MUX[uxn_c_l48_c2_9c52]
signal system_state_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
signal system_state_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(7 downto 0);
signal system_state_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(7 downto 0);
signal system_state_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(7 downto 0);

-- eval_result_MUX[uxn_c_l48_c2_9c52]
signal eval_result_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(0 downto 0);

-- should_cpu_eval_MUX[uxn_c_l48_c2_9c52]
signal should_cpu_eval_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
signal should_cpu_eval_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(0 downto 0);
signal should_cpu_eval_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(0 downto 0);
signal should_cpu_eval_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(0 downto 0);

-- stack_index_MUX[uxn_c_l48_c2_9c52]
signal stack_index_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
signal stack_index_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(0 downto 0);
signal stack_index_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(0 downto 0);
signal stack_index_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(0 downto 0);

-- opc_MUX[uxn_c_l48_c2_9c52]
signal opc_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
signal opc_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(7 downto 0);

-- pc_get[uxn_c_l50_c8_6d69]
signal pc_get_uxn_c_l50_c8_6d69_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_c_l50_c8_6d69_return_output : unsigned(15 downto 0);

-- peek_dev[uxn_c_l51_c18_572f]
signal peek_dev_uxn_c_l51_c18_572f_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_c_l51_c18_572f_address : unsigned(7 downto 0);
signal peek_dev_uxn_c_l51_c18_572f_return_output : unsigned(7 downto 0);

-- stack_pointer_get[uxn_c_l52_c9_0b82]
signal stack_pointer_get_uxn_c_l52_c9_0b82_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_c_l52_c9_0b82_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_c_l52_c9_0b82_return_output : unsigned(7 downto 0);

-- stack_pointer_get[uxn_c_l53_c9_dccb]
signal stack_pointer_get_uxn_c_l53_c9_dccb_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_c_l53_c9_dccb_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_c_l53_c9_dccb_return_output : unsigned(7 downto 0);

-- peek_ram[uxn_c_l54_c9_cd3a]
signal peek_ram_uxn_c_l54_c9_cd3a_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_c_l54_c9_cd3a_address : unsigned(15 downto 0);
signal peek_ram_uxn_c_l54_c9_cd3a_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l54_c9_7569]
signal BIN_OP_AND_uxn_c_l54_c9_7569_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l54_c9_7569_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l54_c9_7569_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l56_c11_8f80]
signal BIN_OP_EQ_uxn_c_l56_c11_8f80_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l56_c11_8f80_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l56_c1_bb1b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l69_c7_1d06]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_return_output : unsigned(0 downto 0);

-- pc_MUX[uxn_c_l56_c7_eaaf]
signal pc_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
signal pc_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(15 downto 0);
signal pc_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(15 downto 0);

-- k_MUX[uxn_c_l56_c7_eaaf]
signal k_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
signal k_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(7 downto 0);
signal k_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(7 downto 0);
signal k_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(7 downto 0);

-- system_state_zero_MUX[uxn_c_l56_c7_eaaf]
signal system_state_zero_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
signal system_state_zero_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(0 downto 0);
signal system_state_zero_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(0 downto 0);
signal system_state_zero_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l56_c7_eaaf]
signal ins_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(7 downto 0);

-- sp_MUX[uxn_c_l56_c7_eaaf]
signal sp_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
signal sp_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(7 downto 0);
signal sp_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(7 downto 0);
signal sp_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(7 downto 0);

-- system_state_MUX[uxn_c_l56_c7_eaaf]
signal system_state_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
signal system_state_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(7 downto 0);
signal system_state_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(7 downto 0);
signal system_state_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(7 downto 0);

-- eval_result_MUX[uxn_c_l56_c7_eaaf]
signal eval_result_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(0 downto 0);

-- should_cpu_eval_MUX[uxn_c_l56_c7_eaaf]
signal should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
signal should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(0 downto 0);
signal should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(0 downto 0);
signal should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(0 downto 0);

-- stack_index_MUX[uxn_c_l56_c7_eaaf]
signal stack_index_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
signal stack_index_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(0 downto 0);
signal stack_index_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(0 downto 0);
signal stack_index_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(0 downto 0);

-- opc_MUX[uxn_c_l56_c7_eaaf]
signal opc_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
signal opc_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(7 downto 0);

-- peek_ram[uxn_c_l57_c9_bc6c]
signal peek_ram_uxn_c_l57_c9_bc6c_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_c_l57_c9_bc6c_address : unsigned(15 downto 0);
signal peek_ram_uxn_c_l57_c9_bc6c_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l57_c9_1a3f]
signal BIN_OP_AND_uxn_c_l57_c9_1a3f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l57_c9_1a3f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l57_c9_1a3f_return_output : unsigned(7 downto 0);

-- peek_dev[uxn_c_l58_c18_0eef]
signal peek_dev_uxn_c_l58_c18_0eef_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_c_l58_c18_0eef_address : unsigned(7 downto 0);
signal peek_dev_uxn_c_l58_c18_0eef_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l59_c7_acd7]
signal BIN_OP_AND_uxn_c_l59_c7_acd7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l59_c7_acd7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l59_c7_acd7_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l59_c7_ab2c]
signal MUX_uxn_c_l59_c7_ab2c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l59_c7_ab2c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l59_c7_ab2c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l59_c7_ab2c_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l60_c17_5373]
signal BIN_OP_AND_uxn_c_l60_c17_5373_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l60_c17_5373_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_c_l60_c17_5373_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l60_c17_96f0]
signal MUX_uxn_c_l60_c17_96f0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l60_c17_96f0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l60_c17_96f0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l60_c17_96f0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l61_c8_246d]
signal BIN_OP_EQ_uxn_c_l61_c8_246d_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l61_c8_246d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l61_c8_246d_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l61_c8_73f0]
signal MUX_uxn_c_l61_c8_73f0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l61_c8_73f0_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l61_c8_73f0_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l61_c8_73f0_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l62_c11_ac24]
signal BIN_OP_AND_uxn_c_l62_c11_ac24_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l62_c11_ac24_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_c_l62_c11_ac24_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l62_c11_1af7]
signal UNARY_OP_NOT_uxn_c_l62_c11_1af7_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_c_l62_c11_1af7_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_c_l62_c31_ea4a]
signal CONST_SR_5_uxn_c_l62_c31_ea4a_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_c_l62_c31_ea4a_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l62_c26_fa33]
signal BIN_OP_MINUS_uxn_c_l62_c26_fa33_left : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l62_c26_fa33_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l62_c26_fa33_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l62_c26_032f]
signal BIN_OP_AND_uxn_c_l62_c26_032f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l62_c26_032f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l62_c26_032f_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l62_c51_64e5]
signal BIN_OP_AND_uxn_c_l62_c51_64e5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l62_c51_64e5_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_c_l62_c51_64e5_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l62_c11_1550]
signal MUX_uxn_c_l62_c11_1550_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l62_c11_1550_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l62_c11_1550_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l62_c11_1550_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l63_c23_9531]
signal BIN_OP_EQ_uxn_c_l63_c23_9531_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l63_c23_9531_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l63_c23_9531_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l63_c23_0d80]
signal MUX_uxn_c_l63_c23_0d80_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l63_c23_0d80_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l63_c23_0d80_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l63_c23_0d80_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l64_c21_25f4]
signal BIN_OP_AND_uxn_c_l64_c21_25f4_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l64_c21_25f4_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l64_c21_25f4_return_output : unsigned(0 downto 0);

-- pc_add[uxn_c_l65_c3_39f9]
signal pc_add_uxn_c_l65_c3_39f9_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_c_l65_c3_39f9_adjustment : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l66_c3_00ad]
signal BIN_OP_PLUS_uxn_c_l66_c3_00ad_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l66_c3_00ad_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l66_c3_00ad_return_output : unsigned(16 downto 0);

-- UNARY_OP_NOT[uxn_c_l67_c18_c203]
signal UNARY_OP_NOT_uxn_c_l67_c18_c203_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l67_c18_c203_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l69_c11_0cb3]
signal BIN_OP_EQ_uxn_c_l69_c11_0cb3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l69_c11_0cb3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l69_c11_0cb3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l69_c1_c7cd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l72_c7_95d3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_return_output : unsigned(0 downto 0);

-- eval_result_MUX[uxn_c_l69_c7_1d06]
signal eval_result_MUX_uxn_c_l69_c7_1d06_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l69_c7_1d06_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l69_c7_1d06_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l69_c7_1d06_return_output : unsigned(0 downto 0);

-- eval_opcode_phased[uxn_c_l70_c17_f1ab]
signal eval_opcode_phased_uxn_c_l70_c17_f1ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l70_c17_f1ab_phase : unsigned(3 downto 0);
signal eval_opcode_phased_uxn_c_l70_c17_f1ab_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l70_c17_f1ab_sp : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l70_c17_f1ab_stack_index : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l70_c17_f1ab_opcode : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l70_c17_f1ab_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l70_c17_f1ab_k : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l70_c17_f1ab_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l72_c11_0759]
signal BIN_OP_EQ_uxn_c_l72_c11_0759_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l72_c11_0759_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l72_c11_0759_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l72_c1_267d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l75_c7_8510]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_return_output : unsigned(0 downto 0);

-- eval_result_MUX[uxn_c_l72_c7_95d3]
signal eval_result_MUX_uxn_c_l72_c7_95d3_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l72_c7_95d3_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l72_c7_95d3_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l72_c7_95d3_return_output : unsigned(0 downto 0);

-- eval_opcode_phased[uxn_c_l73_c17_0f88]
signal eval_opcode_phased_uxn_c_l73_c17_0f88_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l73_c17_0f88_phase : unsigned(3 downto 0);
signal eval_opcode_phased_uxn_c_l73_c17_0f88_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l73_c17_0f88_sp : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l73_c17_0f88_stack_index : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l73_c17_0f88_opcode : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l73_c17_0f88_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l73_c17_0f88_k : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l73_c17_0f88_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l75_c11_7257]
signal BIN_OP_EQ_uxn_c_l75_c11_7257_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c11_7257_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_c_l75_c11_7257_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l75_c1_f24e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l78_c7_7b39]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_return_output : unsigned(0 downto 0);

-- eval_result_MUX[uxn_c_l75_c7_8510]
signal eval_result_MUX_uxn_c_l75_c7_8510_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l75_c7_8510_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l75_c7_8510_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l75_c7_8510_return_output : unsigned(0 downto 0);

-- eval_opcode_phased[uxn_c_l76_c17_a11f]
signal eval_opcode_phased_uxn_c_l76_c17_a11f_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l76_c17_a11f_phase : unsigned(3 downto 0);
signal eval_opcode_phased_uxn_c_l76_c17_a11f_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l76_c17_a11f_sp : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l76_c17_a11f_stack_index : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l76_c17_a11f_opcode : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l76_c17_a11f_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l76_c17_a11f_k : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l76_c17_a11f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l78_c11_3ac5]
signal BIN_OP_EQ_uxn_c_l78_c11_3ac5_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l78_c11_3ac5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_c_l78_c11_3ac5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l78_c1_ce9e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c7_1569]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_return_output : unsigned(0 downto 0);

-- eval_result_MUX[uxn_c_l78_c7_7b39]
signal eval_result_MUX_uxn_c_l78_c7_7b39_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l78_c7_7b39_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l78_c7_7b39_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l78_c7_7b39_return_output : unsigned(0 downto 0);

-- eval_opcode_phased[uxn_c_l79_c17_4bb9]
signal eval_opcode_phased_uxn_c_l79_c17_4bb9_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l79_c17_4bb9_phase : unsigned(3 downto 0);
signal eval_opcode_phased_uxn_c_l79_c17_4bb9_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l79_c17_4bb9_sp : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l79_c17_4bb9_stack_index : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l79_c17_4bb9_opcode : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l79_c17_4bb9_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l79_c17_4bb9_k : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l79_c17_4bb9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l81_c11_a851]
signal BIN_OP_EQ_uxn_c_l81_c11_a851_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c11_a851_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_c_l81_c11_a851_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l81_c1_4814]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l84_c7_4af9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_return_output : unsigned(0 downto 0);

-- eval_result_MUX[uxn_c_l81_c7_1569]
signal eval_result_MUX_uxn_c_l81_c7_1569_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l81_c7_1569_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l81_c7_1569_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l81_c7_1569_return_output : unsigned(0 downto 0);

-- eval_opcode_phased[uxn_c_l82_c17_e16d]
signal eval_opcode_phased_uxn_c_l82_c17_e16d_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l82_c17_e16d_phase : unsigned(3 downto 0);
signal eval_opcode_phased_uxn_c_l82_c17_e16d_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l82_c17_e16d_sp : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c17_e16d_stack_index : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l82_c17_e16d_opcode : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c17_e16d_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c17_e16d_k : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l82_c17_e16d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l84_c11_a45f]
signal BIN_OP_EQ_uxn_c_l84_c11_a45f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l84_c11_a45f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_c_l84_c11_a45f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l84_c1_d59a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l87_c7_414c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_return_output : unsigned(0 downto 0);

-- eval_result_MUX[uxn_c_l84_c7_4af9]
signal eval_result_MUX_uxn_c_l84_c7_4af9_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l84_c7_4af9_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l84_c7_4af9_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l84_c7_4af9_return_output : unsigned(0 downto 0);

-- eval_opcode_phased[uxn_c_l85_c17_1333]
signal eval_opcode_phased_uxn_c_l85_c17_1333_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l85_c17_1333_phase : unsigned(3 downto 0);
signal eval_opcode_phased_uxn_c_l85_c17_1333_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l85_c17_1333_sp : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l85_c17_1333_stack_index : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l85_c17_1333_opcode : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l85_c17_1333_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l85_c17_1333_k : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l85_c17_1333_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l87_c11_1401]
signal BIN_OP_EQ_uxn_c_l87_c11_1401_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c11_1401_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l87_c11_1401_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l87_c1_8603]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l90_c7_dfb7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_return_output : unsigned(0 downto 0);

-- eval_result_MUX[uxn_c_l87_c7_414c]
signal eval_result_MUX_uxn_c_l87_c7_414c_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l87_c7_414c_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l87_c7_414c_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l87_c7_414c_return_output : unsigned(0 downto 0);

-- eval_opcode_phased[uxn_c_l88_c17_d7c4]
signal eval_opcode_phased_uxn_c_l88_c17_d7c4_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l88_c17_d7c4_phase : unsigned(3 downto 0);
signal eval_opcode_phased_uxn_c_l88_c17_d7c4_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l88_c17_d7c4_sp : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l88_c17_d7c4_stack_index : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l88_c17_d7c4_opcode : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l88_c17_d7c4_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l88_c17_d7c4_k : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l88_c17_d7c4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l90_c11_fbe4]
signal BIN_OP_EQ_uxn_c_l90_c11_fbe4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l90_c11_fbe4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l90_c11_fbe4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l90_c1_fd86]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l93_c7_1e01]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_return_output : unsigned(0 downto 0);

-- eval_result_MUX[uxn_c_l90_c7_dfb7]
signal eval_result_MUX_uxn_c_l90_c7_dfb7_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l90_c7_dfb7_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l90_c7_dfb7_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l90_c7_dfb7_return_output : unsigned(0 downto 0);

-- eval_opcode_phased[uxn_c_l91_c17_c6f8]
signal eval_opcode_phased_uxn_c_l91_c17_c6f8_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l91_c17_c6f8_phase : unsigned(3 downto 0);
signal eval_opcode_phased_uxn_c_l91_c17_c6f8_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l91_c17_c6f8_sp : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l91_c17_c6f8_stack_index : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l91_c17_c6f8_opcode : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l91_c17_c6f8_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l91_c17_c6f8_k : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l91_c17_c6f8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l93_c11_06fa]
signal BIN_OP_EQ_uxn_c_l93_c11_06fa_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l93_c11_06fa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l93_c11_06fa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l93_c1_97f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l96_c7_b854]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_return_output : unsigned(0 downto 0);

-- eval_result_MUX[uxn_c_l93_c7_1e01]
signal eval_result_MUX_uxn_c_l93_c7_1e01_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l93_c7_1e01_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l93_c7_1e01_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l93_c7_1e01_return_output : unsigned(0 downto 0);

-- eval_opcode_phased[uxn_c_l94_c17_5ac9]
signal eval_opcode_phased_uxn_c_l94_c17_5ac9_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l94_c17_5ac9_phase : unsigned(3 downto 0);
signal eval_opcode_phased_uxn_c_l94_c17_5ac9_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l94_c17_5ac9_sp : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l94_c17_5ac9_stack_index : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l94_c17_5ac9_opcode : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l94_c17_5ac9_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l94_c17_5ac9_k : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l94_c17_5ac9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l96_c11_6e69]
signal BIN_OP_EQ_uxn_c_l96_c11_6e69_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l96_c11_6e69_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l96_c11_6e69_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l96_c1_2124]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l99_c7_6c18]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_return_output : unsigned(0 downto 0);

-- eval_result_MUX[uxn_c_l96_c7_b854]
signal eval_result_MUX_uxn_c_l96_c7_b854_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l96_c7_b854_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l96_c7_b854_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l96_c7_b854_return_output : unsigned(0 downto 0);

-- eval_opcode_phased[uxn_c_l97_c17_6d57]
signal eval_opcode_phased_uxn_c_l97_c17_6d57_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l97_c17_6d57_phase : unsigned(3 downto 0);
signal eval_opcode_phased_uxn_c_l97_c17_6d57_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l97_c17_6d57_sp : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l97_c17_6d57_stack_index : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l97_c17_6d57_opcode : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l97_c17_6d57_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l97_c17_6d57_k : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l97_c17_6d57_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l99_c11_2b97]
signal BIN_OP_EQ_uxn_c_l99_c11_2b97_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c11_2b97_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l99_c11_2b97_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l99_c1_193d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l102_c7_4d8d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_return_output : unsigned(0 downto 0);

-- eval_result_MUX[uxn_c_l99_c7_6c18]
signal eval_result_MUX_uxn_c_l99_c7_6c18_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l99_c7_6c18_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l99_c7_6c18_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l99_c7_6c18_return_output : unsigned(0 downto 0);

-- eval_opcode_phased[uxn_c_l100_c17_e45a]
signal eval_opcode_phased_uxn_c_l100_c17_e45a_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l100_c17_e45a_phase : unsigned(3 downto 0);
signal eval_opcode_phased_uxn_c_l100_c17_e45a_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l100_c17_e45a_sp : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l100_c17_e45a_stack_index : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l100_c17_e45a_opcode : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l100_c17_e45a_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l100_c17_e45a_k : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l100_c17_e45a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l102_c11_2dcf]
signal BIN_OP_EQ_uxn_c_l102_c11_2dcf_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c11_2dcf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l102_c11_2dcf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l102_c1_e436]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l105_c7_5f8a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_return_output : unsigned(0 downto 0);

-- eval_result_MUX[uxn_c_l102_c7_4d8d]
signal eval_result_MUX_uxn_c_l102_c7_4d8d_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l102_c7_4d8d_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l102_c7_4d8d_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l102_c7_4d8d_return_output : unsigned(0 downto 0);

-- eval_opcode_phased[uxn_c_l103_c17_ed67]
signal eval_opcode_phased_uxn_c_l103_c17_ed67_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l103_c17_ed67_phase : unsigned(3 downto 0);
signal eval_opcode_phased_uxn_c_l103_c17_ed67_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l103_c17_ed67_sp : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l103_c17_ed67_stack_index : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l103_c17_ed67_opcode : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l103_c17_ed67_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l103_c17_ed67_k : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l103_c17_ed67_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l105_c11_5cf8]
signal BIN_OP_EQ_uxn_c_l105_c11_5cf8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l105_c11_5cf8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l105_c11_5cf8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l105_c1_48f5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l108_c7_5763]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_return_output : unsigned(0 downto 0);

-- eval_result_MUX[uxn_c_l105_c7_5f8a]
signal eval_result_MUX_uxn_c_l105_c7_5f8a_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l105_c7_5f8a_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l105_c7_5f8a_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l105_c7_5f8a_return_output : unsigned(0 downto 0);

-- eval_opcode_phased[uxn_c_l106_c17_367f]
signal eval_opcode_phased_uxn_c_l106_c17_367f_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l106_c17_367f_phase : unsigned(3 downto 0);
signal eval_opcode_phased_uxn_c_l106_c17_367f_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l106_c17_367f_sp : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l106_c17_367f_stack_index : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l106_c17_367f_opcode : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l106_c17_367f_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l106_c17_367f_k : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l106_c17_367f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l108_c11_ed25]
signal BIN_OP_EQ_uxn_c_l108_c11_ed25_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l108_c11_ed25_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l108_c11_ed25_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l108_c1_f240]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_return_output : unsigned(0 downto 0);

-- eval_result_MUX[uxn_c_l108_c7_5763]
signal eval_result_MUX_uxn_c_l108_c7_5763_cond : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l108_c7_5763_iftrue : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l108_c7_5763_iffalse : unsigned(0 downto 0);
signal eval_result_MUX_uxn_c_l108_c7_5763_return_output : unsigned(0 downto 0);

-- eval_opcode_phased[uxn_c_l109_c17_7a04]
signal eval_opcode_phased_uxn_c_l109_c17_7a04_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l109_c17_7a04_phase : unsigned(3 downto 0);
signal eval_opcode_phased_uxn_c_l109_c17_7a04_pc : unsigned(15 downto 0);
signal eval_opcode_phased_uxn_c_l109_c17_7a04_sp : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l109_c17_7a04_stack_index : unsigned(0 downto 0);
signal eval_opcode_phased_uxn_c_l109_c17_7a04_opcode : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l109_c17_7a04_ins : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l109_c17_7a04_k : unsigned(7 downto 0);
signal eval_opcode_phased_uxn_c_l109_c17_7a04_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_c_l112_c6_02eb]
signal BIN_OP_EQ_uxn_c_l112_c6_02eb_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l112_c6_02eb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l112_c6_02eb_return_output : unsigned(0 downto 0);

-- cpu_phase_MUX[uxn_c_l112_c2_0a10]
signal cpu_phase_MUX_uxn_c_l112_c2_0a10_cond : unsigned(0 downto 0);
signal cpu_phase_MUX_uxn_c_l112_c2_0a10_iftrue : unsigned(3 downto 0);
signal cpu_phase_MUX_uxn_c_l112_c2_0a10_iffalse : unsigned(3 downto 0);
signal cpu_phase_MUX_uxn_c_l112_c2_0a10_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_c_l115_c3_6be8]
signal BIN_OP_PLUS_uxn_c_l115_c3_6be8_left : unsigned(3 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c3_6be8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l115_c3_6be8_return_output : unsigned(4 downto 0);

function CAST_TO_uint16_t_uint1_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(0 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_c_l48_c6_c16b
BIN_OP_EQ_uxn_c_l48_c6_c16b : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l48_c6_c16b_left,
BIN_OP_EQ_uxn_c_l48_c6_c16b_right,
BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc
TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf
FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_return_output);

-- pc_MUX_uxn_c_l48_c2_9c52
pc_MUX_uxn_c_l48_c2_9c52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l48_c2_9c52_cond,
pc_MUX_uxn_c_l48_c2_9c52_iftrue,
pc_MUX_uxn_c_l48_c2_9c52_iffalse,
pc_MUX_uxn_c_l48_c2_9c52_return_output);

-- k_MUX_uxn_c_l48_c2_9c52
k_MUX_uxn_c_l48_c2_9c52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
k_MUX_uxn_c_l48_c2_9c52_cond,
k_MUX_uxn_c_l48_c2_9c52_iftrue,
k_MUX_uxn_c_l48_c2_9c52_iffalse,
k_MUX_uxn_c_l48_c2_9c52_return_output);

-- sp0_MUX_uxn_c_l48_c2_9c52
sp0_MUX_uxn_c_l48_c2_9c52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_c_l48_c2_9c52_cond,
sp0_MUX_uxn_c_l48_c2_9c52_iftrue,
sp0_MUX_uxn_c_l48_c2_9c52_iffalse,
sp0_MUX_uxn_c_l48_c2_9c52_return_output);

-- system_state_zero_MUX_uxn_c_l48_c2_9c52
system_state_zero_MUX_uxn_c_l48_c2_9c52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
system_state_zero_MUX_uxn_c_l48_c2_9c52_cond,
system_state_zero_MUX_uxn_c_l48_c2_9c52_iftrue,
system_state_zero_MUX_uxn_c_l48_c2_9c52_iffalse,
system_state_zero_MUX_uxn_c_l48_c2_9c52_return_output);

-- ins_MUX_uxn_c_l48_c2_9c52
ins_MUX_uxn_c_l48_c2_9c52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l48_c2_9c52_cond,
ins_MUX_uxn_c_l48_c2_9c52_iftrue,
ins_MUX_uxn_c_l48_c2_9c52_iffalse,
ins_MUX_uxn_c_l48_c2_9c52_return_output);

-- sp_MUX_uxn_c_l48_c2_9c52
sp_MUX_uxn_c_l48_c2_9c52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp_MUX_uxn_c_l48_c2_9c52_cond,
sp_MUX_uxn_c_l48_c2_9c52_iftrue,
sp_MUX_uxn_c_l48_c2_9c52_iffalse,
sp_MUX_uxn_c_l48_c2_9c52_return_output);

-- sp1_MUX_uxn_c_l48_c2_9c52
sp1_MUX_uxn_c_l48_c2_9c52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_c_l48_c2_9c52_cond,
sp1_MUX_uxn_c_l48_c2_9c52_iftrue,
sp1_MUX_uxn_c_l48_c2_9c52_iffalse,
sp1_MUX_uxn_c_l48_c2_9c52_return_output);

-- system_state_MUX_uxn_c_l48_c2_9c52
system_state_MUX_uxn_c_l48_c2_9c52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
system_state_MUX_uxn_c_l48_c2_9c52_cond,
system_state_MUX_uxn_c_l48_c2_9c52_iftrue,
system_state_MUX_uxn_c_l48_c2_9c52_iffalse,
system_state_MUX_uxn_c_l48_c2_9c52_return_output);

-- eval_result_MUX_uxn_c_l48_c2_9c52
eval_result_MUX_uxn_c_l48_c2_9c52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l48_c2_9c52_cond,
eval_result_MUX_uxn_c_l48_c2_9c52_iftrue,
eval_result_MUX_uxn_c_l48_c2_9c52_iffalse,
eval_result_MUX_uxn_c_l48_c2_9c52_return_output);

-- should_cpu_eval_MUX_uxn_c_l48_c2_9c52
should_cpu_eval_MUX_uxn_c_l48_c2_9c52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
should_cpu_eval_MUX_uxn_c_l48_c2_9c52_cond,
should_cpu_eval_MUX_uxn_c_l48_c2_9c52_iftrue,
should_cpu_eval_MUX_uxn_c_l48_c2_9c52_iffalse,
should_cpu_eval_MUX_uxn_c_l48_c2_9c52_return_output);

-- stack_index_MUX_uxn_c_l48_c2_9c52
stack_index_MUX_uxn_c_l48_c2_9c52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
stack_index_MUX_uxn_c_l48_c2_9c52_cond,
stack_index_MUX_uxn_c_l48_c2_9c52_iftrue,
stack_index_MUX_uxn_c_l48_c2_9c52_iffalse,
stack_index_MUX_uxn_c_l48_c2_9c52_return_output);

-- opc_MUX_uxn_c_l48_c2_9c52
opc_MUX_uxn_c_l48_c2_9c52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
opc_MUX_uxn_c_l48_c2_9c52_cond,
opc_MUX_uxn_c_l48_c2_9c52_iftrue,
opc_MUX_uxn_c_l48_c2_9c52_iffalse,
opc_MUX_uxn_c_l48_c2_9c52_return_output);

-- pc_get_uxn_c_l50_c8_6d69
pc_get_uxn_c_l50_c8_6d69 : entity work.pc_get_0CLK_9859a581 port map (
clk,
pc_get_uxn_c_l50_c8_6d69_CLOCK_ENABLE,
pc_get_uxn_c_l50_c8_6d69_return_output);

-- peek_dev_uxn_c_l51_c18_572f
peek_dev_uxn_c_l51_c18_572f : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_c_l51_c18_572f_CLOCK_ENABLE,
peek_dev_uxn_c_l51_c18_572f_address,
peek_dev_uxn_c_l51_c18_572f_return_output);

-- stack_pointer_get_uxn_c_l52_c9_0b82
stack_pointer_get_uxn_c_l52_c9_0b82 : entity work.stack_pointer_get_0CLK_7bf2eff3 port map (
clk,
stack_pointer_get_uxn_c_l52_c9_0b82_CLOCK_ENABLE,
stack_pointer_get_uxn_c_l52_c9_0b82_stack_index,
stack_pointer_get_uxn_c_l52_c9_0b82_return_output);

-- stack_pointer_get_uxn_c_l53_c9_dccb
stack_pointer_get_uxn_c_l53_c9_dccb : entity work.stack_pointer_get_0CLK_7bf2eff3 port map (
clk,
stack_pointer_get_uxn_c_l53_c9_dccb_CLOCK_ENABLE,
stack_pointer_get_uxn_c_l53_c9_dccb_stack_index,
stack_pointer_get_uxn_c_l53_c9_dccb_return_output);

-- peek_ram_uxn_c_l54_c9_cd3a
peek_ram_uxn_c_l54_c9_cd3a : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_c_l54_c9_cd3a_CLOCK_ENABLE,
peek_ram_uxn_c_l54_c9_cd3a_address,
peek_ram_uxn_c_l54_c9_cd3a_return_output);

-- BIN_OP_AND_uxn_c_l54_c9_7569
BIN_OP_AND_uxn_c_l54_c9_7569 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l54_c9_7569_left,
BIN_OP_AND_uxn_c_l54_c9_7569_right,
BIN_OP_AND_uxn_c_l54_c9_7569_return_output);

-- BIN_OP_EQ_uxn_c_l56_c11_8f80
BIN_OP_EQ_uxn_c_l56_c11_8f80 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l56_c11_8f80_left,
BIN_OP_EQ_uxn_c_l56_c11_8f80_right,
BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b
TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06
FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_return_output);

-- pc_MUX_uxn_c_l56_c7_eaaf
pc_MUX_uxn_c_l56_c7_eaaf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
pc_MUX_uxn_c_l56_c7_eaaf_cond,
pc_MUX_uxn_c_l56_c7_eaaf_iftrue,
pc_MUX_uxn_c_l56_c7_eaaf_iffalse,
pc_MUX_uxn_c_l56_c7_eaaf_return_output);

-- k_MUX_uxn_c_l56_c7_eaaf
k_MUX_uxn_c_l56_c7_eaaf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
k_MUX_uxn_c_l56_c7_eaaf_cond,
k_MUX_uxn_c_l56_c7_eaaf_iftrue,
k_MUX_uxn_c_l56_c7_eaaf_iffalse,
k_MUX_uxn_c_l56_c7_eaaf_return_output);

-- system_state_zero_MUX_uxn_c_l56_c7_eaaf
system_state_zero_MUX_uxn_c_l56_c7_eaaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
system_state_zero_MUX_uxn_c_l56_c7_eaaf_cond,
system_state_zero_MUX_uxn_c_l56_c7_eaaf_iftrue,
system_state_zero_MUX_uxn_c_l56_c7_eaaf_iffalse,
system_state_zero_MUX_uxn_c_l56_c7_eaaf_return_output);

-- ins_MUX_uxn_c_l56_c7_eaaf
ins_MUX_uxn_c_l56_c7_eaaf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l56_c7_eaaf_cond,
ins_MUX_uxn_c_l56_c7_eaaf_iftrue,
ins_MUX_uxn_c_l56_c7_eaaf_iffalse,
ins_MUX_uxn_c_l56_c7_eaaf_return_output);

-- sp_MUX_uxn_c_l56_c7_eaaf
sp_MUX_uxn_c_l56_c7_eaaf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp_MUX_uxn_c_l56_c7_eaaf_cond,
sp_MUX_uxn_c_l56_c7_eaaf_iftrue,
sp_MUX_uxn_c_l56_c7_eaaf_iffalse,
sp_MUX_uxn_c_l56_c7_eaaf_return_output);

-- system_state_MUX_uxn_c_l56_c7_eaaf
system_state_MUX_uxn_c_l56_c7_eaaf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
system_state_MUX_uxn_c_l56_c7_eaaf_cond,
system_state_MUX_uxn_c_l56_c7_eaaf_iftrue,
system_state_MUX_uxn_c_l56_c7_eaaf_iffalse,
system_state_MUX_uxn_c_l56_c7_eaaf_return_output);

-- eval_result_MUX_uxn_c_l56_c7_eaaf
eval_result_MUX_uxn_c_l56_c7_eaaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l56_c7_eaaf_cond,
eval_result_MUX_uxn_c_l56_c7_eaaf_iftrue,
eval_result_MUX_uxn_c_l56_c7_eaaf_iffalse,
eval_result_MUX_uxn_c_l56_c7_eaaf_return_output);

-- should_cpu_eval_MUX_uxn_c_l56_c7_eaaf
should_cpu_eval_MUX_uxn_c_l56_c7_eaaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_cond,
should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_iftrue,
should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_iffalse,
should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_return_output);

-- stack_index_MUX_uxn_c_l56_c7_eaaf
stack_index_MUX_uxn_c_l56_c7_eaaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
stack_index_MUX_uxn_c_l56_c7_eaaf_cond,
stack_index_MUX_uxn_c_l56_c7_eaaf_iftrue,
stack_index_MUX_uxn_c_l56_c7_eaaf_iffalse,
stack_index_MUX_uxn_c_l56_c7_eaaf_return_output);

-- opc_MUX_uxn_c_l56_c7_eaaf
opc_MUX_uxn_c_l56_c7_eaaf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
opc_MUX_uxn_c_l56_c7_eaaf_cond,
opc_MUX_uxn_c_l56_c7_eaaf_iftrue,
opc_MUX_uxn_c_l56_c7_eaaf_iffalse,
opc_MUX_uxn_c_l56_c7_eaaf_return_output);

-- peek_ram_uxn_c_l57_c9_bc6c
peek_ram_uxn_c_l57_c9_bc6c : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_c_l57_c9_bc6c_CLOCK_ENABLE,
peek_ram_uxn_c_l57_c9_bc6c_address,
peek_ram_uxn_c_l57_c9_bc6c_return_output);

-- BIN_OP_AND_uxn_c_l57_c9_1a3f
BIN_OP_AND_uxn_c_l57_c9_1a3f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l57_c9_1a3f_left,
BIN_OP_AND_uxn_c_l57_c9_1a3f_right,
BIN_OP_AND_uxn_c_l57_c9_1a3f_return_output);

-- peek_dev_uxn_c_l58_c18_0eef
peek_dev_uxn_c_l58_c18_0eef : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_c_l58_c18_0eef_CLOCK_ENABLE,
peek_dev_uxn_c_l58_c18_0eef_address,
peek_dev_uxn_c_l58_c18_0eef_return_output);

-- BIN_OP_AND_uxn_c_l59_c7_acd7
BIN_OP_AND_uxn_c_l59_c7_acd7 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l59_c7_acd7_left,
BIN_OP_AND_uxn_c_l59_c7_acd7_right,
BIN_OP_AND_uxn_c_l59_c7_acd7_return_output);

-- MUX_uxn_c_l59_c7_ab2c
MUX_uxn_c_l59_c7_ab2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l59_c7_ab2c_cond,
MUX_uxn_c_l59_c7_ab2c_iftrue,
MUX_uxn_c_l59_c7_ab2c_iffalse,
MUX_uxn_c_l59_c7_ab2c_return_output);

-- BIN_OP_AND_uxn_c_l60_c17_5373
BIN_OP_AND_uxn_c_l60_c17_5373 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l60_c17_5373_left,
BIN_OP_AND_uxn_c_l60_c17_5373_right,
BIN_OP_AND_uxn_c_l60_c17_5373_return_output);

-- MUX_uxn_c_l60_c17_96f0
MUX_uxn_c_l60_c17_96f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l60_c17_96f0_cond,
MUX_uxn_c_l60_c17_96f0_iftrue,
MUX_uxn_c_l60_c17_96f0_iffalse,
MUX_uxn_c_l60_c17_96f0_return_output);

-- BIN_OP_EQ_uxn_c_l61_c8_246d
BIN_OP_EQ_uxn_c_l61_c8_246d : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l61_c8_246d_left,
BIN_OP_EQ_uxn_c_l61_c8_246d_right,
BIN_OP_EQ_uxn_c_l61_c8_246d_return_output);

-- MUX_uxn_c_l61_c8_73f0
MUX_uxn_c_l61_c8_73f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l61_c8_73f0_cond,
MUX_uxn_c_l61_c8_73f0_iftrue,
MUX_uxn_c_l61_c8_73f0_iffalse,
MUX_uxn_c_l61_c8_73f0_return_output);

-- BIN_OP_AND_uxn_c_l62_c11_ac24
BIN_OP_AND_uxn_c_l62_c11_ac24 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l62_c11_ac24_left,
BIN_OP_AND_uxn_c_l62_c11_ac24_right,
BIN_OP_AND_uxn_c_l62_c11_ac24_return_output);

-- UNARY_OP_NOT_uxn_c_l62_c11_1af7
UNARY_OP_NOT_uxn_c_l62_c11_1af7 : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l62_c11_1af7_expr,
UNARY_OP_NOT_uxn_c_l62_c11_1af7_return_output);

-- CONST_SR_5_uxn_c_l62_c31_ea4a
CONST_SR_5_uxn_c_l62_c31_ea4a : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_c_l62_c31_ea4a_x,
CONST_SR_5_uxn_c_l62_c31_ea4a_return_output);

-- BIN_OP_MINUS_uxn_c_l62_c26_fa33
BIN_OP_MINUS_uxn_c_l62_c26_fa33 : entity work.BIN_OP_MINUS_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l62_c26_fa33_left,
BIN_OP_MINUS_uxn_c_l62_c26_fa33_right,
BIN_OP_MINUS_uxn_c_l62_c26_fa33_return_output);

-- BIN_OP_AND_uxn_c_l62_c26_032f
BIN_OP_AND_uxn_c_l62_c26_032f : entity work.BIN_OP_AND_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l62_c26_032f_left,
BIN_OP_AND_uxn_c_l62_c26_032f_right,
BIN_OP_AND_uxn_c_l62_c26_032f_return_output);

-- BIN_OP_AND_uxn_c_l62_c51_64e5
BIN_OP_AND_uxn_c_l62_c51_64e5 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l62_c51_64e5_left,
BIN_OP_AND_uxn_c_l62_c51_64e5_right,
BIN_OP_AND_uxn_c_l62_c51_64e5_return_output);

-- MUX_uxn_c_l62_c11_1550
MUX_uxn_c_l62_c11_1550 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l62_c11_1550_cond,
MUX_uxn_c_l62_c11_1550_iftrue,
MUX_uxn_c_l62_c11_1550_iffalse,
MUX_uxn_c_l62_c11_1550_return_output);

-- BIN_OP_EQ_uxn_c_l63_c23_9531
BIN_OP_EQ_uxn_c_l63_c23_9531 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l63_c23_9531_left,
BIN_OP_EQ_uxn_c_l63_c23_9531_right,
BIN_OP_EQ_uxn_c_l63_c23_9531_return_output);

-- MUX_uxn_c_l63_c23_0d80
MUX_uxn_c_l63_c23_0d80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l63_c23_0d80_cond,
MUX_uxn_c_l63_c23_0d80_iftrue,
MUX_uxn_c_l63_c23_0d80_iffalse,
MUX_uxn_c_l63_c23_0d80_return_output);

-- BIN_OP_AND_uxn_c_l64_c21_25f4
BIN_OP_AND_uxn_c_l64_c21_25f4 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l64_c21_25f4_left,
BIN_OP_AND_uxn_c_l64_c21_25f4_right,
BIN_OP_AND_uxn_c_l64_c21_25f4_return_output);

-- pc_add_uxn_c_l65_c3_39f9
pc_add_uxn_c_l65_c3_39f9 : entity work.pc_add_0CLK_925e4dd0 port map (
clk,
pc_add_uxn_c_l65_c3_39f9_CLOCK_ENABLE,
pc_add_uxn_c_l65_c3_39f9_adjustment);

-- BIN_OP_PLUS_uxn_c_l66_c3_00ad
BIN_OP_PLUS_uxn_c_l66_c3_00ad : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l66_c3_00ad_left,
BIN_OP_PLUS_uxn_c_l66_c3_00ad_right,
BIN_OP_PLUS_uxn_c_l66_c3_00ad_return_output);

-- UNARY_OP_NOT_uxn_c_l67_c18_c203
UNARY_OP_NOT_uxn_c_l67_c18_c203 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l67_c18_c203_expr,
UNARY_OP_NOT_uxn_c_l67_c18_c203_return_output);

-- BIN_OP_EQ_uxn_c_l69_c11_0cb3
BIN_OP_EQ_uxn_c_l69_c11_0cb3 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l69_c11_0cb3_left,
BIN_OP_EQ_uxn_c_l69_c11_0cb3_right,
BIN_OP_EQ_uxn_c_l69_c11_0cb3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd
TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_return_output);

-- eval_result_MUX_uxn_c_l69_c7_1d06
eval_result_MUX_uxn_c_l69_c7_1d06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l69_c7_1d06_cond,
eval_result_MUX_uxn_c_l69_c7_1d06_iftrue,
eval_result_MUX_uxn_c_l69_c7_1d06_iffalse,
eval_result_MUX_uxn_c_l69_c7_1d06_return_output);

-- eval_opcode_phased_uxn_c_l70_c17_f1ab
eval_opcode_phased_uxn_c_l70_c17_f1ab : entity work.eval_opcode_phased_0CLK_c454be67 port map (
clk,
eval_opcode_phased_uxn_c_l70_c17_f1ab_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l70_c17_f1ab_phase,
eval_opcode_phased_uxn_c_l70_c17_f1ab_pc,
eval_opcode_phased_uxn_c_l70_c17_f1ab_sp,
eval_opcode_phased_uxn_c_l70_c17_f1ab_stack_index,
eval_opcode_phased_uxn_c_l70_c17_f1ab_opcode,
eval_opcode_phased_uxn_c_l70_c17_f1ab_ins,
eval_opcode_phased_uxn_c_l70_c17_f1ab_k,
eval_opcode_phased_uxn_c_l70_c17_f1ab_return_output);

-- BIN_OP_EQ_uxn_c_l72_c11_0759
BIN_OP_EQ_uxn_c_l72_c11_0759 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l72_c11_0759_left,
BIN_OP_EQ_uxn_c_l72_c11_0759_right,
BIN_OP_EQ_uxn_c_l72_c11_0759_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d
TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_return_output);

-- eval_result_MUX_uxn_c_l72_c7_95d3
eval_result_MUX_uxn_c_l72_c7_95d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l72_c7_95d3_cond,
eval_result_MUX_uxn_c_l72_c7_95d3_iftrue,
eval_result_MUX_uxn_c_l72_c7_95d3_iffalse,
eval_result_MUX_uxn_c_l72_c7_95d3_return_output);

-- eval_opcode_phased_uxn_c_l73_c17_0f88
eval_opcode_phased_uxn_c_l73_c17_0f88 : entity work.eval_opcode_phased_0CLK_c454be67 port map (
clk,
eval_opcode_phased_uxn_c_l73_c17_0f88_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l73_c17_0f88_phase,
eval_opcode_phased_uxn_c_l73_c17_0f88_pc,
eval_opcode_phased_uxn_c_l73_c17_0f88_sp,
eval_opcode_phased_uxn_c_l73_c17_0f88_stack_index,
eval_opcode_phased_uxn_c_l73_c17_0f88_opcode,
eval_opcode_phased_uxn_c_l73_c17_0f88_ins,
eval_opcode_phased_uxn_c_l73_c17_0f88_k,
eval_opcode_phased_uxn_c_l73_c17_0f88_return_output);

-- BIN_OP_EQ_uxn_c_l75_c11_7257
BIN_OP_EQ_uxn_c_l75_c11_7257 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l75_c11_7257_left,
BIN_OP_EQ_uxn_c_l75_c11_7257_right,
BIN_OP_EQ_uxn_c_l75_c11_7257_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39
FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_return_output);

-- eval_result_MUX_uxn_c_l75_c7_8510
eval_result_MUX_uxn_c_l75_c7_8510 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l75_c7_8510_cond,
eval_result_MUX_uxn_c_l75_c7_8510_iftrue,
eval_result_MUX_uxn_c_l75_c7_8510_iffalse,
eval_result_MUX_uxn_c_l75_c7_8510_return_output);

-- eval_opcode_phased_uxn_c_l76_c17_a11f
eval_opcode_phased_uxn_c_l76_c17_a11f : entity work.eval_opcode_phased_0CLK_c454be67 port map (
clk,
eval_opcode_phased_uxn_c_l76_c17_a11f_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l76_c17_a11f_phase,
eval_opcode_phased_uxn_c_l76_c17_a11f_pc,
eval_opcode_phased_uxn_c_l76_c17_a11f_sp,
eval_opcode_phased_uxn_c_l76_c17_a11f_stack_index,
eval_opcode_phased_uxn_c_l76_c17_a11f_opcode,
eval_opcode_phased_uxn_c_l76_c17_a11f_ins,
eval_opcode_phased_uxn_c_l76_c17_a11f_k,
eval_opcode_phased_uxn_c_l76_c17_a11f_return_output);

-- BIN_OP_EQ_uxn_c_l78_c11_3ac5
BIN_OP_EQ_uxn_c_l78_c11_3ac5 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l78_c11_3ac5_left,
BIN_OP_EQ_uxn_c_l78_c11_3ac5_right,
BIN_OP_EQ_uxn_c_l78_c11_3ac5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e
TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_return_output);

-- eval_result_MUX_uxn_c_l78_c7_7b39
eval_result_MUX_uxn_c_l78_c7_7b39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l78_c7_7b39_cond,
eval_result_MUX_uxn_c_l78_c7_7b39_iftrue,
eval_result_MUX_uxn_c_l78_c7_7b39_iffalse,
eval_result_MUX_uxn_c_l78_c7_7b39_return_output);

-- eval_opcode_phased_uxn_c_l79_c17_4bb9
eval_opcode_phased_uxn_c_l79_c17_4bb9 : entity work.eval_opcode_phased_0CLK_c454be67 port map (
clk,
eval_opcode_phased_uxn_c_l79_c17_4bb9_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l79_c17_4bb9_phase,
eval_opcode_phased_uxn_c_l79_c17_4bb9_pc,
eval_opcode_phased_uxn_c_l79_c17_4bb9_sp,
eval_opcode_phased_uxn_c_l79_c17_4bb9_stack_index,
eval_opcode_phased_uxn_c_l79_c17_4bb9_opcode,
eval_opcode_phased_uxn_c_l79_c17_4bb9_ins,
eval_opcode_phased_uxn_c_l79_c17_4bb9_k,
eval_opcode_phased_uxn_c_l79_c17_4bb9_return_output);

-- BIN_OP_EQ_uxn_c_l81_c11_a851
BIN_OP_EQ_uxn_c_l81_c11_a851 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l81_c11_a851_left,
BIN_OP_EQ_uxn_c_l81_c11_a851_right,
BIN_OP_EQ_uxn_c_l81_c11_a851_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814
TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_return_output);

-- eval_result_MUX_uxn_c_l81_c7_1569
eval_result_MUX_uxn_c_l81_c7_1569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l81_c7_1569_cond,
eval_result_MUX_uxn_c_l81_c7_1569_iftrue,
eval_result_MUX_uxn_c_l81_c7_1569_iffalse,
eval_result_MUX_uxn_c_l81_c7_1569_return_output);

-- eval_opcode_phased_uxn_c_l82_c17_e16d
eval_opcode_phased_uxn_c_l82_c17_e16d : entity work.eval_opcode_phased_0CLK_c454be67 port map (
clk,
eval_opcode_phased_uxn_c_l82_c17_e16d_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l82_c17_e16d_phase,
eval_opcode_phased_uxn_c_l82_c17_e16d_pc,
eval_opcode_phased_uxn_c_l82_c17_e16d_sp,
eval_opcode_phased_uxn_c_l82_c17_e16d_stack_index,
eval_opcode_phased_uxn_c_l82_c17_e16d_opcode,
eval_opcode_phased_uxn_c_l82_c17_e16d_ins,
eval_opcode_phased_uxn_c_l82_c17_e16d_k,
eval_opcode_phased_uxn_c_l82_c17_e16d_return_output);

-- BIN_OP_EQ_uxn_c_l84_c11_a45f
BIN_OP_EQ_uxn_c_l84_c11_a45f : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l84_c11_a45f_left,
BIN_OP_EQ_uxn_c_l84_c11_a45f_right,
BIN_OP_EQ_uxn_c_l84_c11_a45f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a
TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c
FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_return_output);

-- eval_result_MUX_uxn_c_l84_c7_4af9
eval_result_MUX_uxn_c_l84_c7_4af9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l84_c7_4af9_cond,
eval_result_MUX_uxn_c_l84_c7_4af9_iftrue,
eval_result_MUX_uxn_c_l84_c7_4af9_iffalse,
eval_result_MUX_uxn_c_l84_c7_4af9_return_output);

-- eval_opcode_phased_uxn_c_l85_c17_1333
eval_opcode_phased_uxn_c_l85_c17_1333 : entity work.eval_opcode_phased_0CLK_c454be67 port map (
clk,
eval_opcode_phased_uxn_c_l85_c17_1333_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l85_c17_1333_phase,
eval_opcode_phased_uxn_c_l85_c17_1333_pc,
eval_opcode_phased_uxn_c_l85_c17_1333_sp,
eval_opcode_phased_uxn_c_l85_c17_1333_stack_index,
eval_opcode_phased_uxn_c_l85_c17_1333_opcode,
eval_opcode_phased_uxn_c_l85_c17_1333_ins,
eval_opcode_phased_uxn_c_l85_c17_1333_k,
eval_opcode_phased_uxn_c_l85_c17_1333_return_output);

-- BIN_OP_EQ_uxn_c_l87_c11_1401
BIN_OP_EQ_uxn_c_l87_c11_1401 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l87_c11_1401_left,
BIN_OP_EQ_uxn_c_l87_c11_1401_right,
BIN_OP_EQ_uxn_c_l87_c11_1401_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603
TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7
FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_return_output);

-- eval_result_MUX_uxn_c_l87_c7_414c
eval_result_MUX_uxn_c_l87_c7_414c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l87_c7_414c_cond,
eval_result_MUX_uxn_c_l87_c7_414c_iftrue,
eval_result_MUX_uxn_c_l87_c7_414c_iffalse,
eval_result_MUX_uxn_c_l87_c7_414c_return_output);

-- eval_opcode_phased_uxn_c_l88_c17_d7c4
eval_opcode_phased_uxn_c_l88_c17_d7c4 : entity work.eval_opcode_phased_0CLK_c454be67 port map (
clk,
eval_opcode_phased_uxn_c_l88_c17_d7c4_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l88_c17_d7c4_phase,
eval_opcode_phased_uxn_c_l88_c17_d7c4_pc,
eval_opcode_phased_uxn_c_l88_c17_d7c4_sp,
eval_opcode_phased_uxn_c_l88_c17_d7c4_stack_index,
eval_opcode_phased_uxn_c_l88_c17_d7c4_opcode,
eval_opcode_phased_uxn_c_l88_c17_d7c4_ins,
eval_opcode_phased_uxn_c_l88_c17_d7c4_k,
eval_opcode_phased_uxn_c_l88_c17_d7c4_return_output);

-- BIN_OP_EQ_uxn_c_l90_c11_fbe4
BIN_OP_EQ_uxn_c_l90_c11_fbe4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l90_c11_fbe4_left,
BIN_OP_EQ_uxn_c_l90_c11_fbe4_right,
BIN_OP_EQ_uxn_c_l90_c11_fbe4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86
TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01
FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_return_output);

-- eval_result_MUX_uxn_c_l90_c7_dfb7
eval_result_MUX_uxn_c_l90_c7_dfb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l90_c7_dfb7_cond,
eval_result_MUX_uxn_c_l90_c7_dfb7_iftrue,
eval_result_MUX_uxn_c_l90_c7_dfb7_iffalse,
eval_result_MUX_uxn_c_l90_c7_dfb7_return_output);

-- eval_opcode_phased_uxn_c_l91_c17_c6f8
eval_opcode_phased_uxn_c_l91_c17_c6f8 : entity work.eval_opcode_phased_0CLK_c454be67 port map (
clk,
eval_opcode_phased_uxn_c_l91_c17_c6f8_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l91_c17_c6f8_phase,
eval_opcode_phased_uxn_c_l91_c17_c6f8_pc,
eval_opcode_phased_uxn_c_l91_c17_c6f8_sp,
eval_opcode_phased_uxn_c_l91_c17_c6f8_stack_index,
eval_opcode_phased_uxn_c_l91_c17_c6f8_opcode,
eval_opcode_phased_uxn_c_l91_c17_c6f8_ins,
eval_opcode_phased_uxn_c_l91_c17_c6f8_k,
eval_opcode_phased_uxn_c_l91_c17_c6f8_return_output);

-- BIN_OP_EQ_uxn_c_l93_c11_06fa
BIN_OP_EQ_uxn_c_l93_c11_06fa : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l93_c11_06fa_left,
BIN_OP_EQ_uxn_c_l93_c11_06fa_right,
BIN_OP_EQ_uxn_c_l93_c11_06fa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1
TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854
FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_return_output);

-- eval_result_MUX_uxn_c_l93_c7_1e01
eval_result_MUX_uxn_c_l93_c7_1e01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l93_c7_1e01_cond,
eval_result_MUX_uxn_c_l93_c7_1e01_iftrue,
eval_result_MUX_uxn_c_l93_c7_1e01_iffalse,
eval_result_MUX_uxn_c_l93_c7_1e01_return_output);

-- eval_opcode_phased_uxn_c_l94_c17_5ac9
eval_opcode_phased_uxn_c_l94_c17_5ac9 : entity work.eval_opcode_phased_0CLK_c454be67 port map (
clk,
eval_opcode_phased_uxn_c_l94_c17_5ac9_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l94_c17_5ac9_phase,
eval_opcode_phased_uxn_c_l94_c17_5ac9_pc,
eval_opcode_phased_uxn_c_l94_c17_5ac9_sp,
eval_opcode_phased_uxn_c_l94_c17_5ac9_stack_index,
eval_opcode_phased_uxn_c_l94_c17_5ac9_opcode,
eval_opcode_phased_uxn_c_l94_c17_5ac9_ins,
eval_opcode_phased_uxn_c_l94_c17_5ac9_k,
eval_opcode_phased_uxn_c_l94_c17_5ac9_return_output);

-- BIN_OP_EQ_uxn_c_l96_c11_6e69
BIN_OP_EQ_uxn_c_l96_c11_6e69 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l96_c11_6e69_left,
BIN_OP_EQ_uxn_c_l96_c11_6e69_right,
BIN_OP_EQ_uxn_c_l96_c11_6e69_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124
TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18
FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_return_output);

-- eval_result_MUX_uxn_c_l96_c7_b854
eval_result_MUX_uxn_c_l96_c7_b854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l96_c7_b854_cond,
eval_result_MUX_uxn_c_l96_c7_b854_iftrue,
eval_result_MUX_uxn_c_l96_c7_b854_iffalse,
eval_result_MUX_uxn_c_l96_c7_b854_return_output);

-- eval_opcode_phased_uxn_c_l97_c17_6d57
eval_opcode_phased_uxn_c_l97_c17_6d57 : entity work.eval_opcode_phased_0CLK_c454be67 port map (
clk,
eval_opcode_phased_uxn_c_l97_c17_6d57_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l97_c17_6d57_phase,
eval_opcode_phased_uxn_c_l97_c17_6d57_pc,
eval_opcode_phased_uxn_c_l97_c17_6d57_sp,
eval_opcode_phased_uxn_c_l97_c17_6d57_stack_index,
eval_opcode_phased_uxn_c_l97_c17_6d57_opcode,
eval_opcode_phased_uxn_c_l97_c17_6d57_ins,
eval_opcode_phased_uxn_c_l97_c17_6d57_k,
eval_opcode_phased_uxn_c_l97_c17_6d57_return_output);

-- BIN_OP_EQ_uxn_c_l99_c11_2b97
BIN_OP_EQ_uxn_c_l99_c11_2b97 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l99_c11_2b97_left,
BIN_OP_EQ_uxn_c_l99_c11_2b97_right,
BIN_OP_EQ_uxn_c_l99_c11_2b97_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d
TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d
FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_return_output);

-- eval_result_MUX_uxn_c_l99_c7_6c18
eval_result_MUX_uxn_c_l99_c7_6c18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l99_c7_6c18_cond,
eval_result_MUX_uxn_c_l99_c7_6c18_iftrue,
eval_result_MUX_uxn_c_l99_c7_6c18_iffalse,
eval_result_MUX_uxn_c_l99_c7_6c18_return_output);

-- eval_opcode_phased_uxn_c_l100_c17_e45a
eval_opcode_phased_uxn_c_l100_c17_e45a : entity work.eval_opcode_phased_0CLK_c454be67 port map (
clk,
eval_opcode_phased_uxn_c_l100_c17_e45a_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l100_c17_e45a_phase,
eval_opcode_phased_uxn_c_l100_c17_e45a_pc,
eval_opcode_phased_uxn_c_l100_c17_e45a_sp,
eval_opcode_phased_uxn_c_l100_c17_e45a_stack_index,
eval_opcode_phased_uxn_c_l100_c17_e45a_opcode,
eval_opcode_phased_uxn_c_l100_c17_e45a_ins,
eval_opcode_phased_uxn_c_l100_c17_e45a_k,
eval_opcode_phased_uxn_c_l100_c17_e45a_return_output);

-- BIN_OP_EQ_uxn_c_l102_c11_2dcf
BIN_OP_EQ_uxn_c_l102_c11_2dcf : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l102_c11_2dcf_left,
BIN_OP_EQ_uxn_c_l102_c11_2dcf_right,
BIN_OP_EQ_uxn_c_l102_c11_2dcf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436
TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a
FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_return_output);

-- eval_result_MUX_uxn_c_l102_c7_4d8d
eval_result_MUX_uxn_c_l102_c7_4d8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l102_c7_4d8d_cond,
eval_result_MUX_uxn_c_l102_c7_4d8d_iftrue,
eval_result_MUX_uxn_c_l102_c7_4d8d_iffalse,
eval_result_MUX_uxn_c_l102_c7_4d8d_return_output);

-- eval_opcode_phased_uxn_c_l103_c17_ed67
eval_opcode_phased_uxn_c_l103_c17_ed67 : entity work.eval_opcode_phased_0CLK_c454be67 port map (
clk,
eval_opcode_phased_uxn_c_l103_c17_ed67_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l103_c17_ed67_phase,
eval_opcode_phased_uxn_c_l103_c17_ed67_pc,
eval_opcode_phased_uxn_c_l103_c17_ed67_sp,
eval_opcode_phased_uxn_c_l103_c17_ed67_stack_index,
eval_opcode_phased_uxn_c_l103_c17_ed67_opcode,
eval_opcode_phased_uxn_c_l103_c17_ed67_ins,
eval_opcode_phased_uxn_c_l103_c17_ed67_k,
eval_opcode_phased_uxn_c_l103_c17_ed67_return_output);

-- BIN_OP_EQ_uxn_c_l105_c11_5cf8
BIN_OP_EQ_uxn_c_l105_c11_5cf8 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l105_c11_5cf8_left,
BIN_OP_EQ_uxn_c_l105_c11_5cf8_right,
BIN_OP_EQ_uxn_c_l105_c11_5cf8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5
TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763
FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_return_output);

-- eval_result_MUX_uxn_c_l105_c7_5f8a
eval_result_MUX_uxn_c_l105_c7_5f8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l105_c7_5f8a_cond,
eval_result_MUX_uxn_c_l105_c7_5f8a_iftrue,
eval_result_MUX_uxn_c_l105_c7_5f8a_iffalse,
eval_result_MUX_uxn_c_l105_c7_5f8a_return_output);

-- eval_opcode_phased_uxn_c_l106_c17_367f
eval_opcode_phased_uxn_c_l106_c17_367f : entity work.eval_opcode_phased_0CLK_c454be67 port map (
clk,
eval_opcode_phased_uxn_c_l106_c17_367f_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l106_c17_367f_phase,
eval_opcode_phased_uxn_c_l106_c17_367f_pc,
eval_opcode_phased_uxn_c_l106_c17_367f_sp,
eval_opcode_phased_uxn_c_l106_c17_367f_stack_index,
eval_opcode_phased_uxn_c_l106_c17_367f_opcode,
eval_opcode_phased_uxn_c_l106_c17_367f_ins,
eval_opcode_phased_uxn_c_l106_c17_367f_k,
eval_opcode_phased_uxn_c_l106_c17_367f_return_output);

-- BIN_OP_EQ_uxn_c_l108_c11_ed25
BIN_OP_EQ_uxn_c_l108_c11_ed25 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l108_c11_ed25_left,
BIN_OP_EQ_uxn_c_l108_c11_ed25_right,
BIN_OP_EQ_uxn_c_l108_c11_ed25_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240
TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_return_output);

-- eval_result_MUX_uxn_c_l108_c7_5763
eval_result_MUX_uxn_c_l108_c7_5763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
eval_result_MUX_uxn_c_l108_c7_5763_cond,
eval_result_MUX_uxn_c_l108_c7_5763_iftrue,
eval_result_MUX_uxn_c_l108_c7_5763_iffalse,
eval_result_MUX_uxn_c_l108_c7_5763_return_output);

-- eval_opcode_phased_uxn_c_l109_c17_7a04
eval_opcode_phased_uxn_c_l109_c17_7a04 : entity work.eval_opcode_phased_0CLK_c454be67 port map (
clk,
eval_opcode_phased_uxn_c_l109_c17_7a04_CLOCK_ENABLE,
eval_opcode_phased_uxn_c_l109_c17_7a04_phase,
eval_opcode_phased_uxn_c_l109_c17_7a04_pc,
eval_opcode_phased_uxn_c_l109_c17_7a04_sp,
eval_opcode_phased_uxn_c_l109_c17_7a04_stack_index,
eval_opcode_phased_uxn_c_l109_c17_7a04_opcode,
eval_opcode_phased_uxn_c_l109_c17_7a04_ins,
eval_opcode_phased_uxn_c_l109_c17_7a04_k,
eval_opcode_phased_uxn_c_l109_c17_7a04_return_output);

-- BIN_OP_EQ_uxn_c_l112_c6_02eb
BIN_OP_EQ_uxn_c_l112_c6_02eb : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l112_c6_02eb_left,
BIN_OP_EQ_uxn_c_l112_c6_02eb_right,
BIN_OP_EQ_uxn_c_l112_c6_02eb_return_output);

-- cpu_phase_MUX_uxn_c_l112_c2_0a10
cpu_phase_MUX_uxn_c_l112_c2_0a10 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
cpu_phase_MUX_uxn_c_l112_c2_0a10_cond,
cpu_phase_MUX_uxn_c_l112_c2_0a10_iftrue,
cpu_phase_MUX_uxn_c_l112_c2_0a10_iffalse,
cpu_phase_MUX_uxn_c_l112_c2_0a10_return_output);

-- BIN_OP_PLUS_uxn_c_l115_c3_6be8
BIN_OP_PLUS_uxn_c_l115_c3_6be8 : entity work.BIN_OP_PLUS_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l115_c3_6be8_left,
BIN_OP_PLUS_uxn_c_l115_c3_6be8_right,
BIN_OP_PLUS_uxn_c_l115_c3_6be8_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Registers
 pc,
 sp,
 sp0,
 sp1,
 k,
 opc,
 ins,
 system_state,
 cpu_phase,
 stack_index,
 pc_nonzero,
 system_state_zero,
 should_cpu_eval,
 eval_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_return_output,
 pc_MUX_uxn_c_l48_c2_9c52_return_output,
 k_MUX_uxn_c_l48_c2_9c52_return_output,
 sp0_MUX_uxn_c_l48_c2_9c52_return_output,
 system_state_zero_MUX_uxn_c_l48_c2_9c52_return_output,
 ins_MUX_uxn_c_l48_c2_9c52_return_output,
 sp_MUX_uxn_c_l48_c2_9c52_return_output,
 sp1_MUX_uxn_c_l48_c2_9c52_return_output,
 system_state_MUX_uxn_c_l48_c2_9c52_return_output,
 eval_result_MUX_uxn_c_l48_c2_9c52_return_output,
 should_cpu_eval_MUX_uxn_c_l48_c2_9c52_return_output,
 stack_index_MUX_uxn_c_l48_c2_9c52_return_output,
 opc_MUX_uxn_c_l48_c2_9c52_return_output,
 pc_get_uxn_c_l50_c8_6d69_return_output,
 peek_dev_uxn_c_l51_c18_572f_return_output,
 stack_pointer_get_uxn_c_l52_c9_0b82_return_output,
 stack_pointer_get_uxn_c_l53_c9_dccb_return_output,
 peek_ram_uxn_c_l54_c9_cd3a_return_output,
 BIN_OP_AND_uxn_c_l54_c9_7569_return_output,
 BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_return_output,
 pc_MUX_uxn_c_l56_c7_eaaf_return_output,
 k_MUX_uxn_c_l56_c7_eaaf_return_output,
 system_state_zero_MUX_uxn_c_l56_c7_eaaf_return_output,
 ins_MUX_uxn_c_l56_c7_eaaf_return_output,
 sp_MUX_uxn_c_l56_c7_eaaf_return_output,
 system_state_MUX_uxn_c_l56_c7_eaaf_return_output,
 eval_result_MUX_uxn_c_l56_c7_eaaf_return_output,
 should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_return_output,
 stack_index_MUX_uxn_c_l56_c7_eaaf_return_output,
 opc_MUX_uxn_c_l56_c7_eaaf_return_output,
 peek_ram_uxn_c_l57_c9_bc6c_return_output,
 BIN_OP_AND_uxn_c_l57_c9_1a3f_return_output,
 peek_dev_uxn_c_l58_c18_0eef_return_output,
 BIN_OP_AND_uxn_c_l59_c7_acd7_return_output,
 MUX_uxn_c_l59_c7_ab2c_return_output,
 BIN_OP_AND_uxn_c_l60_c17_5373_return_output,
 MUX_uxn_c_l60_c17_96f0_return_output,
 BIN_OP_EQ_uxn_c_l61_c8_246d_return_output,
 MUX_uxn_c_l61_c8_73f0_return_output,
 BIN_OP_AND_uxn_c_l62_c11_ac24_return_output,
 UNARY_OP_NOT_uxn_c_l62_c11_1af7_return_output,
 CONST_SR_5_uxn_c_l62_c31_ea4a_return_output,
 BIN_OP_MINUS_uxn_c_l62_c26_fa33_return_output,
 BIN_OP_AND_uxn_c_l62_c26_032f_return_output,
 BIN_OP_AND_uxn_c_l62_c51_64e5_return_output,
 MUX_uxn_c_l62_c11_1550_return_output,
 BIN_OP_EQ_uxn_c_l63_c23_9531_return_output,
 MUX_uxn_c_l63_c23_0d80_return_output,
 BIN_OP_AND_uxn_c_l64_c21_25f4_return_output,
 BIN_OP_PLUS_uxn_c_l66_c3_00ad_return_output,
 UNARY_OP_NOT_uxn_c_l67_c18_c203_return_output,
 BIN_OP_EQ_uxn_c_l69_c11_0cb3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_return_output,
 eval_result_MUX_uxn_c_l69_c7_1d06_return_output,
 eval_opcode_phased_uxn_c_l70_c17_f1ab_return_output,
 BIN_OP_EQ_uxn_c_l72_c11_0759_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_return_output,
 eval_result_MUX_uxn_c_l72_c7_95d3_return_output,
 eval_opcode_phased_uxn_c_l73_c17_0f88_return_output,
 BIN_OP_EQ_uxn_c_l75_c11_7257_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_return_output,
 eval_result_MUX_uxn_c_l75_c7_8510_return_output,
 eval_opcode_phased_uxn_c_l76_c17_a11f_return_output,
 BIN_OP_EQ_uxn_c_l78_c11_3ac5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_return_output,
 eval_result_MUX_uxn_c_l78_c7_7b39_return_output,
 eval_opcode_phased_uxn_c_l79_c17_4bb9_return_output,
 BIN_OP_EQ_uxn_c_l81_c11_a851_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_return_output,
 eval_result_MUX_uxn_c_l81_c7_1569_return_output,
 eval_opcode_phased_uxn_c_l82_c17_e16d_return_output,
 BIN_OP_EQ_uxn_c_l84_c11_a45f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_return_output,
 eval_result_MUX_uxn_c_l84_c7_4af9_return_output,
 eval_opcode_phased_uxn_c_l85_c17_1333_return_output,
 BIN_OP_EQ_uxn_c_l87_c11_1401_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_return_output,
 eval_result_MUX_uxn_c_l87_c7_414c_return_output,
 eval_opcode_phased_uxn_c_l88_c17_d7c4_return_output,
 BIN_OP_EQ_uxn_c_l90_c11_fbe4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_return_output,
 eval_result_MUX_uxn_c_l90_c7_dfb7_return_output,
 eval_opcode_phased_uxn_c_l91_c17_c6f8_return_output,
 BIN_OP_EQ_uxn_c_l93_c11_06fa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_return_output,
 eval_result_MUX_uxn_c_l93_c7_1e01_return_output,
 eval_opcode_phased_uxn_c_l94_c17_5ac9_return_output,
 BIN_OP_EQ_uxn_c_l96_c11_6e69_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_return_output,
 eval_result_MUX_uxn_c_l96_c7_b854_return_output,
 eval_opcode_phased_uxn_c_l97_c17_6d57_return_output,
 BIN_OP_EQ_uxn_c_l99_c11_2b97_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_return_output,
 eval_result_MUX_uxn_c_l99_c7_6c18_return_output,
 eval_opcode_phased_uxn_c_l100_c17_e45a_return_output,
 BIN_OP_EQ_uxn_c_l102_c11_2dcf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_return_output,
 eval_result_MUX_uxn_c_l102_c7_4d8d_return_output,
 eval_opcode_phased_uxn_c_l103_c17_ed67_return_output,
 BIN_OP_EQ_uxn_c_l105_c11_5cf8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_return_output,
 eval_result_MUX_uxn_c_l105_c7_5f8a_return_output,
 eval_opcode_phased_uxn_c_l106_c17_367f_return_output,
 BIN_OP_EQ_uxn_c_l108_c11_ed25_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_return_output,
 eval_result_MUX_uxn_c_l108_c7_5763_return_output,
 eval_opcode_phased_uxn_c_l109_c17_7a04_return_output,
 BIN_OP_EQ_uxn_c_l112_c6_02eb_return_output,
 cpu_phase_MUX_uxn_c_l112_c2_0a10_return_output,
 BIN_OP_PLUS_uxn_c_l115_c3_6be8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
 variable VAR_k_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
 variable VAR_system_state_zero_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(0 downto 0);
 variable VAR_system_state_zero_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(0 downto 0);
 variable VAR_system_state_zero_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(0 downto 0);
 variable VAR_system_state_zero_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(0 downto 0);
 variable VAR_system_state_zero_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
 variable VAR_sp_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(7 downto 0);
 variable VAR_sp_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(7 downto 0);
 variable VAR_sp_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(7 downto 0);
 variable VAR_sp_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(7 downto 0);
 variable VAR_sp_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
 variable VAR_system_state_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(7 downto 0);
 variable VAR_system_state_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(7 downto 0);
 variable VAR_system_state_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(7 downto 0);
 variable VAR_system_state_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(7 downto 0);
 variable VAR_system_state_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
 variable VAR_should_cpu_eval_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(0 downto 0);
 variable VAR_should_cpu_eval_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(0 downto 0);
 variable VAR_should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(0 downto 0);
 variable VAR_should_cpu_eval_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(0 downto 0);
 variable VAR_should_cpu_eval_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
 variable VAR_stack_index_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(0 downto 0);
 variable VAR_stack_index_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(0 downto 0);
 variable VAR_stack_index_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(0 downto 0);
 variable VAR_stack_index_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(0 downto 0);
 variable VAR_stack_index_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
 variable VAR_opc_MUX_uxn_c_l48_c2_9c52_iftrue : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l48_c2_9c52_iffalse : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l56_c7_eaaf_return_output : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l48_c2_9c52_return_output : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l48_c2_9c52_cond : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_c_l50_c8_6d69_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_c_l50_c8_6d69_return_output : unsigned(15 downto 0);
 variable VAR_peek_dev_uxn_c_l51_c18_572f_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_c_l51_c18_572f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_c_l51_c18_572f_return_output : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_c_l52_c9_0b82_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_c_l52_c9_0b82_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_c_l52_c9_0b82_return_output : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_c_l53_c9_dccb_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_c_l53_c9_dccb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_c_l53_c9_dccb_return_output : unsigned(7 downto 0);
 variable VAR_peek_ram_uxn_c_l54_c9_cd3a_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l54_c9_7569_left : unsigned(7 downto 0);
 variable VAR_peek_ram_uxn_c_l54_c9_cd3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_c_l54_c9_cd3a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l54_c9_7569_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l54_c9_7569_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_iffalse : unsigned(0 downto 0);
 variable VAR_pc_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(15 downto 0);
 variable VAR_pc_uxn_c_l66_c3_d37e : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(15 downto 0);
 variable VAR_pc_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
 variable VAR_k_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
 variable VAR_system_state_zero_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(0 downto 0);
 variable VAR_system_state_zero_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(0 downto 0);
 variable VAR_system_state_zero_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
 variable VAR_sp_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(7 downto 0);
 variable VAR_sp_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(7 downto 0);
 variable VAR_sp_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
 variable VAR_system_state_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(7 downto 0);
 variable VAR_system_state_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(7 downto 0);
 variable VAR_system_state_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l69_c7_1d06_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
 variable VAR_should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(0 downto 0);
 variable VAR_should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(0 downto 0);
 variable VAR_should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
 variable VAR_stack_index_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(0 downto 0);
 variable VAR_stack_index_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(0 downto 0);
 variable VAR_stack_index_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
 variable VAR_opc_MUX_uxn_c_l56_c7_eaaf_iftrue : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l56_c7_eaaf_iffalse : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l56_c7_eaaf_cond : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_c_l57_c9_bc6c_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l57_c9_1a3f_left : unsigned(7 downto 0);
 variable VAR_peek_ram_uxn_c_l57_c9_bc6c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_c_l57_c9_bc6c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l57_c9_1a3f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l57_c9_1a3f_return_output : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_c_l58_c18_0eef_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_c_l58_c18_0eef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_c_l58_c18_0eef_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l59_c7_ab2c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l59_c7_ab2c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l59_c7_ab2c_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l59_c7_acd7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l59_c7_acd7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l59_c7_acd7_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l59_c7_ab2c_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l60_c17_96f0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l60_c17_96f0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l60_c17_96f0_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l60_c17_5373_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l60_c17_5373_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l60_c17_5373_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l60_c17_96f0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l61_c8_73f0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l61_c8_73f0_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l61_c8_73f0_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l61_c8_246d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l61_c8_246d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l61_c8_246d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l61_c8_73f0_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l62_c11_1550_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l62_c11_1550_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l62_c11_1550_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l62_c11_ac24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l62_c11_ac24_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l62_c11_ac24_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l62_c11_1af7_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l62_c11_1af7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l62_c26_fa33_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l62_c26_fa33_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l62_c31_ea4a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l62_c31_ea4a_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l62_c26_fa33_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l62_c26_032f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l62_c26_032f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l62_c26_032f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l62_c51_64e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l62_c51_64e5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l62_c51_64e5_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l62_c11_1550_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l63_c23_0d80_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l63_c23_0d80_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l63_c23_0d80_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l63_c23_9531_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l63_c23_9531_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l63_c23_9531_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l63_c23_0d80_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l64_c21_25f4_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l64_c21_25f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l64_c21_25f4_return_output : unsigned(0 downto 0);
 variable VAR_pc_add_uxn_c_l65_c3_39f9_adjustment : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_c_l65_c10_1fc0_return_output : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_c_l65_c3_39f9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l66_c3_00ad_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l66_c3_00ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l66_c3_00ad_return_output : unsigned(16 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l67_c18_c203_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l67_c18_c203_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l69_c11_0cb3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l69_c11_0cb3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l69_c11_0cb3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l69_c7_1d06_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l69_c7_1d06_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l72_c7_95d3_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l69_c7_1d06_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_phase : unsigned(3 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_sp : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l72_c11_0759_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l72_c11_0759_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l72_c11_0759_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l72_c7_95d3_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l72_c7_95d3_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l75_c7_8510_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l72_c7_95d3_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_phase : unsigned(3 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_sp : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_7257_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_7257_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l75_c11_7257_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l75_c7_8510_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l75_c7_8510_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l78_c7_7b39_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l75_c7_8510_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_phase : unsigned(3 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_sp : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l78_c11_3ac5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l78_c11_3ac5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l78_c11_3ac5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l78_c7_7b39_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l78_c7_7b39_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l81_c7_1569_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l78_c7_7b39_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_phase : unsigned(3 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_sp : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_a851_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_a851_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l81_c11_a851_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l81_c7_1569_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l81_c7_1569_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l84_c7_4af9_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l81_c7_1569_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_phase : unsigned(3 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_sp : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l84_c11_a45f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l84_c11_a45f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l84_c11_a45f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l84_c7_4af9_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l84_c7_4af9_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l87_c7_414c_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l84_c7_4af9_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l85_c17_1333_phase : unsigned(3 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l85_c17_1333_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l85_c17_1333_sp : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l85_c17_1333_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l85_c17_1333_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l85_c17_1333_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l85_c17_1333_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l85_c17_1333_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l85_c17_1333_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c11_1401_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c11_1401_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l87_c11_1401_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l87_c7_414c_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l87_c7_414c_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l90_c7_dfb7_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l87_c7_414c_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_phase : unsigned(3 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_sp : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l90_c11_fbe4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l90_c11_fbe4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l90_c11_fbe4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l90_c7_dfb7_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l90_c7_dfb7_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l93_c7_1e01_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l90_c7_dfb7_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_phase : unsigned(3 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_sp : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l93_c11_06fa_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l93_c11_06fa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l93_c11_06fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l93_c7_1e01_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l93_c7_1e01_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l96_c7_b854_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l93_c7_1e01_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_phase : unsigned(3 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_sp : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l96_c11_6e69_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l96_c11_6e69_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l96_c11_6e69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l96_c7_b854_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l96_c7_b854_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l99_c7_6c18_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l96_c7_b854_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_phase : unsigned(3 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_sp : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c11_2b97_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c11_2b97_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l99_c11_2b97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l99_c7_6c18_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l99_c7_6c18_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l102_c7_4d8d_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l99_c7_6c18_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_phase : unsigned(3 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_sp : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c11_2dcf_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c11_2dcf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l102_c11_2dcf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l102_c7_4d8d_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l102_c7_4d8d_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l105_c7_5f8a_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l102_c7_4d8d_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_phase : unsigned(3 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_sp : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l105_c11_5cf8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l105_c11_5cf8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l105_c11_5cf8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l105_c7_5f8a_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l105_c7_5f8a_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l108_c7_5763_return_output : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l105_c7_5f8a_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l106_c17_367f_phase : unsigned(3 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l106_c17_367f_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l106_c17_367f_sp : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l106_c17_367f_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l106_c17_367f_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l106_c17_367f_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l106_c17_367f_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l106_c17_367f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l106_c17_367f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l108_c11_ed25_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l108_c11_ed25_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l108_c11_ed25_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l108_c7_5763_iftrue : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l108_c7_5763_iffalse : unsigned(0 downto 0);
 variable VAR_eval_result_MUX_uxn_c_l108_c7_5763_cond : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_phase : unsigned(3 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_pc : unsigned(15 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_sp : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l112_c6_02eb_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l112_c6_02eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l112_c6_02eb_return_output : unsigned(0 downto 0);
 variable VAR_cpu_phase_MUX_uxn_c_l112_c2_0a10_iftrue : unsigned(3 downto 0);
 variable VAR_cpu_phase_uxn_c_l113_c3_fa86 : unsigned(3 downto 0);
 variable VAR_cpu_phase_MUX_uxn_c_l112_c2_0a10_iffalse : unsigned(3 downto 0);
 variable VAR_cpu_phase_uxn_c_l115_c3_1407 : unsigned(3 downto 0);
 variable VAR_cpu_phase_MUX_uxn_c_l112_c2_0a10_return_output : unsigned(3 downto 0);
 variable VAR_cpu_phase_MUX_uxn_c_l112_c2_0a10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c3_6be8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c3_6be8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l115_c3_6be8_return_output : unsigned(4 downto 0);
 -- State registers comb logic variables
variable REG_VAR_pc : unsigned(15 downto 0);
variable REG_VAR_sp : unsigned(7 downto 0);
variable REG_VAR_sp0 : unsigned(7 downto 0);
variable REG_VAR_sp1 : unsigned(7 downto 0);
variable REG_VAR_k : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(7 downto 0);
variable REG_VAR_ins : unsigned(7 downto 0);
variable REG_VAR_system_state : unsigned(7 downto 0);
variable REG_VAR_cpu_phase : unsigned(3 downto 0);
variable REG_VAR_stack_index : unsigned(0 downto 0);
variable REG_VAR_pc_nonzero : unsigned(0 downto 0);
variable REG_VAR_system_state_zero : unsigned(0 downto 0);
variable REG_VAR_should_cpu_eval : unsigned(0 downto 0);
variable REG_VAR_eval_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_pc := pc;
  REG_VAR_sp := sp;
  REG_VAR_sp0 := sp0;
  REG_VAR_sp1 := sp1;
  REG_VAR_k := k;
  REG_VAR_opc := opc;
  REG_VAR_ins := ins;
  REG_VAR_system_state := system_state;
  REG_VAR_cpu_phase := cpu_phase;
  REG_VAR_stack_index := stack_index;
  REG_VAR_pc_nonzero := pc_nonzero;
  REG_VAR_system_state_zero := system_state_zero;
  REG_VAR_should_cpu_eval := should_cpu_eval;
  REG_VAR_eval_result := eval_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l78_c11_3ac5_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_iftrue := to_unsigned(0, 1);
     VAR_eval_opcode_phased_uxn_c_l85_c17_1333_phase := resize(to_unsigned(5, 3), 4);
     VAR_MUX_uxn_c_l59_c7_ab2c_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_c_l61_c8_246d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l90_c11_fbe4_right := to_unsigned(9, 4);
     VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_phase := to_unsigned(8, 4);
     VAR_MUX_uxn_c_l60_c17_96f0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l54_c9_7569_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l62_c26_032f_right := to_unsigned(255, 8);
     VAR_MUX_uxn_c_l63_c23_0d80_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l115_c3_6be8_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_iffalse := to_unsigned(0, 1);
     VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_phase := to_unsigned(13, 4);
     VAR_peek_dev_uxn_c_l58_c18_0eef_address := resize(to_unsigned(15, 4), 8);
     VAR_BIN_OP_EQ_uxn_c_l96_c11_6e69_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_c_l81_c11_a851_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_c_l112_c6_02eb_right := to_unsigned(1, 1);
     VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_phase := resize(to_unsigned(2, 2), 4);
     VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_right := to_unsigned(0, 1);
     VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_phase := resize(to_unsigned(1, 1), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l93_c11_06fa_right := to_unsigned(10, 4);
     VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_phase := resize(to_unsigned(4, 3), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l75_c11_7257_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_c_l105_c11_5cf8_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_iftrue := to_unsigned(0, 1);
     VAR_cpu_phase_uxn_c_l113_c3_fa86 := resize(to_unsigned(0, 1), 4);
     VAR_cpu_phase_MUX_uxn_c_l112_c2_0a10_iftrue := VAR_cpu_phase_uxn_c_l113_c3_fa86;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l59_c7_ab2c_iftrue := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l62_c51_64e5_right := to_unsigned(63, 6);
     VAR_BIN_OP_MINUS_uxn_c_l62_c26_fa33_left := to_unsigned(0, 1);
     VAR_eval_opcode_phased_uxn_c_l106_c17_367f_phase := to_unsigned(12, 4);
     VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_phase := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_c_l72_c11_0759_right := to_unsigned(3, 2);
     VAR_MUX_uxn_c_l60_c17_96f0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l63_c23_9531_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l87_c11_1401_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_c_l69_c11_0cb3_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_c_l60_c17_5373_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_c_l84_c11_a45f_right := to_unsigned(7, 3);
     VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_phase := to_unsigned(9, 4);
     VAR_stack_pointer_get_uxn_c_l52_c9_0b82_stack_index := to_unsigned(0, 1);
     VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_phase := to_unsigned(11, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_iftrue := to_unsigned(0, 1);
     VAR_eval_result_MUX_uxn_c_l48_c2_9c52_iftrue := to_unsigned(0, 1);
     VAR_stack_pointer_get_uxn_c_l53_c9_dccb_stack_index := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_iftrue := to_unsigned(0, 1);
     VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_phase := resize(to_unsigned(0, 1), 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l66_c3_00ad_right := to_unsigned(1, 1);
     VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_phase := resize(to_unsigned(6, 3), 4);
     VAR_BIN_OP_AND_uxn_c_l62_c11_ac24_right := to_unsigned(31, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_iffalse := to_unsigned(0, 1);
     VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_phase := resize(to_unsigned(3, 2), 4);
     VAR_BIN_OP_AND_uxn_c_l59_c7_acd7_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_c_l99_c11_2b97_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_c_l102_c11_2dcf_right := to_unsigned(13, 4);
     VAR_BIN_OP_AND_uxn_c_l57_c9_1a3f_right := to_unsigned(255, 8);
     VAR_peek_dev_uxn_c_l51_c18_572f_address := resize(to_unsigned(15, 4), 8);
     VAR_BIN_OP_EQ_uxn_c_l108_c11_ed25_right := to_unsigned(15, 4);
     VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_phase := resize(to_unsigned(7, 3), 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l63_c23_0d80_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l102_c11_2dcf_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l105_c11_5cf8_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l108_c11_ed25_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l69_c11_0cb3_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l72_c11_0759_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l75_c11_7257_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l78_c11_3ac5_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l81_c11_a851_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l84_c11_a45f_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l87_c11_1401_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l90_c11_fbe4_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l93_c11_06fa_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l96_c11_6e69_left := cpu_phase;
     VAR_BIN_OP_EQ_uxn_c_l99_c11_2b97_left := cpu_phase;
     VAR_BIN_OP_PLUS_uxn_c_l115_c3_6be8_left := cpu_phase;
     VAR_eval_result_MUX_uxn_c_l108_c7_5763_iffalse := eval_result;
     VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_ins := ins;
     VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_ins := ins;
     VAR_eval_opcode_phased_uxn_c_l106_c17_367f_ins := ins;
     VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_ins := ins;
     VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_ins := ins;
     VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_ins := ins;
     VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_ins := ins;
     VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_ins := ins;
     VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_ins := ins;
     VAR_eval_opcode_phased_uxn_c_l85_c17_1333_ins := ins;
     VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_ins := ins;
     VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_ins := ins;
     VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_ins := ins;
     VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_ins := ins;
     VAR_ins_MUX_uxn_c_l56_c7_eaaf_iffalse := ins;
     VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_k := k;
     VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_k := k;
     VAR_eval_opcode_phased_uxn_c_l106_c17_367f_k := k;
     VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_k := k;
     VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_k := k;
     VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_k := k;
     VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_k := k;
     VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_k := k;
     VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_k := k;
     VAR_eval_opcode_phased_uxn_c_l85_c17_1333_k := k;
     VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_k := k;
     VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_k := k;
     VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_k := k;
     VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_k := k;
     VAR_k_MUX_uxn_c_l48_c2_9c52_iftrue := k;
     VAR_k_MUX_uxn_c_l56_c7_eaaf_iffalse := k;
     VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_opcode := opc;
     VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_opcode := opc;
     VAR_eval_opcode_phased_uxn_c_l106_c17_367f_opcode := opc;
     VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_opcode := opc;
     VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_opcode := opc;
     VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_opcode := opc;
     VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_opcode := opc;
     VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_opcode := opc;
     VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_opcode := opc;
     VAR_eval_opcode_phased_uxn_c_l85_c17_1333_opcode := opc;
     VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_opcode := opc;
     VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_opcode := opc;
     VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_opcode := opc;
     VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_opcode := opc;
     VAR_opc_MUX_uxn_c_l48_c2_9c52_iftrue := opc;
     VAR_opc_MUX_uxn_c_l56_c7_eaaf_iffalse := opc;
     VAR_BIN_OP_PLUS_uxn_c_l66_c3_00ad_left := pc;
     VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_pc := pc;
     VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_pc := pc;
     VAR_eval_opcode_phased_uxn_c_l106_c17_367f_pc := pc;
     VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_pc := pc;
     VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_pc := pc;
     VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_pc := pc;
     VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_pc := pc;
     VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_pc := pc;
     VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_pc := pc;
     VAR_eval_opcode_phased_uxn_c_l85_c17_1333_pc := pc;
     VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_pc := pc;
     VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_pc := pc;
     VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_pc := pc;
     VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_pc := pc;
     VAR_pc_MUX_uxn_c_l56_c7_eaaf_iffalse := pc;
     VAR_peek_ram_uxn_c_l57_c9_bc6c_address := pc;
     VAR_BIN_OP_AND_uxn_c_l64_c21_25f4_left := pc_nonzero;
     REG_VAR_pc_nonzero := pc_nonzero;
     VAR_should_cpu_eval_MUX_uxn_c_l48_c2_9c52_iftrue := should_cpu_eval;
     VAR_should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_iffalse := should_cpu_eval;
     VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_sp := sp;
     VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_sp := sp;
     VAR_eval_opcode_phased_uxn_c_l106_c17_367f_sp := sp;
     VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_sp := sp;
     VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_sp := sp;
     VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_sp := sp;
     VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_sp := sp;
     VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_sp := sp;
     VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_sp := sp;
     VAR_eval_opcode_phased_uxn_c_l85_c17_1333_sp := sp;
     VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_sp := sp;
     VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_sp := sp;
     VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_sp := sp;
     VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_sp := sp;
     VAR_sp_MUX_uxn_c_l48_c2_9c52_iftrue := sp;
     VAR_sp_MUX_uxn_c_l56_c7_eaaf_iffalse := sp;
     VAR_MUX_uxn_c_l61_c8_73f0_iftrue := sp0;
     VAR_sp0_MUX_uxn_c_l48_c2_9c52_iffalse := sp0;
     VAR_MUX_uxn_c_l61_c8_73f0_iffalse := sp1;
     VAR_sp1_MUX_uxn_c_l48_c2_9c52_iffalse := sp1;
     VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_stack_index := stack_index;
     VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_stack_index := stack_index;
     VAR_eval_opcode_phased_uxn_c_l106_c17_367f_stack_index := stack_index;
     VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_stack_index := stack_index;
     VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_stack_index := stack_index;
     VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_stack_index := stack_index;
     VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_stack_index := stack_index;
     VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_stack_index := stack_index;
     VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_stack_index := stack_index;
     VAR_eval_opcode_phased_uxn_c_l85_c17_1333_stack_index := stack_index;
     VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_stack_index := stack_index;
     VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_stack_index := stack_index;
     VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_stack_index := stack_index;
     VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_stack_index := stack_index;
     VAR_stack_index_MUX_uxn_c_l48_c2_9c52_iftrue := stack_index;
     VAR_stack_index_MUX_uxn_c_l56_c7_eaaf_iffalse := stack_index;
     VAR_system_state_MUX_uxn_c_l56_c7_eaaf_iffalse := system_state;
     VAR_system_state_zero_MUX_uxn_c_l48_c2_9c52_iftrue := system_state_zero;
     VAR_system_state_zero_MUX_uxn_c_l56_c7_eaaf_iffalse := system_state_zero;
     -- BIN_OP_PLUS[uxn_c_l66_c3_00ad] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l66_c3_00ad_left <= VAR_BIN_OP_PLUS_uxn_c_l66_c3_00ad_left;
     BIN_OP_PLUS_uxn_c_l66_c3_00ad_right <= VAR_BIN_OP_PLUS_uxn_c_l66_c3_00ad_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l66_c3_00ad_return_output := BIN_OP_PLUS_uxn_c_l66_c3_00ad_return_output;

     -- BIN_OP_EQ[uxn_c_l81_c11_a851] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l81_c11_a851_left <= VAR_BIN_OP_EQ_uxn_c_l81_c11_a851_left;
     BIN_OP_EQ_uxn_c_l81_c11_a851_right <= VAR_BIN_OP_EQ_uxn_c_l81_c11_a851_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l81_c11_a851_return_output := BIN_OP_EQ_uxn_c_l81_c11_a851_return_output;

     -- BIN_OP_EQ[uxn_c_l69_c11_0cb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l69_c11_0cb3_left <= VAR_BIN_OP_EQ_uxn_c_l69_c11_0cb3_left;
     BIN_OP_EQ_uxn_c_l69_c11_0cb3_right <= VAR_BIN_OP_EQ_uxn_c_l69_c11_0cb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l69_c11_0cb3_return_output := BIN_OP_EQ_uxn_c_l69_c11_0cb3_return_output;

     -- BIN_OP_EQ[uxn_c_l75_c11_7257] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l75_c11_7257_left <= VAR_BIN_OP_EQ_uxn_c_l75_c11_7257_left;
     BIN_OP_EQ_uxn_c_l75_c11_7257_right <= VAR_BIN_OP_EQ_uxn_c_l75_c11_7257_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l75_c11_7257_return_output := BIN_OP_EQ_uxn_c_l75_c11_7257_return_output;

     -- BIN_OP_EQ[uxn_c_l84_c11_a45f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l84_c11_a45f_left <= VAR_BIN_OP_EQ_uxn_c_l84_c11_a45f_left;
     BIN_OP_EQ_uxn_c_l84_c11_a45f_right <= VAR_BIN_OP_EQ_uxn_c_l84_c11_a45f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l84_c11_a45f_return_output := BIN_OP_EQ_uxn_c_l84_c11_a45f_return_output;

     -- BIN_OP_EQ[uxn_c_l108_c11_ed25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l108_c11_ed25_left <= VAR_BIN_OP_EQ_uxn_c_l108_c11_ed25_left;
     BIN_OP_EQ_uxn_c_l108_c11_ed25_right <= VAR_BIN_OP_EQ_uxn_c_l108_c11_ed25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l108_c11_ed25_return_output := BIN_OP_EQ_uxn_c_l108_c11_ed25_return_output;

     -- BIN_OP_EQ[uxn_c_l72_c11_0759] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l72_c11_0759_left <= VAR_BIN_OP_EQ_uxn_c_l72_c11_0759_left;
     BIN_OP_EQ_uxn_c_l72_c11_0759_right <= VAR_BIN_OP_EQ_uxn_c_l72_c11_0759_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l72_c11_0759_return_output := BIN_OP_EQ_uxn_c_l72_c11_0759_return_output;

     -- BIN_OP_EQ[uxn_c_l105_c11_5cf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l105_c11_5cf8_left <= VAR_BIN_OP_EQ_uxn_c_l105_c11_5cf8_left;
     BIN_OP_EQ_uxn_c_l105_c11_5cf8_right <= VAR_BIN_OP_EQ_uxn_c_l105_c11_5cf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l105_c11_5cf8_return_output := BIN_OP_EQ_uxn_c_l105_c11_5cf8_return_output;

     -- BIN_OP_EQ[uxn_c_l90_c11_fbe4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l90_c11_fbe4_left <= VAR_BIN_OP_EQ_uxn_c_l90_c11_fbe4_left;
     BIN_OP_EQ_uxn_c_l90_c11_fbe4_right <= VAR_BIN_OP_EQ_uxn_c_l90_c11_fbe4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l90_c11_fbe4_return_output := BIN_OP_EQ_uxn_c_l90_c11_fbe4_return_output;

     -- BIN_OP_EQ[uxn_c_l102_c11_2dcf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l102_c11_2dcf_left <= VAR_BIN_OP_EQ_uxn_c_l102_c11_2dcf_left;
     BIN_OP_EQ_uxn_c_l102_c11_2dcf_right <= VAR_BIN_OP_EQ_uxn_c_l102_c11_2dcf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l102_c11_2dcf_return_output := BIN_OP_EQ_uxn_c_l102_c11_2dcf_return_output;

     -- BIN_OP_EQ[uxn_c_l56_c11_8f80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l56_c11_8f80_left <= VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_left;
     BIN_OP_EQ_uxn_c_l56_c11_8f80_right <= VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output := BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output;

     -- BIN_OP_EQ[uxn_c_l87_c11_1401] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l87_c11_1401_left <= VAR_BIN_OP_EQ_uxn_c_l87_c11_1401_left;
     BIN_OP_EQ_uxn_c_l87_c11_1401_right <= VAR_BIN_OP_EQ_uxn_c_l87_c11_1401_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l87_c11_1401_return_output := BIN_OP_EQ_uxn_c_l87_c11_1401_return_output;

     -- BIN_OP_EQ[uxn_c_l99_c11_2b97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l99_c11_2b97_left <= VAR_BIN_OP_EQ_uxn_c_l99_c11_2b97_left;
     BIN_OP_EQ_uxn_c_l99_c11_2b97_right <= VAR_BIN_OP_EQ_uxn_c_l99_c11_2b97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l99_c11_2b97_return_output := BIN_OP_EQ_uxn_c_l99_c11_2b97_return_output;

     -- BIN_OP_EQ[uxn_c_l93_c11_06fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l93_c11_06fa_left <= VAR_BIN_OP_EQ_uxn_c_l93_c11_06fa_left;
     BIN_OP_EQ_uxn_c_l93_c11_06fa_right <= VAR_BIN_OP_EQ_uxn_c_l93_c11_06fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l93_c11_06fa_return_output := BIN_OP_EQ_uxn_c_l93_c11_06fa_return_output;

     -- BIN_OP_PLUS[uxn_c_l115_c3_6be8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l115_c3_6be8_left <= VAR_BIN_OP_PLUS_uxn_c_l115_c3_6be8_left;
     BIN_OP_PLUS_uxn_c_l115_c3_6be8_right <= VAR_BIN_OP_PLUS_uxn_c_l115_c3_6be8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l115_c3_6be8_return_output := BIN_OP_PLUS_uxn_c_l115_c3_6be8_return_output;

     -- BIN_OP_EQ[uxn_c_l96_c11_6e69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l96_c11_6e69_left <= VAR_BIN_OP_EQ_uxn_c_l96_c11_6e69_left;
     BIN_OP_EQ_uxn_c_l96_c11_6e69_right <= VAR_BIN_OP_EQ_uxn_c_l96_c11_6e69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l96_c11_6e69_return_output := BIN_OP_EQ_uxn_c_l96_c11_6e69_return_output;

     -- BIN_OP_EQ[uxn_c_l48_c6_c16b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l48_c6_c16b_left <= VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_left;
     BIN_OP_EQ_uxn_c_l48_c6_c16b_right <= VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output := BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;

     -- BIN_OP_EQ[uxn_c_l78_c11_3ac5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l78_c11_3ac5_left <= VAR_BIN_OP_EQ_uxn_c_l78_c11_3ac5_left;
     BIN_OP_EQ_uxn_c_l78_c11_3ac5_right <= VAR_BIN_OP_EQ_uxn_c_l78_c11_3ac5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l78_c11_3ac5_return_output := BIN_OP_EQ_uxn_c_l78_c11_3ac5_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_cond := VAR_BIN_OP_EQ_uxn_c_l102_c11_2dcf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_cond := VAR_BIN_OP_EQ_uxn_c_l102_c11_2dcf_return_output;
     VAR_eval_result_MUX_uxn_c_l102_c7_4d8d_cond := VAR_BIN_OP_EQ_uxn_c_l102_c11_2dcf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_cond := VAR_BIN_OP_EQ_uxn_c_l105_c11_5cf8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_cond := VAR_BIN_OP_EQ_uxn_c_l105_c11_5cf8_return_output;
     VAR_eval_result_MUX_uxn_c_l105_c7_5f8a_cond := VAR_BIN_OP_EQ_uxn_c_l105_c11_5cf8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_cond := VAR_BIN_OP_EQ_uxn_c_l108_c11_ed25_return_output;
     VAR_eval_result_MUX_uxn_c_l108_c7_5763_cond := VAR_BIN_OP_EQ_uxn_c_l108_c11_ed25_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_cond := VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_cond := VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;
     VAR_eval_result_MUX_uxn_c_l48_c2_9c52_cond := VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;
     VAR_ins_MUX_uxn_c_l48_c2_9c52_cond := VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;
     VAR_k_MUX_uxn_c_l48_c2_9c52_cond := VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;
     VAR_opc_MUX_uxn_c_l48_c2_9c52_cond := VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;
     VAR_pc_MUX_uxn_c_l48_c2_9c52_cond := VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;
     VAR_should_cpu_eval_MUX_uxn_c_l48_c2_9c52_cond := VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;
     VAR_sp0_MUX_uxn_c_l48_c2_9c52_cond := VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;
     VAR_sp1_MUX_uxn_c_l48_c2_9c52_cond := VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;
     VAR_sp_MUX_uxn_c_l48_c2_9c52_cond := VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;
     VAR_stack_index_MUX_uxn_c_l48_c2_9c52_cond := VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;
     VAR_system_state_MUX_uxn_c_l48_c2_9c52_cond := VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;
     VAR_system_state_zero_MUX_uxn_c_l48_c2_9c52_cond := VAR_BIN_OP_EQ_uxn_c_l48_c6_c16b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_cond := VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_cond := VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output;
     VAR_eval_result_MUX_uxn_c_l56_c7_eaaf_cond := VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output;
     VAR_ins_MUX_uxn_c_l56_c7_eaaf_cond := VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output;
     VAR_k_MUX_uxn_c_l56_c7_eaaf_cond := VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output;
     VAR_opc_MUX_uxn_c_l56_c7_eaaf_cond := VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output;
     VAR_pc_MUX_uxn_c_l56_c7_eaaf_cond := VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output;
     VAR_should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_cond := VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output;
     VAR_sp_MUX_uxn_c_l56_c7_eaaf_cond := VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output;
     VAR_stack_index_MUX_uxn_c_l56_c7_eaaf_cond := VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output;
     VAR_system_state_MUX_uxn_c_l56_c7_eaaf_cond := VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output;
     VAR_system_state_zero_MUX_uxn_c_l56_c7_eaaf_cond := VAR_BIN_OP_EQ_uxn_c_l56_c11_8f80_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_cond := VAR_BIN_OP_EQ_uxn_c_l69_c11_0cb3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_cond := VAR_BIN_OP_EQ_uxn_c_l69_c11_0cb3_return_output;
     VAR_eval_result_MUX_uxn_c_l69_c7_1d06_cond := VAR_BIN_OP_EQ_uxn_c_l69_c11_0cb3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_0759_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_0759_return_output;
     VAR_eval_result_MUX_uxn_c_l72_c7_95d3_cond := VAR_BIN_OP_EQ_uxn_c_l72_c11_0759_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_7257_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_7257_return_output;
     VAR_eval_result_MUX_uxn_c_l75_c7_8510_cond := VAR_BIN_OP_EQ_uxn_c_l75_c11_7257_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_cond := VAR_BIN_OP_EQ_uxn_c_l78_c11_3ac5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_cond := VAR_BIN_OP_EQ_uxn_c_l78_c11_3ac5_return_output;
     VAR_eval_result_MUX_uxn_c_l78_c7_7b39_cond := VAR_BIN_OP_EQ_uxn_c_l78_c11_3ac5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_a851_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_a851_return_output;
     VAR_eval_result_MUX_uxn_c_l81_c7_1569_cond := VAR_BIN_OP_EQ_uxn_c_l81_c11_a851_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_cond := VAR_BIN_OP_EQ_uxn_c_l84_c11_a45f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_cond := VAR_BIN_OP_EQ_uxn_c_l84_c11_a45f_return_output;
     VAR_eval_result_MUX_uxn_c_l84_c7_4af9_cond := VAR_BIN_OP_EQ_uxn_c_l84_c11_a45f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_cond := VAR_BIN_OP_EQ_uxn_c_l87_c11_1401_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_cond := VAR_BIN_OP_EQ_uxn_c_l87_c11_1401_return_output;
     VAR_eval_result_MUX_uxn_c_l87_c7_414c_cond := VAR_BIN_OP_EQ_uxn_c_l87_c11_1401_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_cond := VAR_BIN_OP_EQ_uxn_c_l90_c11_fbe4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_cond := VAR_BIN_OP_EQ_uxn_c_l90_c11_fbe4_return_output;
     VAR_eval_result_MUX_uxn_c_l90_c7_dfb7_cond := VAR_BIN_OP_EQ_uxn_c_l90_c11_fbe4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_cond := VAR_BIN_OP_EQ_uxn_c_l93_c11_06fa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_cond := VAR_BIN_OP_EQ_uxn_c_l93_c11_06fa_return_output;
     VAR_eval_result_MUX_uxn_c_l93_c7_1e01_cond := VAR_BIN_OP_EQ_uxn_c_l93_c11_06fa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_cond := VAR_BIN_OP_EQ_uxn_c_l96_c11_6e69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_cond := VAR_BIN_OP_EQ_uxn_c_l96_c11_6e69_return_output;
     VAR_eval_result_MUX_uxn_c_l96_c7_b854_cond := VAR_BIN_OP_EQ_uxn_c_l96_c11_6e69_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_cond := VAR_BIN_OP_EQ_uxn_c_l99_c11_2b97_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_cond := VAR_BIN_OP_EQ_uxn_c_l99_c11_2b97_return_output;
     VAR_eval_result_MUX_uxn_c_l99_c7_6c18_cond := VAR_BIN_OP_EQ_uxn_c_l99_c11_2b97_return_output;
     VAR_cpu_phase_uxn_c_l115_c3_1407 := resize(VAR_BIN_OP_PLUS_uxn_c_l115_c3_6be8_return_output, 4);
     VAR_pc_uxn_c_l66_c3_d37e := resize(VAR_BIN_OP_PLUS_uxn_c_l66_c3_00ad_return_output, 16);
     VAR_cpu_phase_MUX_uxn_c_l112_c2_0a10_iffalse := VAR_cpu_phase_uxn_c_l115_c3_1407;
     VAR_pc_MUX_uxn_c_l56_c7_eaaf_iftrue := VAR_pc_uxn_c_l66_c3_d37e;
     -- pc_MUX[uxn_c_l56_c7_eaaf] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l56_c7_eaaf_cond <= VAR_pc_MUX_uxn_c_l56_c7_eaaf_cond;
     pc_MUX_uxn_c_l56_c7_eaaf_iftrue <= VAR_pc_MUX_uxn_c_l56_c7_eaaf_iftrue;
     pc_MUX_uxn_c_l56_c7_eaaf_iffalse <= VAR_pc_MUX_uxn_c_l56_c7_eaaf_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l56_c7_eaaf_return_output := pc_MUX_uxn_c_l56_c7_eaaf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l48_c1_0adc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l56_c7_eaaf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l56_c7_eaaf_return_output;
     VAR_pc_get_uxn_c_l50_c8_6d69_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_return_output;
     VAR_peek_dev_uxn_c_l51_c18_572f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_return_output;
     VAR_peek_ram_uxn_c_l54_c9_cd3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_return_output;
     VAR_stack_pointer_get_uxn_c_l52_c9_0b82_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_return_output;
     VAR_stack_pointer_get_uxn_c_l53_c9_dccb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l48_c1_0adc_return_output;
     VAR_pc_MUX_uxn_c_l48_c2_9c52_iffalse := VAR_pc_MUX_uxn_c_l56_c7_eaaf_return_output;
     -- stack_pointer_get[uxn_c_l53_c9_dccb] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_c_l53_c9_dccb_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_c_l53_c9_dccb_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_c_l53_c9_dccb_stack_index <= VAR_stack_pointer_get_uxn_c_l53_c9_dccb_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_c_l53_c9_dccb_return_output := stack_pointer_get_uxn_c_l53_c9_dccb_return_output;

     -- stack_pointer_get[uxn_c_l52_c9_0b82] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_c_l52_c9_0b82_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_c_l52_c9_0b82_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_c_l52_c9_0b82_stack_index <= VAR_stack_pointer_get_uxn_c_l52_c9_0b82_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_c_l52_c9_0b82_return_output := stack_pointer_get_uxn_c_l52_c9_0b82_return_output;

     -- pc_get[uxn_c_l50_c8_6d69] LATENCY=0
     -- Clock enable
     pc_get_uxn_c_l50_c8_6d69_CLOCK_ENABLE <= VAR_pc_get_uxn_c_l50_c8_6d69_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_c_l50_c8_6d69_return_output := pc_get_uxn_c_l50_c8_6d69_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l56_c1_bb1b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l69_c7_1d06] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_return_output;

     -- peek_dev[uxn_c_l51_c18_572f] LATENCY=0
     -- Clock enable
     peek_dev_uxn_c_l51_c18_572f_CLOCK_ENABLE <= VAR_peek_dev_uxn_c_l51_c18_572f_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_c_l51_c18_572f_address <= VAR_peek_dev_uxn_c_l51_c18_572f_address;
     -- Outputs
     VAR_peek_dev_uxn_c_l51_c18_572f_return_output := peek_dev_uxn_c_l51_c18_572f_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l69_c7_1d06_return_output;
     VAR_pc_add_uxn_c_l65_c3_39f9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_return_output;
     VAR_peek_dev_uxn_c_l58_c18_0eef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_return_output;
     VAR_peek_ram_uxn_c_l57_c9_bc6c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l56_c1_bb1b_return_output;
     VAR_pc_MUX_uxn_c_l48_c2_9c52_iftrue := VAR_pc_get_uxn_c_l50_c8_6d69_return_output;
     VAR_peek_ram_uxn_c_l54_c9_cd3a_address := VAR_pc_get_uxn_c_l50_c8_6d69_return_output;
     VAR_system_state_MUX_uxn_c_l48_c2_9c52_iftrue := VAR_peek_dev_uxn_c_l51_c18_572f_return_output;
     VAR_sp0_MUX_uxn_c_l48_c2_9c52_iftrue := VAR_stack_pointer_get_uxn_c_l52_c9_0b82_return_output;
     VAR_sp1_MUX_uxn_c_l48_c2_9c52_iftrue := VAR_stack_pointer_get_uxn_c_l53_c9_dccb_return_output;
     -- sp0_MUX[uxn_c_l48_c2_9c52] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_c_l48_c2_9c52_cond <= VAR_sp0_MUX_uxn_c_l48_c2_9c52_cond;
     sp0_MUX_uxn_c_l48_c2_9c52_iftrue <= VAR_sp0_MUX_uxn_c_l48_c2_9c52_iftrue;
     sp0_MUX_uxn_c_l48_c2_9c52_iffalse <= VAR_sp0_MUX_uxn_c_l48_c2_9c52_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_c_l48_c2_9c52_return_output := sp0_MUX_uxn_c_l48_c2_9c52_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l72_c7_95d3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_return_output;

     -- peek_ram[uxn_c_l57_c9_bc6c] LATENCY=0
     -- Clock enable
     peek_ram_uxn_c_l57_c9_bc6c_CLOCK_ENABLE <= VAR_peek_ram_uxn_c_l57_c9_bc6c_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_c_l57_c9_bc6c_address <= VAR_peek_ram_uxn_c_l57_c9_bc6c_address;
     -- Outputs
     VAR_peek_ram_uxn_c_l57_c9_bc6c_return_output := peek_ram_uxn_c_l57_c9_bc6c_return_output;

     -- pc_MUX[uxn_c_l48_c2_9c52] LATENCY=0
     -- Inputs
     pc_MUX_uxn_c_l48_c2_9c52_cond <= VAR_pc_MUX_uxn_c_l48_c2_9c52_cond;
     pc_MUX_uxn_c_l48_c2_9c52_iftrue <= VAR_pc_MUX_uxn_c_l48_c2_9c52_iftrue;
     pc_MUX_uxn_c_l48_c2_9c52_iffalse <= VAR_pc_MUX_uxn_c_l48_c2_9c52_iffalse;
     -- Outputs
     VAR_pc_MUX_uxn_c_l48_c2_9c52_return_output := pc_MUX_uxn_c_l48_c2_9c52_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l69_c1_c7cd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_return_output;

     -- peek_dev[uxn_c_l58_c18_0eef] LATENCY=0
     -- Clock enable
     peek_dev_uxn_c_l58_c18_0eef_CLOCK_ENABLE <= VAR_peek_dev_uxn_c_l58_c18_0eef_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_c_l58_c18_0eef_address <= VAR_peek_dev_uxn_c_l58_c18_0eef_address;
     -- Outputs
     VAR_peek_dev_uxn_c_l58_c18_0eef_return_output := peek_dev_uxn_c_l58_c18_0eef_return_output;

     -- peek_ram[uxn_c_l54_c9_cd3a] LATENCY=0
     -- Clock enable
     peek_ram_uxn_c_l54_c9_cd3a_CLOCK_ENABLE <= VAR_peek_ram_uxn_c_l54_c9_cd3a_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_c_l54_c9_cd3a_address <= VAR_peek_ram_uxn_c_l54_c9_cd3a_address;
     -- Outputs
     VAR_peek_ram_uxn_c_l54_c9_cd3a_return_output := peek_ram_uxn_c_l54_c9_cd3a_return_output;

     -- sp1_MUX[uxn_c_l48_c2_9c52] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_c_l48_c2_9c52_cond <= VAR_sp1_MUX_uxn_c_l48_c2_9c52_cond;
     sp1_MUX_uxn_c_l48_c2_9c52_iftrue <= VAR_sp1_MUX_uxn_c_l48_c2_9c52_iftrue;
     sp1_MUX_uxn_c_l48_c2_9c52_iffalse <= VAR_sp1_MUX_uxn_c_l48_c2_9c52_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_c_l48_c2_9c52_return_output := sp1_MUX_uxn_c_l48_c2_9c52_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l72_c7_95d3_return_output;
     VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l69_c1_c7cd_return_output;
     REG_VAR_pc := VAR_pc_MUX_uxn_c_l48_c2_9c52_return_output;
     VAR_BIN_OP_EQ_uxn_c_l63_c23_9531_left := VAR_peek_dev_uxn_c_l58_c18_0eef_return_output;
     VAR_system_state_MUX_uxn_c_l56_c7_eaaf_iftrue := VAR_peek_dev_uxn_c_l58_c18_0eef_return_output;
     VAR_BIN_OP_AND_uxn_c_l54_c9_7569_left := VAR_peek_ram_uxn_c_l54_c9_cd3a_return_output;
     VAR_BIN_OP_AND_uxn_c_l57_c9_1a3f_left := VAR_peek_ram_uxn_c_l57_c9_bc6c_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_c_l48_c2_9c52_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_c_l48_c2_9c52_return_output;
     -- system_state_MUX[uxn_c_l56_c7_eaaf] LATENCY=0
     -- Inputs
     system_state_MUX_uxn_c_l56_c7_eaaf_cond <= VAR_system_state_MUX_uxn_c_l56_c7_eaaf_cond;
     system_state_MUX_uxn_c_l56_c7_eaaf_iftrue <= VAR_system_state_MUX_uxn_c_l56_c7_eaaf_iftrue;
     system_state_MUX_uxn_c_l56_c7_eaaf_iffalse <= VAR_system_state_MUX_uxn_c_l56_c7_eaaf_iffalse;
     -- Outputs
     VAR_system_state_MUX_uxn_c_l56_c7_eaaf_return_output := system_state_MUX_uxn_c_l56_c7_eaaf_return_output;

     -- eval_opcode_phased[uxn_c_l70_c17_f1ab] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l70_c17_f1ab_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l70_c17_f1ab_phase <= VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_phase;
     eval_opcode_phased_uxn_c_l70_c17_f1ab_pc <= VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_pc;
     eval_opcode_phased_uxn_c_l70_c17_f1ab_sp <= VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_sp;
     eval_opcode_phased_uxn_c_l70_c17_f1ab_stack_index <= VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_stack_index;
     eval_opcode_phased_uxn_c_l70_c17_f1ab_opcode <= VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_opcode;
     eval_opcode_phased_uxn_c_l70_c17_f1ab_ins <= VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_ins;
     eval_opcode_phased_uxn_c_l70_c17_f1ab_k <= VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_k;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_return_output := eval_opcode_phased_uxn_c_l70_c17_f1ab_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l72_c1_267d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_return_output;

     -- BIN_OP_AND[uxn_c_l54_c9_7569] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l54_c9_7569_left <= VAR_BIN_OP_AND_uxn_c_l54_c9_7569_left;
     BIN_OP_AND_uxn_c_l54_c9_7569_right <= VAR_BIN_OP_AND_uxn_c_l54_c9_7569_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l54_c9_7569_return_output := BIN_OP_AND_uxn_c_l54_c9_7569_return_output;

     -- BIN_OP_EQ[uxn_c_l63_c23_9531] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l63_c23_9531_left <= VAR_BIN_OP_EQ_uxn_c_l63_c23_9531_left;
     BIN_OP_EQ_uxn_c_l63_c23_9531_right <= VAR_BIN_OP_EQ_uxn_c_l63_c23_9531_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l63_c23_9531_return_output := BIN_OP_EQ_uxn_c_l63_c23_9531_return_output;

     -- BIN_OP_AND[uxn_c_l57_c9_1a3f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l57_c9_1a3f_left <= VAR_BIN_OP_AND_uxn_c_l57_c9_1a3f_left;
     BIN_OP_AND_uxn_c_l57_c9_1a3f_right <= VAR_BIN_OP_AND_uxn_c_l57_c9_1a3f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l57_c9_1a3f_return_output := BIN_OP_AND_uxn_c_l57_c9_1a3f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l75_c7_8510] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_return_output;

     -- Submodule level 5
     VAR_ins_MUX_uxn_c_l48_c2_9c52_iftrue := VAR_BIN_OP_AND_uxn_c_l54_c9_7569_return_output;
     VAR_BIN_OP_AND_uxn_c_l59_c7_acd7_left := VAR_BIN_OP_AND_uxn_c_l57_c9_1a3f_return_output;
     VAR_BIN_OP_AND_uxn_c_l60_c17_5373_left := VAR_BIN_OP_AND_uxn_c_l57_c9_1a3f_return_output;
     VAR_BIN_OP_AND_uxn_c_l62_c11_ac24_left := VAR_BIN_OP_AND_uxn_c_l57_c9_1a3f_return_output;
     VAR_BIN_OP_AND_uxn_c_l62_c51_64e5_left := VAR_BIN_OP_AND_uxn_c_l57_c9_1a3f_return_output;
     VAR_CONST_SR_5_uxn_c_l62_c31_ea4a_x := VAR_BIN_OP_AND_uxn_c_l57_c9_1a3f_return_output;
     VAR_ins_MUX_uxn_c_l56_c7_eaaf_iftrue := VAR_BIN_OP_AND_uxn_c_l57_c9_1a3f_return_output;
     VAR_MUX_uxn_c_l63_c23_0d80_cond := VAR_BIN_OP_EQ_uxn_c_l63_c23_9531_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l75_c7_8510_return_output;
     VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l72_c1_267d_return_output;
     VAR_eval_result_MUX_uxn_c_l69_c7_1d06_iftrue := VAR_eval_opcode_phased_uxn_c_l70_c17_f1ab_return_output;
     VAR_system_state_MUX_uxn_c_l48_c2_9c52_iffalse := VAR_system_state_MUX_uxn_c_l56_c7_eaaf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l78_c7_7b39] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l75_c1_f24e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_return_output;

     -- BIN_OP_AND[uxn_c_l59_c7_acd7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l59_c7_acd7_left <= VAR_BIN_OP_AND_uxn_c_l59_c7_acd7_left;
     BIN_OP_AND_uxn_c_l59_c7_acd7_right <= VAR_BIN_OP_AND_uxn_c_l59_c7_acd7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l59_c7_acd7_return_output := BIN_OP_AND_uxn_c_l59_c7_acd7_return_output;

     -- system_state_MUX[uxn_c_l48_c2_9c52] LATENCY=0
     -- Inputs
     system_state_MUX_uxn_c_l48_c2_9c52_cond <= VAR_system_state_MUX_uxn_c_l48_c2_9c52_cond;
     system_state_MUX_uxn_c_l48_c2_9c52_iftrue <= VAR_system_state_MUX_uxn_c_l48_c2_9c52_iftrue;
     system_state_MUX_uxn_c_l48_c2_9c52_iffalse <= VAR_system_state_MUX_uxn_c_l48_c2_9c52_iffalse;
     -- Outputs
     VAR_system_state_MUX_uxn_c_l48_c2_9c52_return_output := system_state_MUX_uxn_c_l48_c2_9c52_return_output;

     -- ins_MUX[uxn_c_l56_c7_eaaf] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l56_c7_eaaf_cond <= VAR_ins_MUX_uxn_c_l56_c7_eaaf_cond;
     ins_MUX_uxn_c_l56_c7_eaaf_iftrue <= VAR_ins_MUX_uxn_c_l56_c7_eaaf_iftrue;
     ins_MUX_uxn_c_l56_c7_eaaf_iffalse <= VAR_ins_MUX_uxn_c_l56_c7_eaaf_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l56_c7_eaaf_return_output := ins_MUX_uxn_c_l56_c7_eaaf_return_output;

     -- BIN_OP_AND[uxn_c_l62_c11_ac24] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l62_c11_ac24_left <= VAR_BIN_OP_AND_uxn_c_l62_c11_ac24_left;
     BIN_OP_AND_uxn_c_l62_c11_ac24_right <= VAR_BIN_OP_AND_uxn_c_l62_c11_ac24_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l62_c11_ac24_return_output := BIN_OP_AND_uxn_c_l62_c11_ac24_return_output;

     -- eval_opcode_phased[uxn_c_l73_c17_0f88] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l73_c17_0f88_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l73_c17_0f88_phase <= VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_phase;
     eval_opcode_phased_uxn_c_l73_c17_0f88_pc <= VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_pc;
     eval_opcode_phased_uxn_c_l73_c17_0f88_sp <= VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_sp;
     eval_opcode_phased_uxn_c_l73_c17_0f88_stack_index <= VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_stack_index;
     eval_opcode_phased_uxn_c_l73_c17_0f88_opcode <= VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_opcode;
     eval_opcode_phased_uxn_c_l73_c17_0f88_ins <= VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_ins;
     eval_opcode_phased_uxn_c_l73_c17_0f88_k <= VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_k;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_return_output := eval_opcode_phased_uxn_c_l73_c17_0f88_return_output;

     -- BIN_OP_AND[uxn_c_l60_c17_5373] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l60_c17_5373_left <= VAR_BIN_OP_AND_uxn_c_l60_c17_5373_left;
     BIN_OP_AND_uxn_c_l60_c17_5373_right <= VAR_BIN_OP_AND_uxn_c_l60_c17_5373_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l60_c17_5373_return_output := BIN_OP_AND_uxn_c_l60_c17_5373_return_output;

     -- BIN_OP_AND[uxn_c_l62_c51_64e5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l62_c51_64e5_left <= VAR_BIN_OP_AND_uxn_c_l62_c51_64e5_left;
     BIN_OP_AND_uxn_c_l62_c51_64e5_right <= VAR_BIN_OP_AND_uxn_c_l62_c51_64e5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l62_c51_64e5_return_output := BIN_OP_AND_uxn_c_l62_c51_64e5_return_output;

     -- CONST_SR_5[uxn_c_l62_c31_ea4a] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_c_l62_c31_ea4a_x <= VAR_CONST_SR_5_uxn_c_l62_c31_ea4a_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_c_l62_c31_ea4a_return_output := CONST_SR_5_uxn_c_l62_c31_ea4a_return_output;

     -- MUX[uxn_c_l63_c23_0d80] LATENCY=0
     -- Inputs
     MUX_uxn_c_l63_c23_0d80_cond <= VAR_MUX_uxn_c_l63_c23_0d80_cond;
     MUX_uxn_c_l63_c23_0d80_iftrue <= VAR_MUX_uxn_c_l63_c23_0d80_iftrue;
     MUX_uxn_c_l63_c23_0d80_iffalse <= VAR_MUX_uxn_c_l63_c23_0d80_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l63_c23_0d80_return_output := MUX_uxn_c_l63_c23_0d80_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l59_c7_ab2c_cond := resize(VAR_BIN_OP_AND_uxn_c_l59_c7_acd7_return_output, 1);
     VAR_MUX_uxn_c_l60_c17_96f0_cond := resize(VAR_BIN_OP_AND_uxn_c_l60_c17_5373_return_output, 1);
     VAR_UNARY_OP_NOT_uxn_c_l62_c11_1af7_expr := VAR_BIN_OP_AND_uxn_c_l62_c11_ac24_return_output;
     VAR_MUX_uxn_c_l62_c11_1550_iffalse := VAR_BIN_OP_AND_uxn_c_l62_c51_64e5_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l62_c26_fa33_right := VAR_CONST_SR_5_uxn_c_l62_c31_ea4a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l78_c7_7b39_return_output;
     VAR_BIN_OP_AND_uxn_c_l64_c21_25f4_right := VAR_MUX_uxn_c_l63_c23_0d80_return_output;
     VAR_system_state_zero_MUX_uxn_c_l56_c7_eaaf_iftrue := VAR_MUX_uxn_c_l63_c23_0d80_return_output;
     VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l75_c1_f24e_return_output;
     VAR_eval_result_MUX_uxn_c_l72_c7_95d3_iftrue := VAR_eval_opcode_phased_uxn_c_l73_c17_0f88_return_output;
     VAR_ins_MUX_uxn_c_l48_c2_9c52_iffalse := VAR_ins_MUX_uxn_c_l56_c7_eaaf_return_output;
     REG_VAR_system_state := VAR_system_state_MUX_uxn_c_l48_c2_9c52_return_output;
     -- BIN_OP_MINUS[uxn_c_l62_c26_fa33] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l62_c26_fa33_left <= VAR_BIN_OP_MINUS_uxn_c_l62_c26_fa33_left;
     BIN_OP_MINUS_uxn_c_l62_c26_fa33_right <= VAR_BIN_OP_MINUS_uxn_c_l62_c26_fa33_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l62_c26_fa33_return_output := BIN_OP_MINUS_uxn_c_l62_c26_fa33_return_output;

     -- eval_opcode_phased[uxn_c_l76_c17_a11f] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l76_c17_a11f_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l76_c17_a11f_phase <= VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_phase;
     eval_opcode_phased_uxn_c_l76_c17_a11f_pc <= VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_pc;
     eval_opcode_phased_uxn_c_l76_c17_a11f_sp <= VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_sp;
     eval_opcode_phased_uxn_c_l76_c17_a11f_stack_index <= VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_stack_index;
     eval_opcode_phased_uxn_c_l76_c17_a11f_opcode <= VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_opcode;
     eval_opcode_phased_uxn_c_l76_c17_a11f_ins <= VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_ins;
     eval_opcode_phased_uxn_c_l76_c17_a11f_k <= VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_k;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_return_output := eval_opcode_phased_uxn_c_l76_c17_a11f_return_output;

     -- MUX[uxn_c_l59_c7_ab2c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l59_c7_ab2c_cond <= VAR_MUX_uxn_c_l59_c7_ab2c_cond;
     MUX_uxn_c_l59_c7_ab2c_iftrue <= VAR_MUX_uxn_c_l59_c7_ab2c_iftrue;
     MUX_uxn_c_l59_c7_ab2c_iffalse <= VAR_MUX_uxn_c_l59_c7_ab2c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l59_c7_ab2c_return_output := MUX_uxn_c_l59_c7_ab2c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l81_c7_1569] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_return_output;

     -- BIN_OP_AND[uxn_c_l64_c21_25f4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l64_c21_25f4_left <= VAR_BIN_OP_AND_uxn_c_l64_c21_25f4_left;
     BIN_OP_AND_uxn_c_l64_c21_25f4_right <= VAR_BIN_OP_AND_uxn_c_l64_c21_25f4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l64_c21_25f4_return_output := BIN_OP_AND_uxn_c_l64_c21_25f4_return_output;

     -- system_state_zero_MUX[uxn_c_l56_c7_eaaf] LATENCY=0
     -- Inputs
     system_state_zero_MUX_uxn_c_l56_c7_eaaf_cond <= VAR_system_state_zero_MUX_uxn_c_l56_c7_eaaf_cond;
     system_state_zero_MUX_uxn_c_l56_c7_eaaf_iftrue <= VAR_system_state_zero_MUX_uxn_c_l56_c7_eaaf_iftrue;
     system_state_zero_MUX_uxn_c_l56_c7_eaaf_iffalse <= VAR_system_state_zero_MUX_uxn_c_l56_c7_eaaf_iffalse;
     -- Outputs
     VAR_system_state_zero_MUX_uxn_c_l56_c7_eaaf_return_output := system_state_zero_MUX_uxn_c_l56_c7_eaaf_return_output;

     -- ins_MUX[uxn_c_l48_c2_9c52] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l48_c2_9c52_cond <= VAR_ins_MUX_uxn_c_l48_c2_9c52_cond;
     ins_MUX_uxn_c_l48_c2_9c52_iftrue <= VAR_ins_MUX_uxn_c_l48_c2_9c52_iftrue;
     ins_MUX_uxn_c_l48_c2_9c52_iffalse <= VAR_ins_MUX_uxn_c_l48_c2_9c52_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l48_c2_9c52_return_output := ins_MUX_uxn_c_l48_c2_9c52_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l78_c1_ce9e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_return_output;

     -- UNARY_OP_NOT[uxn_c_l62_c11_1af7] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l62_c11_1af7_expr <= VAR_UNARY_OP_NOT_uxn_c_l62_c11_1af7_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l62_c11_1af7_return_output := UNARY_OP_NOT_uxn_c_l62_c11_1af7_return_output;

     -- MUX[uxn_c_l60_c17_96f0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l60_c17_96f0_cond <= VAR_MUX_uxn_c_l60_c17_96f0_cond;
     MUX_uxn_c_l60_c17_96f0_iftrue <= VAR_MUX_uxn_c_l60_c17_96f0_iftrue;
     MUX_uxn_c_l60_c17_96f0_iffalse <= VAR_MUX_uxn_c_l60_c17_96f0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l60_c17_96f0_return_output := MUX_uxn_c_l60_c17_96f0_return_output;

     -- Submodule level 7
     VAR_UNARY_OP_NOT_uxn_c_l67_c18_c203_expr := VAR_BIN_OP_AND_uxn_c_l64_c21_25f4_return_output;
     VAR_should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_iftrue := VAR_BIN_OP_AND_uxn_c_l64_c21_25f4_return_output;
     VAR_BIN_OP_AND_uxn_c_l62_c26_032f_left := VAR_BIN_OP_MINUS_uxn_c_l62_c26_fa33_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l81_c7_1569_return_output;
     VAR_k_MUX_uxn_c_l56_c7_eaaf_iftrue := VAR_MUX_uxn_c_l59_c7_ab2c_return_output;
     VAR_BIN_OP_EQ_uxn_c_l61_c8_246d_left := VAR_MUX_uxn_c_l60_c17_96f0_return_output;
     VAR_stack_index_MUX_uxn_c_l56_c7_eaaf_iftrue := VAR_MUX_uxn_c_l60_c17_96f0_return_output;
     VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l78_c1_ce9e_return_output;
     VAR_MUX_uxn_c_l62_c11_1550_cond := resize(VAR_UNARY_OP_NOT_uxn_c_l62_c11_1af7_return_output, 1);
     VAR_eval_result_MUX_uxn_c_l75_c7_8510_iftrue := VAR_eval_opcode_phased_uxn_c_l76_c17_a11f_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l48_c2_9c52_return_output;
     VAR_system_state_zero_MUX_uxn_c_l48_c2_9c52_iffalse := VAR_system_state_zero_MUX_uxn_c_l56_c7_eaaf_return_output;
     -- BIN_OP_AND[uxn_c_l62_c26_032f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l62_c26_032f_left <= VAR_BIN_OP_AND_uxn_c_l62_c26_032f_left;
     BIN_OP_AND_uxn_c_l62_c26_032f_right <= VAR_BIN_OP_AND_uxn_c_l62_c26_032f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l62_c26_032f_return_output := BIN_OP_AND_uxn_c_l62_c26_032f_return_output;

     -- BIN_OP_EQ[uxn_c_l61_c8_246d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l61_c8_246d_left <= VAR_BIN_OP_EQ_uxn_c_l61_c8_246d_left;
     BIN_OP_EQ_uxn_c_l61_c8_246d_right <= VAR_BIN_OP_EQ_uxn_c_l61_c8_246d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l61_c8_246d_return_output := BIN_OP_EQ_uxn_c_l61_c8_246d_return_output;

     -- k_MUX[uxn_c_l56_c7_eaaf] LATENCY=0
     -- Inputs
     k_MUX_uxn_c_l56_c7_eaaf_cond <= VAR_k_MUX_uxn_c_l56_c7_eaaf_cond;
     k_MUX_uxn_c_l56_c7_eaaf_iftrue <= VAR_k_MUX_uxn_c_l56_c7_eaaf_iftrue;
     k_MUX_uxn_c_l56_c7_eaaf_iffalse <= VAR_k_MUX_uxn_c_l56_c7_eaaf_iffalse;
     -- Outputs
     VAR_k_MUX_uxn_c_l56_c7_eaaf_return_output := k_MUX_uxn_c_l56_c7_eaaf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l84_c7_4af9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_return_output;

     -- UNARY_OP_NOT[uxn_c_l67_c18_c203] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l67_c18_c203_expr <= VAR_UNARY_OP_NOT_uxn_c_l67_c18_c203_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l67_c18_c203_return_output := UNARY_OP_NOT_uxn_c_l67_c18_c203_return_output;

     -- CAST_TO_uint16_t[uxn_c_l65_c10_1fc0] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_c_l65_c10_1fc0_return_output := CAST_TO_uint16_t_uint1_t(
     VAR_BIN_OP_AND_uxn_c_l64_c21_25f4_return_output);

     -- eval_opcode_phased[uxn_c_l79_c17_4bb9] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l79_c17_4bb9_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l79_c17_4bb9_phase <= VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_phase;
     eval_opcode_phased_uxn_c_l79_c17_4bb9_pc <= VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_pc;
     eval_opcode_phased_uxn_c_l79_c17_4bb9_sp <= VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_sp;
     eval_opcode_phased_uxn_c_l79_c17_4bb9_stack_index <= VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_stack_index;
     eval_opcode_phased_uxn_c_l79_c17_4bb9_opcode <= VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_opcode;
     eval_opcode_phased_uxn_c_l79_c17_4bb9_ins <= VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_ins;
     eval_opcode_phased_uxn_c_l79_c17_4bb9_k <= VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_k;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_return_output := eval_opcode_phased_uxn_c_l79_c17_4bb9_return_output;

     -- system_state_zero_MUX[uxn_c_l48_c2_9c52] LATENCY=0
     -- Inputs
     system_state_zero_MUX_uxn_c_l48_c2_9c52_cond <= VAR_system_state_zero_MUX_uxn_c_l48_c2_9c52_cond;
     system_state_zero_MUX_uxn_c_l48_c2_9c52_iftrue <= VAR_system_state_zero_MUX_uxn_c_l48_c2_9c52_iftrue;
     system_state_zero_MUX_uxn_c_l48_c2_9c52_iffalse <= VAR_system_state_zero_MUX_uxn_c_l48_c2_9c52_iffalse;
     -- Outputs
     VAR_system_state_zero_MUX_uxn_c_l48_c2_9c52_return_output := system_state_zero_MUX_uxn_c_l48_c2_9c52_return_output;

     -- should_cpu_eval_MUX[uxn_c_l56_c7_eaaf] LATENCY=0
     -- Inputs
     should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_cond <= VAR_should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_cond;
     should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_iftrue <= VAR_should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_iftrue;
     should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_iffalse <= VAR_should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_iffalse;
     -- Outputs
     VAR_should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_return_output := should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_return_output;

     -- stack_index_MUX[uxn_c_l56_c7_eaaf] LATENCY=0
     -- Inputs
     stack_index_MUX_uxn_c_l56_c7_eaaf_cond <= VAR_stack_index_MUX_uxn_c_l56_c7_eaaf_cond;
     stack_index_MUX_uxn_c_l56_c7_eaaf_iftrue <= VAR_stack_index_MUX_uxn_c_l56_c7_eaaf_iftrue;
     stack_index_MUX_uxn_c_l56_c7_eaaf_iffalse <= VAR_stack_index_MUX_uxn_c_l56_c7_eaaf_iffalse;
     -- Outputs
     VAR_stack_index_MUX_uxn_c_l56_c7_eaaf_return_output := stack_index_MUX_uxn_c_l56_c7_eaaf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l81_c1_4814] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l62_c11_1550_iftrue := VAR_BIN_OP_AND_uxn_c_l62_c26_032f_return_output;
     VAR_MUX_uxn_c_l61_c8_73f0_cond := VAR_BIN_OP_EQ_uxn_c_l61_c8_246d_return_output;
     VAR_pc_add_uxn_c_l65_c3_39f9_adjustment := VAR_CAST_TO_uint16_t_uxn_c_l65_c10_1fc0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l84_c7_4af9_return_output;
     VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l81_c1_4814_return_output;
     VAR_eval_result_MUX_uxn_c_l56_c7_eaaf_iftrue := VAR_UNARY_OP_NOT_uxn_c_l67_c18_c203_return_output;
     VAR_eval_result_MUX_uxn_c_l78_c7_7b39_iftrue := VAR_eval_opcode_phased_uxn_c_l79_c17_4bb9_return_output;
     VAR_k_MUX_uxn_c_l48_c2_9c52_iffalse := VAR_k_MUX_uxn_c_l56_c7_eaaf_return_output;
     VAR_should_cpu_eval_MUX_uxn_c_l48_c2_9c52_iffalse := VAR_should_cpu_eval_MUX_uxn_c_l56_c7_eaaf_return_output;
     VAR_stack_index_MUX_uxn_c_l48_c2_9c52_iffalse := VAR_stack_index_MUX_uxn_c_l56_c7_eaaf_return_output;
     REG_VAR_system_state_zero := VAR_system_state_zero_MUX_uxn_c_l48_c2_9c52_return_output;
     -- eval_opcode_phased[uxn_c_l82_c17_e16d] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l82_c17_e16d_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l82_c17_e16d_phase <= VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_phase;
     eval_opcode_phased_uxn_c_l82_c17_e16d_pc <= VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_pc;
     eval_opcode_phased_uxn_c_l82_c17_e16d_sp <= VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_sp;
     eval_opcode_phased_uxn_c_l82_c17_e16d_stack_index <= VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_stack_index;
     eval_opcode_phased_uxn_c_l82_c17_e16d_opcode <= VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_opcode;
     eval_opcode_phased_uxn_c_l82_c17_e16d_ins <= VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_ins;
     eval_opcode_phased_uxn_c_l82_c17_e16d_k <= VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_k;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_return_output := eval_opcode_phased_uxn_c_l82_c17_e16d_return_output;

     -- should_cpu_eval_MUX[uxn_c_l48_c2_9c52] LATENCY=0
     -- Inputs
     should_cpu_eval_MUX_uxn_c_l48_c2_9c52_cond <= VAR_should_cpu_eval_MUX_uxn_c_l48_c2_9c52_cond;
     should_cpu_eval_MUX_uxn_c_l48_c2_9c52_iftrue <= VAR_should_cpu_eval_MUX_uxn_c_l48_c2_9c52_iftrue;
     should_cpu_eval_MUX_uxn_c_l48_c2_9c52_iffalse <= VAR_should_cpu_eval_MUX_uxn_c_l48_c2_9c52_iffalse;
     -- Outputs
     VAR_should_cpu_eval_MUX_uxn_c_l48_c2_9c52_return_output := should_cpu_eval_MUX_uxn_c_l48_c2_9c52_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l84_c1_d59a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_return_output;

     -- MUX[uxn_c_l61_c8_73f0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l61_c8_73f0_cond <= VAR_MUX_uxn_c_l61_c8_73f0_cond;
     MUX_uxn_c_l61_c8_73f0_iftrue <= VAR_MUX_uxn_c_l61_c8_73f0_iftrue;
     MUX_uxn_c_l61_c8_73f0_iffalse <= VAR_MUX_uxn_c_l61_c8_73f0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l61_c8_73f0_return_output := MUX_uxn_c_l61_c8_73f0_return_output;

     -- k_MUX[uxn_c_l48_c2_9c52] LATENCY=0
     -- Inputs
     k_MUX_uxn_c_l48_c2_9c52_cond <= VAR_k_MUX_uxn_c_l48_c2_9c52_cond;
     k_MUX_uxn_c_l48_c2_9c52_iftrue <= VAR_k_MUX_uxn_c_l48_c2_9c52_iftrue;
     k_MUX_uxn_c_l48_c2_9c52_iffalse <= VAR_k_MUX_uxn_c_l48_c2_9c52_iffalse;
     -- Outputs
     VAR_k_MUX_uxn_c_l48_c2_9c52_return_output := k_MUX_uxn_c_l48_c2_9c52_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l87_c7_414c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_return_output;

     -- MUX[uxn_c_l62_c11_1550] LATENCY=0
     -- Inputs
     MUX_uxn_c_l62_c11_1550_cond <= VAR_MUX_uxn_c_l62_c11_1550_cond;
     MUX_uxn_c_l62_c11_1550_iftrue <= VAR_MUX_uxn_c_l62_c11_1550_iftrue;
     MUX_uxn_c_l62_c11_1550_iffalse <= VAR_MUX_uxn_c_l62_c11_1550_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l62_c11_1550_return_output := MUX_uxn_c_l62_c11_1550_return_output;

     -- pc_add[uxn_c_l65_c3_39f9] LATENCY=0
     -- Clock enable
     pc_add_uxn_c_l65_c3_39f9_CLOCK_ENABLE <= VAR_pc_add_uxn_c_l65_c3_39f9_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_c_l65_c3_39f9_adjustment <= VAR_pc_add_uxn_c_l65_c3_39f9_adjustment;
     -- Outputs

     -- stack_index_MUX[uxn_c_l48_c2_9c52] LATENCY=0
     -- Inputs
     stack_index_MUX_uxn_c_l48_c2_9c52_cond <= VAR_stack_index_MUX_uxn_c_l48_c2_9c52_cond;
     stack_index_MUX_uxn_c_l48_c2_9c52_iftrue <= VAR_stack_index_MUX_uxn_c_l48_c2_9c52_iftrue;
     stack_index_MUX_uxn_c_l48_c2_9c52_iffalse <= VAR_stack_index_MUX_uxn_c_l48_c2_9c52_iffalse;
     -- Outputs
     VAR_stack_index_MUX_uxn_c_l48_c2_9c52_return_output := stack_index_MUX_uxn_c_l48_c2_9c52_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l87_c7_414c_return_output;
     VAR_sp_MUX_uxn_c_l56_c7_eaaf_iftrue := VAR_MUX_uxn_c_l61_c8_73f0_return_output;
     VAR_opc_MUX_uxn_c_l56_c7_eaaf_iftrue := VAR_MUX_uxn_c_l62_c11_1550_return_output;
     VAR_eval_opcode_phased_uxn_c_l85_c17_1333_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l84_c1_d59a_return_output;
     VAR_eval_result_MUX_uxn_c_l81_c7_1569_iftrue := VAR_eval_opcode_phased_uxn_c_l82_c17_e16d_return_output;
     REG_VAR_k := VAR_k_MUX_uxn_c_l48_c2_9c52_return_output;
     REG_VAR_should_cpu_eval := VAR_should_cpu_eval_MUX_uxn_c_l48_c2_9c52_return_output;
     REG_VAR_stack_index := VAR_stack_index_MUX_uxn_c_l48_c2_9c52_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l87_c1_8603] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_return_output;

     -- sp_MUX[uxn_c_l56_c7_eaaf] LATENCY=0
     -- Inputs
     sp_MUX_uxn_c_l56_c7_eaaf_cond <= VAR_sp_MUX_uxn_c_l56_c7_eaaf_cond;
     sp_MUX_uxn_c_l56_c7_eaaf_iftrue <= VAR_sp_MUX_uxn_c_l56_c7_eaaf_iftrue;
     sp_MUX_uxn_c_l56_c7_eaaf_iffalse <= VAR_sp_MUX_uxn_c_l56_c7_eaaf_iffalse;
     -- Outputs
     VAR_sp_MUX_uxn_c_l56_c7_eaaf_return_output := sp_MUX_uxn_c_l56_c7_eaaf_return_output;

     -- eval_opcode_phased[uxn_c_l85_c17_1333] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l85_c17_1333_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l85_c17_1333_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l85_c17_1333_phase <= VAR_eval_opcode_phased_uxn_c_l85_c17_1333_phase;
     eval_opcode_phased_uxn_c_l85_c17_1333_pc <= VAR_eval_opcode_phased_uxn_c_l85_c17_1333_pc;
     eval_opcode_phased_uxn_c_l85_c17_1333_sp <= VAR_eval_opcode_phased_uxn_c_l85_c17_1333_sp;
     eval_opcode_phased_uxn_c_l85_c17_1333_stack_index <= VAR_eval_opcode_phased_uxn_c_l85_c17_1333_stack_index;
     eval_opcode_phased_uxn_c_l85_c17_1333_opcode <= VAR_eval_opcode_phased_uxn_c_l85_c17_1333_opcode;
     eval_opcode_phased_uxn_c_l85_c17_1333_ins <= VAR_eval_opcode_phased_uxn_c_l85_c17_1333_ins;
     eval_opcode_phased_uxn_c_l85_c17_1333_k <= VAR_eval_opcode_phased_uxn_c_l85_c17_1333_k;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l85_c17_1333_return_output := eval_opcode_phased_uxn_c_l85_c17_1333_return_output;

     -- opc_MUX[uxn_c_l56_c7_eaaf] LATENCY=0
     -- Inputs
     opc_MUX_uxn_c_l56_c7_eaaf_cond <= VAR_opc_MUX_uxn_c_l56_c7_eaaf_cond;
     opc_MUX_uxn_c_l56_c7_eaaf_iftrue <= VAR_opc_MUX_uxn_c_l56_c7_eaaf_iftrue;
     opc_MUX_uxn_c_l56_c7_eaaf_iffalse <= VAR_opc_MUX_uxn_c_l56_c7_eaaf_iffalse;
     -- Outputs
     VAR_opc_MUX_uxn_c_l56_c7_eaaf_return_output := opc_MUX_uxn_c_l56_c7_eaaf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l90_c7_dfb7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l90_c7_dfb7_return_output;
     VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l87_c1_8603_return_output;
     VAR_eval_result_MUX_uxn_c_l84_c7_4af9_iftrue := VAR_eval_opcode_phased_uxn_c_l85_c17_1333_return_output;
     VAR_opc_MUX_uxn_c_l48_c2_9c52_iffalse := VAR_opc_MUX_uxn_c_l56_c7_eaaf_return_output;
     VAR_sp_MUX_uxn_c_l48_c2_9c52_iffalse := VAR_sp_MUX_uxn_c_l56_c7_eaaf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l93_c7_1e01] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_return_output;

     -- sp_MUX[uxn_c_l48_c2_9c52] LATENCY=0
     -- Inputs
     sp_MUX_uxn_c_l48_c2_9c52_cond <= VAR_sp_MUX_uxn_c_l48_c2_9c52_cond;
     sp_MUX_uxn_c_l48_c2_9c52_iftrue <= VAR_sp_MUX_uxn_c_l48_c2_9c52_iftrue;
     sp_MUX_uxn_c_l48_c2_9c52_iffalse <= VAR_sp_MUX_uxn_c_l48_c2_9c52_iffalse;
     -- Outputs
     VAR_sp_MUX_uxn_c_l48_c2_9c52_return_output := sp_MUX_uxn_c_l48_c2_9c52_return_output;

     -- opc_MUX[uxn_c_l48_c2_9c52] LATENCY=0
     -- Inputs
     opc_MUX_uxn_c_l48_c2_9c52_cond <= VAR_opc_MUX_uxn_c_l48_c2_9c52_cond;
     opc_MUX_uxn_c_l48_c2_9c52_iftrue <= VAR_opc_MUX_uxn_c_l48_c2_9c52_iftrue;
     opc_MUX_uxn_c_l48_c2_9c52_iffalse <= VAR_opc_MUX_uxn_c_l48_c2_9c52_iffalse;
     -- Outputs
     VAR_opc_MUX_uxn_c_l48_c2_9c52_return_output := opc_MUX_uxn_c_l48_c2_9c52_return_output;

     -- eval_opcode_phased[uxn_c_l88_c17_d7c4] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l88_c17_d7c4_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l88_c17_d7c4_phase <= VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_phase;
     eval_opcode_phased_uxn_c_l88_c17_d7c4_pc <= VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_pc;
     eval_opcode_phased_uxn_c_l88_c17_d7c4_sp <= VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_sp;
     eval_opcode_phased_uxn_c_l88_c17_d7c4_stack_index <= VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_stack_index;
     eval_opcode_phased_uxn_c_l88_c17_d7c4_opcode <= VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_opcode;
     eval_opcode_phased_uxn_c_l88_c17_d7c4_ins <= VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_ins;
     eval_opcode_phased_uxn_c_l88_c17_d7c4_k <= VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_k;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_return_output := eval_opcode_phased_uxn_c_l88_c17_d7c4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l90_c1_fd86] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l93_c7_1e01_return_output;
     VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l90_c1_fd86_return_output;
     VAR_eval_result_MUX_uxn_c_l87_c7_414c_iftrue := VAR_eval_opcode_phased_uxn_c_l88_c17_d7c4_return_output;
     REG_VAR_opc := VAR_opc_MUX_uxn_c_l48_c2_9c52_return_output;
     REG_VAR_sp := VAR_sp_MUX_uxn_c_l48_c2_9c52_return_output;
     -- eval_opcode_phased[uxn_c_l91_c17_c6f8] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l91_c17_c6f8_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l91_c17_c6f8_phase <= VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_phase;
     eval_opcode_phased_uxn_c_l91_c17_c6f8_pc <= VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_pc;
     eval_opcode_phased_uxn_c_l91_c17_c6f8_sp <= VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_sp;
     eval_opcode_phased_uxn_c_l91_c17_c6f8_stack_index <= VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_stack_index;
     eval_opcode_phased_uxn_c_l91_c17_c6f8_opcode <= VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_opcode;
     eval_opcode_phased_uxn_c_l91_c17_c6f8_ins <= VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_ins;
     eval_opcode_phased_uxn_c_l91_c17_c6f8_k <= VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_k;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_return_output := eval_opcode_phased_uxn_c_l91_c17_c6f8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l93_c1_97f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l96_c7_b854] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l96_c7_b854_return_output;
     VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l93_c1_97f1_return_output;
     VAR_eval_result_MUX_uxn_c_l90_c7_dfb7_iftrue := VAR_eval_opcode_phased_uxn_c_l91_c17_c6f8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l99_c7_6c18] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l96_c1_2124] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_return_output;

     -- eval_opcode_phased[uxn_c_l94_c17_5ac9] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l94_c17_5ac9_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l94_c17_5ac9_phase <= VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_phase;
     eval_opcode_phased_uxn_c_l94_c17_5ac9_pc <= VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_pc;
     eval_opcode_phased_uxn_c_l94_c17_5ac9_sp <= VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_sp;
     eval_opcode_phased_uxn_c_l94_c17_5ac9_stack_index <= VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_stack_index;
     eval_opcode_phased_uxn_c_l94_c17_5ac9_opcode <= VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_opcode;
     eval_opcode_phased_uxn_c_l94_c17_5ac9_ins <= VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_ins;
     eval_opcode_phased_uxn_c_l94_c17_5ac9_k <= VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_k;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_return_output := eval_opcode_phased_uxn_c_l94_c17_5ac9_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l99_c7_6c18_return_output;
     VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l96_c1_2124_return_output;
     VAR_eval_result_MUX_uxn_c_l93_c7_1e01_iftrue := VAR_eval_opcode_phased_uxn_c_l94_c17_5ac9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l102_c7_4d8d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_return_output;

     -- eval_opcode_phased[uxn_c_l97_c17_6d57] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l97_c17_6d57_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l97_c17_6d57_phase <= VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_phase;
     eval_opcode_phased_uxn_c_l97_c17_6d57_pc <= VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_pc;
     eval_opcode_phased_uxn_c_l97_c17_6d57_sp <= VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_sp;
     eval_opcode_phased_uxn_c_l97_c17_6d57_stack_index <= VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_stack_index;
     eval_opcode_phased_uxn_c_l97_c17_6d57_opcode <= VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_opcode;
     eval_opcode_phased_uxn_c_l97_c17_6d57_ins <= VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_ins;
     eval_opcode_phased_uxn_c_l97_c17_6d57_k <= VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_k;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_return_output := eval_opcode_phased_uxn_c_l97_c17_6d57_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l99_c1_193d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l102_c7_4d8d_return_output;
     VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l99_c1_193d_return_output;
     VAR_eval_result_MUX_uxn_c_l96_c7_b854_iftrue := VAR_eval_opcode_phased_uxn_c_l97_c17_6d57_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l105_c7_5f8a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l102_c1_e436] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_return_output;

     -- eval_opcode_phased[uxn_c_l100_c17_e45a] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l100_c17_e45a_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l100_c17_e45a_phase <= VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_phase;
     eval_opcode_phased_uxn_c_l100_c17_e45a_pc <= VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_pc;
     eval_opcode_phased_uxn_c_l100_c17_e45a_sp <= VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_sp;
     eval_opcode_phased_uxn_c_l100_c17_e45a_stack_index <= VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_stack_index;
     eval_opcode_phased_uxn_c_l100_c17_e45a_opcode <= VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_opcode;
     eval_opcode_phased_uxn_c_l100_c17_e45a_ins <= VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_ins;
     eval_opcode_phased_uxn_c_l100_c17_e45a_k <= VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_k;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_return_output := eval_opcode_phased_uxn_c_l100_c17_e45a_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l105_c7_5f8a_return_output;
     VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l102_c1_e436_return_output;
     VAR_eval_result_MUX_uxn_c_l99_c7_6c18_iftrue := VAR_eval_opcode_phased_uxn_c_l100_c17_e45a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l108_c7_5763] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_return_output;

     -- eval_opcode_phased[uxn_c_l103_c17_ed67] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l103_c17_ed67_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l103_c17_ed67_phase <= VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_phase;
     eval_opcode_phased_uxn_c_l103_c17_ed67_pc <= VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_pc;
     eval_opcode_phased_uxn_c_l103_c17_ed67_sp <= VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_sp;
     eval_opcode_phased_uxn_c_l103_c17_ed67_stack_index <= VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_stack_index;
     eval_opcode_phased_uxn_c_l103_c17_ed67_opcode <= VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_opcode;
     eval_opcode_phased_uxn_c_l103_c17_ed67_ins <= VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_ins;
     eval_opcode_phased_uxn_c_l103_c17_ed67_k <= VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_k;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_return_output := eval_opcode_phased_uxn_c_l103_c17_ed67_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l105_c1_48f5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l108_c7_5763_return_output;
     VAR_eval_opcode_phased_uxn_c_l106_c17_367f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l105_c1_48f5_return_output;
     VAR_eval_result_MUX_uxn_c_l102_c7_4d8d_iftrue := VAR_eval_opcode_phased_uxn_c_l103_c17_ed67_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l108_c1_f240] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_return_output;

     -- eval_opcode_phased[uxn_c_l106_c17_367f] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l106_c17_367f_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l106_c17_367f_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l106_c17_367f_phase <= VAR_eval_opcode_phased_uxn_c_l106_c17_367f_phase;
     eval_opcode_phased_uxn_c_l106_c17_367f_pc <= VAR_eval_opcode_phased_uxn_c_l106_c17_367f_pc;
     eval_opcode_phased_uxn_c_l106_c17_367f_sp <= VAR_eval_opcode_phased_uxn_c_l106_c17_367f_sp;
     eval_opcode_phased_uxn_c_l106_c17_367f_stack_index <= VAR_eval_opcode_phased_uxn_c_l106_c17_367f_stack_index;
     eval_opcode_phased_uxn_c_l106_c17_367f_opcode <= VAR_eval_opcode_phased_uxn_c_l106_c17_367f_opcode;
     eval_opcode_phased_uxn_c_l106_c17_367f_ins <= VAR_eval_opcode_phased_uxn_c_l106_c17_367f_ins;
     eval_opcode_phased_uxn_c_l106_c17_367f_k <= VAR_eval_opcode_phased_uxn_c_l106_c17_367f_k;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l106_c17_367f_return_output := eval_opcode_phased_uxn_c_l106_c17_367f_return_output;

     -- Submodule level 17
     VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l108_c1_f240_return_output;
     VAR_eval_result_MUX_uxn_c_l105_c7_5f8a_iftrue := VAR_eval_opcode_phased_uxn_c_l106_c17_367f_return_output;
     -- eval_opcode_phased[uxn_c_l109_c17_7a04] LATENCY=0
     -- Clock enable
     eval_opcode_phased_uxn_c_l109_c17_7a04_CLOCK_ENABLE <= VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_phased_uxn_c_l109_c17_7a04_phase <= VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_phase;
     eval_opcode_phased_uxn_c_l109_c17_7a04_pc <= VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_pc;
     eval_opcode_phased_uxn_c_l109_c17_7a04_sp <= VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_sp;
     eval_opcode_phased_uxn_c_l109_c17_7a04_stack_index <= VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_stack_index;
     eval_opcode_phased_uxn_c_l109_c17_7a04_opcode <= VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_opcode;
     eval_opcode_phased_uxn_c_l109_c17_7a04_ins <= VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_ins;
     eval_opcode_phased_uxn_c_l109_c17_7a04_k <= VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_k;
     -- Outputs
     VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_return_output := eval_opcode_phased_uxn_c_l109_c17_7a04_return_output;

     -- Submodule level 18
     VAR_eval_result_MUX_uxn_c_l108_c7_5763_iftrue := VAR_eval_opcode_phased_uxn_c_l109_c17_7a04_return_output;
     -- eval_result_MUX[uxn_c_l108_c7_5763] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l108_c7_5763_cond <= VAR_eval_result_MUX_uxn_c_l108_c7_5763_cond;
     eval_result_MUX_uxn_c_l108_c7_5763_iftrue <= VAR_eval_result_MUX_uxn_c_l108_c7_5763_iftrue;
     eval_result_MUX_uxn_c_l108_c7_5763_iffalse <= VAR_eval_result_MUX_uxn_c_l108_c7_5763_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l108_c7_5763_return_output := eval_result_MUX_uxn_c_l108_c7_5763_return_output;

     -- Submodule level 19
     VAR_eval_result_MUX_uxn_c_l105_c7_5f8a_iffalse := VAR_eval_result_MUX_uxn_c_l108_c7_5763_return_output;
     -- eval_result_MUX[uxn_c_l105_c7_5f8a] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l105_c7_5f8a_cond <= VAR_eval_result_MUX_uxn_c_l105_c7_5f8a_cond;
     eval_result_MUX_uxn_c_l105_c7_5f8a_iftrue <= VAR_eval_result_MUX_uxn_c_l105_c7_5f8a_iftrue;
     eval_result_MUX_uxn_c_l105_c7_5f8a_iffalse <= VAR_eval_result_MUX_uxn_c_l105_c7_5f8a_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l105_c7_5f8a_return_output := eval_result_MUX_uxn_c_l105_c7_5f8a_return_output;

     -- Submodule level 20
     VAR_eval_result_MUX_uxn_c_l102_c7_4d8d_iffalse := VAR_eval_result_MUX_uxn_c_l105_c7_5f8a_return_output;
     -- eval_result_MUX[uxn_c_l102_c7_4d8d] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l102_c7_4d8d_cond <= VAR_eval_result_MUX_uxn_c_l102_c7_4d8d_cond;
     eval_result_MUX_uxn_c_l102_c7_4d8d_iftrue <= VAR_eval_result_MUX_uxn_c_l102_c7_4d8d_iftrue;
     eval_result_MUX_uxn_c_l102_c7_4d8d_iffalse <= VAR_eval_result_MUX_uxn_c_l102_c7_4d8d_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l102_c7_4d8d_return_output := eval_result_MUX_uxn_c_l102_c7_4d8d_return_output;

     -- Submodule level 21
     VAR_eval_result_MUX_uxn_c_l99_c7_6c18_iffalse := VAR_eval_result_MUX_uxn_c_l102_c7_4d8d_return_output;
     -- eval_result_MUX[uxn_c_l99_c7_6c18] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l99_c7_6c18_cond <= VAR_eval_result_MUX_uxn_c_l99_c7_6c18_cond;
     eval_result_MUX_uxn_c_l99_c7_6c18_iftrue <= VAR_eval_result_MUX_uxn_c_l99_c7_6c18_iftrue;
     eval_result_MUX_uxn_c_l99_c7_6c18_iffalse <= VAR_eval_result_MUX_uxn_c_l99_c7_6c18_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l99_c7_6c18_return_output := eval_result_MUX_uxn_c_l99_c7_6c18_return_output;

     -- Submodule level 22
     VAR_eval_result_MUX_uxn_c_l96_c7_b854_iffalse := VAR_eval_result_MUX_uxn_c_l99_c7_6c18_return_output;
     -- eval_result_MUX[uxn_c_l96_c7_b854] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l96_c7_b854_cond <= VAR_eval_result_MUX_uxn_c_l96_c7_b854_cond;
     eval_result_MUX_uxn_c_l96_c7_b854_iftrue <= VAR_eval_result_MUX_uxn_c_l96_c7_b854_iftrue;
     eval_result_MUX_uxn_c_l96_c7_b854_iffalse <= VAR_eval_result_MUX_uxn_c_l96_c7_b854_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l96_c7_b854_return_output := eval_result_MUX_uxn_c_l96_c7_b854_return_output;

     -- Submodule level 23
     VAR_eval_result_MUX_uxn_c_l93_c7_1e01_iffalse := VAR_eval_result_MUX_uxn_c_l96_c7_b854_return_output;
     -- eval_result_MUX[uxn_c_l93_c7_1e01] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l93_c7_1e01_cond <= VAR_eval_result_MUX_uxn_c_l93_c7_1e01_cond;
     eval_result_MUX_uxn_c_l93_c7_1e01_iftrue <= VAR_eval_result_MUX_uxn_c_l93_c7_1e01_iftrue;
     eval_result_MUX_uxn_c_l93_c7_1e01_iffalse <= VAR_eval_result_MUX_uxn_c_l93_c7_1e01_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l93_c7_1e01_return_output := eval_result_MUX_uxn_c_l93_c7_1e01_return_output;

     -- Submodule level 24
     VAR_eval_result_MUX_uxn_c_l90_c7_dfb7_iffalse := VAR_eval_result_MUX_uxn_c_l93_c7_1e01_return_output;
     -- eval_result_MUX[uxn_c_l90_c7_dfb7] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l90_c7_dfb7_cond <= VAR_eval_result_MUX_uxn_c_l90_c7_dfb7_cond;
     eval_result_MUX_uxn_c_l90_c7_dfb7_iftrue <= VAR_eval_result_MUX_uxn_c_l90_c7_dfb7_iftrue;
     eval_result_MUX_uxn_c_l90_c7_dfb7_iffalse <= VAR_eval_result_MUX_uxn_c_l90_c7_dfb7_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l90_c7_dfb7_return_output := eval_result_MUX_uxn_c_l90_c7_dfb7_return_output;

     -- Submodule level 25
     VAR_eval_result_MUX_uxn_c_l87_c7_414c_iffalse := VAR_eval_result_MUX_uxn_c_l90_c7_dfb7_return_output;
     -- eval_result_MUX[uxn_c_l87_c7_414c] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l87_c7_414c_cond <= VAR_eval_result_MUX_uxn_c_l87_c7_414c_cond;
     eval_result_MUX_uxn_c_l87_c7_414c_iftrue <= VAR_eval_result_MUX_uxn_c_l87_c7_414c_iftrue;
     eval_result_MUX_uxn_c_l87_c7_414c_iffalse <= VAR_eval_result_MUX_uxn_c_l87_c7_414c_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l87_c7_414c_return_output := eval_result_MUX_uxn_c_l87_c7_414c_return_output;

     -- Submodule level 26
     VAR_eval_result_MUX_uxn_c_l84_c7_4af9_iffalse := VAR_eval_result_MUX_uxn_c_l87_c7_414c_return_output;
     -- eval_result_MUX[uxn_c_l84_c7_4af9] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l84_c7_4af9_cond <= VAR_eval_result_MUX_uxn_c_l84_c7_4af9_cond;
     eval_result_MUX_uxn_c_l84_c7_4af9_iftrue <= VAR_eval_result_MUX_uxn_c_l84_c7_4af9_iftrue;
     eval_result_MUX_uxn_c_l84_c7_4af9_iffalse <= VAR_eval_result_MUX_uxn_c_l84_c7_4af9_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l84_c7_4af9_return_output := eval_result_MUX_uxn_c_l84_c7_4af9_return_output;

     -- Submodule level 27
     VAR_eval_result_MUX_uxn_c_l81_c7_1569_iffalse := VAR_eval_result_MUX_uxn_c_l84_c7_4af9_return_output;
     -- eval_result_MUX[uxn_c_l81_c7_1569] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l81_c7_1569_cond <= VAR_eval_result_MUX_uxn_c_l81_c7_1569_cond;
     eval_result_MUX_uxn_c_l81_c7_1569_iftrue <= VAR_eval_result_MUX_uxn_c_l81_c7_1569_iftrue;
     eval_result_MUX_uxn_c_l81_c7_1569_iffalse <= VAR_eval_result_MUX_uxn_c_l81_c7_1569_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l81_c7_1569_return_output := eval_result_MUX_uxn_c_l81_c7_1569_return_output;

     -- Submodule level 28
     VAR_eval_result_MUX_uxn_c_l78_c7_7b39_iffalse := VAR_eval_result_MUX_uxn_c_l81_c7_1569_return_output;
     -- eval_result_MUX[uxn_c_l78_c7_7b39] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l78_c7_7b39_cond <= VAR_eval_result_MUX_uxn_c_l78_c7_7b39_cond;
     eval_result_MUX_uxn_c_l78_c7_7b39_iftrue <= VAR_eval_result_MUX_uxn_c_l78_c7_7b39_iftrue;
     eval_result_MUX_uxn_c_l78_c7_7b39_iffalse <= VAR_eval_result_MUX_uxn_c_l78_c7_7b39_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l78_c7_7b39_return_output := eval_result_MUX_uxn_c_l78_c7_7b39_return_output;

     -- Submodule level 29
     VAR_eval_result_MUX_uxn_c_l75_c7_8510_iffalse := VAR_eval_result_MUX_uxn_c_l78_c7_7b39_return_output;
     -- eval_result_MUX[uxn_c_l75_c7_8510] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l75_c7_8510_cond <= VAR_eval_result_MUX_uxn_c_l75_c7_8510_cond;
     eval_result_MUX_uxn_c_l75_c7_8510_iftrue <= VAR_eval_result_MUX_uxn_c_l75_c7_8510_iftrue;
     eval_result_MUX_uxn_c_l75_c7_8510_iffalse <= VAR_eval_result_MUX_uxn_c_l75_c7_8510_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l75_c7_8510_return_output := eval_result_MUX_uxn_c_l75_c7_8510_return_output;

     -- Submodule level 30
     VAR_eval_result_MUX_uxn_c_l72_c7_95d3_iffalse := VAR_eval_result_MUX_uxn_c_l75_c7_8510_return_output;
     -- eval_result_MUX[uxn_c_l72_c7_95d3] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l72_c7_95d3_cond <= VAR_eval_result_MUX_uxn_c_l72_c7_95d3_cond;
     eval_result_MUX_uxn_c_l72_c7_95d3_iftrue <= VAR_eval_result_MUX_uxn_c_l72_c7_95d3_iftrue;
     eval_result_MUX_uxn_c_l72_c7_95d3_iffalse <= VAR_eval_result_MUX_uxn_c_l72_c7_95d3_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l72_c7_95d3_return_output := eval_result_MUX_uxn_c_l72_c7_95d3_return_output;

     -- Submodule level 31
     VAR_eval_result_MUX_uxn_c_l69_c7_1d06_iffalse := VAR_eval_result_MUX_uxn_c_l72_c7_95d3_return_output;
     -- eval_result_MUX[uxn_c_l69_c7_1d06] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l69_c7_1d06_cond <= VAR_eval_result_MUX_uxn_c_l69_c7_1d06_cond;
     eval_result_MUX_uxn_c_l69_c7_1d06_iftrue <= VAR_eval_result_MUX_uxn_c_l69_c7_1d06_iftrue;
     eval_result_MUX_uxn_c_l69_c7_1d06_iffalse <= VAR_eval_result_MUX_uxn_c_l69_c7_1d06_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l69_c7_1d06_return_output := eval_result_MUX_uxn_c_l69_c7_1d06_return_output;

     -- Submodule level 32
     VAR_eval_result_MUX_uxn_c_l56_c7_eaaf_iffalse := VAR_eval_result_MUX_uxn_c_l69_c7_1d06_return_output;
     -- eval_result_MUX[uxn_c_l56_c7_eaaf] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l56_c7_eaaf_cond <= VAR_eval_result_MUX_uxn_c_l56_c7_eaaf_cond;
     eval_result_MUX_uxn_c_l56_c7_eaaf_iftrue <= VAR_eval_result_MUX_uxn_c_l56_c7_eaaf_iftrue;
     eval_result_MUX_uxn_c_l56_c7_eaaf_iffalse <= VAR_eval_result_MUX_uxn_c_l56_c7_eaaf_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l56_c7_eaaf_return_output := eval_result_MUX_uxn_c_l56_c7_eaaf_return_output;

     -- Submodule level 33
     VAR_eval_result_MUX_uxn_c_l48_c2_9c52_iffalse := VAR_eval_result_MUX_uxn_c_l56_c7_eaaf_return_output;
     -- eval_result_MUX[uxn_c_l48_c2_9c52] LATENCY=0
     -- Inputs
     eval_result_MUX_uxn_c_l48_c2_9c52_cond <= VAR_eval_result_MUX_uxn_c_l48_c2_9c52_cond;
     eval_result_MUX_uxn_c_l48_c2_9c52_iftrue <= VAR_eval_result_MUX_uxn_c_l48_c2_9c52_iftrue;
     eval_result_MUX_uxn_c_l48_c2_9c52_iffalse <= VAR_eval_result_MUX_uxn_c_l48_c2_9c52_iffalse;
     -- Outputs
     VAR_eval_result_MUX_uxn_c_l48_c2_9c52_return_output := eval_result_MUX_uxn_c_l48_c2_9c52_return_output;

     -- Submodule level 34
     VAR_BIN_OP_EQ_uxn_c_l112_c6_02eb_left := VAR_eval_result_MUX_uxn_c_l48_c2_9c52_return_output;
     REG_VAR_eval_result := VAR_eval_result_MUX_uxn_c_l48_c2_9c52_return_output;
     -- BIN_OP_EQ[uxn_c_l112_c6_02eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l112_c6_02eb_left <= VAR_BIN_OP_EQ_uxn_c_l112_c6_02eb_left;
     BIN_OP_EQ_uxn_c_l112_c6_02eb_right <= VAR_BIN_OP_EQ_uxn_c_l112_c6_02eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l112_c6_02eb_return_output := BIN_OP_EQ_uxn_c_l112_c6_02eb_return_output;

     -- Submodule level 35
     VAR_cpu_phase_MUX_uxn_c_l112_c2_0a10_cond := VAR_BIN_OP_EQ_uxn_c_l112_c6_02eb_return_output;
     -- cpu_phase_MUX[uxn_c_l112_c2_0a10] LATENCY=0
     -- Inputs
     cpu_phase_MUX_uxn_c_l112_c2_0a10_cond <= VAR_cpu_phase_MUX_uxn_c_l112_c2_0a10_cond;
     cpu_phase_MUX_uxn_c_l112_c2_0a10_iftrue <= VAR_cpu_phase_MUX_uxn_c_l112_c2_0a10_iftrue;
     cpu_phase_MUX_uxn_c_l112_c2_0a10_iffalse <= VAR_cpu_phase_MUX_uxn_c_l112_c2_0a10_iffalse;
     -- Outputs
     VAR_cpu_phase_MUX_uxn_c_l112_c2_0a10_return_output := cpu_phase_MUX_uxn_c_l112_c2_0a10_return_output;

     -- Submodule level 36
     REG_VAR_cpu_phase := VAR_cpu_phase_MUX_uxn_c_l112_c2_0a10_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_pc <= REG_VAR_pc;
REG_COMB_sp <= REG_VAR_sp;
REG_COMB_sp0 <= REG_VAR_sp0;
REG_COMB_sp1 <= REG_VAR_sp1;
REG_COMB_k <= REG_VAR_k;
REG_COMB_opc <= REG_VAR_opc;
REG_COMB_ins <= REG_VAR_ins;
REG_COMB_system_state <= REG_VAR_system_state;
REG_COMB_cpu_phase <= REG_VAR_cpu_phase;
REG_COMB_stack_index <= REG_VAR_stack_index;
REG_COMB_pc_nonzero <= REG_VAR_pc_nonzero;
REG_COMB_system_state_zero <= REG_VAR_system_state_zero;
REG_COMB_should_cpu_eval <= REG_VAR_should_cpu_eval;
REG_COMB_eval_result <= REG_VAR_eval_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     pc <= REG_COMB_pc;
     sp <= REG_COMB_sp;
     sp0 <= REG_COMB_sp0;
     sp1 <= REG_COMB_sp1;
     k <= REG_COMB_k;
     opc <= REG_COMB_opc;
     ins <= REG_COMB_ins;
     system_state <= REG_COMB_system_state;
     cpu_phase <= REG_COMB_cpu_phase;
     stack_index <= REG_COMB_stack_index;
     pc_nonzero <= REG_COMB_pc_nonzero;
     system_state_zero <= REG_COMB_system_state_zero;
     should_cpu_eval <= REG_COMB_should_cpu_eval;
     eval_result <= REG_COMB_eval_result;
 end if;
 end if;
end process;

end arch;
