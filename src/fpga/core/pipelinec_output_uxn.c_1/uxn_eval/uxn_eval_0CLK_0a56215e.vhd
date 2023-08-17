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
entity uxn_eval_0CLK_0a56215e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_0a56215e;
architecture arch of uxn_eval_0CLK_0a56215e is
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
-- pc_get[uxn_c_l29_c7_2336]
signal pc_get_uxn_c_l29_c7_2336_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_c_l29_c7_2336_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l30_c15_cd08]
signal BIN_OP_EQ_uxn_c_l30_c15_cd08_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l30_c15_cd08_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l30_c15_cd08_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l30_c15_9428]
signal MUX_uxn_c_l30_c15_9428_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_9428_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_9428_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_9428_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_c_l31_c17_a5cc]
signal peek_dev_uxn_c_l31_c17_a5cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_c_l31_c17_a5cc_address : unsigned(7 downto 0);
signal peek_dev_uxn_c_l31_c17_a5cc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l32_c22_f3c9]
signal BIN_OP_EQ_uxn_c_l32_c22_f3c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c22_f3c9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c22_f3c9_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l32_c22_7eb5]
signal MUX_uxn_c_l32_c22_7eb5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_7eb5_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_7eb5_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_7eb5_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l33_c16_e3dd]
signal BIN_OP_AND_uxn_c_l33_c16_e3dd_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l33_c16_e3dd_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l33_c16_e3dd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_7296]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l35_c2_f2a5]
signal ins_MUX_uxn_c_l35_c2_f2a5_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l35_c2_f2a5_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l35_c2_f2a5_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l35_c2_f2a5_return_output : unsigned(7 downto 0);

-- error_MUX[uxn_c_l35_c2_f2a5]
signal error_MUX_uxn_c_l35_c2_f2a5_cond : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_f2a5_iftrue : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_f2a5_iffalse : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_f2a5_return_output : unsigned(0 downto 0);

-- opc_MUX[uxn_c_l35_c2_f2a5]
signal opc_MUX_uxn_c_l35_c2_f2a5_cond : unsigned(0 downto 0);
signal opc_MUX_uxn_c_l35_c2_f2a5_iftrue : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l35_c2_f2a5_iffalse : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l35_c2_f2a5_return_output : unsigned(7 downto 0);

-- s_MUX[uxn_c_l35_c2_f2a5]
signal s_MUX_uxn_c_l35_c2_f2a5_cond : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_f2a5_iftrue : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_f2a5_iffalse : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_f2a5_return_output : unsigned(0 downto 0);

-- k_MUX[uxn_c_l35_c2_f2a5]
signal k_MUX_uxn_c_l35_c2_f2a5_cond : unsigned(0 downto 0);
signal k_MUX_uxn_c_l35_c2_f2a5_iftrue : unsigned(7 downto 0);
signal k_MUX_uxn_c_l35_c2_f2a5_iffalse : unsigned(7 downto 0);
signal k_MUX_uxn_c_l35_c2_f2a5_return_output : unsigned(7 downto 0);

-- peek_ram[uxn_c_l36_c9_d714]
signal peek_ram_uxn_c_l36_c9_d714_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_c_l36_c9_d714_address : unsigned(15 downto 0);
signal peek_ram_uxn_c_l36_c9_d714_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l36_c9_d707]
signal BIN_OP_AND_uxn_c_l36_c9_d707_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l36_c9_d707_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l36_c9_d707_return_output : unsigned(7 downto 0);

-- pc_add[uxn_c_l37_c3_c8e9]
signal pc_add_uxn_c_l37_c3_c8e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_c_l37_c3_c8e9_adjustment : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l38_c7_941e]
signal BIN_OP_AND_uxn_c_l38_c7_941e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l38_c7_941e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l38_c7_941e_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l38_c7_ed4c]
signal MUX_uxn_c_l38_c7_ed4c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l38_c7_ed4c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l38_c7_ed4c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l38_c7_ed4c_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l39_c7_66d6]
signal BIN_OP_AND_uxn_c_l39_c7_66d6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_66d6_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_66d6_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l39_c7_5b53]
signal MUX_uxn_c_l39_c7_5b53_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_5b53_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_5b53_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_5b53_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l40_c11_ae41]
signal BIN_OP_AND_uxn_c_l40_c11_ae41_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c11_ae41_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_c_l40_c11_ae41_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l40_c11_ad4f]
signal UNARY_OP_NOT_uxn_c_l40_c11_ad4f_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_c_l40_c11_ad4f_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_c_l40_c31_e33b]
signal CONST_SR_5_uxn_c_l40_c31_e33b_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_c_l40_c31_e33b_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l40_c26_bd85]
signal BIN_OP_MINUS_uxn_c_l40_c26_bd85_left : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l40_c26_bd85_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l40_c26_bd85_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l40_c26_a2a1]
signal BIN_OP_AND_uxn_c_l40_c26_a2a1_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l40_c26_a2a1_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c26_a2a1_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l40_c51_8964]
signal BIN_OP_AND_uxn_c_l40_c51_8964_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c51_8964_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_c_l40_c51_8964_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l40_c11_679b]
signal MUX_uxn_c_l40_c11_679b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l40_c11_679b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l40_c11_679b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l40_c11_679b_return_output : unsigned(7 downto 0);

-- eval_opcode[uxn_c_l41_c11_6c76]
signal eval_opcode_uxn_c_l41_c11_6c76_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l41_c11_6c76_stack_index : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l41_c11_6c76_opcode : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_6c76_ins : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_6c76_k : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_6c76_return_output : unsigned(0 downto 0);

-- screen_ram_update[uxn_c_l44_c32_6ee9]
signal screen_ram_update_uxn_c_l44_c32_6ee9_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_ram_update_uxn_c_l44_c32_6ee9_write_address : unsigned(31 downto 0);
signal screen_ram_update_uxn_c_l44_c32_6ee9_write_value : unsigned(1 downto 0);
signal screen_ram_update_uxn_c_l44_c32_6ee9_read_address : unsigned(31 downto 0);
signal screen_ram_update_uxn_c_l44_c32_6ee9_return_output : unsigned(1 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l50_c22_e372]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l53_c6_5788]
signal BIN_OP_EQ_uxn_c_l53_c6_5788_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l53_c6_5788_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l53_c6_5788_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l53_c2_d688]
signal pixel_counter_MUX_uxn_c_l53_c2_d688_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_d688_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_d688_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_d688_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l56_c3_1244]
signal BIN_OP_PLUS_uxn_c_l56_c3_1244_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l56_c3_1244_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l56_c3_1244_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l60_c6_9003]
signal BIN_OP_EQ_uxn_c_l60_c6_9003_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l60_c6_9003_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l60_c6_9003_return_output : unsigned(0 downto 0);

