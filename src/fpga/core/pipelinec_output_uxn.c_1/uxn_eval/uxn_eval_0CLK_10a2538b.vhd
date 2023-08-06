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
entity uxn_eval_0CLK_10a2538b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_10a2538b;
architecture arch of uxn_eval_0CLK_10a2538b is
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
-- pc_get[uxn_c_l29_c7_d3ef]
signal pc_get_uxn_c_l29_c7_d3ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_c_l29_c7_d3ef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l30_c15_8d3e]
signal BIN_OP_EQ_uxn_c_l30_c15_8d3e_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l30_c15_8d3e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l30_c15_8d3e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l30_c15_a7f7]
signal MUX_uxn_c_l30_c15_a7f7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_a7f7_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_a7f7_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_a7f7_return_output : unsigned(0 downto 0);

-- device_ram_read[uxn_c_l31_c17_d179]
signal device_ram_read_uxn_c_l31_c17_d179_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_c_l31_c17_d179_address : unsigned(7 downto 0);
signal device_ram_read_uxn_c_l31_c17_d179_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l32_c22_76bd]
signal BIN_OP_EQ_uxn_c_l32_c22_76bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c22_76bd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c22_76bd_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l32_c22_8a78]
signal MUX_uxn_c_l32_c22_8a78_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_8a78_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_8a78_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_8a78_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l33_c16_2005]
signal BIN_OP_AND_uxn_c_l33_c16_2005_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l33_c16_2005_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l33_c16_2005_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_1aa8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l35_c2_2928]
signal ins_MUX_uxn_c_l35_c2_2928_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l35_c2_2928_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l35_c2_2928_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l35_c2_2928_return_output : unsigned(7 downto 0);

-- opc_MUX[uxn_c_l35_c2_2928]
signal opc_MUX_uxn_c_l35_c2_2928_cond : unsigned(0 downto 0);
signal opc_MUX_uxn_c_l35_c2_2928_iftrue : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l35_c2_2928_iffalse : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l35_c2_2928_return_output : unsigned(7 downto 0);

-- k_MUX[uxn_c_l35_c2_2928]
signal k_MUX_uxn_c_l35_c2_2928_cond : unsigned(0 downto 0);
signal k_MUX_uxn_c_l35_c2_2928_iftrue : unsigned(7 downto 0);
signal k_MUX_uxn_c_l35_c2_2928_iffalse : unsigned(7 downto 0);
signal k_MUX_uxn_c_l35_c2_2928_return_output : unsigned(7 downto 0);

-- s_MUX[uxn_c_l35_c2_2928]
signal s_MUX_uxn_c_l35_c2_2928_cond : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_2928_iftrue : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_2928_iffalse : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_2928_return_output : unsigned(0 downto 0);

-- error_MUX[uxn_c_l35_c2_2928]
signal error_MUX_uxn_c_l35_c2_2928_cond : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_2928_iftrue : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_2928_iffalse : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_2928_return_output : unsigned(0 downto 0);

-- main_ram_read[uxn_c_l36_c9_9cab]
signal main_ram_read_uxn_c_l36_c9_9cab_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_read_uxn_c_l36_c9_9cab_address : unsigned(15 downto 0);
signal main_ram_read_uxn_c_l36_c9_9cab_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l36_c9_6f98]
signal BIN_OP_AND_uxn_c_l36_c9_6f98_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l36_c9_6f98_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l36_c9_6f98_return_output : unsigned(7 downto 0);

-- pc_add[uxn_c_l37_c3_2382]
signal pc_add_uxn_c_l37_c3_2382_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_c_l37_c3_2382_adjustment : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l38_c7_c149]
signal BIN_OP_AND_uxn_c_l38_c7_c149_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l38_c7_c149_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l38_c7_c149_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l38_c7_597b]
signal MUX_uxn_c_l38_c7_597b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l38_c7_597b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l38_c7_597b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l38_c7_597b_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l39_c7_c05e]
signal BIN_OP_AND_uxn_c_l39_c7_c05e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_c05e_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_c05e_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l39_c7_ca4c]
signal MUX_uxn_c_l39_c7_ca4c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_ca4c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_ca4c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_ca4c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l40_c11_59dc]
signal BIN_OP_AND_uxn_c_l40_c11_59dc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c11_59dc_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_c_l40_c11_59dc_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l40_c11_83d7]
signal UNARY_OP_NOT_uxn_c_l40_c11_83d7_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_c_l40_c11_83d7_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_c_l40_c31_92c2]
signal CONST_SR_5_uxn_c_l40_c31_92c2_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_c_l40_c31_92c2_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l40_c26_9cf2]
signal BIN_OP_MINUS_uxn_c_l40_c26_9cf2_left : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l40_c26_9cf2_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l40_c26_9cf2_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l40_c26_ea42]
signal BIN_OP_AND_uxn_c_l40_c26_ea42_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l40_c26_ea42_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c26_ea42_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l40_c51_6763]
signal BIN_OP_AND_uxn_c_l40_c51_6763_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c51_6763_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_c_l40_c51_6763_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l40_c11_2737]
signal MUX_uxn_c_l40_c11_2737_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l40_c11_2737_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l40_c11_2737_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l40_c11_2737_return_output : unsigned(7 downto 0);

-- eval_opcode[uxn_c_l41_c11_04bf]
signal eval_opcode_uxn_c_l41_c11_04bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l41_c11_04bf_stack_index : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l41_c11_04bf_opcode : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_04bf_ins : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_04bf_k : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_04bf_return_output : unsigned(0 downto 0);

-- screen_ram_update[uxn_c_l44_c32_7986]
signal screen_ram_update_uxn_c_l44_c32_7986_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_ram_update_uxn_c_l44_c32_7986_write_address : unsigned(31 downto 0);
signal screen_ram_update_uxn_c_l44_c32_7986_write_value : unsigned(1 downto 0);
signal screen_ram_update_uxn_c_l44_c32_7986_read_address : unsigned(31 downto 0);
signal screen_ram_update_uxn_c_l44_c32_7986_return_output : unsigned(1 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l50_c22_f537]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l53_c6_e4d4]
signal BIN_OP_EQ_uxn_c_l53_c6_e4d4_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l53_c6_e4d4_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l53_c6_e4d4_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l53_c2_d8bf]
signal pixel_counter_MUX_uxn_c_l53_c2_d8bf_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_d8bf_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_d8bf_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_d8bf_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l56_c3_51b6]
signal BIN_OP_PLUS_uxn_c_l56_c3_51b6_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l56_c3_51b6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l56_c3_51b6_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l60_c6_7bd9]
signal BIN_OP_EQ_uxn_c_l60_c6_7bd9_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l60_c6_7bd9_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l60_c6_7bd9_return_output : unsigned(0 downto 0);

