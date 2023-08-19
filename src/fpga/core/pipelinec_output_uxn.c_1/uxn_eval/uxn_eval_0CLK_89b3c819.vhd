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
entity uxn_eval_0CLK_89b3c819 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_89b3c819;
architecture arch of uxn_eval_0CLK_89b3c819 is
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
-- pc_get[uxn_c_l29_c7_ffa7]
signal pc_get_uxn_c_l29_c7_ffa7_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_c_l29_c7_ffa7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l30_c15_d398]
signal BIN_OP_EQ_uxn_c_l30_c15_d398_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l30_c15_d398_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l30_c15_d398_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l30_c15_2e54]
signal MUX_uxn_c_l30_c15_2e54_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_2e54_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_2e54_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_2e54_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_c_l31_c17_69c0]
signal peek_dev_uxn_c_l31_c17_69c0_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_c_l31_c17_69c0_address : unsigned(7 downto 0);
signal peek_dev_uxn_c_l31_c17_69c0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l32_c22_7a07]
signal BIN_OP_EQ_uxn_c_l32_c22_7a07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c22_7a07_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c22_7a07_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l32_c22_68af]
signal MUX_uxn_c_l32_c22_68af_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_68af_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_68af_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_68af_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l33_c16_f76c]
signal BIN_OP_AND_uxn_c_l33_c16_f76c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l33_c16_f76c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l33_c16_f76c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_8013]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l35_c2_5987]
signal ins_MUX_uxn_c_l35_c2_5987_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l35_c2_5987_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l35_c2_5987_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l35_c2_5987_return_output : unsigned(7 downto 0);

-- opc_MUX[uxn_c_l35_c2_5987]
signal opc_MUX_uxn_c_l35_c2_5987_cond : unsigned(0 downto 0);
signal opc_MUX_uxn_c_l35_c2_5987_iftrue : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l35_c2_5987_iffalse : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l35_c2_5987_return_output : unsigned(7 downto 0);

-- s_MUX[uxn_c_l35_c2_5987]
signal s_MUX_uxn_c_l35_c2_5987_cond : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_5987_iftrue : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_5987_iffalse : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_5987_return_output : unsigned(0 downto 0);

-- k_MUX[uxn_c_l35_c2_5987]
signal k_MUX_uxn_c_l35_c2_5987_cond : unsigned(0 downto 0);
signal k_MUX_uxn_c_l35_c2_5987_iftrue : unsigned(7 downto 0);
signal k_MUX_uxn_c_l35_c2_5987_iffalse : unsigned(7 downto 0);
signal k_MUX_uxn_c_l35_c2_5987_return_output : unsigned(7 downto 0);

-- error_MUX[uxn_c_l35_c2_5987]
signal error_MUX_uxn_c_l35_c2_5987_cond : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_5987_iftrue : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_5987_iffalse : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_5987_return_output : unsigned(0 downto 0);

-- peek_ram[uxn_c_l36_c9_1d74]
signal peek_ram_uxn_c_l36_c9_1d74_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_c_l36_c9_1d74_address : unsigned(15 downto 0);
signal peek_ram_uxn_c_l36_c9_1d74_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l36_c9_b9e1]
signal BIN_OP_AND_uxn_c_l36_c9_b9e1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l36_c9_b9e1_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l36_c9_b9e1_return_output : unsigned(7 downto 0);

-- pc_add[uxn_c_l37_c3_d56d]
signal pc_add_uxn_c_l37_c3_d56d_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_c_l37_c3_d56d_adjustment : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l38_c7_b1fb]
signal BIN_OP_AND_uxn_c_l38_c7_b1fb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l38_c7_b1fb_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l38_c7_b1fb_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l38_c7_83ff]
signal MUX_uxn_c_l38_c7_83ff_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l38_c7_83ff_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l38_c7_83ff_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l38_c7_83ff_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l39_c7_3263]
signal BIN_OP_AND_uxn_c_l39_c7_3263_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_3263_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_3263_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l39_c7_c665]
signal MUX_uxn_c_l39_c7_c665_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_c665_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_c665_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_c665_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l40_c11_b9bd]
signal BIN_OP_AND_uxn_c_l40_c11_b9bd_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c11_b9bd_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_c_l40_c11_b9bd_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l40_c11_a981]
signal UNARY_OP_NOT_uxn_c_l40_c11_a981_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_c_l40_c11_a981_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_c_l40_c31_e066]
signal CONST_SR_5_uxn_c_l40_c31_e066_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_c_l40_c31_e066_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l40_c26_026e]
signal BIN_OP_MINUS_uxn_c_l40_c26_026e_left : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l40_c26_026e_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l40_c26_026e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l40_c26_6340]
signal BIN_OP_AND_uxn_c_l40_c26_6340_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l40_c26_6340_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c26_6340_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l40_c51_d3a3]
signal BIN_OP_AND_uxn_c_l40_c51_d3a3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c51_d3a3_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_c_l40_c51_d3a3_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l40_c11_f075]
signal MUX_uxn_c_l40_c11_f075_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l40_c11_f075_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l40_c11_f075_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l40_c11_f075_return_output : unsigned(7 downto 0);

-- eval_opcode[uxn_c_l41_c11_ab04]
signal eval_opcode_uxn_c_l41_c11_ab04_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l41_c11_ab04_stack_index : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l41_c11_ab04_opcode : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_ab04_ins : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_ab04_k : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_ab04_return_output : unsigned(0 downto 0);

-- screen_ram_update[uxn_c_l44_c32_f451]
signal screen_ram_update_uxn_c_l44_c32_f451_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_ram_update_uxn_c_l44_c32_f451_write_address : unsigned(31 downto 0);
signal screen_ram_update_uxn_c_l44_c32_f451_write_value : unsigned(1 downto 0);
signal screen_ram_update_uxn_c_l44_c32_f451_read_address : unsigned(31 downto 0);
signal screen_ram_update_uxn_c_l44_c32_f451_return_output : unsigned(1 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l50_c22_7fda]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l53_c6_bf8c]
signal BIN_OP_EQ_uxn_c_l53_c6_bf8c_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l53_c6_bf8c_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l53_c6_bf8c_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l53_c2_2770]
signal pixel_counter_MUX_uxn_c_l53_c2_2770_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_2770_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_2770_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_2770_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l56_c3_54c6]
signal BIN_OP_PLUS_uxn_c_l56_c3_54c6_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l56_c3_54c6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l56_c3_54c6_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l60_c6_88d7]
signal BIN_OP_EQ_uxn_c_l60_c6_88d7_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l60_c6_88d7_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l60_c6_88d7_return_output : unsigned(0 downto 0);