-- seconds_counter_MUX[uxn_c_l60_c2_b301]
signal seconds_counter_MUX_uxn_c_l60_c2_b301_cond : unsigned(0 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_b301_iftrue : unsigned(31 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_b301_iffalse : unsigned(31 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_b301_return_output : unsigned(31 downto 0);

-- clock_cycle_counter_MUX[uxn_c_l60_c2_b301]
signal clock_cycle_counter_MUX_uxn_c_l60_c2_b301_cond : unsigned(0 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_b301_iftrue : unsigned(31 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_b301_iffalse : unsigned(31 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_b301_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l61_c3_9a9c]
signal BIN_OP_PLUS_uxn_c_l61_c3_9a9c_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l61_c3_9a9c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l61_c3_9a9c_return_output : unsigned(32 downto 0);

-- BIN_OP_PLUS[uxn_c_l64_c3_57f2]
signal BIN_OP_PLUS_uxn_c_l64_c3_57f2_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l64_c3_57f2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l64_c3_57f2_return_output : unsigned(32 downto 0);

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
-- pc_get_uxn_c_l29_c7_2336
pc_get_uxn_c_l29_c7_2336 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_c_l29_c7_2336_CLOCK_ENABLE,
pc_get_uxn_c_l29_c7_2336_return_output);

-- BIN_OP_EQ_uxn_c_l30_c15_cd08
BIN_OP_EQ_uxn_c_l30_c15_cd08 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l30_c15_cd08_left,
BIN_OP_EQ_uxn_c_l30_c15_cd08_right,
BIN_OP_EQ_uxn_c_l30_c15_cd08_return_output);

-- MUX_uxn_c_l30_c15_9428
MUX_uxn_c_l30_c15_9428 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l30_c15_9428_cond,
MUX_uxn_c_l30_c15_9428_iftrue,
MUX_uxn_c_l30_c15_9428_iffalse,
MUX_uxn_c_l30_c15_9428_return_output);

-- peek_dev_uxn_c_l31_c17_a5cc
peek_dev_uxn_c_l31_c17_a5cc : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_c_l31_c17_a5cc_CLOCK_ENABLE,
peek_dev_uxn_c_l31_c17_a5cc_address,
peek_dev_uxn_c_l31_c17_a5cc_return_output);

-- BIN_OP_EQ_uxn_c_l32_c22_f3c9
BIN_OP_EQ_uxn_c_l32_c22_f3c9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l32_c22_f3c9_left,
BIN_OP_EQ_uxn_c_l32_c22_f3c9_right,
BIN_OP_EQ_uxn_c_l32_c22_f3c9_return_output);

-- MUX_uxn_c_l32_c22_7eb5
MUX_uxn_c_l32_c22_7eb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l32_c22_7eb5_cond,
MUX_uxn_c_l32_c22_7eb5_iftrue,
MUX_uxn_c_l32_c22_7eb5_iffalse,
MUX_uxn_c_l32_c22_7eb5_return_output);

-- BIN_OP_AND_uxn_c_l33_c16_e3dd
BIN_OP_AND_uxn_c_l33_c16_e3dd : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l33_c16_e3dd_left,
BIN_OP_AND_uxn_c_l33_c16_e3dd_right,
BIN_OP_AND_uxn_c_l33_c16_e3dd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_return_output);

-- ins_MUX_uxn_c_l35_c2_f2a5
ins_MUX_uxn_c_l35_c2_f2a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l35_c2_f2a5_cond,
ins_MUX_uxn_c_l35_c2_f2a5_iftrue,
ins_MUX_uxn_c_l35_c2_f2a5_iffalse,
ins_MUX_uxn_c_l35_c2_f2a5_return_output);

-- error_MUX_uxn_c_l35_c2_f2a5
error_MUX_uxn_c_l35_c2_f2a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
error_MUX_uxn_c_l35_c2_f2a5_cond,
error_MUX_uxn_c_l35_c2_f2a5_iftrue,
error_MUX_uxn_c_l35_c2_f2a5_iffalse,
error_MUX_uxn_c_l35_c2_f2a5_return_output);

-- opc_MUX_uxn_c_l35_c2_f2a5
opc_MUX_uxn_c_l35_c2_f2a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
opc_MUX_uxn_c_l35_c2_f2a5_cond,
opc_MUX_uxn_c_l35_c2_f2a5_iftrue,
opc_MUX_uxn_c_l35_c2_f2a5_iffalse,
opc_MUX_uxn_c_l35_c2_f2a5_return_output);

-- s_MUX_uxn_c_l35_c2_f2a5
s_MUX_uxn_c_l35_c2_f2a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
s_MUX_uxn_c_l35_c2_f2a5_cond,
s_MUX_uxn_c_l35_c2_f2a5_iftrue,
s_MUX_uxn_c_l35_c2_f2a5_iffalse,
s_MUX_uxn_c_l35_c2_f2a5_return_output);

-- k_MUX_uxn_c_l35_c2_f2a5
k_MUX_uxn_c_l35_c2_f2a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
k_MUX_uxn_c_l35_c2_f2a5_cond,
k_MUX_uxn_c_l35_c2_f2a5_iftrue,
k_MUX_uxn_c_l35_c2_f2a5_iffalse,
k_MUX_uxn_c_l35_c2_f2a5_return_output);

-- peek_ram_uxn_c_l36_c9_d714
peek_ram_uxn_c_l36_c9_d714 : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_c_l36_c9_d714_CLOCK_ENABLE,
peek_ram_uxn_c_l36_c9_d714_address,
peek_ram_uxn_c_l36_c9_d714_return_output);

-- BIN_OP_AND_uxn_c_l36_c9_d707
BIN_OP_AND_uxn_c_l36_c9_d707 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l36_c9_d707_left,
BIN_OP_AND_uxn_c_l36_c9_d707_right,
BIN_OP_AND_uxn_c_l36_c9_d707_return_output);

-- pc_add_uxn_c_l37_c3_c8e9
pc_add_uxn_c_l37_c3_c8e9 : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_c_l37_c3_c8e9_CLOCK_ENABLE,
pc_add_uxn_c_l37_c3_c8e9_adjustment);

-- BIN_OP_AND_uxn_c_l38_c7_941e
BIN_OP_AND_uxn_c_l38_c7_941e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l38_c7_941e_left,
BIN_OP_AND_uxn_c_l38_c7_941e_right,
BIN_OP_AND_uxn_c_l38_c7_941e_return_output);

-- MUX_uxn_c_l38_c7_ed4c
MUX_uxn_c_l38_c7_ed4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l38_c7_ed4c_cond,
MUX_uxn_c_l38_c7_ed4c_iftrue,
MUX_uxn_c_l38_c7_ed4c_iffalse,
MUX_uxn_c_l38_c7_ed4c_return_output);

-- BIN_OP_AND_uxn_c_l39_c7_66d6
BIN_OP_AND_uxn_c_l39_c7_66d6 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l39_c7_66d6_left,
BIN_OP_AND_uxn_c_l39_c7_66d6_right,
BIN_OP_AND_uxn_c_l39_c7_66d6_return_output);

-- MUX_uxn_c_l39_c7_5b53
MUX_uxn_c_l39_c7_5b53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l39_c7_5b53_cond,
MUX_uxn_c_l39_c7_5b53_iftrue,
MUX_uxn_c_l39_c7_5b53_iffalse,
MUX_uxn_c_l39_c7_5b53_return_output);

-- BIN_OP_AND_uxn_c_l40_c11_ae41
BIN_OP_AND_uxn_c_l40_c11_ae41 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c11_ae41_left,
BIN_OP_AND_uxn_c_l40_c11_ae41_right,
BIN_OP_AND_uxn_c_l40_c11_ae41_return_output);