-- clock_cycle_counter_MUX[uxn_c_l60_c2_86ad]
signal clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_cond : unsigned(0 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_iftrue : unsigned(31 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_iffalse : unsigned(31 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_return_output : unsigned(31 downto 0);

-- seconds_counter_MUX[uxn_c_l60_c2_86ad]
signal seconds_counter_MUX_uxn_c_l60_c2_86ad_cond : unsigned(0 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_86ad_iftrue : unsigned(31 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_86ad_iffalse : unsigned(31 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_86ad_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l61_c3_2021]
signal BIN_OP_PLUS_uxn_c_l61_c3_2021_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l61_c3_2021_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l61_c3_2021_return_output : unsigned(32 downto 0);

-- BIN_OP_PLUS[uxn_c_l64_c3_0292]
signal BIN_OP_PLUS_uxn_c_l64_c3_0292_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l64_c3_0292_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l64_c3_0292_return_output : unsigned(32 downto 0);

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
-- pc_get_uxn_c_l29_c7_d3ef
pc_get_uxn_c_l29_c7_d3ef : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_c_l29_c7_d3ef_CLOCK_ENABLE,
pc_get_uxn_c_l29_c7_d3ef_return_output);

-- BIN_OP_EQ_uxn_c_l30_c15_8d3e
BIN_OP_EQ_uxn_c_l30_c15_8d3e : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l30_c15_8d3e_left,
BIN_OP_EQ_uxn_c_l30_c15_8d3e_right,
BIN_OP_EQ_uxn_c_l30_c15_8d3e_return_output);

-- MUX_uxn_c_l30_c15_a7f7
MUX_uxn_c_l30_c15_a7f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l30_c15_a7f7_cond,
MUX_uxn_c_l30_c15_a7f7_iftrue,
MUX_uxn_c_l30_c15_a7f7_iffalse,
MUX_uxn_c_l30_c15_a7f7_return_output);

-- device_ram_read_uxn_c_l31_c17_d179
device_ram_read_uxn_c_l31_c17_d179 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_c_l31_c17_d179_CLOCK_ENABLE,
device_ram_read_uxn_c_l31_c17_d179_address,
device_ram_read_uxn_c_l31_c17_d179_return_output);

-- BIN_OP_EQ_uxn_c_l32_c22_76bd
BIN_OP_EQ_uxn_c_l32_c22_76bd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l32_c22_76bd_left,
BIN_OP_EQ_uxn_c_l32_c22_76bd_right,
BIN_OP_EQ_uxn_c_l32_c22_76bd_return_output);

-- MUX_uxn_c_l32_c22_8a78
MUX_uxn_c_l32_c22_8a78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l32_c22_8a78_cond,
MUX_uxn_c_l32_c22_8a78_iftrue,
MUX_uxn_c_l32_c22_8a78_iffalse,
MUX_uxn_c_l32_c22_8a78_return_output);

-- BIN_OP_AND_uxn_c_l33_c16_2005
BIN_OP_AND_uxn_c_l33_c16_2005 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l33_c16_2005_left,
BIN_OP_AND_uxn_c_l33_c16_2005_right,
BIN_OP_AND_uxn_c_l33_c16_2005_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_return_output);

-- ins_MUX_uxn_c_l35_c2_2928
ins_MUX_uxn_c_l35_c2_2928 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l35_c2_2928_cond,
ins_MUX_uxn_c_l35_c2_2928_iftrue,
ins_MUX_uxn_c_l35_c2_2928_iffalse,
ins_MUX_uxn_c_l35_c2_2928_return_output);

-- opc_MUX_uxn_c_l35_c2_2928
opc_MUX_uxn_c_l35_c2_2928 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
opc_MUX_uxn_c_l35_c2_2928_cond,
opc_MUX_uxn_c_l35_c2_2928_iftrue,
opc_MUX_uxn_c_l35_c2_2928_iffalse,
opc_MUX_uxn_c_l35_c2_2928_return_output);

-- k_MUX_uxn_c_l35_c2_2928
k_MUX_uxn_c_l35_c2_2928 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
k_MUX_uxn_c_l35_c2_2928_cond,
k_MUX_uxn_c_l35_c2_2928_iftrue,
k_MUX_uxn_c_l35_c2_2928_iffalse,
k_MUX_uxn_c_l35_c2_2928_return_output);

-- s_MUX_uxn_c_l35_c2_2928
s_MUX_uxn_c_l35_c2_2928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
s_MUX_uxn_c_l35_c2_2928_cond,
s_MUX_uxn_c_l35_c2_2928_iftrue,
s_MUX_uxn_c_l35_c2_2928_iffalse,
s_MUX_uxn_c_l35_c2_2928_return_output);

-- error_MUX_uxn_c_l35_c2_2928
error_MUX_uxn_c_l35_c2_2928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
error_MUX_uxn_c_l35_c2_2928_cond,
error_MUX_uxn_c_l35_c2_2928_iftrue,
error_MUX_uxn_c_l35_c2_2928_iffalse,
error_MUX_uxn_c_l35_c2_2928_return_output);

-- main_ram_read_uxn_c_l36_c9_9cab
main_ram_read_uxn_c_l36_c9_9cab : entity work.main_ram_read_0CLK_8ab28aec port map (
clk,
main_ram_read_uxn_c_l36_c9_9cab_CLOCK_ENABLE,
main_ram_read_uxn_c_l36_c9_9cab_address,
main_ram_read_uxn_c_l36_c9_9cab_return_output);

-- BIN_OP_AND_uxn_c_l36_c9_6f98
BIN_OP_AND_uxn_c_l36_c9_6f98 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l36_c9_6f98_left,
BIN_OP_AND_uxn_c_l36_c9_6f98_right,
BIN_OP_AND_uxn_c_l36_c9_6f98_return_output);

-- pc_add_uxn_c_l37_c3_2382
pc_add_uxn_c_l37_c3_2382 : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_c_l37_c3_2382_CLOCK_ENABLE,
pc_add_uxn_c_l37_c3_2382_adjustment);

-- BIN_OP_AND_uxn_c_l38_c7_c149
BIN_OP_AND_uxn_c_l38_c7_c149 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l38_c7_c149_left,
BIN_OP_AND_uxn_c_l38_c7_c149_right,
BIN_OP_AND_uxn_c_l38_c7_c149_return_output);

-- MUX_uxn_c_l38_c7_597b
MUX_uxn_c_l38_c7_597b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l38_c7_597b_cond,
MUX_uxn_c_l38_c7_597b_iftrue,
MUX_uxn_c_l38_c7_597b_iffalse,
MUX_uxn_c_l38_c7_597b_return_output);

-- BIN_OP_AND_uxn_c_l39_c7_c05e
BIN_OP_AND_uxn_c_l39_c7_c05e : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l39_c7_c05e_left,
BIN_OP_AND_uxn_c_l39_c7_c05e_right,
BIN_OP_AND_uxn_c_l39_c7_c05e_return_output);

-- MUX_uxn_c_l39_c7_ca4c
MUX_uxn_c_l39_c7_ca4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l39_c7_ca4c_cond,
MUX_uxn_c_l39_c7_ca4c_iftrue,
MUX_uxn_c_l39_c7_ca4c_iffalse,
MUX_uxn_c_l39_c7_ca4c_return_output);

