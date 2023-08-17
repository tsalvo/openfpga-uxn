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
-- Submodules: 40
entity uxn_eval_0CLK_5ae75222 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_5ae75222;
architecture arch of uxn_eval_0CLK_5ae75222 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal palette_color_values : uint12_t_4 := (
0 => to_unsigned(4095, 12),
1 => to_unsigned(0, 12),
2 => to_unsigned(2011, 12),
3 => to_unsigned(3938, 12),
others => to_unsigned(0, 12))
;
signal pixel_counter : unsigned(31 downto 0) := to_unsigned(0, 32);
signal clock_cycle_counter : unsigned(31 downto 0) := to_unsigned(0, 32);
signal seconds_counter : unsigned(31 downto 0) := to_unsigned(0, 32);
signal result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal current_pixel_palette_color : unsigned(1 downto 0) := to_unsigned(0, 2);
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
signal REG_COMB_palette_color_values : uint12_t_4;
signal REG_COMB_pixel_counter : unsigned(31 downto 0);
signal REG_COMB_clock_cycle_counter : unsigned(31 downto 0);
signal REG_COMB_seconds_counter : unsigned(31 downto 0);
signal REG_COMB_result : unsigned(15 downto 0);
signal REG_COMB_current_pixel_palette_color : unsigned(1 downto 0);
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
-- pc_get[uxn_c_l29_c7_f10b]
signal pc_get_uxn_c_l29_c7_f10b_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_c_l29_c7_f10b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l30_c15_2e88]
signal BIN_OP_EQ_uxn_c_l30_c15_2e88_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l30_c15_2e88_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l30_c15_2e88_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l30_c15_a021]
signal MUX_uxn_c_l30_c15_a021_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_a021_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_a021_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_a021_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_c_l31_c17_dbbf]
signal peek_dev_uxn_c_l31_c17_dbbf_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_c_l31_c17_dbbf_address : unsigned(7 downto 0);
signal peek_dev_uxn_c_l31_c17_dbbf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l32_c22_7931]
signal BIN_OP_EQ_uxn_c_l32_c22_7931_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c22_7931_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c22_7931_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l32_c22_b0c1]
signal MUX_uxn_c_l32_c22_b0c1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_b0c1_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_b0c1_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_b0c1_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l33_c16_f2d3]
signal BIN_OP_AND_uxn_c_l33_c16_f2d3_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l33_c16_f2d3_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l33_c16_f2d3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_edba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_return_output : unsigned(0 downto 0);

-- k_MUX[uxn_c_l35_c2_5350]
signal k_MUX_uxn_c_l35_c2_5350_cond : unsigned(0 downto 0);
signal k_MUX_uxn_c_l35_c2_5350_iftrue : unsigned(7 downto 0);
signal k_MUX_uxn_c_l35_c2_5350_iffalse : unsigned(7 downto 0);
signal k_MUX_uxn_c_l35_c2_5350_return_output : unsigned(7 downto 0);

-- error_MUX[uxn_c_l35_c2_5350]
signal error_MUX_uxn_c_l35_c2_5350_cond : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_5350_iftrue : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_5350_iffalse : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_5350_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l35_c2_5350]
signal ins_MUX_uxn_c_l35_c2_5350_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l35_c2_5350_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l35_c2_5350_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l35_c2_5350_return_output : unsigned(7 downto 0);

-- opc_MUX[uxn_c_l35_c2_5350]
signal opc_MUX_uxn_c_l35_c2_5350_cond : unsigned(0 downto 0);
signal opc_MUX_uxn_c_l35_c2_5350_iftrue : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l35_c2_5350_iffalse : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l35_c2_5350_return_output : unsigned(7 downto 0);

-- s_MUX[uxn_c_l35_c2_5350]
signal s_MUX_uxn_c_l35_c2_5350_cond : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_5350_iftrue : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_5350_iffalse : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_5350_return_output : unsigned(0 downto 0);

-- peek_ram[uxn_c_l36_c9_fe67]
signal peek_ram_uxn_c_l36_c9_fe67_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_c_l36_c9_fe67_address : unsigned(15 downto 0);
signal peek_ram_uxn_c_l36_c9_fe67_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l36_c9_6cfb]
signal BIN_OP_AND_uxn_c_l36_c9_6cfb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l36_c9_6cfb_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l36_c9_6cfb_return_output : unsigned(7 downto 0);

-- pc_add[uxn_c_l37_c3_9936]
signal pc_add_uxn_c_l37_c3_9936_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_c_l37_c3_9936_adjustment : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l38_c7_1fa9]
signal BIN_OP_AND_uxn_c_l38_c7_1fa9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l38_c7_1fa9_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l38_c7_1fa9_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l38_c7_04d3]
signal MUX_uxn_c_l38_c7_04d3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l38_c7_04d3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l38_c7_04d3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l38_c7_04d3_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l39_c7_7836]
signal BIN_OP_AND_uxn_c_l39_c7_7836_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_7836_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_7836_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l39_c7_4bd1]
signal MUX_uxn_c_l39_c7_4bd1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_4bd1_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_4bd1_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_4bd1_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l40_c11_71b7]
signal BIN_OP_AND_uxn_c_l40_c11_71b7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c11_71b7_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_c_l40_c11_71b7_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l40_c11_e414]
signal UNARY_OP_NOT_uxn_c_l40_c11_e414_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_c_l40_c11_e414_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_c_l40_c31_b60b]
signal CONST_SR_5_uxn_c_l40_c31_b60b_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_c_l40_c31_b60b_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l40_c26_124b]
signal BIN_OP_MINUS_uxn_c_l40_c26_124b_left : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l40_c26_124b_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l40_c26_124b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l40_c26_3c66]
signal BIN_OP_AND_uxn_c_l40_c26_3c66_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l40_c26_3c66_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c26_3c66_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l40_c51_f0cc]
signal BIN_OP_AND_uxn_c_l40_c51_f0cc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c51_f0cc_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_c_l40_c51_f0cc_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l40_c11_5407]
signal MUX_uxn_c_l40_c11_5407_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l40_c11_5407_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l40_c11_5407_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l40_c11_5407_return_output : unsigned(7 downto 0);

-- eval_opcode[uxn_c_l41_c11_d9e4]
signal eval_opcode_uxn_c_l41_c11_d9e4_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l41_c11_d9e4_stack_index : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l41_c11_d9e4_opcode : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_d9e4_ins : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_d9e4_k : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_d9e4_return_output : unsigned(0 downto 0);

-- screen_ram_update[uxn_c_l44_c32_11b4]
signal screen_ram_update_uxn_c_l44_c32_11b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_ram_update_uxn_c_l44_c32_11b4_write_address : unsigned(31 downto 0);
signal screen_ram_update_uxn_c_l44_c32_11b4_write_value : unsigned(1 downto 0);
signal screen_ram_update_uxn_c_l44_c32_11b4_read_address : unsigned(31 downto 0);
signal screen_ram_update_uxn_c_l44_c32_11b4_return_output : unsigned(1 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l50_c22_118b]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l53_c6_5bfb]
signal BIN_OP_EQ_uxn_c_l53_c6_5bfb_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l53_c6_5bfb_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l53_c6_5bfb_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l53_c2_bf28]
signal pixel_counter_MUX_uxn_c_l53_c2_bf28_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_bf28_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_bf28_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_bf28_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l56_c3_8f75]
signal BIN_OP_PLUS_uxn_c_l56_c3_8f75_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l56_c3_8f75_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l56_c3_8f75_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l60_c6_7fac]
signal BIN_OP_EQ_uxn_c_l60_c6_7fac_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l60_c6_7fac_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l60_c6_7fac_return_output : unsigned(0 downto 0);