-- UNARY_OP_NOT_uxn_c_l40_c11_ad4f
UNARY_OP_NOT_uxn_c_l40_c11_ad4f : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l40_c11_ad4f_expr,
UNARY_OP_NOT_uxn_c_l40_c11_ad4f_return_output);

-- CONST_SR_5_uxn_c_l40_c31_e33b
CONST_SR_5_uxn_c_l40_c31_e33b : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_c_l40_c31_e33b_x,
CONST_SR_5_uxn_c_l40_c31_e33b_return_output);

-- BIN_OP_MINUS_uxn_c_l40_c26_bd85
BIN_OP_MINUS_uxn_c_l40_c26_bd85 : entity work.BIN_OP_MINUS_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l40_c26_bd85_left,
BIN_OP_MINUS_uxn_c_l40_c26_bd85_right,
BIN_OP_MINUS_uxn_c_l40_c26_bd85_return_output);

-- BIN_OP_AND_uxn_c_l40_c26_a2a1
BIN_OP_AND_uxn_c_l40_c26_a2a1 : entity work.BIN_OP_AND_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c26_a2a1_left,
BIN_OP_AND_uxn_c_l40_c26_a2a1_right,
BIN_OP_AND_uxn_c_l40_c26_a2a1_return_output);

-- BIN_OP_AND_uxn_c_l40_c51_8964
BIN_OP_AND_uxn_c_l40_c51_8964 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c51_8964_left,
BIN_OP_AND_uxn_c_l40_c51_8964_right,
BIN_OP_AND_uxn_c_l40_c51_8964_return_output);

-- MUX_uxn_c_l40_c11_679b
MUX_uxn_c_l40_c11_679b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l40_c11_679b_cond,
MUX_uxn_c_l40_c11_679b_iftrue,
MUX_uxn_c_l40_c11_679b_iffalse,
MUX_uxn_c_l40_c11_679b_return_output);

-- eval_opcode_uxn_c_l41_c11_6c76
eval_opcode_uxn_c_l41_c11_6c76 : entity work.eval_opcode_0CLK_48d3e199 port map (
clk,
eval_opcode_uxn_c_l41_c11_6c76_CLOCK_ENABLE,
eval_opcode_uxn_c_l41_c11_6c76_stack_index,
eval_opcode_uxn_c_l41_c11_6c76_opcode,
eval_opcode_uxn_c_l41_c11_6c76_ins,
eval_opcode_uxn_c_l41_c11_6c76_k,
eval_opcode_uxn_c_l41_c11_6c76_return_output);

-- screen_ram_update_uxn_c_l44_c32_6ee9
screen_ram_update_uxn_c_l44_c32_6ee9 : entity work.screen_ram_update_0CLK_b4ec7bd0 port map (
clk,
screen_ram_update_uxn_c_l44_c32_6ee9_CLOCK_ENABLE,
screen_ram_update_uxn_c_l44_c32_6ee9_write_address,
screen_ram_update_uxn_c_l44_c32_6ee9_write_value,
screen_ram_update_uxn_c_l44_c32_6ee9_read_address,
screen_ram_update_uxn_c_l44_c32_6ee9_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_return_output);

-- BIN_OP_EQ_uxn_c_l53_c6_5788
BIN_OP_EQ_uxn_c_l53_c6_5788 : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l53_c6_5788_left,
BIN_OP_EQ_uxn_c_l53_c6_5788_right,
BIN_OP_EQ_uxn_c_l53_c6_5788_return_output);

-- pixel_counter_MUX_uxn_c_l53_c2_d688
pixel_counter_MUX_uxn_c_l53_c2_d688 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l53_c2_d688_cond,
pixel_counter_MUX_uxn_c_l53_c2_d688_iftrue,
pixel_counter_MUX_uxn_c_l53_c2_d688_iffalse,
pixel_counter_MUX_uxn_c_l53_c2_d688_return_output);

-- BIN_OP_PLUS_uxn_c_l56_c3_1244
BIN_OP_PLUS_uxn_c_l56_c3_1244 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l56_c3_1244_left,
BIN_OP_PLUS_uxn_c_l56_c3_1244_right,
BIN_OP_PLUS_uxn_c_l56_c3_1244_return_output);

-- BIN_OP_EQ_uxn_c_l60_c6_9003
BIN_OP_EQ_uxn_c_l60_c6_9003 : entity work.BIN_OP_EQ_uint32_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l60_c6_9003_left,
BIN_OP_EQ_uxn_c_l60_c6_9003_right,
BIN_OP_EQ_uxn_c_l60_c6_9003_return_output);

-- seconds_counter_MUX_uxn_c_l60_c2_b301
seconds_counter_MUX_uxn_c_l60_c2_b301 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
seconds_counter_MUX_uxn_c_l60_c2_b301_cond,
seconds_counter_MUX_uxn_c_l60_c2_b301_iftrue,
seconds_counter_MUX_uxn_c_l60_c2_b301_iffalse,
seconds_counter_MUX_uxn_c_l60_c2_b301_return_output);

-- clock_cycle_counter_MUX_uxn_c_l60_c2_b301
clock_cycle_counter_MUX_uxn_c_l60_c2_b301 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
clock_cycle_counter_MUX_uxn_c_l60_c2_b301_cond,
clock_cycle_counter_MUX_uxn_c_l60_c2_b301_iftrue,
clock_cycle_counter_MUX_uxn_c_l60_c2_b301_iffalse,
clock_cycle_counter_MUX_uxn_c_l60_c2_b301_return_output);

-- BIN_OP_PLUS_uxn_c_l61_c3_9a9c
BIN_OP_PLUS_uxn_c_l61_c3_9a9c : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l61_c3_9a9c_left,
BIN_OP_PLUS_uxn_c_l61_c3_9a9c_right,
BIN_OP_PLUS_uxn_c_l61_c3_9a9c_return_output);