-- clock_cycle_counter_MUX[uxn_c_l60_c2_7e1d]
signal clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_cond : unsigned(0 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_iftrue : unsigned(31 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_iffalse : unsigned(31 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_return_output : unsigned(31 downto 0);

-- seconds_counter_MUX[uxn_c_l60_c2_7e1d]
signal seconds_counter_MUX_uxn_c_l60_c2_7e1d_cond : unsigned(0 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_7e1d_iftrue : unsigned(31 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_7e1d_iffalse : unsigned(31 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_7e1d_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l61_c3_8559]
signal BIN_OP_PLUS_uxn_c_l61_c3_8559_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l61_c3_8559_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l61_c3_8559_return_output : unsigned(32 downto 0);

-- BIN_OP_PLUS[uxn_c_l64_c3_ce00]
signal BIN_OP_PLUS_uxn_c_l64_c3_ce00_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l64_c3_ce00_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l64_c3_ce00_return_output : unsigned(32 downto 0);

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
-- pc_get_uxn_c_l29_c7_ffa7
pc_get_uxn_c_l29_c7_ffa7 : entity work.pc_get_0CLK_9859a581 port map (
clk,
pc_get_uxn_c_l29_c7_ffa7_CLOCK_ENABLE,
pc_get_uxn_c_l29_c7_ffa7_return_output);

-- BIN_OP_EQ_uxn_c_l30_c15_d398
BIN_OP_EQ_uxn_c_l30_c15_d398 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l30_c15_d398_left,
BIN_OP_EQ_uxn_c_l30_c15_d398_right,
BIN_OP_EQ_uxn_c_l30_c15_d398_return_output);

-- MUX_uxn_c_l30_c15_2e54
MUX_uxn_c_l30_c15_2e54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l30_c15_2e54_cond,
MUX_uxn_c_l30_c15_2e54_iftrue,
MUX_uxn_c_l30_c15_2e54_iffalse,
MUX_uxn_c_l30_c15_2e54_return_output);

-- peek_dev_uxn_c_l31_c17_69c0
peek_dev_uxn_c_l31_c17_69c0 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_c_l31_c17_69c0_CLOCK_ENABLE,
peek_dev_uxn_c_l31_c17_69c0_address,
peek_dev_uxn_c_l31_c17_69c0_return_output);

-- BIN_OP_EQ_uxn_c_l32_c22_7a07
BIN_OP_EQ_uxn_c_l32_c22_7a07 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l32_c22_7a07_left,
BIN_OP_EQ_uxn_c_l32_c22_7a07_right,
BIN_OP_EQ_uxn_c_l32_c22_7a07_return_output);

-- MUX_uxn_c_l32_c22_68af
MUX_uxn_c_l32_c22_68af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l32_c22_68af_cond,
MUX_uxn_c_l32_c22_68af_iftrue,
MUX_uxn_c_l32_c22_68af_iffalse,
MUX_uxn_c_l32_c22_68af_return_output);

-- BIN_OP_AND_uxn_c_l33_c16_f76c
BIN_OP_AND_uxn_c_l33_c16_f76c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l33_c16_f76c_left,
BIN_OP_AND_uxn_c_l33_c16_f76c_right,
BIN_OP_AND_uxn_c_l33_c16_f76c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_return_output);

-- ins_MUX_uxn_c_l35_c2_5987
ins_MUX_uxn_c_l35_c2_5987 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l35_c2_5987_cond,
ins_MUX_uxn_c_l35_c2_5987_iftrue,
ins_MUX_uxn_c_l35_c2_5987_iffalse,
ins_MUX_uxn_c_l35_c2_5987_return_output);

-- opc_MUX_uxn_c_l35_c2_5987
opc_MUX_uxn_c_l35_c2_5987 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
opc_MUX_uxn_c_l35_c2_5987_cond,
opc_MUX_uxn_c_l35_c2_5987_iftrue,
opc_MUX_uxn_c_l35_c2_5987_iffalse,
opc_MUX_uxn_c_l35_c2_5987_return_output);

-- s_MUX_uxn_c_l35_c2_5987
s_MUX_uxn_c_l35_c2_5987 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
s_MUX_uxn_c_l35_c2_5987_cond,
s_MUX_uxn_c_l35_c2_5987_iftrue,
s_MUX_uxn_c_l35_c2_5987_iffalse,
s_MUX_uxn_c_l35_c2_5987_return_output);

-- k_MUX_uxn_c_l35_c2_5987
k_MUX_uxn_c_l35_c2_5987 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
k_MUX_uxn_c_l35_c2_5987_cond,
k_MUX_uxn_c_l35_c2_5987_iftrue,
k_MUX_uxn_c_l35_c2_5987_iffalse,
k_MUX_uxn_c_l35_c2_5987_return_output);

-- error_MUX_uxn_c_l35_c2_5987
error_MUX_uxn_c_l35_c2_5987 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
error_MUX_uxn_c_l35_c2_5987_cond,
error_MUX_uxn_c_l35_c2_5987_iftrue,
error_MUX_uxn_c_l35_c2_5987_iffalse,
error_MUX_uxn_c_l35_c2_5987_return_output);

-- peek_ram_uxn_c_l36_c9_1d74
peek_ram_uxn_c_l36_c9_1d74 : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_c_l36_c9_1d74_CLOCK_ENABLE,
peek_ram_uxn_c_l36_c9_1d74_address,
peek_ram_uxn_c_l36_c9_1d74_return_output);

-- BIN_OP_AND_uxn_c_l36_c9_b9e1
BIN_OP_AND_uxn_c_l36_c9_b9e1 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l36_c9_b9e1_left,
BIN_OP_AND_uxn_c_l36_c9_b9e1_right,
BIN_OP_AND_uxn_c_l36_c9_b9e1_return_output);

-- pc_add_uxn_c_l37_c3_d56d
pc_add_uxn_c_l37_c3_d56d : entity work.pc_add_0CLK_925e4dd0 port map (
clk,
pc_add_uxn_c_l37_c3_d56d_CLOCK_ENABLE,
pc_add_uxn_c_l37_c3_d56d_adjustment);

-- BIN_OP_AND_uxn_c_l38_c7_b1fb
BIN_OP_AND_uxn_c_l38_c7_b1fb : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l38_c7_b1fb_left,
BIN_OP_AND_uxn_c_l38_c7_b1fb_right,
BIN_OP_AND_uxn_c_l38_c7_b1fb_return_output);

-- MUX_uxn_c_l38_c7_83ff
MUX_uxn_c_l38_c7_83ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l38_c7_83ff_cond,
MUX_uxn_c_l38_c7_83ff_iftrue,
MUX_uxn_c_l38_c7_83ff_iffalse,
MUX_uxn_c_l38_c7_83ff_return_output);

-- BIN_OP_AND_uxn_c_l39_c7_3263
BIN_OP_AND_uxn_c_l39_c7_3263 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l39_c7_3263_left,
BIN_OP_AND_uxn_c_l39_c7_3263_right,
BIN_OP_AND_uxn_c_l39_c7_3263_return_output);

-- MUX_uxn_c_l39_c7_c665
MUX_uxn_c_l39_c7_c665 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l39_c7_c665_cond,
MUX_uxn_c_l39_c7_c665_iftrue,
MUX_uxn_c_l39_c7_c665_iffalse,
MUX_uxn_c_l39_c7_c665_return_output);