-- BIN_OP_AND_uxn_c_l40_c11_59dc
BIN_OP_AND_uxn_c_l40_c11_59dc : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c11_59dc_left,
BIN_OP_AND_uxn_c_l40_c11_59dc_right,
BIN_OP_AND_uxn_c_l40_c11_59dc_return_output);

-- UNARY_OP_NOT_uxn_c_l40_c11_83d7
UNARY_OP_NOT_uxn_c_l40_c11_83d7 : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l40_c11_83d7_expr,
UNARY_OP_NOT_uxn_c_l40_c11_83d7_return_output);

-- CONST_SR_5_uxn_c_l40_c31_92c2
CONST_SR_5_uxn_c_l40_c31_92c2 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_c_l40_c31_92c2_x,
CONST_SR_5_uxn_c_l40_c31_92c2_return_output);

-- BIN_OP_MINUS_uxn_c_l40_c26_9cf2
BIN_OP_MINUS_uxn_c_l40_c26_9cf2 : entity work.BIN_OP_MINUS_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l40_c26_9cf2_left,
BIN_OP_MINUS_uxn_c_l40_c26_9cf2_right,
BIN_OP_MINUS_uxn_c_l40_c26_9cf2_return_output);

-- BIN_OP_AND_uxn_c_l40_c26_ea42
BIN_OP_AND_uxn_c_l40_c26_ea42 : entity work.BIN_OP_AND_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c26_ea42_left,
BIN_OP_AND_uxn_c_l40_c26_ea42_right,
BIN_OP_AND_uxn_c_l40_c26_ea42_return_output);

-- BIN_OP_AND_uxn_c_l40_c51_6763
BIN_OP_AND_uxn_c_l40_c51_6763 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c51_6763_left,
BIN_OP_AND_uxn_c_l40_c51_6763_right,
BIN_OP_AND_uxn_c_l40_c51_6763_return_output);

-- MUX_uxn_c_l40_c11_2737
MUX_uxn_c_l40_c11_2737 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l40_c11_2737_cond,
MUX_uxn_c_l40_c11_2737_iftrue,
MUX_uxn_c_l40_c11_2737_iffalse,
MUX_uxn_c_l40_c11_2737_return_output);

-- eval_opcode_uxn_c_l41_c11_04bf
eval_opcode_uxn_c_l41_c11_04bf : entity work.eval_opcode_0CLK_44dad49a port map (
clk,
eval_opcode_uxn_c_l41_c11_04bf_CLOCK_ENABLE,
eval_opcode_uxn_c_l41_c11_04bf_stack_index,
eval_opcode_uxn_c_l41_c11_04bf_opcode,
eval_opcode_uxn_c_l41_c11_04bf_ins,
eval_opcode_uxn_c_l41_c11_04bf_k,
eval_opcode_uxn_c_l41_c11_04bf_return_output);

-- screen_ram_update_uxn_c_l44_c32_7986
screen_ram_update_uxn_c_l44_c32_7986 : entity work.screen_ram_update_0CLK_b4ec7bd0 port map (
clk,
screen_ram_update_uxn_c_l44_c32_7986_CLOCK_ENABLE,
screen_ram_update_uxn_c_l44_c32_7986_write_address,
screen_ram_update_uxn_c_l44_c32_7986_write_value,
screen_ram_update_uxn_c_l44_c32_7986_read_address,
screen_ram_update_uxn_c_l44_c32_7986_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_return_output);

-- BIN_OP_EQ_uxn_c_l53_c6_e4d4
BIN_OP_EQ_uxn_c_l53_c6_e4d4 : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l53_c6_e4d4_left,
BIN_OP_EQ_uxn_c_l53_c6_e4d4_right,
BIN_OP_EQ_uxn_c_l53_c6_e4d4_return_output);

-- pixel_counter_MUX_uxn_c_l53_c2_d8bf
pixel_counter_MUX_uxn_c_l53_c2_d8bf : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l53_c2_d8bf_cond,
pixel_counter_MUX_uxn_c_l53_c2_d8bf_iftrue,
pixel_counter_MUX_uxn_c_l53_c2_d8bf_iffalse,
pixel_counter_MUX_uxn_c_l53_c2_d8bf_return_output);

-- BIN_OP_PLUS_uxn_c_l56_c3_51b6
BIN_OP_PLUS_uxn_c_l56_c3_51b6 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l56_c3_51b6_left,
BIN_OP_PLUS_uxn_c_l56_c3_51b6_right,
BIN_OP_PLUS_uxn_c_l56_c3_51b6_return_output);

-- BIN_OP_EQ_uxn_c_l60_c6_7bd9
BIN_OP_EQ_uxn_c_l60_c6_7bd9 : entity work.BIN_OP_EQ_uint32_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l60_c6_7bd9_left,
BIN_OP_EQ_uxn_c_l60_c6_7bd9_right,
BIN_OP_EQ_uxn_c_l60_c6_7bd9_return_output);

-- clock_cycle_counter_MUX_uxn_c_l60_c2_86ad
clock_cycle_counter_MUX_uxn_c_l60_c2_86ad : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_cond,
clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_iftrue,
clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_iffalse,
clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_return_output);

-- seconds_counter_MUX_uxn_c_l60_c2_86ad
seconds_counter_MUX_uxn_c_l60_c2_86ad : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
seconds_counter_MUX_uxn_c_l60_c2_86ad_cond,
seconds_counter_MUX_uxn_c_l60_c2_86ad_iftrue,
seconds_counter_MUX_uxn_c_l60_c2_86ad_iffalse,
seconds_counter_MUX_uxn_c_l60_c2_86ad_return_output);

-- BIN_OP_PLUS_uxn_c_l61_c3_2021
BIN_OP_PLUS_uxn_c_l61_c3_2021 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l61_c3_2021_left,
BIN_OP_PLUS_uxn_c_l61_c3_2021_right,
BIN_OP_PLUS_uxn_c_l61_c3_2021_return_output);