-- BIN_OP_PLUS_uxn_c_l64_c3_57f2
BIN_OP_PLUS_uxn_c_l64_c3_57f2 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l64_c3_57f2_left,
BIN_OP_PLUS_uxn_c_l64_c3_57f2_right,
BIN_OP_PLUS_uxn_c_l64_c3_57f2_return_output);



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
 pc_get_uxn_c_l29_c7_2336_return_output,
 BIN_OP_EQ_uxn_c_l30_c15_cd08_return_output,
 MUX_uxn_c_l30_c15_9428_return_output,
 peek_dev_uxn_c_l31_c17_a5cc_return_output,
 BIN_OP_EQ_uxn_c_l32_c22_f3c9_return_output,
 MUX_uxn_c_l32_c22_7eb5_return_output,
 BIN_OP_AND_uxn_c_l33_c16_e3dd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_return_output,
 ins_MUX_uxn_c_l35_c2_f2a5_return_output,
 error_MUX_uxn_c_l35_c2_f2a5_return_output,
 opc_MUX_uxn_c_l35_c2_f2a5_return_output,
 s_MUX_uxn_c_l35_c2_f2a5_return_output,
 k_MUX_uxn_c_l35_c2_f2a5_return_output,
 peek_ram_uxn_c_l36_c9_d714_return_output,
 BIN_OP_AND_uxn_c_l36_c9_d707_return_output,
 BIN_OP_AND_uxn_c_l38_c7_941e_return_output,
 MUX_uxn_c_l38_c7_ed4c_return_output,
 BIN_OP_AND_uxn_c_l39_c7_66d6_return_output,
 MUX_uxn_c_l39_c7_5b53_return_output,
 BIN_OP_AND_uxn_c_l40_c11_ae41_return_output,
 UNARY_OP_NOT_uxn_c_l40_c11_ad4f_return_output,
 CONST_SR_5_uxn_c_l40_c31_e33b_return_output,
 BIN_OP_MINUS_uxn_c_l40_c26_bd85_return_output,
 BIN_OP_AND_uxn_c_l40_c26_a2a1_return_output,
 BIN_OP_AND_uxn_c_l40_c51_8964_return_output,
 MUX_uxn_c_l40_c11_679b_return_output,
 eval_opcode_uxn_c_l41_c11_6c76_return_output,
 screen_ram_update_uxn_c_l44_c32_6ee9_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_return_output,
 BIN_OP_EQ_uxn_c_l53_c6_5788_return_output,
 pixel_counter_MUX_uxn_c_l53_c2_d688_return_output,
 BIN_OP_PLUS_uxn_c_l56_c3_1244_return_output,
 BIN_OP_EQ_uxn_c_l60_c6_9003_return_output,
 seconds_counter_MUX_uxn_c_l60_c2_b301_return_output,
 clock_cycle_counter_MUX_uxn_c_l60_c2_b301_return_output,
 BIN_OP_PLUS_uxn_c_l61_c3_9a9c_return_output,
 BIN_OP_PLUS_uxn_c_l64_c3_57f2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_c_l29_c7_2336_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_c_l29_c7_2336_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_9428_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_9428_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_9428_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_cd08_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_cd08_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_cd08_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_9428_return_output : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_c_l31_c17_a5cc_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_c_l31_c17_a5cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_c_l31_c17_a5cc_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_7eb5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_7eb5_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_7eb5_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_f3c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_f3c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_f3c9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_7eb5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_f2a5_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_f2a5_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_f2a5_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_f2a5_cond : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_f2a5_iftrue : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_f2a5_iffalse : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_f2a5_return_output : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_f2a5_cond : unsigned(0 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_f2a5_iftrue : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_f2a5_iffalse : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_f2a5_return_output : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_f2a5_cond : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_f2a5_iftrue : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_f2a5_iffalse : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_f2a5_return_output : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_f2a5_cond : unsigned(0 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_f2a5_iftrue : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_f2a5_iffalse : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_f2a5_return_output : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_f2a5_cond : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_d714_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_d707_left : unsigned(7 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_d714_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_d714_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_d707_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_d707_return_output : unsigned(7 downto 0);
 variable VAR_pc_add_uxn_c_l37_c3_c8e9_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_c_l37_c3_c8e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_ed4c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_ed4c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_ed4c_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_941e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_941e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_941e_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_ed4c_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_5b53_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_5b53_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_5b53_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_66d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_66d6_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_66d6_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_5b53_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_679b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_679b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_679b_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_ae41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_ae41_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_ae41_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l40_c11_ad4f_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l40_c11_ad4f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_bd85_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_bd85_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l40_c31_e33b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l40_c31_e33b_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_bd85_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_a2a1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_a2a1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_a2a1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_8964_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_8964_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_8964_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_679b_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_6c76_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_6c76_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_6c76_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_6c76_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_6c76_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_6c76_return_output : unsigned(0 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_6ee9_write_address : unsigned(31 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_6ee9_write_value : unsigned(1 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_6ee9_read_address : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l46_c3_4319_return_output : unsigned(1 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_6ee9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_6ee9_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_ref_toks_0 : uint12_t_4;
 variable VAR_CAST_TO_uint16_t_uxn_c_l50_c11_53ea_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_5788_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_5788_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_5788_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_d688_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l54_c3_3a15 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_d688_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l56_c3_1bf9 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_d688_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_d688_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_1244_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_1244_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_1244_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_9003_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_9003_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_9003_return_output : unsigned(0 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_b301_iftrue : unsigned(31 downto 0);
 variable VAR_seconds_counter_uxn_c_l61_c3_103e : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_b301_iffalse : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_b301_return_output : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_b301_cond : unsigned(0 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_b301_iftrue : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_uxn_c_l62_c3_bcb9 : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_b301_iffalse : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_uxn_c_l64_c3_afbb : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_b301_return_output : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_b301_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_9a9c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_9a9c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_9a9c_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_57f2_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_57f2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_57f2_return_output : unsigned(32 downto 0);
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
     VAR_BIN_OP_AND_uxn_c_l39_c7_66d6_right := to_unsigned(64, 7);
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_57f2_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l39_c7_5b53_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l53_c6_5788_right := to_unsigned(204799, 18);
     VAR_MUX_uxn_c_l32_c22_7eb5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_9a9c_right := to_unsigned(1, 1);
     VAR_peek_dev_uxn_c_l31_c17_a5cc_address := resize(to_unsigned(15, 4), 8);
     VAR_BIN_OP_AND_uxn_c_l36_c9_d707_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l40_c51_8964_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_c_l30_c15_cd08_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_1244_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l60_c6_9003_right := to_unsigned(12287998, 24);
     VAR_error_MUX_uxn_c_l35_c2_f2a5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l38_c7_941e_right := to_unsigned(128, 8);
     VAR_pc_add_uxn_c_l37_c3_c8e9_adjustment := resize(to_unsigned(1, 1), 16);
     VAR_pixel_counter_uxn_c_l54_c3_3a15 := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l53_c2_d688_iftrue := VAR_pixel_counter_uxn_c_l54_c3_3a15;
     VAR_MUX_uxn_c_l32_c22_7eb5_iffalse := to_unsigned(0, 1);
     VAR_clock_cycle_counter_uxn_c_l62_c3_bcb9 := resize(to_unsigned(0, 1), 32);
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_b301_iftrue := VAR_clock_cycle_counter_uxn_c_l62_c3_bcb9;
     VAR_MUX_uxn_c_l30_c15_9428_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l32_c22_f3c9_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_bd85_left := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l30_c15_9428_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l39_c7_5b53_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l40_c26_a2a1_right := to_unsigned(255, 8);
     VAR_MUX_uxn_c_l38_c7_ed4c_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_c_l38_c7_ed4c_iftrue := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l40_c11_ae41_right := to_unsigned(31, 5);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_iftrue := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_c_l29_c7_2336_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_peek_dev_uxn_c_l31_c17_a5cc_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_screen_ram_update_uxn_c_l44_c32_6ee9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l60_c6_9003_left := clock_cycle_counter;
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_57f2_left := clock_cycle_counter;
     VAR_ins_MUX_uxn_c_l35_c2_f2a5_iffalse := ins;
     VAR_k_MUX_uxn_c_l35_c2_f2a5_iffalse := k;
     VAR_opc_MUX_uxn_c_l35_c2_f2a5_iffalse := opc;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_ref_toks_0 := palette_color_values;
     REG_VAR_palette_color_values := palette_color_values;
     VAR_BIN_OP_EQ_uxn_c_l53_c6_5788_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_1244_left := pixel_counter;
     VAR_screen_ram_update_uxn_c_l44_c32_6ee9_read_address := pixel_counter;
     VAR_screen_ram_update_uxn_c_l44_c32_6ee9_write_address := pixel_counter;
     VAR_s_MUX_uxn_c_l35_c2_f2a5_iffalse := s;
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_9a9c_left := seconds_counter;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_b301_iffalse := seconds_counter;
     -- BIN_OP_PLUS[uxn_c_l56_c3_1244] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l56_c3_1244_left <= VAR_BIN_OP_PLUS_uxn_c_l56_c3_1244_left;
     BIN_OP_PLUS_uxn_c_l56_c3_1244_right <= VAR_BIN_OP_PLUS_uxn_c_l56_c3_1244_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_1244_return_output := BIN_OP_PLUS_uxn_c_l56_c3_1244_return_output;

     -- CAST_TO_uint2_t[uxn_c_l46_c3_4319] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l46_c3_4319_return_output := CAST_TO_uint2_t_uint32_t(
     seconds_counter);

     -- BIN_OP_PLUS[uxn_c_l61_c3_9a9c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l61_c3_9a9c_left <= VAR_BIN_OP_PLUS_uxn_c_l61_c3_9a9c_left;
     BIN_OP_PLUS_uxn_c_l61_c3_9a9c_right <= VAR_BIN_OP_PLUS_uxn_c_l61_c3_9a9c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_9a9c_return_output := BIN_OP_PLUS_uxn_c_l61_c3_9a9c_return_output;

     -- pc_get[uxn_c_l29_c7_2336] LATENCY=0
     -- Clock enable
     pc_get_uxn_c_l29_c7_2336_CLOCK_ENABLE <= VAR_pc_get_uxn_c_l29_c7_2336_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_c_l29_c7_2336_return_output := pc_get_uxn_c_l29_c7_2336_return_output;

     -- BIN_OP_PLUS[uxn_c_l64_c3_57f2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l64_c3_57f2_left <= VAR_BIN_OP_PLUS_uxn_c_l64_c3_57f2_left;
     BIN_OP_PLUS_uxn_c_l64_c3_57f2_right <= VAR_BIN_OP_PLUS_uxn_c_l64_c3_57f2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_57f2_return_output := BIN_OP_PLUS_uxn_c_l64_c3_57f2_return_output;

     -- peek_dev[uxn_c_l31_c17_a5cc] LATENCY=0
     -- Clock enable
     peek_dev_uxn_c_l31_c17_a5cc_CLOCK_ENABLE <= VAR_peek_dev_uxn_c_l31_c17_a5cc_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_c_l31_c17_a5cc_address <= VAR_peek_dev_uxn_c_l31_c17_a5cc_address;
     -- Outputs
     VAR_peek_dev_uxn_c_l31_c17_a5cc_return_output := peek_dev_uxn_c_l31_c17_a5cc_return_output;

     -- BIN_OP_EQ[uxn_c_l53_c6_5788] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l53_c6_5788_left <= VAR_BIN_OP_EQ_uxn_c_l53_c6_5788_left;
     BIN_OP_EQ_uxn_c_l53_c6_5788_right <= VAR_BIN_OP_EQ_uxn_c_l53_c6_5788_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l53_c6_5788_return_output := BIN_OP_EQ_uxn_c_l53_c6_5788_return_output;

     -- BIN_OP_EQ[uxn_c_l60_c6_9003] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l60_c6_9003_left <= VAR_BIN_OP_EQ_uxn_c_l60_c6_9003_left;
     BIN_OP_EQ_uxn_c_l60_c6_9003_right <= VAR_BIN_OP_EQ_uxn_c_l60_c6_9003_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l60_c6_9003_return_output := BIN_OP_EQ_uxn_c_l60_c6_9003_return_output;

     -- Submodule level 1
     VAR_pixel_counter_MUX_uxn_c_l53_c2_d688_cond := VAR_BIN_OP_EQ_uxn_c_l53_c6_5788_return_output;
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_b301_cond := VAR_BIN_OP_EQ_uxn_c_l60_c6_9003_return_output;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_b301_cond := VAR_BIN_OP_EQ_uxn_c_l60_c6_9003_return_output;
     VAR_pixel_counter_uxn_c_l56_c3_1bf9 := resize(VAR_BIN_OP_PLUS_uxn_c_l56_c3_1244_return_output, 32);
     VAR_seconds_counter_uxn_c_l61_c3_103e := resize(VAR_BIN_OP_PLUS_uxn_c_l61_c3_9a9c_return_output, 32);
     VAR_clock_cycle_counter_uxn_c_l64_c3_afbb := resize(VAR_BIN_OP_PLUS_uxn_c_l64_c3_57f2_return_output, 32);
     VAR_screen_ram_update_uxn_c_l44_c32_6ee9_write_value := VAR_CAST_TO_uint2_t_uxn_c_l46_c3_4319_return_output;
     VAR_BIN_OP_EQ_uxn_c_l30_c15_cd08_left := VAR_pc_get_uxn_c_l29_c7_2336_return_output;
     REG_VAR_pc := VAR_pc_get_uxn_c_l29_c7_2336_return_output;
     VAR_peek_ram_uxn_c_l36_c9_d714_address := VAR_pc_get_uxn_c_l29_c7_2336_return_output;
     VAR_BIN_OP_EQ_uxn_c_l32_c22_f3c9_left := VAR_peek_dev_uxn_c_l31_c17_a5cc_return_output;
     REG_VAR_system_state := VAR_peek_dev_uxn_c_l31_c17_a5cc_return_output;
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_b301_iffalse := VAR_clock_cycle_counter_uxn_c_l64_c3_afbb;
     VAR_pixel_counter_MUX_uxn_c_l53_c2_d688_iffalse := VAR_pixel_counter_uxn_c_l56_c3_1bf9;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_b301_iftrue := VAR_seconds_counter_uxn_c_l61_c3_103e;
     -- pixel_counter_MUX[uxn_c_l53_c2_d688] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l53_c2_d688_cond <= VAR_pixel_counter_MUX_uxn_c_l53_c2_d688_cond;
     pixel_counter_MUX_uxn_c_l53_c2_d688_iftrue <= VAR_pixel_counter_MUX_uxn_c_l53_c2_d688_iftrue;
     pixel_counter_MUX_uxn_c_l53_c2_d688_iffalse <= VAR_pixel_counter_MUX_uxn_c_l53_c2_d688_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l53_c2_d688_return_output := pixel_counter_MUX_uxn_c_l53_c2_d688_return_output;

     -- screen_ram_update[uxn_c_l44_c32_6ee9] LATENCY=0
     -- Clock enable
     screen_ram_update_uxn_c_l44_c32_6ee9_CLOCK_ENABLE <= VAR_screen_ram_update_uxn_c_l44_c32_6ee9_CLOCK_ENABLE;
     -- Inputs
     screen_ram_update_uxn_c_l44_c32_6ee9_write_address <= VAR_screen_ram_update_uxn_c_l44_c32_6ee9_write_address;
     screen_ram_update_uxn_c_l44_c32_6ee9_write_value <= VAR_screen_ram_update_uxn_c_l44_c32_6ee9_write_value;
     screen_ram_update_uxn_c_l44_c32_6ee9_read_address <= VAR_screen_ram_update_uxn_c_l44_c32_6ee9_read_address;
     -- Outputs
     VAR_screen_ram_update_uxn_c_l44_c32_6ee9_return_output := screen_ram_update_uxn_c_l44_c32_6ee9_return_output;

     -- BIN_OP_EQ[uxn_c_l30_c15_cd08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l30_c15_cd08_left <= VAR_BIN_OP_EQ_uxn_c_l30_c15_cd08_left;
     BIN_OP_EQ_uxn_c_l30_c15_cd08_right <= VAR_BIN_OP_EQ_uxn_c_l30_c15_cd08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l30_c15_cd08_return_output := BIN_OP_EQ_uxn_c_l30_c15_cd08_return_output;

     -- seconds_counter_MUX[uxn_c_l60_c2_b301] LATENCY=0
     -- Inputs
     seconds_counter_MUX_uxn_c_l60_c2_b301_cond <= VAR_seconds_counter_MUX_uxn_c_l60_c2_b301_cond;
     seconds_counter_MUX_uxn_c_l60_c2_b301_iftrue <= VAR_seconds_counter_MUX_uxn_c_l60_c2_b301_iftrue;
     seconds_counter_MUX_uxn_c_l60_c2_b301_iffalse <= VAR_seconds_counter_MUX_uxn_c_l60_c2_b301_iffalse;
     -- Outputs
     VAR_seconds_counter_MUX_uxn_c_l60_c2_b301_return_output := seconds_counter_MUX_uxn_c_l60_c2_b301_return_output;

     -- clock_cycle_counter_MUX[uxn_c_l60_c2_b301] LATENCY=0
     -- Inputs
     clock_cycle_counter_MUX_uxn_c_l60_c2_b301_cond <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_b301_cond;
     clock_cycle_counter_MUX_uxn_c_l60_c2_b301_iftrue <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_b301_iftrue;
     clock_cycle_counter_MUX_uxn_c_l60_c2_b301_iffalse <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_b301_iffalse;
     -- Outputs
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_b301_return_output := clock_cycle_counter_MUX_uxn_c_l60_c2_b301_return_output;

     -- BIN_OP_EQ[uxn_c_l32_c22_f3c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l32_c22_f3c9_left <= VAR_BIN_OP_EQ_uxn_c_l32_c22_f3c9_left;
     BIN_OP_EQ_uxn_c_l32_c22_f3c9_right <= VAR_BIN_OP_EQ_uxn_c_l32_c22_f3c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l32_c22_f3c9_return_output := BIN_OP_EQ_uxn_c_l32_c22_f3c9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l30_c15_9428_cond := VAR_BIN_OP_EQ_uxn_c_l30_c15_cd08_return_output;
     VAR_MUX_uxn_c_l32_c22_7eb5_cond := VAR_BIN_OP_EQ_uxn_c_l32_c22_f3c9_return_output;
     REG_VAR_clock_cycle_counter := VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_b301_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l53_c2_d688_return_output;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_var_dim_0 := VAR_screen_ram_update_uxn_c_l44_c32_6ee9_return_output;
     REG_VAR_current_pixel_palette_color := VAR_screen_ram_update_uxn_c_l44_c32_6ee9_return_output;
     REG_VAR_seconds_counter := VAR_seconds_counter_MUX_uxn_c_l60_c2_b301_return_output;
     -- MUX[uxn_c_l30_c15_9428] LATENCY=0
     -- Inputs
     MUX_uxn_c_l30_c15_9428_cond <= VAR_MUX_uxn_c_l30_c15_9428_cond;
     MUX_uxn_c_l30_c15_9428_iftrue <= VAR_MUX_uxn_c_l30_c15_9428_iftrue;
     MUX_uxn_c_l30_c15_9428_iffalse <= VAR_MUX_uxn_c_l30_c15_9428_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l30_c15_9428_return_output := MUX_uxn_c_l30_c15_9428_return_output;

     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l50_c22_e372] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_return_output;

     -- MUX[uxn_c_l32_c22_7eb5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l32_c22_7eb5_cond <= VAR_MUX_uxn_c_l32_c22_7eb5_cond;
     MUX_uxn_c_l32_c22_7eb5_iftrue <= VAR_MUX_uxn_c_l32_c22_7eb5_iftrue;
     MUX_uxn_c_l32_c22_7eb5_iffalse <= VAR_MUX_uxn_c_l32_c22_7eb5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l32_c22_7eb5_return_output := MUX_uxn_c_l32_c22_7eb5_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_left := VAR_MUX_uxn_c_l30_c15_9428_return_output;
     REG_VAR_pc_nonzero := VAR_MUX_uxn_c_l30_c15_9428_return_output;
     VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_right := VAR_MUX_uxn_c_l32_c22_7eb5_return_output;
     REG_VAR_system_state_zero := VAR_MUX_uxn_c_l32_c22_7eb5_return_output;
     -- CAST_TO_uint16_t[uxn_c_l50_c11_53ea] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_c_l50_c11_53ea_return_output := CAST_TO_uint16_t_uint12_t(
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_e372_return_output);

     -- BIN_OP_AND[uxn_c_l33_c16_e3dd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l33_c16_e3dd_left <= VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_left;
     BIN_OP_AND_uxn_c_l33_c16_e3dd_right <= VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_return_output := BIN_OP_AND_uxn_c_l33_c16_e3dd_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_return_output;
     VAR_error_MUX_uxn_c_l35_c2_f2a5_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_return_output;
     VAR_ins_MUX_uxn_c_l35_c2_f2a5_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_return_output;
     VAR_k_MUX_uxn_c_l35_c2_f2a5_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_return_output;
     VAR_opc_MUX_uxn_c_l35_c2_f2a5_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_return_output;
     VAR_s_MUX_uxn_c_l35_c2_f2a5_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_return_output;
     REG_VAR_should_eval := VAR_BIN_OP_AND_uxn_c_l33_c16_e3dd_return_output;
     REG_VAR_result := VAR_CAST_TO_uint16_t_uxn_c_l50_c11_53ea_return_output;
     VAR_return_output := VAR_CAST_TO_uint16_t_uxn_c_l50_c11_53ea_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_7296] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_return_output;

     -- Submodule level 5
     VAR_eval_opcode_uxn_c_l41_c11_6c76_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_return_output;
     VAR_pc_add_uxn_c_l37_c3_c8e9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_return_output;
     VAR_peek_ram_uxn_c_l36_c9_d714_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_7296_return_output;
     -- pc_add[uxn_c_l37_c3_c8e9] LATENCY=0
     -- Clock enable
     pc_add_uxn_c_l37_c3_c8e9_CLOCK_ENABLE <= VAR_pc_add_uxn_c_l37_c3_c8e9_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_c_l37_c3_c8e9_adjustment <= VAR_pc_add_uxn_c_l37_c3_c8e9_adjustment;
     -- Outputs

     -- peek_ram[uxn_c_l36_c9_d714] LATENCY=0
     -- Clock enable
     peek_ram_uxn_c_l36_c9_d714_CLOCK_ENABLE <= VAR_peek_ram_uxn_c_l36_c9_d714_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_c_l36_c9_d714_address <= VAR_peek_ram_uxn_c_l36_c9_d714_address;
     -- Outputs
     VAR_peek_ram_uxn_c_l36_c9_d714_return_output := peek_ram_uxn_c_l36_c9_d714_return_output;

     -- Submodule level 6
     VAR_BIN_OP_AND_uxn_c_l36_c9_d707_left := VAR_peek_ram_uxn_c_l36_c9_d714_return_output;
     -- BIN_OP_AND[uxn_c_l36_c9_d707] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l36_c9_d707_left <= VAR_BIN_OP_AND_uxn_c_l36_c9_d707_left;
     BIN_OP_AND_uxn_c_l36_c9_d707_right <= VAR_BIN_OP_AND_uxn_c_l36_c9_d707_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l36_c9_d707_return_output := BIN_OP_AND_uxn_c_l36_c9_d707_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l38_c7_941e_left := VAR_BIN_OP_AND_uxn_c_l36_c9_d707_return_output;
     VAR_BIN_OP_AND_uxn_c_l39_c7_66d6_left := VAR_BIN_OP_AND_uxn_c_l36_c9_d707_return_output;
     VAR_BIN_OP_AND_uxn_c_l40_c11_ae41_left := VAR_BIN_OP_AND_uxn_c_l36_c9_d707_return_output;
     VAR_BIN_OP_AND_uxn_c_l40_c51_8964_left := VAR_BIN_OP_AND_uxn_c_l36_c9_d707_return_output;
     VAR_CONST_SR_5_uxn_c_l40_c31_e33b_x := VAR_BIN_OP_AND_uxn_c_l36_c9_d707_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_6c76_ins := VAR_BIN_OP_AND_uxn_c_l36_c9_d707_return_output;
     VAR_ins_MUX_uxn_c_l35_c2_f2a5_iftrue := VAR_BIN_OP_AND_uxn_c_l36_c9_d707_return_output;
     -- BIN_OP_AND[uxn_c_l38_c7_941e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l38_c7_941e_left <= VAR_BIN_OP_AND_uxn_c_l38_c7_941e_left;
     BIN_OP_AND_uxn_c_l38_c7_941e_right <= VAR_BIN_OP_AND_uxn_c_l38_c7_941e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l38_c7_941e_return_output := BIN_OP_AND_uxn_c_l38_c7_941e_return_output;

     -- BIN_OP_AND[uxn_c_l39_c7_66d6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l39_c7_66d6_left <= VAR_BIN_OP_AND_uxn_c_l39_c7_66d6_left;
     BIN_OP_AND_uxn_c_l39_c7_66d6_right <= VAR_BIN_OP_AND_uxn_c_l39_c7_66d6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l39_c7_66d6_return_output := BIN_OP_AND_uxn_c_l39_c7_66d6_return_output;

     -- BIN_OP_AND[uxn_c_l40_c51_8964] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c51_8964_left <= VAR_BIN_OP_AND_uxn_c_l40_c51_8964_left;
     BIN_OP_AND_uxn_c_l40_c51_8964_right <= VAR_BIN_OP_AND_uxn_c_l40_c51_8964_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c51_8964_return_output := BIN_OP_AND_uxn_c_l40_c51_8964_return_output;

     -- ins_MUX[uxn_c_l35_c2_f2a5] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l35_c2_f2a5_cond <= VAR_ins_MUX_uxn_c_l35_c2_f2a5_cond;
     ins_MUX_uxn_c_l35_c2_f2a5_iftrue <= VAR_ins_MUX_uxn_c_l35_c2_f2a5_iftrue;
     ins_MUX_uxn_c_l35_c2_f2a5_iffalse <= VAR_ins_MUX_uxn_c_l35_c2_f2a5_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l35_c2_f2a5_return_output := ins_MUX_uxn_c_l35_c2_f2a5_return_output;

     -- BIN_OP_AND[uxn_c_l40_c11_ae41] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c11_ae41_left <= VAR_BIN_OP_AND_uxn_c_l40_c11_ae41_left;
     BIN_OP_AND_uxn_c_l40_c11_ae41_right <= VAR_BIN_OP_AND_uxn_c_l40_c11_ae41_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c11_ae41_return_output := BIN_OP_AND_uxn_c_l40_c11_ae41_return_output;

     -- CONST_SR_5[uxn_c_l40_c31_e33b] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_c_l40_c31_e33b_x <= VAR_CONST_SR_5_uxn_c_l40_c31_e33b_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_c_l40_c31_e33b_return_output := CONST_SR_5_uxn_c_l40_c31_e33b_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l38_c7_ed4c_cond := resize(VAR_BIN_OP_AND_uxn_c_l38_c7_941e_return_output, 1);
     VAR_MUX_uxn_c_l39_c7_5b53_cond := resize(VAR_BIN_OP_AND_uxn_c_l39_c7_66d6_return_output, 1);
     VAR_UNARY_OP_NOT_uxn_c_l40_c11_ad4f_expr := VAR_BIN_OP_AND_uxn_c_l40_c11_ae41_return_output;
     VAR_MUX_uxn_c_l40_c11_679b_iffalse := VAR_BIN_OP_AND_uxn_c_l40_c51_8964_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_bd85_right := VAR_CONST_SR_5_uxn_c_l40_c31_e33b_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l35_c2_f2a5_return_output;
     -- UNARY_OP_NOT[uxn_c_l40_c11_ad4f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l40_c11_ad4f_expr <= VAR_UNARY_OP_NOT_uxn_c_l40_c11_ad4f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l40_c11_ad4f_return_output := UNARY_OP_NOT_uxn_c_l40_c11_ad4f_return_output;

     -- MUX[uxn_c_l39_c7_5b53] LATENCY=0
     -- Inputs
     MUX_uxn_c_l39_c7_5b53_cond <= VAR_MUX_uxn_c_l39_c7_5b53_cond;
     MUX_uxn_c_l39_c7_5b53_iftrue <= VAR_MUX_uxn_c_l39_c7_5b53_iftrue;
     MUX_uxn_c_l39_c7_5b53_iffalse <= VAR_MUX_uxn_c_l39_c7_5b53_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l39_c7_5b53_return_output := MUX_uxn_c_l39_c7_5b53_return_output;

     -- MUX[uxn_c_l38_c7_ed4c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l38_c7_ed4c_cond <= VAR_MUX_uxn_c_l38_c7_ed4c_cond;
     MUX_uxn_c_l38_c7_ed4c_iftrue <= VAR_MUX_uxn_c_l38_c7_ed4c_iftrue;
     MUX_uxn_c_l38_c7_ed4c_iffalse <= VAR_MUX_uxn_c_l38_c7_ed4c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l38_c7_ed4c_return_output := MUX_uxn_c_l38_c7_ed4c_return_output;

     -- BIN_OP_MINUS[uxn_c_l40_c26_bd85] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l40_c26_bd85_left <= VAR_BIN_OP_MINUS_uxn_c_l40_c26_bd85_left;
     BIN_OP_MINUS_uxn_c_l40_c26_bd85_right <= VAR_BIN_OP_MINUS_uxn_c_l40_c26_bd85_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_bd85_return_output := BIN_OP_MINUS_uxn_c_l40_c26_bd85_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l40_c26_a2a1_left := VAR_BIN_OP_MINUS_uxn_c_l40_c26_bd85_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_6c76_k := VAR_MUX_uxn_c_l38_c7_ed4c_return_output;
     VAR_k_MUX_uxn_c_l35_c2_f2a5_iftrue := VAR_MUX_uxn_c_l38_c7_ed4c_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_6c76_stack_index := VAR_MUX_uxn_c_l39_c7_5b53_return_output;
     VAR_s_MUX_uxn_c_l35_c2_f2a5_iftrue := VAR_MUX_uxn_c_l39_c7_5b53_return_output;
     VAR_MUX_uxn_c_l40_c11_679b_cond := resize(VAR_UNARY_OP_NOT_uxn_c_l40_c11_ad4f_return_output, 1);
     -- k_MUX[uxn_c_l35_c2_f2a5] LATENCY=0
     -- Inputs
     k_MUX_uxn_c_l35_c2_f2a5_cond <= VAR_k_MUX_uxn_c_l35_c2_f2a5_cond;
     k_MUX_uxn_c_l35_c2_f2a5_iftrue <= VAR_k_MUX_uxn_c_l35_c2_f2a5_iftrue;
     k_MUX_uxn_c_l35_c2_f2a5_iffalse <= VAR_k_MUX_uxn_c_l35_c2_f2a5_iffalse;
     -- Outputs
     VAR_k_MUX_uxn_c_l35_c2_f2a5_return_output := k_MUX_uxn_c_l35_c2_f2a5_return_output;

     -- BIN_OP_AND[uxn_c_l40_c26_a2a1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c26_a2a1_left <= VAR_BIN_OP_AND_uxn_c_l40_c26_a2a1_left;
     BIN_OP_AND_uxn_c_l40_c26_a2a1_right <= VAR_BIN_OP_AND_uxn_c_l40_c26_a2a1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c26_a2a1_return_output := BIN_OP_AND_uxn_c_l40_c26_a2a1_return_output;

     -- s_MUX[uxn_c_l35_c2_f2a5] LATENCY=0
     -- Inputs
     s_MUX_uxn_c_l35_c2_f2a5_cond <= VAR_s_MUX_uxn_c_l35_c2_f2a5_cond;
     s_MUX_uxn_c_l35_c2_f2a5_iftrue <= VAR_s_MUX_uxn_c_l35_c2_f2a5_iftrue;
     s_MUX_uxn_c_l35_c2_f2a5_iffalse <= VAR_s_MUX_uxn_c_l35_c2_f2a5_iffalse;
     -- Outputs
     VAR_s_MUX_uxn_c_l35_c2_f2a5_return_output := s_MUX_uxn_c_l35_c2_f2a5_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l40_c11_679b_iftrue := VAR_BIN_OP_AND_uxn_c_l40_c26_a2a1_return_output;
     REG_VAR_k := VAR_k_MUX_uxn_c_l35_c2_f2a5_return_output;
     REG_VAR_s := VAR_s_MUX_uxn_c_l35_c2_f2a5_return_output;
     -- MUX[uxn_c_l40_c11_679b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l40_c11_679b_cond <= VAR_MUX_uxn_c_l40_c11_679b_cond;
     MUX_uxn_c_l40_c11_679b_iftrue <= VAR_MUX_uxn_c_l40_c11_679b_iftrue;
     MUX_uxn_c_l40_c11_679b_iffalse <= VAR_MUX_uxn_c_l40_c11_679b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l40_c11_679b_return_output := MUX_uxn_c_l40_c11_679b_return_output;

     -- Submodule level 11
     VAR_eval_opcode_uxn_c_l41_c11_6c76_opcode := VAR_MUX_uxn_c_l40_c11_679b_return_output;
     VAR_opc_MUX_uxn_c_l35_c2_f2a5_iftrue := VAR_MUX_uxn_c_l40_c11_679b_return_output;
     -- eval_opcode[uxn_c_l41_c11_6c76] LATENCY=0
     -- Clock enable
     eval_opcode_uxn_c_l41_c11_6c76_CLOCK_ENABLE <= VAR_eval_opcode_uxn_c_l41_c11_6c76_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_uxn_c_l41_c11_6c76_stack_index <= VAR_eval_opcode_uxn_c_l41_c11_6c76_stack_index;
     eval_opcode_uxn_c_l41_c11_6c76_opcode <= VAR_eval_opcode_uxn_c_l41_c11_6c76_opcode;
     eval_opcode_uxn_c_l41_c11_6c76_ins <= VAR_eval_opcode_uxn_c_l41_c11_6c76_ins;
     eval_opcode_uxn_c_l41_c11_6c76_k <= VAR_eval_opcode_uxn_c_l41_c11_6c76_k;
     -- Outputs
     VAR_eval_opcode_uxn_c_l41_c11_6c76_return_output := eval_opcode_uxn_c_l41_c11_6c76_return_output;

     -- opc_MUX[uxn_c_l35_c2_f2a5] LATENCY=0
     -- Inputs
     opc_MUX_uxn_c_l35_c2_f2a5_cond <= VAR_opc_MUX_uxn_c_l35_c2_f2a5_cond;
     opc_MUX_uxn_c_l35_c2_f2a5_iftrue <= VAR_opc_MUX_uxn_c_l35_c2_f2a5_iftrue;
     opc_MUX_uxn_c_l35_c2_f2a5_iffalse <= VAR_opc_MUX_uxn_c_l35_c2_f2a5_iffalse;
     -- Outputs
     VAR_opc_MUX_uxn_c_l35_c2_f2a5_return_output := opc_MUX_uxn_c_l35_c2_f2a5_return_output;

     -- Submodule level 12
     VAR_error_MUX_uxn_c_l35_c2_f2a5_iftrue := VAR_eval_opcode_uxn_c_l41_c11_6c76_return_output;
     REG_VAR_opc := VAR_opc_MUX_uxn_c_l35_c2_f2a5_return_output;
     -- error_MUX[uxn_c_l35_c2_f2a5] LATENCY=0
     -- Inputs
     error_MUX_uxn_c_l35_c2_f2a5_cond <= VAR_error_MUX_uxn_c_l35_c2_f2a5_cond;
     error_MUX_uxn_c_l35_c2_f2a5_iftrue <= VAR_error_MUX_uxn_c_l35_c2_f2a5_iftrue;
     error_MUX_uxn_c_l35_c2_f2a5_iffalse <= VAR_error_MUX_uxn_c_l35_c2_f2a5_iffalse;
     -- Outputs
     VAR_error_MUX_uxn_c_l35_c2_f2a5_return_output := error_MUX_uxn_c_l35_c2_f2a5_return_output;

     -- Submodule level 13
     REG_VAR_error := VAR_error_MUX_uxn_c_l35_c2_f2a5_return_output;
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