-- BIN_OP_AND_uxn_c_l40_c11_b9bd
BIN_OP_AND_uxn_c_l40_c11_b9bd : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c11_b9bd_left,
BIN_OP_AND_uxn_c_l40_c11_b9bd_right,
BIN_OP_AND_uxn_c_l40_c11_b9bd_return_output);

-- UNARY_OP_NOT_uxn_c_l40_c11_a981
UNARY_OP_NOT_uxn_c_l40_c11_a981 : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l40_c11_a981_expr,
UNARY_OP_NOT_uxn_c_l40_c11_a981_return_output);

-- CONST_SR_5_uxn_c_l40_c31_e066
CONST_SR_5_uxn_c_l40_c31_e066 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_c_l40_c31_e066_x,
CONST_SR_5_uxn_c_l40_c31_e066_return_output);

-- BIN_OP_MINUS_uxn_c_l40_c26_026e
BIN_OP_MINUS_uxn_c_l40_c26_026e : entity work.BIN_OP_MINUS_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l40_c26_026e_left,
BIN_OP_MINUS_uxn_c_l40_c26_026e_right,
BIN_OP_MINUS_uxn_c_l40_c26_026e_return_output);

-- BIN_OP_AND_uxn_c_l40_c26_6340
BIN_OP_AND_uxn_c_l40_c26_6340 : entity work.BIN_OP_AND_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c26_6340_left,
BIN_OP_AND_uxn_c_l40_c26_6340_right,
BIN_OP_AND_uxn_c_l40_c26_6340_return_output);

-- BIN_OP_AND_uxn_c_l40_c51_d3a3
BIN_OP_AND_uxn_c_l40_c51_d3a3 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c51_d3a3_left,
BIN_OP_AND_uxn_c_l40_c51_d3a3_right,
BIN_OP_AND_uxn_c_l40_c51_d3a3_return_output);

-- MUX_uxn_c_l40_c11_f075
MUX_uxn_c_l40_c11_f075 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l40_c11_f075_cond,
MUX_uxn_c_l40_c11_f075_iftrue,
MUX_uxn_c_l40_c11_f075_iffalse,
MUX_uxn_c_l40_c11_f075_return_output);

-- eval_opcode_uxn_c_l41_c11_ab04
eval_opcode_uxn_c_l41_c11_ab04 : entity work.eval_opcode_0CLK_cb98657c port map (
clk,
eval_opcode_uxn_c_l41_c11_ab04_CLOCK_ENABLE,
eval_opcode_uxn_c_l41_c11_ab04_stack_index,
eval_opcode_uxn_c_l41_c11_ab04_opcode,
eval_opcode_uxn_c_l41_c11_ab04_ins,
eval_opcode_uxn_c_l41_c11_ab04_k,
eval_opcode_uxn_c_l41_c11_ab04_return_output);

-- screen_ram_update_uxn_c_l44_c32_f451
screen_ram_update_uxn_c_l44_c32_f451 : entity work.screen_ram_update_0CLK_b4ec7bd0 port map (
clk,
screen_ram_update_uxn_c_l44_c32_f451_CLOCK_ENABLE,
screen_ram_update_uxn_c_l44_c32_f451_write_address,
screen_ram_update_uxn_c_l44_c32_f451_write_value,
screen_ram_update_uxn_c_l44_c32_f451_read_address,
screen_ram_update_uxn_c_l44_c32_f451_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_return_output);

-- BIN_OP_EQ_uxn_c_l53_c6_bf8c
BIN_OP_EQ_uxn_c_l53_c6_bf8c : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l53_c6_bf8c_left,
BIN_OP_EQ_uxn_c_l53_c6_bf8c_right,
BIN_OP_EQ_uxn_c_l53_c6_bf8c_return_output);

-- pixel_counter_MUX_uxn_c_l53_c2_2770
pixel_counter_MUX_uxn_c_l53_c2_2770 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l53_c2_2770_cond,
pixel_counter_MUX_uxn_c_l53_c2_2770_iftrue,
pixel_counter_MUX_uxn_c_l53_c2_2770_iffalse,
pixel_counter_MUX_uxn_c_l53_c2_2770_return_output);

-- BIN_OP_PLUS_uxn_c_l56_c3_54c6
BIN_OP_PLUS_uxn_c_l56_c3_54c6 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l56_c3_54c6_left,
BIN_OP_PLUS_uxn_c_l56_c3_54c6_right,
BIN_OP_PLUS_uxn_c_l56_c3_54c6_return_output);

-- BIN_OP_EQ_uxn_c_l60_c6_88d7
BIN_OP_EQ_uxn_c_l60_c6_88d7 : entity work.BIN_OP_EQ_uint32_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l60_c6_88d7_left,
BIN_OP_EQ_uxn_c_l60_c6_88d7_right,
BIN_OP_EQ_uxn_c_l60_c6_88d7_return_output);

-- clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d
clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_cond,
clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_iftrue,
clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_iffalse,
clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_return_output);

-- seconds_counter_MUX_uxn_c_l60_c2_7e1d
seconds_counter_MUX_uxn_c_l60_c2_7e1d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
seconds_counter_MUX_uxn_c_l60_c2_7e1d_cond,
seconds_counter_MUX_uxn_c_l60_c2_7e1d_iftrue,
seconds_counter_MUX_uxn_c_l60_c2_7e1d_iffalse,
seconds_counter_MUX_uxn_c_l60_c2_7e1d_return_output);

-- BIN_OP_PLUS_uxn_c_l61_c3_8559
BIN_OP_PLUS_uxn_c_l61_c3_8559 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l61_c3_8559_left,
BIN_OP_PLUS_uxn_c_l61_c3_8559_right,
BIN_OP_PLUS_uxn_c_l61_c3_8559_return_output);