-- seconds_counter_MUX[uxn_c_l60_c2_63db]
signal seconds_counter_MUX_uxn_c_l60_c2_63db_cond : unsigned(0 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_63db_iftrue : unsigned(31 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_63db_iffalse : unsigned(31 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_63db_return_output : unsigned(31 downto 0);

-- clock_cycle_counter_MUX[uxn_c_l60_c2_63db]
signal clock_cycle_counter_MUX_uxn_c_l60_c2_63db_cond : unsigned(0 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_63db_iftrue : unsigned(31 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_63db_iffalse : unsigned(31 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_63db_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l61_c3_d5ca]
signal BIN_OP_PLUS_uxn_c_l61_c3_d5ca_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l61_c3_d5ca_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l61_c3_d5ca_return_output : unsigned(32 downto 0);

-- BIN_OP_PLUS[uxn_c_l64_c3_9bb0]
signal BIN_OP_PLUS_uxn_c_l64_c3_9bb0_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l64_c3_9bb0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l64_c3_9bb0_return_output : unsigned(32 downto 0);

function CAST_TO_uint2_t_uint32_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(31 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint12_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(11 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_c_l29_c7_f10b
pc_get_uxn_c_l29_c7_f10b : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_c_l29_c7_f10b_CLOCK_ENABLE,
pc_get_uxn_c_l29_c7_f10b_return_output);

-- BIN_OP_EQ_uxn_c_l30_c15_2e88
BIN_OP_EQ_uxn_c_l30_c15_2e88 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l30_c15_2e88_left,
BIN_OP_EQ_uxn_c_l30_c15_2e88_right,
BIN_OP_EQ_uxn_c_l30_c15_2e88_return_output);

-- MUX_uxn_c_l30_c15_a021
MUX_uxn_c_l30_c15_a021 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l30_c15_a021_cond,
MUX_uxn_c_l30_c15_a021_iftrue,
MUX_uxn_c_l30_c15_a021_iffalse,
MUX_uxn_c_l30_c15_a021_return_output);

-- peek_dev_uxn_c_l31_c17_dbbf
peek_dev_uxn_c_l31_c17_dbbf : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_c_l31_c17_dbbf_CLOCK_ENABLE,
peek_dev_uxn_c_l31_c17_dbbf_address,
peek_dev_uxn_c_l31_c17_dbbf_return_output);

-- BIN_OP_EQ_uxn_c_l32_c22_7931
BIN_OP_EQ_uxn_c_l32_c22_7931 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l32_c22_7931_left,
BIN_OP_EQ_uxn_c_l32_c22_7931_right,
BIN_OP_EQ_uxn_c_l32_c22_7931_return_output);

-- MUX_uxn_c_l32_c22_b0c1
MUX_uxn_c_l32_c22_b0c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l32_c22_b0c1_cond,
MUX_uxn_c_l32_c22_b0c1_iftrue,
MUX_uxn_c_l32_c22_b0c1_iffalse,
MUX_uxn_c_l32_c22_b0c1_return_output);

-- BIN_OP_AND_uxn_c_l33_c16_f2d3
BIN_OP_AND_uxn_c_l33_c16_f2d3 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l33_c16_f2d3_left,
BIN_OP_AND_uxn_c_l33_c16_f2d3_right,
BIN_OP_AND_uxn_c_l33_c16_f2d3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_return_output);

-- k_MUX_uxn_c_l35_c2_5350
k_MUX_uxn_c_l35_c2_5350 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
k_MUX_uxn_c_l35_c2_5350_cond,
k_MUX_uxn_c_l35_c2_5350_iftrue,
k_MUX_uxn_c_l35_c2_5350_iffalse,
k_MUX_uxn_c_l35_c2_5350_return_output);

-- error_MUX_uxn_c_l35_c2_5350
error_MUX_uxn_c_l35_c2_5350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
error_MUX_uxn_c_l35_c2_5350_cond,
error_MUX_uxn_c_l35_c2_5350_iftrue,
error_MUX_uxn_c_l35_c2_5350_iffalse,
error_MUX_uxn_c_l35_c2_5350_return_output);

-- ins_MUX_uxn_c_l35_c2_5350
ins_MUX_uxn_c_l35_c2_5350 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l35_c2_5350_cond,
ins_MUX_uxn_c_l35_c2_5350_iftrue,
ins_MUX_uxn_c_l35_c2_5350_iffalse,
ins_MUX_uxn_c_l35_c2_5350_return_output);

-- opc_MUX_uxn_c_l35_c2_5350
opc_MUX_uxn_c_l35_c2_5350 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
opc_MUX_uxn_c_l35_c2_5350_cond,
opc_MUX_uxn_c_l35_c2_5350_iftrue,
opc_MUX_uxn_c_l35_c2_5350_iffalse,
opc_MUX_uxn_c_l35_c2_5350_return_output);

-- s_MUX_uxn_c_l35_c2_5350
s_MUX_uxn_c_l35_c2_5350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
s_MUX_uxn_c_l35_c2_5350_cond,
s_MUX_uxn_c_l35_c2_5350_iftrue,
s_MUX_uxn_c_l35_c2_5350_iffalse,
s_MUX_uxn_c_l35_c2_5350_return_output);

-- peek_ram_uxn_c_l36_c9_fe67
peek_ram_uxn_c_l36_c9_fe67 : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_c_l36_c9_fe67_CLOCK_ENABLE,
peek_ram_uxn_c_l36_c9_fe67_address,
peek_ram_uxn_c_l36_c9_fe67_return_output);

-- BIN_OP_AND_uxn_c_l36_c9_6cfb
BIN_OP_AND_uxn_c_l36_c9_6cfb : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l36_c9_6cfb_left,
BIN_OP_AND_uxn_c_l36_c9_6cfb_right,
BIN_OP_AND_uxn_c_l36_c9_6cfb_return_output);

-- pc_add_uxn_c_l37_c3_9936
pc_add_uxn_c_l37_c3_9936 : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_c_l37_c3_9936_CLOCK_ENABLE,
pc_add_uxn_c_l37_c3_9936_adjustment);

-- BIN_OP_AND_uxn_c_l38_c7_1fa9
BIN_OP_AND_uxn_c_l38_c7_1fa9 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l38_c7_1fa9_left,
BIN_OP_AND_uxn_c_l38_c7_1fa9_right,
BIN_OP_AND_uxn_c_l38_c7_1fa9_return_output);

-- MUX_uxn_c_l38_c7_04d3
MUX_uxn_c_l38_c7_04d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l38_c7_04d3_cond,
MUX_uxn_c_l38_c7_04d3_iftrue,
MUX_uxn_c_l38_c7_04d3_iffalse,
MUX_uxn_c_l38_c7_04d3_return_output);

-- BIN_OP_AND_uxn_c_l39_c7_7836
BIN_OP_AND_uxn_c_l39_c7_7836 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l39_c7_7836_left,
BIN_OP_AND_uxn_c_l39_c7_7836_right,
BIN_OP_AND_uxn_c_l39_c7_7836_return_output);