-- BIN_OP_PLUS_uxn_c_l64_c3_0292
BIN_OP_PLUS_uxn_c_l64_c3_0292 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l64_c3_0292_left,
BIN_OP_PLUS_uxn_c_l64_c3_0292_right,
BIN_OP_PLUS_uxn_c_l64_c3_0292_return_output);



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
 pc_get_uxn_c_l29_c7_d3ef_return_output,
 BIN_OP_EQ_uxn_c_l30_c15_8d3e_return_output,
 MUX_uxn_c_l30_c15_a7f7_return_output,
 device_ram_read_uxn_c_l31_c17_d179_return_output,
 BIN_OP_EQ_uxn_c_l32_c22_76bd_return_output,
 MUX_uxn_c_l32_c22_8a78_return_output,
 BIN_OP_AND_uxn_c_l33_c16_2005_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_return_output,
 ins_MUX_uxn_c_l35_c2_2928_return_output,
 opc_MUX_uxn_c_l35_c2_2928_return_output,
 k_MUX_uxn_c_l35_c2_2928_return_output,
 s_MUX_uxn_c_l35_c2_2928_return_output,
 error_MUX_uxn_c_l35_c2_2928_return_output,
 main_ram_read_uxn_c_l36_c9_9cab_return_output,
 BIN_OP_AND_uxn_c_l36_c9_6f98_return_output,
 BIN_OP_AND_uxn_c_l38_c7_c149_return_output,
 MUX_uxn_c_l38_c7_597b_return_output,
 BIN_OP_AND_uxn_c_l39_c7_c05e_return_output,
 MUX_uxn_c_l39_c7_ca4c_return_output,
 BIN_OP_AND_uxn_c_l40_c11_59dc_return_output,
 UNARY_OP_NOT_uxn_c_l40_c11_83d7_return_output,
 CONST_SR_5_uxn_c_l40_c31_92c2_return_output,
 BIN_OP_MINUS_uxn_c_l40_c26_9cf2_return_output,
 BIN_OP_AND_uxn_c_l40_c26_ea42_return_output,
 BIN_OP_AND_uxn_c_l40_c51_6763_return_output,
 MUX_uxn_c_l40_c11_2737_return_output,
 eval_opcode_uxn_c_l41_c11_04bf_return_output,
 screen_ram_update_uxn_c_l44_c32_7986_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_return_output,
 BIN_OP_EQ_uxn_c_l53_c6_e4d4_return_output,
 pixel_counter_MUX_uxn_c_l53_c2_d8bf_return_output,
 BIN_OP_PLUS_uxn_c_l56_c3_51b6_return_output,
 BIN_OP_EQ_uxn_c_l60_c6_7bd9_return_output,
 clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_return_output,
 seconds_counter_MUX_uxn_c_l60_c2_86ad_return_output,
 BIN_OP_PLUS_uxn_c_l61_c3_2021_return_output,
 BIN_OP_PLUS_uxn_c_l64_c3_0292_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_c_l29_c7_d3ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_c_l29_c7_d3ef_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_a7f7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_a7f7_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_a7f7_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_8d3e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_8d3e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_8d3e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_a7f7_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_c_l31_c17_d179_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_c_l31_c17_d179_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_c_l31_c17_d179_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_8a78_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_8a78_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_8a78_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_76bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_76bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_76bd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_8a78_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_2005_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_2005_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_2005_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_iffalse : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_2928_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_2928_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_2928_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_2928_cond : unsigned(0 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_2928_iftrue : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_2928_iffalse : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_2928_return_output : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_2928_cond : unsigned(0 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_2928_iftrue : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_2928_iffalse : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_2928_return_output : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_2928_cond : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_2928_iftrue : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_2928_iffalse : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_2928_return_output : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_2928_cond : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_2928_iftrue : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_2928_iffalse : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_2928_return_output : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_2928_cond : unsigned(0 downto 0);
 variable VAR_main_ram_read_uxn_c_l36_c9_9cab_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_left : unsigned(7 downto 0);
 variable VAR_main_ram_read_uxn_c_l36_c9_9cab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_read_uxn_c_l36_c9_9cab_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_return_output : unsigned(7 downto 0);
 variable VAR_pc_add_uxn_c_l37_c3_2382_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_c_l37_c3_2382_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_597b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_597b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_597b_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_c149_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_c149_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_c149_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_597b_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_ca4c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_ca4c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_ca4c_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_c05e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_c05e_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_c05e_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_ca4c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_2737_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_2737_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_2737_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_59dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_59dc_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_59dc_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l40_c11_83d7_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l40_c11_83d7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_9cf2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_9cf2_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l40_c31_92c2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l40_c31_92c2_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_9cf2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_ea42_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_ea42_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_ea42_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_6763_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_6763_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_6763_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_2737_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_04bf_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_04bf_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_04bf_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_04bf_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_04bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_04bf_return_output : unsigned(0 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_7986_write_address : unsigned(31 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_7986_write_value : unsigned(1 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_7986_read_address : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l46_c3_45a2_return_output : unsigned(1 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_7986_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_7986_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_ref_toks_0 : uint12_t_4;
 variable VAR_CAST_TO_uint16_t_uxn_c_l50_c11_bbac_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_e4d4_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_e4d4_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_e4d4_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_d8bf_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l54_c3_47eb : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_d8bf_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l56_c3_9d38 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_d8bf_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_d8bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_51b6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_51b6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_51b6_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_7bd9_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_7bd9_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_7bd9_return_output : unsigned(0 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_iftrue : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_uxn_c_l62_c3_c9a5 : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_iffalse : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_uxn_c_l64_c3_1f8b : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_return_output : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_cond : unsigned(0 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_86ad_iftrue : unsigned(31 downto 0);
 variable VAR_seconds_counter_uxn_c_l61_c3_4243 : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_86ad_iffalse : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_86ad_return_output : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_86ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_2021_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_2021_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_2021_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_0292_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_0292_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_0292_return_output : unsigned(32 downto 0);
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
     VAR_BIN_OP_AND_uxn_c_l39_c7_c05e_right := to_unsigned(64, 7);
     VAR_error_MUX_uxn_c_l35_c2_2928_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l53_c6_e4d4_right := to_unsigned(204799, 18);
     VAR_MUX_uxn_c_l30_c15_a7f7_iffalse := to_unsigned(1, 1);
     VAR_pc_add_uxn_c_l37_c3_2382_adjustment := resize(to_unsigned(1, 1), 16);
     VAR_MUX_uxn_c_l30_c15_a7f7_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l38_c7_597b_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_c_l32_c22_8a78_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l39_c7_ca4c_iffalse := to_unsigned(0, 1);
     VAR_pixel_counter_uxn_c_l54_c3_47eb := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l53_c2_d8bf_iftrue := VAR_pixel_counter_uxn_c_l54_c3_47eb;
     VAR_BIN_OP_AND_uxn_c_l38_c7_c149_right := to_unsigned(128, 8);
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_2021_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l32_c22_8a78_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l60_c6_7bd9_right := to_unsigned(12287998, 24);
     VAR_MUX_uxn_c_l39_c7_ca4c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l40_c11_59dc_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_c_l30_c15_8d3e_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l40_c26_ea42_right := to_unsigned(255, 8);
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_9cf2_left := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l40_c51_6763_right := to_unsigned(63, 6);
     VAR_clock_cycle_counter_uxn_c_l62_c3_c9a5 := resize(to_unsigned(0, 1), 32);
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_iftrue := VAR_clock_cycle_counter_uxn_c_l62_c3_c9a5;
     VAR_BIN_OP_EQ_uxn_c_l32_c22_76bd_right := to_unsigned(0, 1);
     VAR_device_ram_read_uxn_c_l31_c17_d179_address := resize(to_unsigned(15, 4), 8);
     VAR_MUX_uxn_c_l38_c7_597b_iftrue := to_unsigned(255, 8);
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_0292_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_51b6_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_read_uxn_c_l31_c17_d179_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_c_l29_c7_d3ef_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_screen_ram_update_uxn_c_l44_c32_7986_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l60_c6_7bd9_left := clock_cycle_counter;
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_0292_left := clock_cycle_counter;
     VAR_ins_MUX_uxn_c_l35_c2_2928_iffalse := ins;
     VAR_k_MUX_uxn_c_l35_c2_2928_iffalse := k;
     VAR_opc_MUX_uxn_c_l35_c2_2928_iffalse := opc;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_ref_toks_0 := palette_color_values;
     REG_VAR_palette_color_values := palette_color_values;
     VAR_BIN_OP_EQ_uxn_c_l53_c6_e4d4_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_51b6_left := pixel_counter;
     VAR_screen_ram_update_uxn_c_l44_c32_7986_read_address := pixel_counter;
     VAR_screen_ram_update_uxn_c_l44_c32_7986_write_address := pixel_counter;
     VAR_s_MUX_uxn_c_l35_c2_2928_iffalse := s;
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_2021_left := seconds_counter;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_86ad_iffalse := seconds_counter;
     -- BIN_OP_PLUS[uxn_c_l56_c3_51b6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l56_c3_51b6_left <= VAR_BIN_OP_PLUS_uxn_c_l56_c3_51b6_left;
     BIN_OP_PLUS_uxn_c_l56_c3_51b6_right <= VAR_BIN_OP_PLUS_uxn_c_l56_c3_51b6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_51b6_return_output := BIN_OP_PLUS_uxn_c_l56_c3_51b6_return_output;

     -- CAST_TO_uint2_t[uxn_c_l46_c3_45a2] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l46_c3_45a2_return_output := CAST_TO_uint2_t_uint32_t(
     seconds_counter);

     -- BIN_OP_PLUS[uxn_c_l61_c3_2021] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l61_c3_2021_left <= VAR_BIN_OP_PLUS_uxn_c_l61_c3_2021_left;
     BIN_OP_PLUS_uxn_c_l61_c3_2021_right <= VAR_BIN_OP_PLUS_uxn_c_l61_c3_2021_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_2021_return_output := BIN_OP_PLUS_uxn_c_l61_c3_2021_return_output;

     -- BIN_OP_PLUS[uxn_c_l64_c3_0292] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l64_c3_0292_left <= VAR_BIN_OP_PLUS_uxn_c_l64_c3_0292_left;
     BIN_OP_PLUS_uxn_c_l64_c3_0292_right <= VAR_BIN_OP_PLUS_uxn_c_l64_c3_0292_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_0292_return_output := BIN_OP_PLUS_uxn_c_l64_c3_0292_return_output;

     -- device_ram_read[uxn_c_l31_c17_d179] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_c_l31_c17_d179_CLOCK_ENABLE <= VAR_device_ram_read_uxn_c_l31_c17_d179_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_c_l31_c17_d179_address <= VAR_device_ram_read_uxn_c_l31_c17_d179_address;
     -- Outputs
     VAR_device_ram_read_uxn_c_l31_c17_d179_return_output := device_ram_read_uxn_c_l31_c17_d179_return_output;

     -- BIN_OP_EQ[uxn_c_l60_c6_7bd9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l60_c6_7bd9_left <= VAR_BIN_OP_EQ_uxn_c_l60_c6_7bd9_left;
     BIN_OP_EQ_uxn_c_l60_c6_7bd9_right <= VAR_BIN_OP_EQ_uxn_c_l60_c6_7bd9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l60_c6_7bd9_return_output := BIN_OP_EQ_uxn_c_l60_c6_7bd9_return_output;

     -- BIN_OP_EQ[uxn_c_l53_c6_e4d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l53_c6_e4d4_left <= VAR_BIN_OP_EQ_uxn_c_l53_c6_e4d4_left;
     BIN_OP_EQ_uxn_c_l53_c6_e4d4_right <= VAR_BIN_OP_EQ_uxn_c_l53_c6_e4d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l53_c6_e4d4_return_output := BIN_OP_EQ_uxn_c_l53_c6_e4d4_return_output;

     -- pc_get[uxn_c_l29_c7_d3ef] LATENCY=0
     -- Clock enable
     pc_get_uxn_c_l29_c7_d3ef_CLOCK_ENABLE <= VAR_pc_get_uxn_c_l29_c7_d3ef_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_c_l29_c7_d3ef_return_output := pc_get_uxn_c_l29_c7_d3ef_return_output;

     -- Submodule level 1
     VAR_pixel_counter_MUX_uxn_c_l53_c2_d8bf_cond := VAR_BIN_OP_EQ_uxn_c_l53_c6_e4d4_return_output;
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_cond := VAR_BIN_OP_EQ_uxn_c_l60_c6_7bd9_return_output;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_86ad_cond := VAR_BIN_OP_EQ_uxn_c_l60_c6_7bd9_return_output;
     VAR_pixel_counter_uxn_c_l56_c3_9d38 := resize(VAR_BIN_OP_PLUS_uxn_c_l56_c3_51b6_return_output, 32);
     VAR_seconds_counter_uxn_c_l61_c3_4243 := resize(VAR_BIN_OP_PLUS_uxn_c_l61_c3_2021_return_output, 32);
     VAR_clock_cycle_counter_uxn_c_l64_c3_1f8b := resize(VAR_BIN_OP_PLUS_uxn_c_l64_c3_0292_return_output, 32);
     VAR_screen_ram_update_uxn_c_l44_c32_7986_write_value := VAR_CAST_TO_uint2_t_uxn_c_l46_c3_45a2_return_output;
     VAR_BIN_OP_EQ_uxn_c_l32_c22_76bd_left := VAR_device_ram_read_uxn_c_l31_c17_d179_return_output;
     REG_VAR_system_state := VAR_device_ram_read_uxn_c_l31_c17_d179_return_output;
     VAR_BIN_OP_EQ_uxn_c_l30_c15_8d3e_left := VAR_pc_get_uxn_c_l29_c7_d3ef_return_output;
     VAR_main_ram_read_uxn_c_l36_c9_9cab_address := VAR_pc_get_uxn_c_l29_c7_d3ef_return_output;
     REG_VAR_pc := VAR_pc_get_uxn_c_l29_c7_d3ef_return_output;
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_iffalse := VAR_clock_cycle_counter_uxn_c_l64_c3_1f8b;
     VAR_pixel_counter_MUX_uxn_c_l53_c2_d8bf_iffalse := VAR_pixel_counter_uxn_c_l56_c3_9d38;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_86ad_iftrue := VAR_seconds_counter_uxn_c_l61_c3_4243;
     -- screen_ram_update[uxn_c_l44_c32_7986] LATENCY=0
     -- Clock enable
     screen_ram_update_uxn_c_l44_c32_7986_CLOCK_ENABLE <= VAR_screen_ram_update_uxn_c_l44_c32_7986_CLOCK_ENABLE;
     -- Inputs
     screen_ram_update_uxn_c_l44_c32_7986_write_address <= VAR_screen_ram_update_uxn_c_l44_c32_7986_write_address;
     screen_ram_update_uxn_c_l44_c32_7986_write_value <= VAR_screen_ram_update_uxn_c_l44_c32_7986_write_value;
     screen_ram_update_uxn_c_l44_c32_7986_read_address <= VAR_screen_ram_update_uxn_c_l44_c32_7986_read_address;
     -- Outputs
     VAR_screen_ram_update_uxn_c_l44_c32_7986_return_output := screen_ram_update_uxn_c_l44_c32_7986_return_output;

     -- seconds_counter_MUX[uxn_c_l60_c2_86ad] LATENCY=0
     -- Inputs
     seconds_counter_MUX_uxn_c_l60_c2_86ad_cond <= VAR_seconds_counter_MUX_uxn_c_l60_c2_86ad_cond;
     seconds_counter_MUX_uxn_c_l60_c2_86ad_iftrue <= VAR_seconds_counter_MUX_uxn_c_l60_c2_86ad_iftrue;
     seconds_counter_MUX_uxn_c_l60_c2_86ad_iffalse <= VAR_seconds_counter_MUX_uxn_c_l60_c2_86ad_iffalse;
     -- Outputs
     VAR_seconds_counter_MUX_uxn_c_l60_c2_86ad_return_output := seconds_counter_MUX_uxn_c_l60_c2_86ad_return_output;

     -- pixel_counter_MUX[uxn_c_l53_c2_d8bf] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l53_c2_d8bf_cond <= VAR_pixel_counter_MUX_uxn_c_l53_c2_d8bf_cond;
     pixel_counter_MUX_uxn_c_l53_c2_d8bf_iftrue <= VAR_pixel_counter_MUX_uxn_c_l53_c2_d8bf_iftrue;
     pixel_counter_MUX_uxn_c_l53_c2_d8bf_iffalse <= VAR_pixel_counter_MUX_uxn_c_l53_c2_d8bf_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l53_c2_d8bf_return_output := pixel_counter_MUX_uxn_c_l53_c2_d8bf_return_output;

     -- BIN_OP_EQ[uxn_c_l30_c15_8d3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l30_c15_8d3e_left <= VAR_BIN_OP_EQ_uxn_c_l30_c15_8d3e_left;
     BIN_OP_EQ_uxn_c_l30_c15_8d3e_right <= VAR_BIN_OP_EQ_uxn_c_l30_c15_8d3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l30_c15_8d3e_return_output := BIN_OP_EQ_uxn_c_l30_c15_8d3e_return_output;

     -- BIN_OP_EQ[uxn_c_l32_c22_76bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l32_c22_76bd_left <= VAR_BIN_OP_EQ_uxn_c_l32_c22_76bd_left;
     BIN_OP_EQ_uxn_c_l32_c22_76bd_right <= VAR_BIN_OP_EQ_uxn_c_l32_c22_76bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l32_c22_76bd_return_output := BIN_OP_EQ_uxn_c_l32_c22_76bd_return_output;

     -- clock_cycle_counter_MUX[uxn_c_l60_c2_86ad] LATENCY=0
     -- Inputs
     clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_cond <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_cond;
     clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_iftrue <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_iftrue;
     clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_iffalse <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_iffalse;
     -- Outputs
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_return_output := clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l30_c15_a7f7_cond := VAR_BIN_OP_EQ_uxn_c_l30_c15_8d3e_return_output;
     VAR_MUX_uxn_c_l32_c22_8a78_cond := VAR_BIN_OP_EQ_uxn_c_l32_c22_76bd_return_output;
     REG_VAR_clock_cycle_counter := VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_86ad_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l53_c2_d8bf_return_output;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_var_dim_0 := VAR_screen_ram_update_uxn_c_l44_c32_7986_return_output;
     REG_VAR_current_pixel_palette_color := VAR_screen_ram_update_uxn_c_l44_c32_7986_return_output;
     REG_VAR_seconds_counter := VAR_seconds_counter_MUX_uxn_c_l60_c2_86ad_return_output;
     -- MUX[uxn_c_l30_c15_a7f7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l30_c15_a7f7_cond <= VAR_MUX_uxn_c_l30_c15_a7f7_cond;
     MUX_uxn_c_l30_c15_a7f7_iftrue <= VAR_MUX_uxn_c_l30_c15_a7f7_iftrue;
     MUX_uxn_c_l30_c15_a7f7_iffalse <= VAR_MUX_uxn_c_l30_c15_a7f7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l30_c15_a7f7_return_output := MUX_uxn_c_l30_c15_a7f7_return_output;

     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l50_c22_f537] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_return_output;

     -- MUX[uxn_c_l32_c22_8a78] LATENCY=0
     -- Inputs
     MUX_uxn_c_l32_c22_8a78_cond <= VAR_MUX_uxn_c_l32_c22_8a78_cond;
     MUX_uxn_c_l32_c22_8a78_iftrue <= VAR_MUX_uxn_c_l32_c22_8a78_iftrue;
     MUX_uxn_c_l32_c22_8a78_iffalse <= VAR_MUX_uxn_c_l32_c22_8a78_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l32_c22_8a78_return_output := MUX_uxn_c_l32_c22_8a78_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l33_c16_2005_left := VAR_MUX_uxn_c_l30_c15_a7f7_return_output;
     REG_VAR_pc_nonzero := VAR_MUX_uxn_c_l30_c15_a7f7_return_output;
     VAR_BIN_OP_AND_uxn_c_l33_c16_2005_right := VAR_MUX_uxn_c_l32_c22_8a78_return_output;
     REG_VAR_system_state_zero := VAR_MUX_uxn_c_l32_c22_8a78_return_output;
     -- CAST_TO_uint16_t[uxn_c_l50_c11_bbac] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_c_l50_c11_bbac_return_output := CAST_TO_uint16_t_uint12_t(
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_f537_return_output);

     -- BIN_OP_AND[uxn_c_l33_c16_2005] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l33_c16_2005_left <= VAR_BIN_OP_AND_uxn_c_l33_c16_2005_left;
     BIN_OP_AND_uxn_c_l33_c16_2005_right <= VAR_BIN_OP_AND_uxn_c_l33_c16_2005_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l33_c16_2005_return_output := BIN_OP_AND_uxn_c_l33_c16_2005_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_2005_return_output;
     VAR_error_MUX_uxn_c_l35_c2_2928_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_2005_return_output;
     VAR_ins_MUX_uxn_c_l35_c2_2928_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_2005_return_output;
     VAR_k_MUX_uxn_c_l35_c2_2928_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_2005_return_output;
     VAR_opc_MUX_uxn_c_l35_c2_2928_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_2005_return_output;
     VAR_s_MUX_uxn_c_l35_c2_2928_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_2005_return_output;
     REG_VAR_should_eval := VAR_BIN_OP_AND_uxn_c_l33_c16_2005_return_output;
     REG_VAR_result := VAR_CAST_TO_uint16_t_uxn_c_l50_c11_bbac_return_output;
     VAR_return_output := VAR_CAST_TO_uint16_t_uxn_c_l50_c11_bbac_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_1aa8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_return_output;

     -- Submodule level 5
     VAR_eval_opcode_uxn_c_l41_c11_04bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_return_output;
     VAR_main_ram_read_uxn_c_l36_c9_9cab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_return_output;
     VAR_pc_add_uxn_c_l37_c3_2382_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1aa8_return_output;
     -- main_ram_read[uxn_c_l36_c9_9cab] LATENCY=0
     -- Clock enable
     main_ram_read_uxn_c_l36_c9_9cab_CLOCK_ENABLE <= VAR_main_ram_read_uxn_c_l36_c9_9cab_CLOCK_ENABLE;
     -- Inputs
     main_ram_read_uxn_c_l36_c9_9cab_address <= VAR_main_ram_read_uxn_c_l36_c9_9cab_address;
     -- Outputs
     VAR_main_ram_read_uxn_c_l36_c9_9cab_return_output := main_ram_read_uxn_c_l36_c9_9cab_return_output;

     -- pc_add[uxn_c_l37_c3_2382] LATENCY=0
     -- Clock enable
     pc_add_uxn_c_l37_c3_2382_CLOCK_ENABLE <= VAR_pc_add_uxn_c_l37_c3_2382_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_c_l37_c3_2382_adjustment <= VAR_pc_add_uxn_c_l37_c3_2382_adjustment;
     -- Outputs

     -- Submodule level 6
     VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_left := VAR_main_ram_read_uxn_c_l36_c9_9cab_return_output;
     -- BIN_OP_AND[uxn_c_l36_c9_6f98] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l36_c9_6f98_left <= VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_left;
     BIN_OP_AND_uxn_c_l36_c9_6f98_right <= VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_return_output := BIN_OP_AND_uxn_c_l36_c9_6f98_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l38_c7_c149_left := VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_return_output;
     VAR_BIN_OP_AND_uxn_c_l39_c7_c05e_left := VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_return_output;
     VAR_BIN_OP_AND_uxn_c_l40_c11_59dc_left := VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_return_output;
     VAR_BIN_OP_AND_uxn_c_l40_c51_6763_left := VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_return_output;
     VAR_CONST_SR_5_uxn_c_l40_c31_92c2_x := VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_04bf_ins := VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_return_output;
     VAR_ins_MUX_uxn_c_l35_c2_2928_iftrue := VAR_BIN_OP_AND_uxn_c_l36_c9_6f98_return_output;
     -- BIN_OP_AND[uxn_c_l40_c11_59dc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c11_59dc_left <= VAR_BIN_OP_AND_uxn_c_l40_c11_59dc_left;
     BIN_OP_AND_uxn_c_l40_c11_59dc_right <= VAR_BIN_OP_AND_uxn_c_l40_c11_59dc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c11_59dc_return_output := BIN_OP_AND_uxn_c_l40_c11_59dc_return_output;

     -- ins_MUX[uxn_c_l35_c2_2928] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l35_c2_2928_cond <= VAR_ins_MUX_uxn_c_l35_c2_2928_cond;
     ins_MUX_uxn_c_l35_c2_2928_iftrue <= VAR_ins_MUX_uxn_c_l35_c2_2928_iftrue;
     ins_MUX_uxn_c_l35_c2_2928_iffalse <= VAR_ins_MUX_uxn_c_l35_c2_2928_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l35_c2_2928_return_output := ins_MUX_uxn_c_l35_c2_2928_return_output;

     -- BIN_OP_AND[uxn_c_l40_c51_6763] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c51_6763_left <= VAR_BIN_OP_AND_uxn_c_l40_c51_6763_left;
     BIN_OP_AND_uxn_c_l40_c51_6763_right <= VAR_BIN_OP_AND_uxn_c_l40_c51_6763_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c51_6763_return_output := BIN_OP_AND_uxn_c_l40_c51_6763_return_output;

     -- BIN_OP_AND[uxn_c_l38_c7_c149] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l38_c7_c149_left <= VAR_BIN_OP_AND_uxn_c_l38_c7_c149_left;
     BIN_OP_AND_uxn_c_l38_c7_c149_right <= VAR_BIN_OP_AND_uxn_c_l38_c7_c149_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l38_c7_c149_return_output := BIN_OP_AND_uxn_c_l38_c7_c149_return_output;

     -- BIN_OP_AND[uxn_c_l39_c7_c05e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l39_c7_c05e_left <= VAR_BIN_OP_AND_uxn_c_l39_c7_c05e_left;
     BIN_OP_AND_uxn_c_l39_c7_c05e_right <= VAR_BIN_OP_AND_uxn_c_l39_c7_c05e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l39_c7_c05e_return_output := BIN_OP_AND_uxn_c_l39_c7_c05e_return_output;

     -- CONST_SR_5[uxn_c_l40_c31_92c2] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_c_l40_c31_92c2_x <= VAR_CONST_SR_5_uxn_c_l40_c31_92c2_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_c_l40_c31_92c2_return_output := CONST_SR_5_uxn_c_l40_c31_92c2_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l38_c7_597b_cond := resize(VAR_BIN_OP_AND_uxn_c_l38_c7_c149_return_output, 1);
     VAR_MUX_uxn_c_l39_c7_ca4c_cond := resize(VAR_BIN_OP_AND_uxn_c_l39_c7_c05e_return_output, 1);
     VAR_UNARY_OP_NOT_uxn_c_l40_c11_83d7_expr := VAR_BIN_OP_AND_uxn_c_l40_c11_59dc_return_output;
     VAR_MUX_uxn_c_l40_c11_2737_iffalse := VAR_BIN_OP_AND_uxn_c_l40_c51_6763_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_9cf2_right := VAR_CONST_SR_5_uxn_c_l40_c31_92c2_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l35_c2_2928_return_output;
     -- UNARY_OP_NOT[uxn_c_l40_c11_83d7] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l40_c11_83d7_expr <= VAR_UNARY_OP_NOT_uxn_c_l40_c11_83d7_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l40_c11_83d7_return_output := UNARY_OP_NOT_uxn_c_l40_c11_83d7_return_output;

     -- MUX[uxn_c_l39_c7_ca4c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l39_c7_ca4c_cond <= VAR_MUX_uxn_c_l39_c7_ca4c_cond;
     MUX_uxn_c_l39_c7_ca4c_iftrue <= VAR_MUX_uxn_c_l39_c7_ca4c_iftrue;
     MUX_uxn_c_l39_c7_ca4c_iffalse <= VAR_MUX_uxn_c_l39_c7_ca4c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l39_c7_ca4c_return_output := MUX_uxn_c_l39_c7_ca4c_return_output;

     -- MUX[uxn_c_l38_c7_597b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l38_c7_597b_cond <= VAR_MUX_uxn_c_l38_c7_597b_cond;
     MUX_uxn_c_l38_c7_597b_iftrue <= VAR_MUX_uxn_c_l38_c7_597b_iftrue;
     MUX_uxn_c_l38_c7_597b_iffalse <= VAR_MUX_uxn_c_l38_c7_597b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l38_c7_597b_return_output := MUX_uxn_c_l38_c7_597b_return_output;

     -- BIN_OP_MINUS[uxn_c_l40_c26_9cf2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l40_c26_9cf2_left <= VAR_BIN_OP_MINUS_uxn_c_l40_c26_9cf2_left;
     BIN_OP_MINUS_uxn_c_l40_c26_9cf2_right <= VAR_BIN_OP_MINUS_uxn_c_l40_c26_9cf2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_9cf2_return_output := BIN_OP_MINUS_uxn_c_l40_c26_9cf2_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l40_c26_ea42_left := VAR_BIN_OP_MINUS_uxn_c_l40_c26_9cf2_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_04bf_k := VAR_MUX_uxn_c_l38_c7_597b_return_output;
     VAR_k_MUX_uxn_c_l35_c2_2928_iftrue := VAR_MUX_uxn_c_l38_c7_597b_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_04bf_stack_index := VAR_MUX_uxn_c_l39_c7_ca4c_return_output;
     VAR_s_MUX_uxn_c_l35_c2_2928_iftrue := VAR_MUX_uxn_c_l39_c7_ca4c_return_output;
     VAR_MUX_uxn_c_l40_c11_2737_cond := resize(VAR_UNARY_OP_NOT_uxn_c_l40_c11_83d7_return_output, 1);
     -- k_MUX[uxn_c_l35_c2_2928] LATENCY=0
     -- Inputs
     k_MUX_uxn_c_l35_c2_2928_cond <= VAR_k_MUX_uxn_c_l35_c2_2928_cond;
     k_MUX_uxn_c_l35_c2_2928_iftrue <= VAR_k_MUX_uxn_c_l35_c2_2928_iftrue;
     k_MUX_uxn_c_l35_c2_2928_iffalse <= VAR_k_MUX_uxn_c_l35_c2_2928_iffalse;
     -- Outputs
     VAR_k_MUX_uxn_c_l35_c2_2928_return_output := k_MUX_uxn_c_l35_c2_2928_return_output;

     -- BIN_OP_AND[uxn_c_l40_c26_ea42] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c26_ea42_left <= VAR_BIN_OP_AND_uxn_c_l40_c26_ea42_left;
     BIN_OP_AND_uxn_c_l40_c26_ea42_right <= VAR_BIN_OP_AND_uxn_c_l40_c26_ea42_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c26_ea42_return_output := BIN_OP_AND_uxn_c_l40_c26_ea42_return_output;

     -- s_MUX[uxn_c_l35_c2_2928] LATENCY=0
     -- Inputs
     s_MUX_uxn_c_l35_c2_2928_cond <= VAR_s_MUX_uxn_c_l35_c2_2928_cond;
     s_MUX_uxn_c_l35_c2_2928_iftrue <= VAR_s_MUX_uxn_c_l35_c2_2928_iftrue;
     s_MUX_uxn_c_l35_c2_2928_iffalse <= VAR_s_MUX_uxn_c_l35_c2_2928_iffalse;
     -- Outputs
     VAR_s_MUX_uxn_c_l35_c2_2928_return_output := s_MUX_uxn_c_l35_c2_2928_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l40_c11_2737_iftrue := VAR_BIN_OP_AND_uxn_c_l40_c26_ea42_return_output;
     REG_VAR_k := VAR_k_MUX_uxn_c_l35_c2_2928_return_output;
     REG_VAR_s := VAR_s_MUX_uxn_c_l35_c2_2928_return_output;
     -- MUX[uxn_c_l40_c11_2737] LATENCY=0
     -- Inputs
     MUX_uxn_c_l40_c11_2737_cond <= VAR_MUX_uxn_c_l40_c11_2737_cond;
     MUX_uxn_c_l40_c11_2737_iftrue <= VAR_MUX_uxn_c_l40_c11_2737_iftrue;
     MUX_uxn_c_l40_c11_2737_iffalse <= VAR_MUX_uxn_c_l40_c11_2737_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l40_c11_2737_return_output := MUX_uxn_c_l40_c11_2737_return_output;

     -- Submodule level 11
     VAR_eval_opcode_uxn_c_l41_c11_04bf_opcode := VAR_MUX_uxn_c_l40_c11_2737_return_output;
     VAR_opc_MUX_uxn_c_l35_c2_2928_iftrue := VAR_MUX_uxn_c_l40_c11_2737_return_output;
     -- eval_opcode[uxn_c_l41_c11_04bf] LATENCY=0
     -- Clock enable
     eval_opcode_uxn_c_l41_c11_04bf_CLOCK_ENABLE <= VAR_eval_opcode_uxn_c_l41_c11_04bf_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_uxn_c_l41_c11_04bf_stack_index <= VAR_eval_opcode_uxn_c_l41_c11_04bf_stack_index;
     eval_opcode_uxn_c_l41_c11_04bf_opcode <= VAR_eval_opcode_uxn_c_l41_c11_04bf_opcode;
     eval_opcode_uxn_c_l41_c11_04bf_ins <= VAR_eval_opcode_uxn_c_l41_c11_04bf_ins;
     eval_opcode_uxn_c_l41_c11_04bf_k <= VAR_eval_opcode_uxn_c_l41_c11_04bf_k;
     -- Outputs
     VAR_eval_opcode_uxn_c_l41_c11_04bf_return_output := eval_opcode_uxn_c_l41_c11_04bf_return_output;

     -- opc_MUX[uxn_c_l35_c2_2928] LATENCY=0
     -- Inputs
     opc_MUX_uxn_c_l35_c2_2928_cond <= VAR_opc_MUX_uxn_c_l35_c2_2928_cond;
     opc_MUX_uxn_c_l35_c2_2928_iftrue <= VAR_opc_MUX_uxn_c_l35_c2_2928_iftrue;
     opc_MUX_uxn_c_l35_c2_2928_iffalse <= VAR_opc_MUX_uxn_c_l35_c2_2928_iffalse;
     -- Outputs
     VAR_opc_MUX_uxn_c_l35_c2_2928_return_output := opc_MUX_uxn_c_l35_c2_2928_return_output;

     -- Submodule level 12
     VAR_error_MUX_uxn_c_l35_c2_2928_iftrue := VAR_eval_opcode_uxn_c_l41_c11_04bf_return_output;
     REG_VAR_opc := VAR_opc_MUX_uxn_c_l35_c2_2928_return_output;
     -- error_MUX[uxn_c_l35_c2_2928] LATENCY=0
     -- Inputs
     error_MUX_uxn_c_l35_c2_2928_cond <= VAR_error_MUX_uxn_c_l35_c2_2928_cond;
     error_MUX_uxn_c_l35_c2_2928_iftrue <= VAR_error_MUX_uxn_c_l35_c2_2928_iftrue;
     error_MUX_uxn_c_l35_c2_2928_iffalse <= VAR_error_MUX_uxn_c_l35_c2_2928_iffalse;
     -- Outputs
     VAR_error_MUX_uxn_c_l35_c2_2928_return_output := error_MUX_uxn_c_l35_c2_2928_return_output;

     -- Submodule level 13
     REG_VAR_error := VAR_error_MUX_uxn_c_l35_c2_2928_return_output;
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