-- BIN_OP_PLUS_uxn_c_l64_c3_ce00
BIN_OP_PLUS_uxn_c_l64_c3_ce00 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l64_c3_ce00_left,
BIN_OP_PLUS_uxn_c_l64_c3_ce00_right,
BIN_OP_PLUS_uxn_c_l64_c3_ce00_return_output);



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
 pc_get_uxn_c_l29_c7_ffa7_return_output,
 BIN_OP_EQ_uxn_c_l30_c15_d398_return_output,
 MUX_uxn_c_l30_c15_2e54_return_output,
 peek_dev_uxn_c_l31_c17_69c0_return_output,
 BIN_OP_EQ_uxn_c_l32_c22_7a07_return_output,
 MUX_uxn_c_l32_c22_68af_return_output,
 BIN_OP_AND_uxn_c_l33_c16_f76c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_return_output,
 ins_MUX_uxn_c_l35_c2_5987_return_output,
 opc_MUX_uxn_c_l35_c2_5987_return_output,
 s_MUX_uxn_c_l35_c2_5987_return_output,
 k_MUX_uxn_c_l35_c2_5987_return_output,
 error_MUX_uxn_c_l35_c2_5987_return_output,
 peek_ram_uxn_c_l36_c9_1d74_return_output,
 BIN_OP_AND_uxn_c_l36_c9_b9e1_return_output,
 BIN_OP_AND_uxn_c_l38_c7_b1fb_return_output,
 MUX_uxn_c_l38_c7_83ff_return_output,
 BIN_OP_AND_uxn_c_l39_c7_3263_return_output,
 MUX_uxn_c_l39_c7_c665_return_output,
 BIN_OP_AND_uxn_c_l40_c11_b9bd_return_output,
 UNARY_OP_NOT_uxn_c_l40_c11_a981_return_output,
 CONST_SR_5_uxn_c_l40_c31_e066_return_output,
 BIN_OP_MINUS_uxn_c_l40_c26_026e_return_output,
 BIN_OP_AND_uxn_c_l40_c26_6340_return_output,
 BIN_OP_AND_uxn_c_l40_c51_d3a3_return_output,
 MUX_uxn_c_l40_c11_f075_return_output,
 eval_opcode_uxn_c_l41_c11_ab04_return_output,
 screen_ram_update_uxn_c_l44_c32_f451_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_return_output,
 BIN_OP_EQ_uxn_c_l53_c6_bf8c_return_output,
 pixel_counter_MUX_uxn_c_l53_c2_2770_return_output,
 BIN_OP_PLUS_uxn_c_l56_c3_54c6_return_output,
 BIN_OP_EQ_uxn_c_l60_c6_88d7_return_output,
 clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_return_output,
 seconds_counter_MUX_uxn_c_l60_c2_7e1d_return_output,
 BIN_OP_PLUS_uxn_c_l61_c3_8559_return_output,
 BIN_OP_PLUS_uxn_c_l64_c3_ce00_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_c_l29_c7_ffa7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_c_l29_c7_ffa7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_2e54_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_2e54_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_2e54_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_d398_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_d398_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_d398_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_2e54_return_output : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_c_l31_c17_69c0_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_c_l31_c17_69c0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_c_l31_c17_69c0_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_68af_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_68af_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_68af_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_7a07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_7a07_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_7a07_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_68af_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_5987_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_5987_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_5987_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_5987_cond : unsigned(0 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_5987_iftrue : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_5987_iffalse : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_5987_return_output : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_5987_cond : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_5987_iftrue : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_5987_iffalse : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_5987_return_output : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_5987_cond : unsigned(0 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_5987_iftrue : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_5987_iffalse : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_5987_return_output : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_5987_cond : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_5987_iftrue : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_5987_iffalse : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_5987_return_output : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_5987_cond : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_1d74_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_left : unsigned(7 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_1d74_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_1d74_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_return_output : unsigned(7 downto 0);
 variable VAR_pc_add_uxn_c_l37_c3_d56d_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_c_l37_c3_d56d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_83ff_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_83ff_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_83ff_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_b1fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_b1fb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_b1fb_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_83ff_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_c665_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_c665_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_c665_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_3263_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_3263_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_3263_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_c665_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_f075_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_f075_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_f075_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_b9bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_b9bd_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_b9bd_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l40_c11_a981_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l40_c11_a981_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_026e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_026e_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l40_c31_e066_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l40_c31_e066_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_026e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_6340_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_6340_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_6340_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_d3a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_d3a3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_d3a3_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_f075_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_ab04_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_ab04_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_ab04_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_ab04_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_ab04_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_ab04_return_output : unsigned(0 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_f451_write_address : unsigned(31 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_f451_write_value : unsigned(1 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_f451_read_address : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l46_c3_9ea4_return_output : unsigned(1 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_f451_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_f451_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_ref_toks_0 : uint12_t_4;
 variable VAR_CAST_TO_uint16_t_uxn_c_l50_c11_b1f0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_bf8c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_bf8c_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_bf8c_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_2770_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l54_c3_743d : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_2770_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l56_c3_1ee9 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_2770_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_2770_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_54c6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_54c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_54c6_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_88d7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_88d7_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_88d7_return_output : unsigned(0 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_iftrue : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_uxn_c_l62_c3_749a : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_iffalse : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_uxn_c_l64_c3_255f : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_return_output : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_cond : unsigned(0 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_7e1d_iftrue : unsigned(31 downto 0);
 variable VAR_seconds_counter_uxn_c_l61_c3_57c4 : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_7e1d_iffalse : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_7e1d_return_output : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_7e1d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_8559_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_8559_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_8559_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_ce00_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_ce00_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_ce00_return_output : unsigned(32 downto 0);
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
     VAR_BIN_OP_EQ_uxn_c_l60_c6_88d7_right := to_unsigned(12287998, 24);
     VAR_MUX_uxn_c_l30_c15_2e54_iftrue := to_unsigned(0, 1);
     VAR_pc_add_uxn_c_l37_c3_d56d_adjustment := resize(to_unsigned(1, 1), 16);
     VAR_MUX_uxn_c_l38_c7_83ff_iftrue := to_unsigned(255, 8);
     VAR_MUX_uxn_c_l32_c22_68af_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l40_c51_d3a3_right := to_unsigned(63, 6);
     VAR_error_MUX_uxn_c_l35_c2_5987_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_54c6_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l40_c11_b9bd_right := to_unsigned(31, 5);
     VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_right := to_unsigned(255, 8);
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_8559_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_026e_left := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l39_c7_c665_iffalse := to_unsigned(0, 1);
     VAR_pixel_counter_uxn_c_l54_c3_743d := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l53_c2_2770_iftrue := VAR_pixel_counter_uxn_c_l54_c3_743d;
     VAR_BIN_OP_AND_uxn_c_l39_c7_3263_right := to_unsigned(64, 7);
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_ce00_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l30_c15_d398_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l30_c15_2e54_iffalse := to_unsigned(1, 1);
     VAR_clock_cycle_counter_uxn_c_l62_c3_749a := resize(to_unsigned(0, 1), 32);
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_iftrue := VAR_clock_cycle_counter_uxn_c_l62_c3_749a;
     VAR_MUX_uxn_c_l39_c7_c665_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l53_c6_bf8c_right := to_unsigned(204799, 18);
     VAR_peek_dev_uxn_c_l31_c17_69c0_address := resize(to_unsigned(15, 4), 8);
     VAR_BIN_OP_EQ_uxn_c_l32_c22_7a07_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l38_c7_b1fb_right := to_unsigned(128, 8);
     VAR_BIN_OP_AND_uxn_c_l40_c26_6340_right := to_unsigned(255, 8);
     VAR_MUX_uxn_c_l38_c7_83ff_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_c_l32_c22_68af_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_iftrue := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_c_l29_c7_ffa7_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_peek_dev_uxn_c_l31_c17_69c0_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_screen_ram_update_uxn_c_l44_c32_f451_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l60_c6_88d7_left := clock_cycle_counter;
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_ce00_left := clock_cycle_counter;
     VAR_ins_MUX_uxn_c_l35_c2_5987_iffalse := ins;
     VAR_k_MUX_uxn_c_l35_c2_5987_iffalse := k;
     VAR_opc_MUX_uxn_c_l35_c2_5987_iffalse := opc;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_ref_toks_0 := palette_color_values;
     REG_VAR_palette_color_values := palette_color_values;
     VAR_BIN_OP_EQ_uxn_c_l53_c6_bf8c_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_54c6_left := pixel_counter;
     VAR_screen_ram_update_uxn_c_l44_c32_f451_read_address := pixel_counter;
     VAR_screen_ram_update_uxn_c_l44_c32_f451_write_address := pixel_counter;
     VAR_s_MUX_uxn_c_l35_c2_5987_iffalse := s;
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_8559_left := seconds_counter;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_7e1d_iffalse := seconds_counter;
     -- BIN_OP_PLUS[uxn_c_l61_c3_8559] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l61_c3_8559_left <= VAR_BIN_OP_PLUS_uxn_c_l61_c3_8559_left;
     BIN_OP_PLUS_uxn_c_l61_c3_8559_right <= VAR_BIN_OP_PLUS_uxn_c_l61_c3_8559_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_8559_return_output := BIN_OP_PLUS_uxn_c_l61_c3_8559_return_output;

     -- BIN_OP_EQ[uxn_c_l53_c6_bf8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l53_c6_bf8c_left <= VAR_BIN_OP_EQ_uxn_c_l53_c6_bf8c_left;
     BIN_OP_EQ_uxn_c_l53_c6_bf8c_right <= VAR_BIN_OP_EQ_uxn_c_l53_c6_bf8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l53_c6_bf8c_return_output := BIN_OP_EQ_uxn_c_l53_c6_bf8c_return_output;

     -- peek_dev[uxn_c_l31_c17_69c0] LATENCY=0
     -- Clock enable
     peek_dev_uxn_c_l31_c17_69c0_CLOCK_ENABLE <= VAR_peek_dev_uxn_c_l31_c17_69c0_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_c_l31_c17_69c0_address <= VAR_peek_dev_uxn_c_l31_c17_69c0_address;
     -- Outputs
     VAR_peek_dev_uxn_c_l31_c17_69c0_return_output := peek_dev_uxn_c_l31_c17_69c0_return_output;

     -- pc_get[uxn_c_l29_c7_ffa7] LATENCY=0
     -- Clock enable
     pc_get_uxn_c_l29_c7_ffa7_CLOCK_ENABLE <= VAR_pc_get_uxn_c_l29_c7_ffa7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_c_l29_c7_ffa7_return_output := pc_get_uxn_c_l29_c7_ffa7_return_output;

     -- BIN_OP_PLUS[uxn_c_l64_c3_ce00] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l64_c3_ce00_left <= VAR_BIN_OP_PLUS_uxn_c_l64_c3_ce00_left;
     BIN_OP_PLUS_uxn_c_l64_c3_ce00_right <= VAR_BIN_OP_PLUS_uxn_c_l64_c3_ce00_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_ce00_return_output := BIN_OP_PLUS_uxn_c_l64_c3_ce00_return_output;

     -- BIN_OP_EQ[uxn_c_l60_c6_88d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l60_c6_88d7_left <= VAR_BIN_OP_EQ_uxn_c_l60_c6_88d7_left;
     BIN_OP_EQ_uxn_c_l60_c6_88d7_right <= VAR_BIN_OP_EQ_uxn_c_l60_c6_88d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l60_c6_88d7_return_output := BIN_OP_EQ_uxn_c_l60_c6_88d7_return_output;

     -- BIN_OP_PLUS[uxn_c_l56_c3_54c6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l56_c3_54c6_left <= VAR_BIN_OP_PLUS_uxn_c_l56_c3_54c6_left;
     BIN_OP_PLUS_uxn_c_l56_c3_54c6_right <= VAR_BIN_OP_PLUS_uxn_c_l56_c3_54c6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_54c6_return_output := BIN_OP_PLUS_uxn_c_l56_c3_54c6_return_output;

     -- CAST_TO_uint2_t[uxn_c_l46_c3_9ea4] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l46_c3_9ea4_return_output := CAST_TO_uint2_t_uint32_t(
     seconds_counter);

     -- Submodule level 1
     VAR_pixel_counter_MUX_uxn_c_l53_c2_2770_cond := VAR_BIN_OP_EQ_uxn_c_l53_c6_bf8c_return_output;
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_cond := VAR_BIN_OP_EQ_uxn_c_l60_c6_88d7_return_output;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_7e1d_cond := VAR_BIN_OP_EQ_uxn_c_l60_c6_88d7_return_output;
     VAR_pixel_counter_uxn_c_l56_c3_1ee9 := resize(VAR_BIN_OP_PLUS_uxn_c_l56_c3_54c6_return_output, 32);
     VAR_seconds_counter_uxn_c_l61_c3_57c4 := resize(VAR_BIN_OP_PLUS_uxn_c_l61_c3_8559_return_output, 32);
     VAR_clock_cycle_counter_uxn_c_l64_c3_255f := resize(VAR_BIN_OP_PLUS_uxn_c_l64_c3_ce00_return_output, 32);
     VAR_screen_ram_update_uxn_c_l44_c32_f451_write_value := VAR_CAST_TO_uint2_t_uxn_c_l46_c3_9ea4_return_output;
     VAR_BIN_OP_EQ_uxn_c_l30_c15_d398_left := VAR_pc_get_uxn_c_l29_c7_ffa7_return_output;
     REG_VAR_pc := VAR_pc_get_uxn_c_l29_c7_ffa7_return_output;
     VAR_peek_ram_uxn_c_l36_c9_1d74_address := VAR_pc_get_uxn_c_l29_c7_ffa7_return_output;
     VAR_BIN_OP_EQ_uxn_c_l32_c22_7a07_left := VAR_peek_dev_uxn_c_l31_c17_69c0_return_output;
     REG_VAR_system_state := VAR_peek_dev_uxn_c_l31_c17_69c0_return_output;
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_iffalse := VAR_clock_cycle_counter_uxn_c_l64_c3_255f;
     VAR_pixel_counter_MUX_uxn_c_l53_c2_2770_iffalse := VAR_pixel_counter_uxn_c_l56_c3_1ee9;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_7e1d_iftrue := VAR_seconds_counter_uxn_c_l61_c3_57c4;
     -- clock_cycle_counter_MUX[uxn_c_l60_c2_7e1d] LATENCY=0
     -- Inputs
     clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_cond <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_cond;
     clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_iftrue <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_iftrue;
     clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_iffalse <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_iffalse;
     -- Outputs
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_return_output := clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_return_output;

     -- screen_ram_update[uxn_c_l44_c32_f451] LATENCY=0
     -- Clock enable
     screen_ram_update_uxn_c_l44_c32_f451_CLOCK_ENABLE <= VAR_screen_ram_update_uxn_c_l44_c32_f451_CLOCK_ENABLE;
     -- Inputs
     screen_ram_update_uxn_c_l44_c32_f451_write_address <= VAR_screen_ram_update_uxn_c_l44_c32_f451_write_address;
     screen_ram_update_uxn_c_l44_c32_f451_write_value <= VAR_screen_ram_update_uxn_c_l44_c32_f451_write_value;
     screen_ram_update_uxn_c_l44_c32_f451_read_address <= VAR_screen_ram_update_uxn_c_l44_c32_f451_read_address;
     -- Outputs
     VAR_screen_ram_update_uxn_c_l44_c32_f451_return_output := screen_ram_update_uxn_c_l44_c32_f451_return_output;

     -- pixel_counter_MUX[uxn_c_l53_c2_2770] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l53_c2_2770_cond <= VAR_pixel_counter_MUX_uxn_c_l53_c2_2770_cond;
     pixel_counter_MUX_uxn_c_l53_c2_2770_iftrue <= VAR_pixel_counter_MUX_uxn_c_l53_c2_2770_iftrue;
     pixel_counter_MUX_uxn_c_l53_c2_2770_iffalse <= VAR_pixel_counter_MUX_uxn_c_l53_c2_2770_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l53_c2_2770_return_output := pixel_counter_MUX_uxn_c_l53_c2_2770_return_output;

     -- BIN_OP_EQ[uxn_c_l32_c22_7a07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l32_c22_7a07_left <= VAR_BIN_OP_EQ_uxn_c_l32_c22_7a07_left;
     BIN_OP_EQ_uxn_c_l32_c22_7a07_right <= VAR_BIN_OP_EQ_uxn_c_l32_c22_7a07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l32_c22_7a07_return_output := BIN_OP_EQ_uxn_c_l32_c22_7a07_return_output;

     -- seconds_counter_MUX[uxn_c_l60_c2_7e1d] LATENCY=0
     -- Inputs
     seconds_counter_MUX_uxn_c_l60_c2_7e1d_cond <= VAR_seconds_counter_MUX_uxn_c_l60_c2_7e1d_cond;
     seconds_counter_MUX_uxn_c_l60_c2_7e1d_iftrue <= VAR_seconds_counter_MUX_uxn_c_l60_c2_7e1d_iftrue;
     seconds_counter_MUX_uxn_c_l60_c2_7e1d_iffalse <= VAR_seconds_counter_MUX_uxn_c_l60_c2_7e1d_iffalse;
     -- Outputs
     VAR_seconds_counter_MUX_uxn_c_l60_c2_7e1d_return_output := seconds_counter_MUX_uxn_c_l60_c2_7e1d_return_output;

     -- BIN_OP_EQ[uxn_c_l30_c15_d398] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l30_c15_d398_left <= VAR_BIN_OP_EQ_uxn_c_l30_c15_d398_left;
     BIN_OP_EQ_uxn_c_l30_c15_d398_right <= VAR_BIN_OP_EQ_uxn_c_l30_c15_d398_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l30_c15_d398_return_output := BIN_OP_EQ_uxn_c_l30_c15_d398_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l30_c15_2e54_cond := VAR_BIN_OP_EQ_uxn_c_l30_c15_d398_return_output;
     VAR_MUX_uxn_c_l32_c22_68af_cond := VAR_BIN_OP_EQ_uxn_c_l32_c22_7a07_return_output;
     REG_VAR_clock_cycle_counter := VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_7e1d_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l53_c2_2770_return_output;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_var_dim_0 := VAR_screen_ram_update_uxn_c_l44_c32_f451_return_output;
     REG_VAR_current_pixel_palette_color := VAR_screen_ram_update_uxn_c_l44_c32_f451_return_output;
     REG_VAR_seconds_counter := VAR_seconds_counter_MUX_uxn_c_l60_c2_7e1d_return_output;
     -- MUX[uxn_c_l32_c22_68af] LATENCY=0
     -- Inputs
     MUX_uxn_c_l32_c22_68af_cond <= VAR_MUX_uxn_c_l32_c22_68af_cond;
     MUX_uxn_c_l32_c22_68af_iftrue <= VAR_MUX_uxn_c_l32_c22_68af_iftrue;
     MUX_uxn_c_l32_c22_68af_iffalse <= VAR_MUX_uxn_c_l32_c22_68af_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l32_c22_68af_return_output := MUX_uxn_c_l32_c22_68af_return_output;

     -- MUX[uxn_c_l30_c15_2e54] LATENCY=0
     -- Inputs
     MUX_uxn_c_l30_c15_2e54_cond <= VAR_MUX_uxn_c_l30_c15_2e54_cond;
     MUX_uxn_c_l30_c15_2e54_iftrue <= VAR_MUX_uxn_c_l30_c15_2e54_iftrue;
     MUX_uxn_c_l30_c15_2e54_iffalse <= VAR_MUX_uxn_c_l30_c15_2e54_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l30_c15_2e54_return_output := MUX_uxn_c_l30_c15_2e54_return_output;

     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l50_c22_7fda] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_left := VAR_MUX_uxn_c_l30_c15_2e54_return_output;
     REG_VAR_pc_nonzero := VAR_MUX_uxn_c_l30_c15_2e54_return_output;
     VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_right := VAR_MUX_uxn_c_l32_c22_68af_return_output;
     REG_VAR_system_state_zero := VAR_MUX_uxn_c_l32_c22_68af_return_output;
     -- BIN_OP_AND[uxn_c_l33_c16_f76c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l33_c16_f76c_left <= VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_left;
     BIN_OP_AND_uxn_c_l33_c16_f76c_right <= VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_return_output := BIN_OP_AND_uxn_c_l33_c16_f76c_return_output;

     -- CAST_TO_uint16_t[uxn_c_l50_c11_b1f0] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_c_l50_c11_b1f0_return_output := CAST_TO_uint16_t_uint12_t(
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_7fda_return_output);

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_return_output;
     VAR_error_MUX_uxn_c_l35_c2_5987_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_return_output;
     VAR_ins_MUX_uxn_c_l35_c2_5987_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_return_output;
     VAR_k_MUX_uxn_c_l35_c2_5987_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_return_output;
     VAR_opc_MUX_uxn_c_l35_c2_5987_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_return_output;
     VAR_s_MUX_uxn_c_l35_c2_5987_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_return_output;
     REG_VAR_should_eval := VAR_BIN_OP_AND_uxn_c_l33_c16_f76c_return_output;
     REG_VAR_result := VAR_CAST_TO_uint16_t_uxn_c_l50_c11_b1f0_return_output;
     VAR_return_output := VAR_CAST_TO_uint16_t_uxn_c_l50_c11_b1f0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_8013] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_return_output;

     -- Submodule level 5
     VAR_eval_opcode_uxn_c_l41_c11_ab04_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_return_output;
     VAR_pc_add_uxn_c_l37_c3_d56d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_return_output;
     VAR_peek_ram_uxn_c_l36_c9_1d74_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_8013_return_output;
     -- pc_add[uxn_c_l37_c3_d56d] LATENCY=0
     -- Clock enable
     pc_add_uxn_c_l37_c3_d56d_CLOCK_ENABLE <= VAR_pc_add_uxn_c_l37_c3_d56d_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_c_l37_c3_d56d_adjustment <= VAR_pc_add_uxn_c_l37_c3_d56d_adjustment;
     -- Outputs

     -- peek_ram[uxn_c_l36_c9_1d74] LATENCY=0
     -- Clock enable
     peek_ram_uxn_c_l36_c9_1d74_CLOCK_ENABLE <= VAR_peek_ram_uxn_c_l36_c9_1d74_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_c_l36_c9_1d74_address <= VAR_peek_ram_uxn_c_l36_c9_1d74_address;
     -- Outputs
     VAR_peek_ram_uxn_c_l36_c9_1d74_return_output := peek_ram_uxn_c_l36_c9_1d74_return_output;

     -- Submodule level 6
     VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_left := VAR_peek_ram_uxn_c_l36_c9_1d74_return_output;
     -- BIN_OP_AND[uxn_c_l36_c9_b9e1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l36_c9_b9e1_left <= VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_left;
     BIN_OP_AND_uxn_c_l36_c9_b9e1_right <= VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_return_output := BIN_OP_AND_uxn_c_l36_c9_b9e1_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l38_c7_b1fb_left := VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_return_output;
     VAR_BIN_OP_AND_uxn_c_l39_c7_3263_left := VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_return_output;
     VAR_BIN_OP_AND_uxn_c_l40_c11_b9bd_left := VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_return_output;
     VAR_BIN_OP_AND_uxn_c_l40_c51_d3a3_left := VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_return_output;
     VAR_CONST_SR_5_uxn_c_l40_c31_e066_x := VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_ab04_ins := VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_return_output;
     VAR_ins_MUX_uxn_c_l35_c2_5987_iftrue := VAR_BIN_OP_AND_uxn_c_l36_c9_b9e1_return_output;
     -- BIN_OP_AND[uxn_c_l39_c7_3263] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l39_c7_3263_left <= VAR_BIN_OP_AND_uxn_c_l39_c7_3263_left;
     BIN_OP_AND_uxn_c_l39_c7_3263_right <= VAR_BIN_OP_AND_uxn_c_l39_c7_3263_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l39_c7_3263_return_output := BIN_OP_AND_uxn_c_l39_c7_3263_return_output;

     -- CONST_SR_5[uxn_c_l40_c31_e066] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_c_l40_c31_e066_x <= VAR_CONST_SR_5_uxn_c_l40_c31_e066_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_c_l40_c31_e066_return_output := CONST_SR_5_uxn_c_l40_c31_e066_return_output;

     -- BIN_OP_AND[uxn_c_l40_c51_d3a3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c51_d3a3_left <= VAR_BIN_OP_AND_uxn_c_l40_c51_d3a3_left;
     BIN_OP_AND_uxn_c_l40_c51_d3a3_right <= VAR_BIN_OP_AND_uxn_c_l40_c51_d3a3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c51_d3a3_return_output := BIN_OP_AND_uxn_c_l40_c51_d3a3_return_output;

     -- BIN_OP_AND[uxn_c_l38_c7_b1fb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l38_c7_b1fb_left <= VAR_BIN_OP_AND_uxn_c_l38_c7_b1fb_left;
     BIN_OP_AND_uxn_c_l38_c7_b1fb_right <= VAR_BIN_OP_AND_uxn_c_l38_c7_b1fb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l38_c7_b1fb_return_output := BIN_OP_AND_uxn_c_l38_c7_b1fb_return_output;

     -- ins_MUX[uxn_c_l35_c2_5987] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l35_c2_5987_cond <= VAR_ins_MUX_uxn_c_l35_c2_5987_cond;
     ins_MUX_uxn_c_l35_c2_5987_iftrue <= VAR_ins_MUX_uxn_c_l35_c2_5987_iftrue;
     ins_MUX_uxn_c_l35_c2_5987_iffalse <= VAR_ins_MUX_uxn_c_l35_c2_5987_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l35_c2_5987_return_output := ins_MUX_uxn_c_l35_c2_5987_return_output;

     -- BIN_OP_AND[uxn_c_l40_c11_b9bd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c11_b9bd_left <= VAR_BIN_OP_AND_uxn_c_l40_c11_b9bd_left;
     BIN_OP_AND_uxn_c_l40_c11_b9bd_right <= VAR_BIN_OP_AND_uxn_c_l40_c11_b9bd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c11_b9bd_return_output := BIN_OP_AND_uxn_c_l40_c11_b9bd_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l38_c7_83ff_cond := resize(VAR_BIN_OP_AND_uxn_c_l38_c7_b1fb_return_output, 1);
     VAR_MUX_uxn_c_l39_c7_c665_cond := resize(VAR_BIN_OP_AND_uxn_c_l39_c7_3263_return_output, 1);
     VAR_UNARY_OP_NOT_uxn_c_l40_c11_a981_expr := VAR_BIN_OP_AND_uxn_c_l40_c11_b9bd_return_output;
     VAR_MUX_uxn_c_l40_c11_f075_iffalse := VAR_BIN_OP_AND_uxn_c_l40_c51_d3a3_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_026e_right := VAR_CONST_SR_5_uxn_c_l40_c31_e066_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l35_c2_5987_return_output;
     -- UNARY_OP_NOT[uxn_c_l40_c11_a981] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l40_c11_a981_expr <= VAR_UNARY_OP_NOT_uxn_c_l40_c11_a981_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l40_c11_a981_return_output := UNARY_OP_NOT_uxn_c_l40_c11_a981_return_output;

     -- BIN_OP_MINUS[uxn_c_l40_c26_026e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l40_c26_026e_left <= VAR_BIN_OP_MINUS_uxn_c_l40_c26_026e_left;
     BIN_OP_MINUS_uxn_c_l40_c26_026e_right <= VAR_BIN_OP_MINUS_uxn_c_l40_c26_026e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_026e_return_output := BIN_OP_MINUS_uxn_c_l40_c26_026e_return_output;

     -- MUX[uxn_c_l38_c7_83ff] LATENCY=0
     -- Inputs
     MUX_uxn_c_l38_c7_83ff_cond <= VAR_MUX_uxn_c_l38_c7_83ff_cond;
     MUX_uxn_c_l38_c7_83ff_iftrue <= VAR_MUX_uxn_c_l38_c7_83ff_iftrue;
     MUX_uxn_c_l38_c7_83ff_iffalse <= VAR_MUX_uxn_c_l38_c7_83ff_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l38_c7_83ff_return_output := MUX_uxn_c_l38_c7_83ff_return_output;

     -- MUX[uxn_c_l39_c7_c665] LATENCY=0
     -- Inputs
     MUX_uxn_c_l39_c7_c665_cond <= VAR_MUX_uxn_c_l39_c7_c665_cond;
     MUX_uxn_c_l39_c7_c665_iftrue <= VAR_MUX_uxn_c_l39_c7_c665_iftrue;
     MUX_uxn_c_l39_c7_c665_iffalse <= VAR_MUX_uxn_c_l39_c7_c665_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l39_c7_c665_return_output := MUX_uxn_c_l39_c7_c665_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l40_c26_6340_left := VAR_BIN_OP_MINUS_uxn_c_l40_c26_026e_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_ab04_k := VAR_MUX_uxn_c_l38_c7_83ff_return_output;
     VAR_k_MUX_uxn_c_l35_c2_5987_iftrue := VAR_MUX_uxn_c_l38_c7_83ff_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_ab04_stack_index := VAR_MUX_uxn_c_l39_c7_c665_return_output;
     VAR_s_MUX_uxn_c_l35_c2_5987_iftrue := VAR_MUX_uxn_c_l39_c7_c665_return_output;
     VAR_MUX_uxn_c_l40_c11_f075_cond := resize(VAR_UNARY_OP_NOT_uxn_c_l40_c11_a981_return_output, 1);
     -- k_MUX[uxn_c_l35_c2_5987] LATENCY=0
     -- Inputs
     k_MUX_uxn_c_l35_c2_5987_cond <= VAR_k_MUX_uxn_c_l35_c2_5987_cond;
     k_MUX_uxn_c_l35_c2_5987_iftrue <= VAR_k_MUX_uxn_c_l35_c2_5987_iftrue;
     k_MUX_uxn_c_l35_c2_5987_iffalse <= VAR_k_MUX_uxn_c_l35_c2_5987_iffalse;
     -- Outputs
     VAR_k_MUX_uxn_c_l35_c2_5987_return_output := k_MUX_uxn_c_l35_c2_5987_return_output;

     -- s_MUX[uxn_c_l35_c2_5987] LATENCY=0
     -- Inputs
     s_MUX_uxn_c_l35_c2_5987_cond <= VAR_s_MUX_uxn_c_l35_c2_5987_cond;
     s_MUX_uxn_c_l35_c2_5987_iftrue <= VAR_s_MUX_uxn_c_l35_c2_5987_iftrue;
     s_MUX_uxn_c_l35_c2_5987_iffalse <= VAR_s_MUX_uxn_c_l35_c2_5987_iffalse;
     -- Outputs
     VAR_s_MUX_uxn_c_l35_c2_5987_return_output := s_MUX_uxn_c_l35_c2_5987_return_output;

     -- BIN_OP_AND[uxn_c_l40_c26_6340] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c26_6340_left <= VAR_BIN_OP_AND_uxn_c_l40_c26_6340_left;
     BIN_OP_AND_uxn_c_l40_c26_6340_right <= VAR_BIN_OP_AND_uxn_c_l40_c26_6340_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c26_6340_return_output := BIN_OP_AND_uxn_c_l40_c26_6340_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l40_c11_f075_iftrue := VAR_BIN_OP_AND_uxn_c_l40_c26_6340_return_output;
     REG_VAR_k := VAR_k_MUX_uxn_c_l35_c2_5987_return_output;
     REG_VAR_s := VAR_s_MUX_uxn_c_l35_c2_5987_return_output;
     -- MUX[uxn_c_l40_c11_f075] LATENCY=0
     -- Inputs
     MUX_uxn_c_l40_c11_f075_cond <= VAR_MUX_uxn_c_l40_c11_f075_cond;
     MUX_uxn_c_l40_c11_f075_iftrue <= VAR_MUX_uxn_c_l40_c11_f075_iftrue;
     MUX_uxn_c_l40_c11_f075_iffalse <= VAR_MUX_uxn_c_l40_c11_f075_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l40_c11_f075_return_output := MUX_uxn_c_l40_c11_f075_return_output;

     -- Submodule level 11
     VAR_eval_opcode_uxn_c_l41_c11_ab04_opcode := VAR_MUX_uxn_c_l40_c11_f075_return_output;
     VAR_opc_MUX_uxn_c_l35_c2_5987_iftrue := VAR_MUX_uxn_c_l40_c11_f075_return_output;
     -- opc_MUX[uxn_c_l35_c2_5987] LATENCY=0
     -- Inputs
     opc_MUX_uxn_c_l35_c2_5987_cond <= VAR_opc_MUX_uxn_c_l35_c2_5987_cond;
     opc_MUX_uxn_c_l35_c2_5987_iftrue <= VAR_opc_MUX_uxn_c_l35_c2_5987_iftrue;
     opc_MUX_uxn_c_l35_c2_5987_iffalse <= VAR_opc_MUX_uxn_c_l35_c2_5987_iffalse;
     -- Outputs
     VAR_opc_MUX_uxn_c_l35_c2_5987_return_output := opc_MUX_uxn_c_l35_c2_5987_return_output;

     -- eval_opcode[uxn_c_l41_c11_ab04] LATENCY=0
     -- Clock enable
     eval_opcode_uxn_c_l41_c11_ab04_CLOCK_ENABLE <= VAR_eval_opcode_uxn_c_l41_c11_ab04_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_uxn_c_l41_c11_ab04_stack_index <= VAR_eval_opcode_uxn_c_l41_c11_ab04_stack_index;
     eval_opcode_uxn_c_l41_c11_ab04_opcode <= VAR_eval_opcode_uxn_c_l41_c11_ab04_opcode;
     eval_opcode_uxn_c_l41_c11_ab04_ins <= VAR_eval_opcode_uxn_c_l41_c11_ab04_ins;
     eval_opcode_uxn_c_l41_c11_ab04_k <= VAR_eval_opcode_uxn_c_l41_c11_ab04_k;
     -- Outputs
     VAR_eval_opcode_uxn_c_l41_c11_ab04_return_output := eval_opcode_uxn_c_l41_c11_ab04_return_output;

     -- Submodule level 12
     VAR_error_MUX_uxn_c_l35_c2_5987_iftrue := VAR_eval_opcode_uxn_c_l41_c11_ab04_return_output;
     REG_VAR_opc := VAR_opc_MUX_uxn_c_l35_c2_5987_return_output;
     -- error_MUX[uxn_c_l35_c2_5987] LATENCY=0
     -- Inputs
     error_MUX_uxn_c_l35_c2_5987_cond <= VAR_error_MUX_uxn_c_l35_c2_5987_cond;
     error_MUX_uxn_c_l35_c2_5987_iftrue <= VAR_error_MUX_uxn_c_l35_c2_5987_iftrue;
     error_MUX_uxn_c_l35_c2_5987_iffalse <= VAR_error_MUX_uxn_c_l35_c2_5987_iffalse;
     -- Outputs
     VAR_error_MUX_uxn_c_l35_c2_5987_return_output := error_MUX_uxn_c_l35_c2_5987_return_output;

     -- Submodule level 13
     REG_VAR_error := VAR_error_MUX_uxn_c_l35_c2_5987_return_output;
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