-- MUX_uxn_c_l39_c7_4bd1
MUX_uxn_c_l39_c7_4bd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l39_c7_4bd1_cond,
MUX_uxn_c_l39_c7_4bd1_iftrue,
MUX_uxn_c_l39_c7_4bd1_iffalse,
MUX_uxn_c_l39_c7_4bd1_return_output);

-- BIN_OP_AND_uxn_c_l40_c11_71b7
BIN_OP_AND_uxn_c_l40_c11_71b7 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c11_71b7_left,
BIN_OP_AND_uxn_c_l40_c11_71b7_right,
BIN_OP_AND_uxn_c_l40_c11_71b7_return_output);

-- UNARY_OP_NOT_uxn_c_l40_c11_e414
UNARY_OP_NOT_uxn_c_l40_c11_e414 : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l40_c11_e414_expr,
UNARY_OP_NOT_uxn_c_l40_c11_e414_return_output);

-- CONST_SR_5_uxn_c_l40_c31_b60b
CONST_SR_5_uxn_c_l40_c31_b60b : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_c_l40_c31_b60b_x,
CONST_SR_5_uxn_c_l40_c31_b60b_return_output);

-- BIN_OP_MINUS_uxn_c_l40_c26_124b
BIN_OP_MINUS_uxn_c_l40_c26_124b : entity work.BIN_OP_MINUS_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l40_c26_124b_left,
BIN_OP_MINUS_uxn_c_l40_c26_124b_right,
BIN_OP_MINUS_uxn_c_l40_c26_124b_return_output);

-- BIN_OP_AND_uxn_c_l40_c26_3c66
BIN_OP_AND_uxn_c_l40_c26_3c66 : entity work.BIN_OP_AND_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c26_3c66_left,
BIN_OP_AND_uxn_c_l40_c26_3c66_right,
BIN_OP_AND_uxn_c_l40_c26_3c66_return_output);

-- BIN_OP_AND_uxn_c_l40_c51_f0cc
BIN_OP_AND_uxn_c_l40_c51_f0cc : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c51_f0cc_left,
BIN_OP_AND_uxn_c_l40_c51_f0cc_right,
BIN_OP_AND_uxn_c_l40_c51_f0cc_return_output);

-- MUX_uxn_c_l40_c11_5407
MUX_uxn_c_l40_c11_5407 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l40_c11_5407_cond,
MUX_uxn_c_l40_c11_5407_iftrue,
MUX_uxn_c_l40_c11_5407_iffalse,
MUX_uxn_c_l40_c11_5407_return_output);

-- eval_opcode_uxn_c_l41_c11_d9e4
eval_opcode_uxn_c_l41_c11_d9e4 : entity work.eval_opcode_0CLK_1e9868e1 port map (
clk,
eval_opcode_uxn_c_l41_c11_d9e4_CLOCK_ENABLE,
eval_opcode_uxn_c_l41_c11_d9e4_stack_index,
eval_opcode_uxn_c_l41_c11_d9e4_opcode,
eval_opcode_uxn_c_l41_c11_d9e4_ins,
eval_opcode_uxn_c_l41_c11_d9e4_k,
eval_opcode_uxn_c_l41_c11_d9e4_return_output);

-- screen_ram_update_uxn_c_l44_c32_11b4
screen_ram_update_uxn_c_l44_c32_11b4 : entity work.screen_ram_update_0CLK_b4ec7bd0 port map (
clk,
screen_ram_update_uxn_c_l44_c32_11b4_CLOCK_ENABLE,
screen_ram_update_uxn_c_l44_c32_11b4_write_address,
screen_ram_update_uxn_c_l44_c32_11b4_write_value,
screen_ram_update_uxn_c_l44_c32_11b4_read_address,
screen_ram_update_uxn_c_l44_c32_11b4_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_return_output);

-- BIN_OP_EQ_uxn_c_l53_c6_5bfb
BIN_OP_EQ_uxn_c_l53_c6_5bfb : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l53_c6_5bfb_left,
BIN_OP_EQ_uxn_c_l53_c6_5bfb_right,
BIN_OP_EQ_uxn_c_l53_c6_5bfb_return_output);

-- pixel_counter_MUX_uxn_c_l53_c2_bf28
pixel_counter_MUX_uxn_c_l53_c2_bf28 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l53_c2_bf28_cond,
pixel_counter_MUX_uxn_c_l53_c2_bf28_iftrue,
pixel_counter_MUX_uxn_c_l53_c2_bf28_iffalse,
pixel_counter_MUX_uxn_c_l53_c2_bf28_return_output);

-- BIN_OP_PLUS_uxn_c_l56_c3_8f75
BIN_OP_PLUS_uxn_c_l56_c3_8f75 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l56_c3_8f75_left,
BIN_OP_PLUS_uxn_c_l56_c3_8f75_right,
BIN_OP_PLUS_uxn_c_l56_c3_8f75_return_output);

-- BIN_OP_EQ_uxn_c_l60_c6_7fac
BIN_OP_EQ_uxn_c_l60_c6_7fac : entity work.BIN_OP_EQ_uint32_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l60_c6_7fac_left,
BIN_OP_EQ_uxn_c_l60_c6_7fac_right,
BIN_OP_EQ_uxn_c_l60_c6_7fac_return_output);

-- seconds_counter_MUX_uxn_c_l60_c2_63db
seconds_counter_MUX_uxn_c_l60_c2_63db : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
seconds_counter_MUX_uxn_c_l60_c2_63db_cond,
seconds_counter_MUX_uxn_c_l60_c2_63db_iftrue,
seconds_counter_MUX_uxn_c_l60_c2_63db_iffalse,
seconds_counter_MUX_uxn_c_l60_c2_63db_return_output);

-- clock_cycle_counter_MUX_uxn_c_l60_c2_63db
clock_cycle_counter_MUX_uxn_c_l60_c2_63db : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
clock_cycle_counter_MUX_uxn_c_l60_c2_63db_cond,
clock_cycle_counter_MUX_uxn_c_l60_c2_63db_iftrue,
clock_cycle_counter_MUX_uxn_c_l60_c2_63db_iffalse,
clock_cycle_counter_MUX_uxn_c_l60_c2_63db_return_output);

-- BIN_OP_PLUS_uxn_c_l61_c3_d5ca
BIN_OP_PLUS_uxn_c_l61_c3_d5ca : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l61_c3_d5ca_left,
BIN_OP_PLUS_uxn_c_l61_c3_d5ca_right,
BIN_OP_PLUS_uxn_c_l61_c3_d5ca_return_output);

-- BIN_OP_PLUS_uxn_c_l64_c3_9bb0
BIN_OP_PLUS_uxn_c_l64_c3_9bb0 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l64_c3_9bb0_left,
BIN_OP_PLUS_uxn_c_l64_c3_9bb0_right,
BIN_OP_PLUS_uxn_c_l64_c3_9bb0_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 input,
 -- Registers
 palette_color_values,
 pixel_counter,
 clock_cycle_counter,
 seconds_counter,
 result,
 current_pixel_palette_color,
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
 pc_get_uxn_c_l29_c7_f10b_return_output,
 BIN_OP_EQ_uxn_c_l30_c15_2e88_return_output,
 MUX_uxn_c_l30_c15_a021_return_output,
 peek_dev_uxn_c_l31_c17_dbbf_return_output,
 BIN_OP_EQ_uxn_c_l32_c22_7931_return_output,
 MUX_uxn_c_l32_c22_b0c1_return_output,
 BIN_OP_AND_uxn_c_l33_c16_f2d3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_return_output,
 k_MUX_uxn_c_l35_c2_5350_return_output,
 error_MUX_uxn_c_l35_c2_5350_return_output,
 ins_MUX_uxn_c_l35_c2_5350_return_output,
 opc_MUX_uxn_c_l35_c2_5350_return_output,
 s_MUX_uxn_c_l35_c2_5350_return_output,
 peek_ram_uxn_c_l36_c9_fe67_return_output,
 BIN_OP_AND_uxn_c_l36_c9_6cfb_return_output,
 BIN_OP_AND_uxn_c_l38_c7_1fa9_return_output,
 MUX_uxn_c_l38_c7_04d3_return_output,
 BIN_OP_AND_uxn_c_l39_c7_7836_return_output,
 MUX_uxn_c_l39_c7_4bd1_return_output,
 BIN_OP_AND_uxn_c_l40_c11_71b7_return_output,
 UNARY_OP_NOT_uxn_c_l40_c11_e414_return_output,
 CONST_SR_5_uxn_c_l40_c31_b60b_return_output,
 BIN_OP_MINUS_uxn_c_l40_c26_124b_return_output,
 BIN_OP_AND_uxn_c_l40_c26_3c66_return_output,
 BIN_OP_AND_uxn_c_l40_c51_f0cc_return_output,
 MUX_uxn_c_l40_c11_5407_return_output,
 eval_opcode_uxn_c_l41_c11_d9e4_return_output,
 screen_ram_update_uxn_c_l44_c32_11b4_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_return_output,
 BIN_OP_EQ_uxn_c_l53_c6_5bfb_return_output,
 pixel_counter_MUX_uxn_c_l53_c2_bf28_return_output,
 BIN_OP_PLUS_uxn_c_l56_c3_8f75_return_output,
 BIN_OP_EQ_uxn_c_l60_c6_7fac_return_output,
 seconds_counter_MUX_uxn_c_l60_c2_63db_return_output,
 clock_cycle_counter_MUX_uxn_c_l60_c2_63db_return_output,
 BIN_OP_PLUS_uxn_c_l61_c3_d5ca_return_output,
 BIN_OP_PLUS_uxn_c_l64_c3_9bb0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_c_l29_c7_f10b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_c_l29_c7_f10b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_a021_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_a021_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_a021_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_2e88_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_2e88_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_2e88_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_a021_return_output : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_c_l31_c17_dbbf_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_c_l31_c17_dbbf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_c_l31_c17_dbbf_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_b0c1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_b0c1_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_b0c1_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_7931_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_7931_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_7931_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_b0c1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_iffalse : unsigned(0 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_5350_iftrue : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_5350_iffalse : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_5350_return_output : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_5350_cond : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_5350_iftrue : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_5350_iffalse : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_5350_return_output : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_5350_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_5350_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_5350_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_5350_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_5350_cond : unsigned(0 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_5350_iftrue : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_5350_iffalse : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_5350_return_output : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_5350_cond : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_5350_iftrue : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_5350_iffalse : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_5350_return_output : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_5350_cond : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_fe67_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_left : unsigned(7 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_fe67_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_fe67_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_return_output : unsigned(7 downto 0);
 variable VAR_pc_add_uxn_c_l37_c3_9936_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_c_l37_c3_9936_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_04d3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_04d3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_04d3_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_1fa9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_1fa9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_1fa9_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_04d3_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_4bd1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_4bd1_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_4bd1_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_7836_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_7836_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_7836_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_4bd1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_5407_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_5407_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_5407_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_71b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_71b7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_71b7_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l40_c11_e414_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l40_c11_e414_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_124b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_124b_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l40_c31_b60b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l40_c31_b60b_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_124b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_3c66_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_3c66_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_3c66_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_f0cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_f0cc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_f0cc_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_5407_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_d9e4_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_d9e4_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_d9e4_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_d9e4_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_d9e4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_d9e4_return_output : unsigned(0 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_11b4_write_address : unsigned(31 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_11b4_write_value : unsigned(1 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_11b4_read_address : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l46_c3_9fea_return_output : unsigned(1 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_11b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_11b4_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_ref_toks_0 : uint12_t_4;
 variable VAR_CAST_TO_uint16_t_uxn_c_l50_c11_bc85_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_5bfb_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_5bfb_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_5bfb_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_bf28_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l54_c3_1b72 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_bf28_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l56_c3_eaa2 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_bf28_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_bf28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_8f75_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_8f75_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_8f75_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_7fac_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_7fac_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_7fac_return_output : unsigned(0 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_63db_iftrue : unsigned(31 downto 0);
 variable VAR_seconds_counter_uxn_c_l61_c3_569e : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_63db_iffalse : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_63db_return_output : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_63db_cond : unsigned(0 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_63db_iftrue : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_uxn_c_l62_c3_8c49 : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_63db_iffalse : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_uxn_c_l64_c3_bbc6 : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_63db_return_output : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_63db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_d5ca_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_d5ca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_d5ca_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_9bb0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_9bb0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_9bb0_return_output : unsigned(32 downto 0);
 -- State registers comb logic variables
variable REG_VAR_palette_color_values : uint12_t_4;
variable REG_VAR_pixel_counter : unsigned(31 downto 0);
variable REG_VAR_clock_cycle_counter : unsigned(31 downto 0);
variable REG_VAR_seconds_counter : unsigned(31 downto 0);
variable REG_VAR_result : unsigned(15 downto 0);
variable REG_VAR_current_pixel_palette_color : unsigned(1 downto 0);
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
  REG_VAR_palette_color_values := palette_color_values;
  REG_VAR_pixel_counter := pixel_counter;
  REG_VAR_clock_cycle_counter := clock_cycle_counter;
  REG_VAR_seconds_counter := seconds_counter;
  REG_VAR_result := result;
  REG_VAR_current_pixel_palette_color := current_pixel_palette_color;
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
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_d5ca_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l38_c7_04d3_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_c_l32_c22_7931_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l40_c51_f0cc_right := to_unsigned(63, 6);
     VAR_BIN_OP_AND_uxn_c_l38_c7_1fa9_right := to_unsigned(128, 8);
     VAR_pixel_counter_uxn_c_l54_c3_1b72 := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l53_c2_bf28_iftrue := VAR_pixel_counter_uxn_c_l54_c3_1b72;
     VAR_BIN_OP_EQ_uxn_c_l30_c15_2e88_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l32_c22_b0c1_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l39_c7_4bd1_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l30_c15_a021_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_8f75_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l38_c7_04d3_iftrue := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l40_c11_71b7_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l40_c26_3c66_right := to_unsigned(255, 8);
     VAR_pc_add_uxn_c_l37_c3_9936_adjustment := resize(to_unsigned(1, 1), 16);
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_124b_left := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l30_c15_a021_iftrue := to_unsigned(0, 1);
     VAR_error_MUX_uxn_c_l35_c2_5350_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l32_c22_b0c1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_9bb0_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l39_c7_4bd1_iftrue := to_unsigned(1, 1);
     VAR_clock_cycle_counter_uxn_c_l62_c3_8c49 := resize(to_unsigned(0, 1), 32);
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_63db_iftrue := VAR_clock_cycle_counter_uxn_c_l62_c3_8c49;
     VAR_BIN_OP_EQ_uxn_c_l60_c6_7fac_right := to_unsigned(12287998, 24);
     VAR_BIN_OP_AND_uxn_c_l39_c7_7836_right := to_unsigned(64, 7);
     VAR_peek_dev_uxn_c_l31_c17_dbbf_address := resize(to_unsigned(15, 4), 8);
     VAR_BIN_OP_EQ_uxn_c_l53_c6_5bfb_right := to_unsigned(204799, 18);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_iftrue := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_c_l29_c7_f10b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_peek_dev_uxn_c_l31_c17_dbbf_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_screen_ram_update_uxn_c_l44_c32_11b4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l60_c6_7fac_left := clock_cycle_counter;
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_9bb0_left := clock_cycle_counter;
     VAR_ins_MUX_uxn_c_l35_c2_5350_iffalse := ins;
     VAR_k_MUX_uxn_c_l35_c2_5350_iffalse := k;
     VAR_opc_MUX_uxn_c_l35_c2_5350_iffalse := opc;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_ref_toks_0 := palette_color_values;
     REG_VAR_palette_color_values := palette_color_values;
     VAR_BIN_OP_EQ_uxn_c_l53_c6_5bfb_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_8f75_left := pixel_counter;
     VAR_screen_ram_update_uxn_c_l44_c32_11b4_read_address := pixel_counter;
     VAR_screen_ram_update_uxn_c_l44_c32_11b4_write_address := pixel_counter;
     VAR_s_MUX_uxn_c_l35_c2_5350_iffalse := s;
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_d5ca_left := seconds_counter;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_63db_iffalse := seconds_counter;
     -- pc_get[uxn_c_l29_c7_f10b] LATENCY=0
     -- Clock enable
     pc_get_uxn_c_l29_c7_f10b_CLOCK_ENABLE <= VAR_pc_get_uxn_c_l29_c7_f10b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_c_l29_c7_f10b_return_output := pc_get_uxn_c_l29_c7_f10b_return_output;

     -- BIN_OP_PLUS[uxn_c_l61_c3_d5ca] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l61_c3_d5ca_left <= VAR_BIN_OP_PLUS_uxn_c_l61_c3_d5ca_left;
     BIN_OP_PLUS_uxn_c_l61_c3_d5ca_right <= VAR_BIN_OP_PLUS_uxn_c_l61_c3_d5ca_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_d5ca_return_output := BIN_OP_PLUS_uxn_c_l61_c3_d5ca_return_output;

     -- CAST_TO_uint2_t[uxn_c_l46_c3_9fea] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l46_c3_9fea_return_output := CAST_TO_uint2_t_uint32_t(
     seconds_counter);

     -- BIN_OP_EQ[uxn_c_l53_c6_5bfb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l53_c6_5bfb_left <= VAR_BIN_OP_EQ_uxn_c_l53_c6_5bfb_left;
     BIN_OP_EQ_uxn_c_l53_c6_5bfb_right <= VAR_BIN_OP_EQ_uxn_c_l53_c6_5bfb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l53_c6_5bfb_return_output := BIN_OP_EQ_uxn_c_l53_c6_5bfb_return_output;

     -- BIN_OP_EQ[uxn_c_l60_c6_7fac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l60_c6_7fac_left <= VAR_BIN_OP_EQ_uxn_c_l60_c6_7fac_left;
     BIN_OP_EQ_uxn_c_l60_c6_7fac_right <= VAR_BIN_OP_EQ_uxn_c_l60_c6_7fac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l60_c6_7fac_return_output := BIN_OP_EQ_uxn_c_l60_c6_7fac_return_output;

     -- BIN_OP_PLUS[uxn_c_l56_c3_8f75] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l56_c3_8f75_left <= VAR_BIN_OP_PLUS_uxn_c_l56_c3_8f75_left;
     BIN_OP_PLUS_uxn_c_l56_c3_8f75_right <= VAR_BIN_OP_PLUS_uxn_c_l56_c3_8f75_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_8f75_return_output := BIN_OP_PLUS_uxn_c_l56_c3_8f75_return_output;

     -- peek_dev[uxn_c_l31_c17_dbbf] LATENCY=0
     -- Clock enable
     peek_dev_uxn_c_l31_c17_dbbf_CLOCK_ENABLE <= VAR_peek_dev_uxn_c_l31_c17_dbbf_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_c_l31_c17_dbbf_address <= VAR_peek_dev_uxn_c_l31_c17_dbbf_address;
     -- Outputs
     VAR_peek_dev_uxn_c_l31_c17_dbbf_return_output := peek_dev_uxn_c_l31_c17_dbbf_return_output;

     -- BIN_OP_PLUS[uxn_c_l64_c3_9bb0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l64_c3_9bb0_left <= VAR_BIN_OP_PLUS_uxn_c_l64_c3_9bb0_left;
     BIN_OP_PLUS_uxn_c_l64_c3_9bb0_right <= VAR_BIN_OP_PLUS_uxn_c_l64_c3_9bb0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_9bb0_return_output := BIN_OP_PLUS_uxn_c_l64_c3_9bb0_return_output;

     -- Submodule level 1
     VAR_pixel_counter_MUX_uxn_c_l53_c2_bf28_cond := VAR_BIN_OP_EQ_uxn_c_l53_c6_5bfb_return_output;
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_63db_cond := VAR_BIN_OP_EQ_uxn_c_l60_c6_7fac_return_output;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_63db_cond := VAR_BIN_OP_EQ_uxn_c_l60_c6_7fac_return_output;
     VAR_pixel_counter_uxn_c_l56_c3_eaa2 := resize(VAR_BIN_OP_PLUS_uxn_c_l56_c3_8f75_return_output, 32);
     VAR_seconds_counter_uxn_c_l61_c3_569e := resize(VAR_BIN_OP_PLUS_uxn_c_l61_c3_d5ca_return_output, 32);
     VAR_clock_cycle_counter_uxn_c_l64_c3_bbc6 := resize(VAR_BIN_OP_PLUS_uxn_c_l64_c3_9bb0_return_output, 32);
     VAR_screen_ram_update_uxn_c_l44_c32_11b4_write_value := VAR_CAST_TO_uint2_t_uxn_c_l46_c3_9fea_return_output;
     VAR_BIN_OP_EQ_uxn_c_l30_c15_2e88_left := VAR_pc_get_uxn_c_l29_c7_f10b_return_output;
     REG_VAR_pc := VAR_pc_get_uxn_c_l29_c7_f10b_return_output;
     VAR_peek_ram_uxn_c_l36_c9_fe67_address := VAR_pc_get_uxn_c_l29_c7_f10b_return_output;
     VAR_BIN_OP_EQ_uxn_c_l32_c22_7931_left := VAR_peek_dev_uxn_c_l31_c17_dbbf_return_output;
     REG_VAR_system_state := VAR_peek_dev_uxn_c_l31_c17_dbbf_return_output;
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_63db_iffalse := VAR_clock_cycle_counter_uxn_c_l64_c3_bbc6;
     VAR_pixel_counter_MUX_uxn_c_l53_c2_bf28_iffalse := VAR_pixel_counter_uxn_c_l56_c3_eaa2;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_63db_iftrue := VAR_seconds_counter_uxn_c_l61_c3_569e;
     -- clock_cycle_counter_MUX[uxn_c_l60_c2_63db] LATENCY=0
     -- Inputs
     clock_cycle_counter_MUX_uxn_c_l60_c2_63db_cond <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_63db_cond;
     clock_cycle_counter_MUX_uxn_c_l60_c2_63db_iftrue <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_63db_iftrue;
     clock_cycle_counter_MUX_uxn_c_l60_c2_63db_iffalse <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_63db_iffalse;
     -- Outputs
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_63db_return_output := clock_cycle_counter_MUX_uxn_c_l60_c2_63db_return_output;

     -- BIN_OP_EQ[uxn_c_l30_c15_2e88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l30_c15_2e88_left <= VAR_BIN_OP_EQ_uxn_c_l30_c15_2e88_left;
     BIN_OP_EQ_uxn_c_l30_c15_2e88_right <= VAR_BIN_OP_EQ_uxn_c_l30_c15_2e88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l30_c15_2e88_return_output := BIN_OP_EQ_uxn_c_l30_c15_2e88_return_output;

     -- BIN_OP_EQ[uxn_c_l32_c22_7931] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l32_c22_7931_left <= VAR_BIN_OP_EQ_uxn_c_l32_c22_7931_left;
     BIN_OP_EQ_uxn_c_l32_c22_7931_right <= VAR_BIN_OP_EQ_uxn_c_l32_c22_7931_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l32_c22_7931_return_output := BIN_OP_EQ_uxn_c_l32_c22_7931_return_output;

     -- seconds_counter_MUX[uxn_c_l60_c2_63db] LATENCY=0
     -- Inputs
     seconds_counter_MUX_uxn_c_l60_c2_63db_cond <= VAR_seconds_counter_MUX_uxn_c_l60_c2_63db_cond;
     seconds_counter_MUX_uxn_c_l60_c2_63db_iftrue <= VAR_seconds_counter_MUX_uxn_c_l60_c2_63db_iftrue;
     seconds_counter_MUX_uxn_c_l60_c2_63db_iffalse <= VAR_seconds_counter_MUX_uxn_c_l60_c2_63db_iffalse;
     -- Outputs
     VAR_seconds_counter_MUX_uxn_c_l60_c2_63db_return_output := seconds_counter_MUX_uxn_c_l60_c2_63db_return_output;

     -- pixel_counter_MUX[uxn_c_l53_c2_bf28] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l53_c2_bf28_cond <= VAR_pixel_counter_MUX_uxn_c_l53_c2_bf28_cond;
     pixel_counter_MUX_uxn_c_l53_c2_bf28_iftrue <= VAR_pixel_counter_MUX_uxn_c_l53_c2_bf28_iftrue;
     pixel_counter_MUX_uxn_c_l53_c2_bf28_iffalse <= VAR_pixel_counter_MUX_uxn_c_l53_c2_bf28_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l53_c2_bf28_return_output := pixel_counter_MUX_uxn_c_l53_c2_bf28_return_output;

     -- screen_ram_update[uxn_c_l44_c32_11b4] LATENCY=0
     -- Clock enable
     screen_ram_update_uxn_c_l44_c32_11b4_CLOCK_ENABLE <= VAR_screen_ram_update_uxn_c_l44_c32_11b4_CLOCK_ENABLE;
     -- Inputs
     screen_ram_update_uxn_c_l44_c32_11b4_write_address <= VAR_screen_ram_update_uxn_c_l44_c32_11b4_write_address;
     screen_ram_update_uxn_c_l44_c32_11b4_write_value <= VAR_screen_ram_update_uxn_c_l44_c32_11b4_write_value;
     screen_ram_update_uxn_c_l44_c32_11b4_read_address <= VAR_screen_ram_update_uxn_c_l44_c32_11b4_read_address;
     -- Outputs
     VAR_screen_ram_update_uxn_c_l44_c32_11b4_return_output := screen_ram_update_uxn_c_l44_c32_11b4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l30_c15_a021_cond := VAR_BIN_OP_EQ_uxn_c_l30_c15_2e88_return_output;
     VAR_MUX_uxn_c_l32_c22_b0c1_cond := VAR_BIN_OP_EQ_uxn_c_l32_c22_7931_return_output;
     REG_VAR_clock_cycle_counter := VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_63db_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l53_c2_bf28_return_output;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_var_dim_0 := VAR_screen_ram_update_uxn_c_l44_c32_11b4_return_output;
     REG_VAR_current_pixel_palette_color := VAR_screen_ram_update_uxn_c_l44_c32_11b4_return_output;
     REG_VAR_seconds_counter := VAR_seconds_counter_MUX_uxn_c_l60_c2_63db_return_output;
     -- MUX[uxn_c_l32_c22_b0c1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l32_c22_b0c1_cond <= VAR_MUX_uxn_c_l32_c22_b0c1_cond;
     MUX_uxn_c_l32_c22_b0c1_iftrue <= VAR_MUX_uxn_c_l32_c22_b0c1_iftrue;
     MUX_uxn_c_l32_c22_b0c1_iffalse <= VAR_MUX_uxn_c_l32_c22_b0c1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l32_c22_b0c1_return_output := MUX_uxn_c_l32_c22_b0c1_return_output;

     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l50_c22_118b] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_return_output;

     -- MUX[uxn_c_l30_c15_a021] LATENCY=0
     -- Inputs
     MUX_uxn_c_l30_c15_a021_cond <= VAR_MUX_uxn_c_l30_c15_a021_cond;
     MUX_uxn_c_l30_c15_a021_iftrue <= VAR_MUX_uxn_c_l30_c15_a021_iftrue;
     MUX_uxn_c_l30_c15_a021_iffalse <= VAR_MUX_uxn_c_l30_c15_a021_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l30_c15_a021_return_output := MUX_uxn_c_l30_c15_a021_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_left := VAR_MUX_uxn_c_l30_c15_a021_return_output;
     REG_VAR_pc_nonzero := VAR_MUX_uxn_c_l30_c15_a021_return_output;
     VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_right := VAR_MUX_uxn_c_l32_c22_b0c1_return_output;
     REG_VAR_system_state_zero := VAR_MUX_uxn_c_l32_c22_b0c1_return_output;
     -- CAST_TO_uint16_t[uxn_c_l50_c11_bc85] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_c_l50_c11_bc85_return_output := CAST_TO_uint16_t_uint12_t(
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_118b_return_output);

     -- BIN_OP_AND[uxn_c_l33_c16_f2d3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l33_c16_f2d3_left <= VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_left;
     BIN_OP_AND_uxn_c_l33_c16_f2d3_right <= VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_return_output := BIN_OP_AND_uxn_c_l33_c16_f2d3_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_return_output;
     VAR_error_MUX_uxn_c_l35_c2_5350_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_return_output;
     VAR_ins_MUX_uxn_c_l35_c2_5350_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_return_output;
     VAR_k_MUX_uxn_c_l35_c2_5350_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_return_output;
     VAR_opc_MUX_uxn_c_l35_c2_5350_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_return_output;
     VAR_s_MUX_uxn_c_l35_c2_5350_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_return_output;
     REG_VAR_should_eval := VAR_BIN_OP_AND_uxn_c_l33_c16_f2d3_return_output;
     REG_VAR_result := VAR_CAST_TO_uint16_t_uxn_c_l50_c11_bc85_return_output;
     VAR_return_output := VAR_CAST_TO_uint16_t_uxn_c_l50_c11_bc85_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_edba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_return_output;

     -- Submodule level 5
     VAR_eval_opcode_uxn_c_l41_c11_d9e4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_return_output;
     VAR_pc_add_uxn_c_l37_c3_9936_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_return_output;
     VAR_peek_ram_uxn_c_l36_c9_fe67_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_edba_return_output;
     -- pc_add[uxn_c_l37_c3_9936] LATENCY=0
     -- Clock enable
     pc_add_uxn_c_l37_c3_9936_CLOCK_ENABLE <= VAR_pc_add_uxn_c_l37_c3_9936_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_c_l37_c3_9936_adjustment <= VAR_pc_add_uxn_c_l37_c3_9936_adjustment;
     -- Outputs

     -- peek_ram[uxn_c_l36_c9_fe67] LATENCY=0
     -- Clock enable
     peek_ram_uxn_c_l36_c9_fe67_CLOCK_ENABLE <= VAR_peek_ram_uxn_c_l36_c9_fe67_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_c_l36_c9_fe67_address <= VAR_peek_ram_uxn_c_l36_c9_fe67_address;
     -- Outputs
     VAR_peek_ram_uxn_c_l36_c9_fe67_return_output := peek_ram_uxn_c_l36_c9_fe67_return_output;

     -- Submodule level 6
     VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_left := VAR_peek_ram_uxn_c_l36_c9_fe67_return_output;
     -- BIN_OP_AND[uxn_c_l36_c9_6cfb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l36_c9_6cfb_left <= VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_left;
     BIN_OP_AND_uxn_c_l36_c9_6cfb_right <= VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_return_output := BIN_OP_AND_uxn_c_l36_c9_6cfb_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l38_c7_1fa9_left := VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_return_output;
     VAR_BIN_OP_AND_uxn_c_l39_c7_7836_left := VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_return_output;
     VAR_BIN_OP_AND_uxn_c_l40_c11_71b7_left := VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_return_output;
     VAR_BIN_OP_AND_uxn_c_l40_c51_f0cc_left := VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_return_output;
     VAR_CONST_SR_5_uxn_c_l40_c31_b60b_x := VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_d9e4_ins := VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_return_output;
     VAR_ins_MUX_uxn_c_l35_c2_5350_iftrue := VAR_BIN_OP_AND_uxn_c_l36_c9_6cfb_return_output;
     -- BIN_OP_AND[uxn_c_l39_c7_7836] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l39_c7_7836_left <= VAR_BIN_OP_AND_uxn_c_l39_c7_7836_left;
     BIN_OP_AND_uxn_c_l39_c7_7836_right <= VAR_BIN_OP_AND_uxn_c_l39_c7_7836_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l39_c7_7836_return_output := BIN_OP_AND_uxn_c_l39_c7_7836_return_output;

     -- CONST_SR_5[uxn_c_l40_c31_b60b] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_c_l40_c31_b60b_x <= VAR_CONST_SR_5_uxn_c_l40_c31_b60b_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_c_l40_c31_b60b_return_output := CONST_SR_5_uxn_c_l40_c31_b60b_return_output;

     -- BIN_OP_AND[uxn_c_l40_c11_71b7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c11_71b7_left <= VAR_BIN_OP_AND_uxn_c_l40_c11_71b7_left;
     BIN_OP_AND_uxn_c_l40_c11_71b7_right <= VAR_BIN_OP_AND_uxn_c_l40_c11_71b7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c11_71b7_return_output := BIN_OP_AND_uxn_c_l40_c11_71b7_return_output;

     -- ins_MUX[uxn_c_l35_c2_5350] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l35_c2_5350_cond <= VAR_ins_MUX_uxn_c_l35_c2_5350_cond;
     ins_MUX_uxn_c_l35_c2_5350_iftrue <= VAR_ins_MUX_uxn_c_l35_c2_5350_iftrue;
     ins_MUX_uxn_c_l35_c2_5350_iffalse <= VAR_ins_MUX_uxn_c_l35_c2_5350_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l35_c2_5350_return_output := ins_MUX_uxn_c_l35_c2_5350_return_output;

     -- BIN_OP_AND[uxn_c_l38_c7_1fa9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l38_c7_1fa9_left <= VAR_BIN_OP_AND_uxn_c_l38_c7_1fa9_left;
     BIN_OP_AND_uxn_c_l38_c7_1fa9_right <= VAR_BIN_OP_AND_uxn_c_l38_c7_1fa9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l38_c7_1fa9_return_output := BIN_OP_AND_uxn_c_l38_c7_1fa9_return_output;

     -- BIN_OP_AND[uxn_c_l40_c51_f0cc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c51_f0cc_left <= VAR_BIN_OP_AND_uxn_c_l40_c51_f0cc_left;
     BIN_OP_AND_uxn_c_l40_c51_f0cc_right <= VAR_BIN_OP_AND_uxn_c_l40_c51_f0cc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c51_f0cc_return_output := BIN_OP_AND_uxn_c_l40_c51_f0cc_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l38_c7_04d3_cond := resize(VAR_BIN_OP_AND_uxn_c_l38_c7_1fa9_return_output, 1);
     VAR_MUX_uxn_c_l39_c7_4bd1_cond := resize(VAR_BIN_OP_AND_uxn_c_l39_c7_7836_return_output, 1);
     VAR_UNARY_OP_NOT_uxn_c_l40_c11_e414_expr := VAR_BIN_OP_AND_uxn_c_l40_c11_71b7_return_output;
     VAR_MUX_uxn_c_l40_c11_5407_iffalse := VAR_BIN_OP_AND_uxn_c_l40_c51_f0cc_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_124b_right := VAR_CONST_SR_5_uxn_c_l40_c31_b60b_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l35_c2_5350_return_output;
     -- BIN_OP_MINUS[uxn_c_l40_c26_124b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l40_c26_124b_left <= VAR_BIN_OP_MINUS_uxn_c_l40_c26_124b_left;
     BIN_OP_MINUS_uxn_c_l40_c26_124b_right <= VAR_BIN_OP_MINUS_uxn_c_l40_c26_124b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_124b_return_output := BIN_OP_MINUS_uxn_c_l40_c26_124b_return_output;

     -- MUX[uxn_c_l39_c7_4bd1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l39_c7_4bd1_cond <= VAR_MUX_uxn_c_l39_c7_4bd1_cond;
     MUX_uxn_c_l39_c7_4bd1_iftrue <= VAR_MUX_uxn_c_l39_c7_4bd1_iftrue;
     MUX_uxn_c_l39_c7_4bd1_iffalse <= VAR_MUX_uxn_c_l39_c7_4bd1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l39_c7_4bd1_return_output := MUX_uxn_c_l39_c7_4bd1_return_output;

     -- MUX[uxn_c_l38_c7_04d3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l38_c7_04d3_cond <= VAR_MUX_uxn_c_l38_c7_04d3_cond;
     MUX_uxn_c_l38_c7_04d3_iftrue <= VAR_MUX_uxn_c_l38_c7_04d3_iftrue;
     MUX_uxn_c_l38_c7_04d3_iffalse <= VAR_MUX_uxn_c_l38_c7_04d3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l38_c7_04d3_return_output := MUX_uxn_c_l38_c7_04d3_return_output;

     -- UNARY_OP_NOT[uxn_c_l40_c11_e414] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l40_c11_e414_expr <= VAR_UNARY_OP_NOT_uxn_c_l40_c11_e414_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l40_c11_e414_return_output := UNARY_OP_NOT_uxn_c_l40_c11_e414_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l40_c26_3c66_left := VAR_BIN_OP_MINUS_uxn_c_l40_c26_124b_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_d9e4_k := VAR_MUX_uxn_c_l38_c7_04d3_return_output;
     VAR_k_MUX_uxn_c_l35_c2_5350_iftrue := VAR_MUX_uxn_c_l38_c7_04d3_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_d9e4_stack_index := VAR_MUX_uxn_c_l39_c7_4bd1_return_output;
     VAR_s_MUX_uxn_c_l35_c2_5350_iftrue := VAR_MUX_uxn_c_l39_c7_4bd1_return_output;
     VAR_MUX_uxn_c_l40_c11_5407_cond := resize(VAR_UNARY_OP_NOT_uxn_c_l40_c11_e414_return_output, 1);
     -- k_MUX[uxn_c_l35_c2_5350] LATENCY=0
     -- Inputs
     k_MUX_uxn_c_l35_c2_5350_cond <= VAR_k_MUX_uxn_c_l35_c2_5350_cond;
     k_MUX_uxn_c_l35_c2_5350_iftrue <= VAR_k_MUX_uxn_c_l35_c2_5350_iftrue;
     k_MUX_uxn_c_l35_c2_5350_iffalse <= VAR_k_MUX_uxn_c_l35_c2_5350_iffalse;
     -- Outputs
     VAR_k_MUX_uxn_c_l35_c2_5350_return_output := k_MUX_uxn_c_l35_c2_5350_return_output;

     -- s_MUX[uxn_c_l35_c2_5350] LATENCY=0
     -- Inputs
     s_MUX_uxn_c_l35_c2_5350_cond <= VAR_s_MUX_uxn_c_l35_c2_5350_cond;
     s_MUX_uxn_c_l35_c2_5350_iftrue <= VAR_s_MUX_uxn_c_l35_c2_5350_iftrue;
     s_MUX_uxn_c_l35_c2_5350_iffalse <= VAR_s_MUX_uxn_c_l35_c2_5350_iffalse;
     -- Outputs
     VAR_s_MUX_uxn_c_l35_c2_5350_return_output := s_MUX_uxn_c_l35_c2_5350_return_output;

     -- BIN_OP_AND[uxn_c_l40_c26_3c66] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c26_3c66_left <= VAR_BIN_OP_AND_uxn_c_l40_c26_3c66_left;
     BIN_OP_AND_uxn_c_l40_c26_3c66_right <= VAR_BIN_OP_AND_uxn_c_l40_c26_3c66_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c26_3c66_return_output := BIN_OP_AND_uxn_c_l40_c26_3c66_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l40_c11_5407_iftrue := VAR_BIN_OP_AND_uxn_c_l40_c26_3c66_return_output;
     REG_VAR_k := VAR_k_MUX_uxn_c_l35_c2_5350_return_output;
     REG_VAR_s := VAR_s_MUX_uxn_c_l35_c2_5350_return_output;
     -- MUX[uxn_c_l40_c11_5407] LATENCY=0
     -- Inputs
     MUX_uxn_c_l40_c11_5407_cond <= VAR_MUX_uxn_c_l40_c11_5407_cond;
     MUX_uxn_c_l40_c11_5407_iftrue <= VAR_MUX_uxn_c_l40_c11_5407_iftrue;
     MUX_uxn_c_l40_c11_5407_iffalse <= VAR_MUX_uxn_c_l40_c11_5407_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l40_c11_5407_return_output := MUX_uxn_c_l40_c11_5407_return_output;

     -- Submodule level 11
     VAR_eval_opcode_uxn_c_l41_c11_d9e4_opcode := VAR_MUX_uxn_c_l40_c11_5407_return_output;
     VAR_opc_MUX_uxn_c_l35_c2_5350_iftrue := VAR_MUX_uxn_c_l40_c11_5407_return_output;
     -- eval_opcode[uxn_c_l41_c11_d9e4] LATENCY=0
     -- Clock enable
     eval_opcode_uxn_c_l41_c11_d9e4_CLOCK_ENABLE <= VAR_eval_opcode_uxn_c_l41_c11_d9e4_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_uxn_c_l41_c11_d9e4_stack_index <= VAR_eval_opcode_uxn_c_l41_c11_d9e4_stack_index;
     eval_opcode_uxn_c_l41_c11_d9e4_opcode <= VAR_eval_opcode_uxn_c_l41_c11_d9e4_opcode;
     eval_opcode_uxn_c_l41_c11_d9e4_ins <= VAR_eval_opcode_uxn_c_l41_c11_d9e4_ins;
     eval_opcode_uxn_c_l41_c11_d9e4_k <= VAR_eval_opcode_uxn_c_l41_c11_d9e4_k;
     -- Outputs
     VAR_eval_opcode_uxn_c_l41_c11_d9e4_return_output := eval_opcode_uxn_c_l41_c11_d9e4_return_output;

     -- opc_MUX[uxn_c_l35_c2_5350] LATENCY=0
     -- Inputs
     opc_MUX_uxn_c_l35_c2_5350_cond <= VAR_opc_MUX_uxn_c_l35_c2_5350_cond;
     opc_MUX_uxn_c_l35_c2_5350_iftrue <= VAR_opc_MUX_uxn_c_l35_c2_5350_iftrue;
     opc_MUX_uxn_c_l35_c2_5350_iffalse <= VAR_opc_MUX_uxn_c_l35_c2_5350_iffalse;
     -- Outputs
     VAR_opc_MUX_uxn_c_l35_c2_5350_return_output := opc_MUX_uxn_c_l35_c2_5350_return_output;

     -- Submodule level 12
     VAR_error_MUX_uxn_c_l35_c2_5350_iftrue := VAR_eval_opcode_uxn_c_l41_c11_d9e4_return_output;
     REG_VAR_opc := VAR_opc_MUX_uxn_c_l35_c2_5350_return_output;
     -- error_MUX[uxn_c_l35_c2_5350] LATENCY=0
     -- Inputs
     error_MUX_uxn_c_l35_c2_5350_cond <= VAR_error_MUX_uxn_c_l35_c2_5350_cond;
     error_MUX_uxn_c_l35_c2_5350_iftrue <= VAR_error_MUX_uxn_c_l35_c2_5350_iftrue;
     error_MUX_uxn_c_l35_c2_5350_iffalse <= VAR_error_MUX_uxn_c_l35_c2_5350_iffalse;
     -- Outputs
     VAR_error_MUX_uxn_c_l35_c2_5350_return_output := error_MUX_uxn_c_l35_c2_5350_return_output;

     -- Submodule level 13
     REG_VAR_error := VAR_error_MUX_uxn_c_l35_c2_5350_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_palette_color_values <= REG_VAR_palette_color_values;
REG_COMB_pixel_counter <= REG_VAR_pixel_counter;
REG_COMB_clock_cycle_counter <= REG_VAR_clock_cycle_counter;
REG_COMB_seconds_counter <= REG_VAR_seconds_counter;
REG_COMB_result <= REG_VAR_result;
REG_COMB_current_pixel_palette_color <= REG_VAR_current_pixel_palette_color;
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
     palette_color_values <= REG_COMB_palette_color_values;
     pixel_counter <= REG_COMB_pixel_counter;
     clock_cycle_counter <= REG_COMB_clock_cycle_counter;
     seconds_counter <= REG_COMB_seconds_counter;
     result <= REG_COMB_result;
     current_pixel_palette_color <= REG_COMB_current_pixel_palette_color;
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
