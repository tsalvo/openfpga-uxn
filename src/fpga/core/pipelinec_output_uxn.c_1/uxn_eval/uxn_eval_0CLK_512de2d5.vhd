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
entity uxn_eval_0CLK_512de2d5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_512de2d5;
architecture arch of uxn_eval_0CLK_512de2d5 is
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
-- pc_get[uxn_c_l29_c7_2f2c]
signal pc_get_uxn_c_l29_c7_2f2c_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_c_l29_c7_2f2c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l30_c15_5ecd]
signal BIN_OP_EQ_uxn_c_l30_c15_5ecd_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l30_c15_5ecd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l30_c15_5ecd_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l30_c15_230e]
signal MUX_uxn_c_l30_c15_230e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_230e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_230e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l30_c15_230e_return_output : unsigned(0 downto 0);

-- peek_dev[uxn_c_l31_c17_eed3]
signal peek_dev_uxn_c_l31_c17_eed3_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_c_l31_c17_eed3_address : unsigned(7 downto 0);
signal peek_dev_uxn_c_l31_c17_eed3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l32_c22_31d2]
signal BIN_OP_EQ_uxn_c_l32_c22_31d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c22_31d2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l32_c22_31d2_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l32_c22_d22b]
signal MUX_uxn_c_l32_c22_d22b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_d22b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_d22b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l32_c22_d22b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l33_c16_212f]
signal BIN_OP_AND_uxn_c_l33_c16_212f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l33_c16_212f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l33_c16_212f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_0ee0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_return_output : unsigned(0 downto 0);

-- opc_MUX[uxn_c_l35_c2_3840]
signal opc_MUX_uxn_c_l35_c2_3840_cond : unsigned(0 downto 0);
signal opc_MUX_uxn_c_l35_c2_3840_iftrue : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l35_c2_3840_iffalse : unsigned(7 downto 0);
signal opc_MUX_uxn_c_l35_c2_3840_return_output : unsigned(7 downto 0);

-- k_MUX[uxn_c_l35_c2_3840]
signal k_MUX_uxn_c_l35_c2_3840_cond : unsigned(0 downto 0);
signal k_MUX_uxn_c_l35_c2_3840_iftrue : unsigned(7 downto 0);
signal k_MUX_uxn_c_l35_c2_3840_iffalse : unsigned(7 downto 0);
signal k_MUX_uxn_c_l35_c2_3840_return_output : unsigned(7 downto 0);

-- s_MUX[uxn_c_l35_c2_3840]
signal s_MUX_uxn_c_l35_c2_3840_cond : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_3840_iftrue : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_3840_iffalse : unsigned(0 downto 0);
signal s_MUX_uxn_c_l35_c2_3840_return_output : unsigned(0 downto 0);

-- error_MUX[uxn_c_l35_c2_3840]
signal error_MUX_uxn_c_l35_c2_3840_cond : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_3840_iftrue : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_3840_iffalse : unsigned(0 downto 0);
signal error_MUX_uxn_c_l35_c2_3840_return_output : unsigned(0 downto 0);

-- ins_MUX[uxn_c_l35_c2_3840]
signal ins_MUX_uxn_c_l35_c2_3840_cond : unsigned(0 downto 0);
signal ins_MUX_uxn_c_l35_c2_3840_iftrue : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l35_c2_3840_iffalse : unsigned(7 downto 0);
signal ins_MUX_uxn_c_l35_c2_3840_return_output : unsigned(7 downto 0);

-- peek_ram[uxn_c_l36_c9_179f]
signal peek_ram_uxn_c_l36_c9_179f_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_ram_uxn_c_l36_c9_179f_address : unsigned(15 downto 0);
signal peek_ram_uxn_c_l36_c9_179f_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l36_c9_e1cf]
signal BIN_OP_AND_uxn_c_l36_c9_e1cf_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l36_c9_e1cf_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l36_c9_e1cf_return_output : unsigned(7 downto 0);

-- pc_add[uxn_c_l37_c3_0fb2]
signal pc_add_uxn_c_l37_c3_0fb2_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_c_l37_c3_0fb2_adjustment : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l38_c7_5cd0]
signal BIN_OP_AND_uxn_c_l38_c7_5cd0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l38_c7_5cd0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l38_c7_5cd0_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l38_c7_d3f8]
signal MUX_uxn_c_l38_c7_d3f8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l38_c7_d3f8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l38_c7_d3f8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l38_c7_d3f8_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l39_c7_b4af]
signal BIN_OP_AND_uxn_c_l39_c7_b4af_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_b4af_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_c_l39_c7_b4af_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l39_c7_b03d]
signal MUX_uxn_c_l39_c7_b03d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_b03d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_b03d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l39_c7_b03d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l40_c11_8650]
signal BIN_OP_AND_uxn_c_l40_c11_8650_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c11_8650_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_c_l40_c11_8650_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l40_c11_c14c]
signal UNARY_OP_NOT_uxn_c_l40_c11_c14c_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_c_l40_c11_c14c_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_c_l40_c31_bf7c]
signal CONST_SR_5_uxn_c_l40_c31_bf7c_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_c_l40_c31_bf7c_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_c_l40_c26_45d2]
signal BIN_OP_MINUS_uxn_c_l40_c26_45d2_left : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_c_l40_c26_45d2_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_c_l40_c26_45d2_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l40_c26_e76c]
signal BIN_OP_AND_uxn_c_l40_c26_e76c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l40_c26_e76c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c26_e76c_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l40_c51_91ef]
signal BIN_OP_AND_uxn_c_l40_c51_91ef_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l40_c51_91ef_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_c_l40_c51_91ef_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l40_c11_2122]
signal MUX_uxn_c_l40_c11_2122_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l40_c11_2122_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l40_c11_2122_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l40_c11_2122_return_output : unsigned(7 downto 0);

-- eval_opcode[uxn_c_l41_c11_410b]
signal eval_opcode_uxn_c_l41_c11_410b_CLOCK_ENABLE : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l41_c11_410b_stack_index : unsigned(0 downto 0);
signal eval_opcode_uxn_c_l41_c11_410b_opcode : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_410b_ins : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_410b_k : unsigned(7 downto 0);
signal eval_opcode_uxn_c_l41_c11_410b_return_output : unsigned(0 downto 0);

-- screen_ram_update[uxn_c_l44_c32_5d2d]
signal screen_ram_update_uxn_c_l44_c32_5d2d_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_ram_update_uxn_c_l44_c32_5d2d_write_address : unsigned(31 downto 0);
signal screen_ram_update_uxn_c_l44_c32_5d2d_write_value : unsigned(1 downto 0);
signal screen_ram_update_uxn_c_l44_c32_5d2d_read_address : unsigned(31 downto 0);
signal screen_ram_update_uxn_c_l44_c32_5d2d_return_output : unsigned(1 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l50_c22_26f4]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l53_c6_d4dd]
signal BIN_OP_EQ_uxn_c_l53_c6_d4dd_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l53_c6_d4dd_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l53_c6_d4dd_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l53_c2_412e]
signal pixel_counter_MUX_uxn_c_l53_c2_412e_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_412e_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_412e_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l53_c2_412e_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l56_c3_0699]
signal BIN_OP_PLUS_uxn_c_l56_c3_0699_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l56_c3_0699_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l56_c3_0699_return_output : unsigned(32 downto 0);

-- BIN_OP_EQ[uxn_c_l60_c6_0908]
signal BIN_OP_EQ_uxn_c_l60_c6_0908_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l60_c6_0908_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l60_c6_0908_return_output : unsigned(0 downto 0);

-- clock_cycle_counter_MUX[uxn_c_l60_c2_15b0]
signal clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_cond : unsigned(0 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_iftrue : unsigned(31 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_iffalse : unsigned(31 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_return_output : unsigned(31 downto 0);

-- seconds_counter_MUX[uxn_c_l60_c2_15b0]
signal seconds_counter_MUX_uxn_c_l60_c2_15b0_cond : unsigned(0 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_15b0_iftrue : unsigned(31 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_15b0_iffalse : unsigned(31 downto 0);
signal seconds_counter_MUX_uxn_c_l60_c2_15b0_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l61_c3_194d]
signal BIN_OP_PLUS_uxn_c_l61_c3_194d_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l61_c3_194d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l61_c3_194d_return_output : unsigned(32 downto 0);

-- BIN_OP_PLUS[uxn_c_l64_c3_8dd7]
signal BIN_OP_PLUS_uxn_c_l64_c3_8dd7_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l64_c3_8dd7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l64_c3_8dd7_return_output : unsigned(32 downto 0);

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
-- pc_get_uxn_c_l29_c7_2f2c
pc_get_uxn_c_l29_c7_2f2c : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_c_l29_c7_2f2c_CLOCK_ENABLE,
pc_get_uxn_c_l29_c7_2f2c_return_output);

-- BIN_OP_EQ_uxn_c_l30_c15_5ecd
BIN_OP_EQ_uxn_c_l30_c15_5ecd : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l30_c15_5ecd_left,
BIN_OP_EQ_uxn_c_l30_c15_5ecd_right,
BIN_OP_EQ_uxn_c_l30_c15_5ecd_return_output);

-- MUX_uxn_c_l30_c15_230e
MUX_uxn_c_l30_c15_230e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l30_c15_230e_cond,
MUX_uxn_c_l30_c15_230e_iftrue,
MUX_uxn_c_l30_c15_230e_iffalse,
MUX_uxn_c_l30_c15_230e_return_output);

-- peek_dev_uxn_c_l31_c17_eed3
peek_dev_uxn_c_l31_c17_eed3 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_c_l31_c17_eed3_CLOCK_ENABLE,
peek_dev_uxn_c_l31_c17_eed3_address,
peek_dev_uxn_c_l31_c17_eed3_return_output);

-- BIN_OP_EQ_uxn_c_l32_c22_31d2
BIN_OP_EQ_uxn_c_l32_c22_31d2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l32_c22_31d2_left,
BIN_OP_EQ_uxn_c_l32_c22_31d2_right,
BIN_OP_EQ_uxn_c_l32_c22_31d2_return_output);

-- MUX_uxn_c_l32_c22_d22b
MUX_uxn_c_l32_c22_d22b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l32_c22_d22b_cond,
MUX_uxn_c_l32_c22_d22b_iftrue,
MUX_uxn_c_l32_c22_d22b_iffalse,
MUX_uxn_c_l32_c22_d22b_return_output);

-- BIN_OP_AND_uxn_c_l33_c16_212f
BIN_OP_AND_uxn_c_l33_c16_212f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l33_c16_212f_left,
BIN_OP_AND_uxn_c_l33_c16_212f_right,
BIN_OP_AND_uxn_c_l33_c16_212f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_return_output);

-- opc_MUX_uxn_c_l35_c2_3840
opc_MUX_uxn_c_l35_c2_3840 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
opc_MUX_uxn_c_l35_c2_3840_cond,
opc_MUX_uxn_c_l35_c2_3840_iftrue,
opc_MUX_uxn_c_l35_c2_3840_iffalse,
opc_MUX_uxn_c_l35_c2_3840_return_output);

-- k_MUX_uxn_c_l35_c2_3840
k_MUX_uxn_c_l35_c2_3840 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
k_MUX_uxn_c_l35_c2_3840_cond,
k_MUX_uxn_c_l35_c2_3840_iftrue,
k_MUX_uxn_c_l35_c2_3840_iffalse,
k_MUX_uxn_c_l35_c2_3840_return_output);

-- s_MUX_uxn_c_l35_c2_3840
s_MUX_uxn_c_l35_c2_3840 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
s_MUX_uxn_c_l35_c2_3840_cond,
s_MUX_uxn_c_l35_c2_3840_iftrue,
s_MUX_uxn_c_l35_c2_3840_iffalse,
s_MUX_uxn_c_l35_c2_3840_return_output);

-- error_MUX_uxn_c_l35_c2_3840
error_MUX_uxn_c_l35_c2_3840 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
error_MUX_uxn_c_l35_c2_3840_cond,
error_MUX_uxn_c_l35_c2_3840_iftrue,
error_MUX_uxn_c_l35_c2_3840_iffalse,
error_MUX_uxn_c_l35_c2_3840_return_output);

-- ins_MUX_uxn_c_l35_c2_3840
ins_MUX_uxn_c_l35_c2_3840 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ins_MUX_uxn_c_l35_c2_3840_cond,
ins_MUX_uxn_c_l35_c2_3840_iftrue,
ins_MUX_uxn_c_l35_c2_3840_iffalse,
ins_MUX_uxn_c_l35_c2_3840_return_output);

-- peek_ram_uxn_c_l36_c9_179f
peek_ram_uxn_c_l36_c9_179f : entity work.peek_ram_0CLK_7bf2eff3 port map (
clk,
peek_ram_uxn_c_l36_c9_179f_CLOCK_ENABLE,
peek_ram_uxn_c_l36_c9_179f_address,
peek_ram_uxn_c_l36_c9_179f_return_output);

-- BIN_OP_AND_uxn_c_l36_c9_e1cf
BIN_OP_AND_uxn_c_l36_c9_e1cf : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l36_c9_e1cf_left,
BIN_OP_AND_uxn_c_l36_c9_e1cf_right,
BIN_OP_AND_uxn_c_l36_c9_e1cf_return_output);

-- pc_add_uxn_c_l37_c3_0fb2
pc_add_uxn_c_l37_c3_0fb2 : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_c_l37_c3_0fb2_CLOCK_ENABLE,
pc_add_uxn_c_l37_c3_0fb2_adjustment);

-- BIN_OP_AND_uxn_c_l38_c7_5cd0
BIN_OP_AND_uxn_c_l38_c7_5cd0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l38_c7_5cd0_left,
BIN_OP_AND_uxn_c_l38_c7_5cd0_right,
BIN_OP_AND_uxn_c_l38_c7_5cd0_return_output);

-- MUX_uxn_c_l38_c7_d3f8
MUX_uxn_c_l38_c7_d3f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l38_c7_d3f8_cond,
MUX_uxn_c_l38_c7_d3f8_iftrue,
MUX_uxn_c_l38_c7_d3f8_iffalse,
MUX_uxn_c_l38_c7_d3f8_return_output);

-- BIN_OP_AND_uxn_c_l39_c7_b4af
BIN_OP_AND_uxn_c_l39_c7_b4af : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l39_c7_b4af_left,
BIN_OP_AND_uxn_c_l39_c7_b4af_right,
BIN_OP_AND_uxn_c_l39_c7_b4af_return_output);

-- MUX_uxn_c_l39_c7_b03d
MUX_uxn_c_l39_c7_b03d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l39_c7_b03d_cond,
MUX_uxn_c_l39_c7_b03d_iftrue,
MUX_uxn_c_l39_c7_b03d_iffalse,
MUX_uxn_c_l39_c7_b03d_return_output);

-- BIN_OP_AND_uxn_c_l40_c11_8650
BIN_OP_AND_uxn_c_l40_c11_8650 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c11_8650_left,
BIN_OP_AND_uxn_c_l40_c11_8650_right,
BIN_OP_AND_uxn_c_l40_c11_8650_return_output);

-- UNARY_OP_NOT_uxn_c_l40_c11_c14c
UNARY_OP_NOT_uxn_c_l40_c11_c14c : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l40_c11_c14c_expr,
UNARY_OP_NOT_uxn_c_l40_c11_c14c_return_output);

-- CONST_SR_5_uxn_c_l40_c31_bf7c
CONST_SR_5_uxn_c_l40_c31_bf7c : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_c_l40_c31_bf7c_x,
CONST_SR_5_uxn_c_l40_c31_bf7c_return_output);

-- BIN_OP_MINUS_uxn_c_l40_c26_45d2
BIN_OP_MINUS_uxn_c_l40_c26_45d2 : entity work.BIN_OP_MINUS_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_c_l40_c26_45d2_left,
BIN_OP_MINUS_uxn_c_l40_c26_45d2_right,
BIN_OP_MINUS_uxn_c_l40_c26_45d2_return_output);

-- BIN_OP_AND_uxn_c_l40_c26_e76c
BIN_OP_AND_uxn_c_l40_c26_e76c : entity work.BIN_OP_AND_uint1_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c26_e76c_left,
BIN_OP_AND_uxn_c_l40_c26_e76c_right,
BIN_OP_AND_uxn_c_l40_c26_e76c_return_output);

-- BIN_OP_AND_uxn_c_l40_c51_91ef
BIN_OP_AND_uxn_c_l40_c51_91ef : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l40_c51_91ef_left,
BIN_OP_AND_uxn_c_l40_c51_91ef_right,
BIN_OP_AND_uxn_c_l40_c51_91ef_return_output);

-- MUX_uxn_c_l40_c11_2122
MUX_uxn_c_l40_c11_2122 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l40_c11_2122_cond,
MUX_uxn_c_l40_c11_2122_iftrue,
MUX_uxn_c_l40_c11_2122_iffalse,
MUX_uxn_c_l40_c11_2122_return_output);

-- eval_opcode_uxn_c_l41_c11_410b
eval_opcode_uxn_c_l41_c11_410b : entity work.eval_opcode_0CLK_c5f1fcde port map (
clk,
eval_opcode_uxn_c_l41_c11_410b_CLOCK_ENABLE,
eval_opcode_uxn_c_l41_c11_410b_stack_index,
eval_opcode_uxn_c_l41_c11_410b_opcode,
eval_opcode_uxn_c_l41_c11_410b_ins,
eval_opcode_uxn_c_l41_c11_410b_k,
eval_opcode_uxn_c_l41_c11_410b_return_output);

-- screen_ram_update_uxn_c_l44_c32_5d2d
screen_ram_update_uxn_c_l44_c32_5d2d : entity work.screen_ram_update_0CLK_b4ec7bd0 port map (
clk,
screen_ram_update_uxn_c_l44_c32_5d2d_CLOCK_ENABLE,
screen_ram_update_uxn_c_l44_c32_5d2d_write_address,
screen_ram_update_uxn_c_l44_c32_5d2d_write_value,
screen_ram_update_uxn_c_l44_c32_5d2d_read_address,
screen_ram_update_uxn_c_l44_c32_5d2d_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_return_output);

-- BIN_OP_EQ_uxn_c_l53_c6_d4dd
BIN_OP_EQ_uxn_c_l53_c6_d4dd : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l53_c6_d4dd_left,
BIN_OP_EQ_uxn_c_l53_c6_d4dd_right,
BIN_OP_EQ_uxn_c_l53_c6_d4dd_return_output);

-- pixel_counter_MUX_uxn_c_l53_c2_412e
pixel_counter_MUX_uxn_c_l53_c2_412e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l53_c2_412e_cond,
pixel_counter_MUX_uxn_c_l53_c2_412e_iftrue,
pixel_counter_MUX_uxn_c_l53_c2_412e_iffalse,
pixel_counter_MUX_uxn_c_l53_c2_412e_return_output);

-- BIN_OP_PLUS_uxn_c_l56_c3_0699
BIN_OP_PLUS_uxn_c_l56_c3_0699 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l56_c3_0699_left,
BIN_OP_PLUS_uxn_c_l56_c3_0699_right,
BIN_OP_PLUS_uxn_c_l56_c3_0699_return_output);

-- BIN_OP_EQ_uxn_c_l60_c6_0908
BIN_OP_EQ_uxn_c_l60_c6_0908 : entity work.BIN_OP_EQ_uint32_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l60_c6_0908_left,
BIN_OP_EQ_uxn_c_l60_c6_0908_right,
BIN_OP_EQ_uxn_c_l60_c6_0908_return_output);

-- clock_cycle_counter_MUX_uxn_c_l60_c2_15b0
clock_cycle_counter_MUX_uxn_c_l60_c2_15b0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_cond,
clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_iftrue,
clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_iffalse,
clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_return_output);

-- seconds_counter_MUX_uxn_c_l60_c2_15b0
seconds_counter_MUX_uxn_c_l60_c2_15b0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
seconds_counter_MUX_uxn_c_l60_c2_15b0_cond,
seconds_counter_MUX_uxn_c_l60_c2_15b0_iftrue,
seconds_counter_MUX_uxn_c_l60_c2_15b0_iffalse,
seconds_counter_MUX_uxn_c_l60_c2_15b0_return_output);

-- BIN_OP_PLUS_uxn_c_l61_c3_194d
BIN_OP_PLUS_uxn_c_l61_c3_194d : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l61_c3_194d_left,
BIN_OP_PLUS_uxn_c_l61_c3_194d_right,
BIN_OP_PLUS_uxn_c_l61_c3_194d_return_output);

-- BIN_OP_PLUS_uxn_c_l64_c3_8dd7
BIN_OP_PLUS_uxn_c_l64_c3_8dd7 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l64_c3_8dd7_left,
BIN_OP_PLUS_uxn_c_l64_c3_8dd7_right,
BIN_OP_PLUS_uxn_c_l64_c3_8dd7_return_output);



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
 pc_get_uxn_c_l29_c7_2f2c_return_output,
 BIN_OP_EQ_uxn_c_l30_c15_5ecd_return_output,
 MUX_uxn_c_l30_c15_230e_return_output,
 peek_dev_uxn_c_l31_c17_eed3_return_output,
 BIN_OP_EQ_uxn_c_l32_c22_31d2_return_output,
 MUX_uxn_c_l32_c22_d22b_return_output,
 BIN_OP_AND_uxn_c_l33_c16_212f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_return_output,
 opc_MUX_uxn_c_l35_c2_3840_return_output,
 k_MUX_uxn_c_l35_c2_3840_return_output,
 s_MUX_uxn_c_l35_c2_3840_return_output,
 error_MUX_uxn_c_l35_c2_3840_return_output,
 ins_MUX_uxn_c_l35_c2_3840_return_output,
 peek_ram_uxn_c_l36_c9_179f_return_output,
 BIN_OP_AND_uxn_c_l36_c9_e1cf_return_output,
 BIN_OP_AND_uxn_c_l38_c7_5cd0_return_output,
 MUX_uxn_c_l38_c7_d3f8_return_output,
 BIN_OP_AND_uxn_c_l39_c7_b4af_return_output,
 MUX_uxn_c_l39_c7_b03d_return_output,
 BIN_OP_AND_uxn_c_l40_c11_8650_return_output,
 UNARY_OP_NOT_uxn_c_l40_c11_c14c_return_output,
 CONST_SR_5_uxn_c_l40_c31_bf7c_return_output,
 BIN_OP_MINUS_uxn_c_l40_c26_45d2_return_output,
 BIN_OP_AND_uxn_c_l40_c26_e76c_return_output,
 BIN_OP_AND_uxn_c_l40_c51_91ef_return_output,
 MUX_uxn_c_l40_c11_2122_return_output,
 eval_opcode_uxn_c_l41_c11_410b_return_output,
 screen_ram_update_uxn_c_l44_c32_5d2d_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_return_output,
 BIN_OP_EQ_uxn_c_l53_c6_d4dd_return_output,
 pixel_counter_MUX_uxn_c_l53_c2_412e_return_output,
 BIN_OP_PLUS_uxn_c_l56_c3_0699_return_output,
 BIN_OP_EQ_uxn_c_l60_c6_0908_return_output,
 clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_return_output,
 seconds_counter_MUX_uxn_c_l60_c2_15b0_return_output,
 BIN_OP_PLUS_uxn_c_l61_c3_194d_return_output,
 BIN_OP_PLUS_uxn_c_l64_c3_8dd7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_c_l29_c7_2f2c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_c_l29_c7_2f2c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_230e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_230e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_230e_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_5ecd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_5ecd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l30_c15_5ecd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l30_c15_230e_return_output : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_c_l31_c17_eed3_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_c_l31_c17_eed3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_c_l31_c17_eed3_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_d22b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_d22b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_d22b_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_31d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_31d2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l32_c22_31d2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l32_c22_d22b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_212f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_212f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l33_c16_212f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_3840_iftrue : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_3840_iffalse : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_3840_return_output : unsigned(7 downto 0);
 variable VAR_opc_MUX_uxn_c_l35_c2_3840_cond : unsigned(0 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_3840_iftrue : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_3840_iffalse : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_3840_return_output : unsigned(7 downto 0);
 variable VAR_k_MUX_uxn_c_l35_c2_3840_cond : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_3840_iftrue : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_3840_iffalse : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_3840_return_output : unsigned(0 downto 0);
 variable VAR_s_MUX_uxn_c_l35_c2_3840_cond : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_3840_iftrue : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_3840_iffalse : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_3840_return_output : unsigned(0 downto 0);
 variable VAR_error_MUX_uxn_c_l35_c2_3840_cond : unsigned(0 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_3840_iftrue : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_3840_iffalse : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_3840_return_output : unsigned(7 downto 0);
 variable VAR_ins_MUX_uxn_c_l35_c2_3840_cond : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_179f_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_left : unsigned(7 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_179f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_ram_uxn_c_l36_c9_179f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_return_output : unsigned(7 downto 0);
 variable VAR_pc_add_uxn_c_l37_c3_0fb2_adjustment : unsigned(15 downto 0);
 variable VAR_pc_add_uxn_c_l37_c3_0fb2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_d3f8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_d3f8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_d3f8_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_5cd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_5cd0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l38_c7_5cd0_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l38_c7_d3f8_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_b03d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_b03d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_b03d_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_b4af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_b4af_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l39_c7_b4af_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l39_c7_b03d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_2122_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_2122_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_2122_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_8650_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_8650_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c11_8650_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l40_c11_c14c_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l40_c11_c14c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_45d2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_45d2_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l40_c31_bf7c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_c_l40_c31_bf7c_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_c_l40_c26_45d2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_e76c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_e76c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c26_e76c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_91ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_91ef_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l40_c51_91ef_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l40_c11_2122_return_output : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_410b_stack_index : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_410b_opcode : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_410b_ins : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_410b_k : unsigned(7 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_410b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eval_opcode_uxn_c_l41_c11_410b_return_output : unsigned(0 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_5d2d_write_address : unsigned(31 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_5d2d_write_value : unsigned(1 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_5d2d_read_address : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l46_c3_034e_return_output : unsigned(1 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_5d2d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_ram_update_uxn_c_l44_c32_5d2d_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_ref_toks_0 : uint12_t_4;
 variable VAR_CAST_TO_uint16_t_uxn_c_l50_c11_ece4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_d4dd_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_d4dd_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l53_c6_d4dd_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_412e_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l54_c3_ed6b : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_412e_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l56_c3_fb19 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_412e_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l53_c2_412e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_0699_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_0699_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l56_c3_0699_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_0908_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_0908_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l60_c6_0908_return_output : unsigned(0 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_iftrue : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_uxn_c_l62_c3_d85a : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_iffalse : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_uxn_c_l64_c3_00b6 : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_return_output : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_cond : unsigned(0 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_15b0_iftrue : unsigned(31 downto 0);
 variable VAR_seconds_counter_uxn_c_l61_c3_65d5 : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_15b0_iffalse : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_15b0_return_output : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l60_c2_15b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_194d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_194d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l61_c3_194d_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_8dd7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_8dd7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l64_c3_8dd7_return_output : unsigned(32 downto 0);
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
     VAR_MUX_uxn_c_l39_c7_b03d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l38_c7_5cd0_right := to_unsigned(128, 8);
     VAR_clock_cycle_counter_uxn_c_l62_c3_d85a := resize(to_unsigned(0, 1), 32);
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_iftrue := VAR_clock_cycle_counter_uxn_c_l62_c3_d85a;
     VAR_BIN_OP_EQ_uxn_c_l32_c22_31d2_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l38_c7_d3f8_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_AND_uxn_c_l40_c26_e76c_right := to_unsigned(255, 8);
     VAR_MUX_uxn_c_l30_c15_230e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l39_c7_b4af_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_c_l30_c15_5ecd_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l38_c7_d3f8_iftrue := to_unsigned(255, 8);
     VAR_MUX_uxn_c_l30_c15_230e_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l40_c51_91ef_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_c_l53_c6_d4dd_right := to_unsigned(204799, 18);
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_45d2_left := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l32_c22_d22b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l60_c6_0908_right := to_unsigned(12287998, 24);
     VAR_BIN_OP_AND_uxn_c_l40_c11_8650_right := to_unsigned(31, 5);
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_0699_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_right := to_unsigned(255, 8);
     VAR_MUX_uxn_c_l32_c22_d22b_iftrue := to_unsigned(1, 1);
     VAR_pixel_counter_uxn_c_l54_c3_ed6b := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l53_c2_412e_iftrue := VAR_pixel_counter_uxn_c_l54_c3_ed6b;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_8dd7_right := to_unsigned(1, 1);
     VAR_pc_add_uxn_c_l37_c3_0fb2_adjustment := resize(to_unsigned(1, 1), 16);
     VAR_MUX_uxn_c_l39_c7_b03d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_194d_right := to_unsigned(1, 1);
     VAR_error_MUX_uxn_c_l35_c2_3840_iffalse := to_unsigned(0, 1);
     VAR_peek_dev_uxn_c_l31_c17_eed3_address := resize(to_unsigned(15, 4), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_iftrue := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_c_l29_c7_2f2c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_peek_dev_uxn_c_l31_c17_eed3_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_screen_ram_update_uxn_c_l44_c32_5d2d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l60_c6_0908_left := clock_cycle_counter;
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_8dd7_left := clock_cycle_counter;
     VAR_ins_MUX_uxn_c_l35_c2_3840_iffalse := ins;
     VAR_k_MUX_uxn_c_l35_c2_3840_iffalse := k;
     VAR_opc_MUX_uxn_c_l35_c2_3840_iffalse := opc;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_ref_toks_0 := palette_color_values;
     REG_VAR_palette_color_values := palette_color_values;
     VAR_BIN_OP_EQ_uxn_c_l53_c6_d4dd_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_0699_left := pixel_counter;
     VAR_screen_ram_update_uxn_c_l44_c32_5d2d_read_address := pixel_counter;
     VAR_screen_ram_update_uxn_c_l44_c32_5d2d_write_address := pixel_counter;
     VAR_s_MUX_uxn_c_l35_c2_3840_iffalse := s;
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_194d_left := seconds_counter;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_15b0_iffalse := seconds_counter;
     -- BIN_OP_EQ[uxn_c_l60_c6_0908] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l60_c6_0908_left <= VAR_BIN_OP_EQ_uxn_c_l60_c6_0908_left;
     BIN_OP_EQ_uxn_c_l60_c6_0908_right <= VAR_BIN_OP_EQ_uxn_c_l60_c6_0908_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l60_c6_0908_return_output := BIN_OP_EQ_uxn_c_l60_c6_0908_return_output;

     -- BIN_OP_EQ[uxn_c_l53_c6_d4dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l53_c6_d4dd_left <= VAR_BIN_OP_EQ_uxn_c_l53_c6_d4dd_left;
     BIN_OP_EQ_uxn_c_l53_c6_d4dd_right <= VAR_BIN_OP_EQ_uxn_c_l53_c6_d4dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l53_c6_d4dd_return_output := BIN_OP_EQ_uxn_c_l53_c6_d4dd_return_output;

     -- BIN_OP_PLUS[uxn_c_l64_c3_8dd7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l64_c3_8dd7_left <= VAR_BIN_OP_PLUS_uxn_c_l64_c3_8dd7_left;
     BIN_OP_PLUS_uxn_c_l64_c3_8dd7_right <= VAR_BIN_OP_PLUS_uxn_c_l64_c3_8dd7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l64_c3_8dd7_return_output := BIN_OP_PLUS_uxn_c_l64_c3_8dd7_return_output;

     -- peek_dev[uxn_c_l31_c17_eed3] LATENCY=0
     -- Clock enable
     peek_dev_uxn_c_l31_c17_eed3_CLOCK_ENABLE <= VAR_peek_dev_uxn_c_l31_c17_eed3_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_c_l31_c17_eed3_address <= VAR_peek_dev_uxn_c_l31_c17_eed3_address;
     -- Outputs
     VAR_peek_dev_uxn_c_l31_c17_eed3_return_output := peek_dev_uxn_c_l31_c17_eed3_return_output;

     -- CAST_TO_uint2_t[uxn_c_l46_c3_034e] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l46_c3_034e_return_output := CAST_TO_uint2_t_uint32_t(
     seconds_counter);

     -- pc_get[uxn_c_l29_c7_2f2c] LATENCY=0
     -- Clock enable
     pc_get_uxn_c_l29_c7_2f2c_CLOCK_ENABLE <= VAR_pc_get_uxn_c_l29_c7_2f2c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_c_l29_c7_2f2c_return_output := pc_get_uxn_c_l29_c7_2f2c_return_output;

     -- BIN_OP_PLUS[uxn_c_l61_c3_194d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l61_c3_194d_left <= VAR_BIN_OP_PLUS_uxn_c_l61_c3_194d_left;
     BIN_OP_PLUS_uxn_c_l61_c3_194d_right <= VAR_BIN_OP_PLUS_uxn_c_l61_c3_194d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l61_c3_194d_return_output := BIN_OP_PLUS_uxn_c_l61_c3_194d_return_output;

     -- BIN_OP_PLUS[uxn_c_l56_c3_0699] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l56_c3_0699_left <= VAR_BIN_OP_PLUS_uxn_c_l56_c3_0699_left;
     BIN_OP_PLUS_uxn_c_l56_c3_0699_right <= VAR_BIN_OP_PLUS_uxn_c_l56_c3_0699_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l56_c3_0699_return_output := BIN_OP_PLUS_uxn_c_l56_c3_0699_return_output;

     -- Submodule level 1
     VAR_pixel_counter_MUX_uxn_c_l53_c2_412e_cond := VAR_BIN_OP_EQ_uxn_c_l53_c6_d4dd_return_output;
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_cond := VAR_BIN_OP_EQ_uxn_c_l60_c6_0908_return_output;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_15b0_cond := VAR_BIN_OP_EQ_uxn_c_l60_c6_0908_return_output;
     VAR_pixel_counter_uxn_c_l56_c3_fb19 := resize(VAR_BIN_OP_PLUS_uxn_c_l56_c3_0699_return_output, 32);
     VAR_seconds_counter_uxn_c_l61_c3_65d5 := resize(VAR_BIN_OP_PLUS_uxn_c_l61_c3_194d_return_output, 32);
     VAR_clock_cycle_counter_uxn_c_l64_c3_00b6 := resize(VAR_BIN_OP_PLUS_uxn_c_l64_c3_8dd7_return_output, 32);
     VAR_screen_ram_update_uxn_c_l44_c32_5d2d_write_value := VAR_CAST_TO_uint2_t_uxn_c_l46_c3_034e_return_output;
     VAR_BIN_OP_EQ_uxn_c_l30_c15_5ecd_left := VAR_pc_get_uxn_c_l29_c7_2f2c_return_output;
     REG_VAR_pc := VAR_pc_get_uxn_c_l29_c7_2f2c_return_output;
     VAR_peek_ram_uxn_c_l36_c9_179f_address := VAR_pc_get_uxn_c_l29_c7_2f2c_return_output;
     VAR_BIN_OP_EQ_uxn_c_l32_c22_31d2_left := VAR_peek_dev_uxn_c_l31_c17_eed3_return_output;
     REG_VAR_system_state := VAR_peek_dev_uxn_c_l31_c17_eed3_return_output;
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_iffalse := VAR_clock_cycle_counter_uxn_c_l64_c3_00b6;
     VAR_pixel_counter_MUX_uxn_c_l53_c2_412e_iffalse := VAR_pixel_counter_uxn_c_l56_c3_fb19;
     VAR_seconds_counter_MUX_uxn_c_l60_c2_15b0_iftrue := VAR_seconds_counter_uxn_c_l61_c3_65d5;
     -- screen_ram_update[uxn_c_l44_c32_5d2d] LATENCY=0
     -- Clock enable
     screen_ram_update_uxn_c_l44_c32_5d2d_CLOCK_ENABLE <= VAR_screen_ram_update_uxn_c_l44_c32_5d2d_CLOCK_ENABLE;
     -- Inputs
     screen_ram_update_uxn_c_l44_c32_5d2d_write_address <= VAR_screen_ram_update_uxn_c_l44_c32_5d2d_write_address;
     screen_ram_update_uxn_c_l44_c32_5d2d_write_value <= VAR_screen_ram_update_uxn_c_l44_c32_5d2d_write_value;
     screen_ram_update_uxn_c_l44_c32_5d2d_read_address <= VAR_screen_ram_update_uxn_c_l44_c32_5d2d_read_address;
     -- Outputs
     VAR_screen_ram_update_uxn_c_l44_c32_5d2d_return_output := screen_ram_update_uxn_c_l44_c32_5d2d_return_output;

     -- seconds_counter_MUX[uxn_c_l60_c2_15b0] LATENCY=0
     -- Inputs
     seconds_counter_MUX_uxn_c_l60_c2_15b0_cond <= VAR_seconds_counter_MUX_uxn_c_l60_c2_15b0_cond;
     seconds_counter_MUX_uxn_c_l60_c2_15b0_iftrue <= VAR_seconds_counter_MUX_uxn_c_l60_c2_15b0_iftrue;
     seconds_counter_MUX_uxn_c_l60_c2_15b0_iffalse <= VAR_seconds_counter_MUX_uxn_c_l60_c2_15b0_iffalse;
     -- Outputs
     VAR_seconds_counter_MUX_uxn_c_l60_c2_15b0_return_output := seconds_counter_MUX_uxn_c_l60_c2_15b0_return_output;

     -- pixel_counter_MUX[uxn_c_l53_c2_412e] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l53_c2_412e_cond <= VAR_pixel_counter_MUX_uxn_c_l53_c2_412e_cond;
     pixel_counter_MUX_uxn_c_l53_c2_412e_iftrue <= VAR_pixel_counter_MUX_uxn_c_l53_c2_412e_iftrue;
     pixel_counter_MUX_uxn_c_l53_c2_412e_iffalse <= VAR_pixel_counter_MUX_uxn_c_l53_c2_412e_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l53_c2_412e_return_output := pixel_counter_MUX_uxn_c_l53_c2_412e_return_output;

     -- clock_cycle_counter_MUX[uxn_c_l60_c2_15b0] LATENCY=0
     -- Inputs
     clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_cond <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_cond;
     clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_iftrue <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_iftrue;
     clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_iffalse <= VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_iffalse;
     -- Outputs
     VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_return_output := clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_return_output;

     -- BIN_OP_EQ[uxn_c_l30_c15_5ecd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l30_c15_5ecd_left <= VAR_BIN_OP_EQ_uxn_c_l30_c15_5ecd_left;
     BIN_OP_EQ_uxn_c_l30_c15_5ecd_right <= VAR_BIN_OP_EQ_uxn_c_l30_c15_5ecd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l30_c15_5ecd_return_output := BIN_OP_EQ_uxn_c_l30_c15_5ecd_return_output;

     -- BIN_OP_EQ[uxn_c_l32_c22_31d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l32_c22_31d2_left <= VAR_BIN_OP_EQ_uxn_c_l32_c22_31d2_left;
     BIN_OP_EQ_uxn_c_l32_c22_31d2_right <= VAR_BIN_OP_EQ_uxn_c_l32_c22_31d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l32_c22_31d2_return_output := BIN_OP_EQ_uxn_c_l32_c22_31d2_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l30_c15_230e_cond := VAR_BIN_OP_EQ_uxn_c_l30_c15_5ecd_return_output;
     VAR_MUX_uxn_c_l32_c22_d22b_cond := VAR_BIN_OP_EQ_uxn_c_l32_c22_31d2_return_output;
     REG_VAR_clock_cycle_counter := VAR_clock_cycle_counter_MUX_uxn_c_l60_c2_15b0_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l53_c2_412e_return_output;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_var_dim_0 := VAR_screen_ram_update_uxn_c_l44_c32_5d2d_return_output;
     REG_VAR_current_pixel_palette_color := VAR_screen_ram_update_uxn_c_l44_c32_5d2d_return_output;
     REG_VAR_seconds_counter := VAR_seconds_counter_MUX_uxn_c_l60_c2_15b0_return_output;
     -- MUX[uxn_c_l32_c22_d22b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l32_c22_d22b_cond <= VAR_MUX_uxn_c_l32_c22_d22b_cond;
     MUX_uxn_c_l32_c22_d22b_iftrue <= VAR_MUX_uxn_c_l32_c22_d22b_iftrue;
     MUX_uxn_c_l32_c22_d22b_iffalse <= VAR_MUX_uxn_c_l32_c22_d22b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l32_c22_d22b_return_output := MUX_uxn_c_l32_c22_d22b_return_output;

     -- MUX[uxn_c_l30_c15_230e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l30_c15_230e_cond <= VAR_MUX_uxn_c_l30_c15_230e_cond;
     MUX_uxn_c_l30_c15_230e_iftrue <= VAR_MUX_uxn_c_l30_c15_230e_iftrue;
     MUX_uxn_c_l30_c15_230e_iffalse <= VAR_MUX_uxn_c_l30_c15_230e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l30_c15_230e_return_output := MUX_uxn_c_l30_c15_230e_return_output;

     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l50_c22_26f4] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_c_l33_c16_212f_left := VAR_MUX_uxn_c_l30_c15_230e_return_output;
     REG_VAR_pc_nonzero := VAR_MUX_uxn_c_l30_c15_230e_return_output;
     VAR_BIN_OP_AND_uxn_c_l33_c16_212f_right := VAR_MUX_uxn_c_l32_c22_d22b_return_output;
     REG_VAR_system_state_zero := VAR_MUX_uxn_c_l32_c22_d22b_return_output;
     -- CAST_TO_uint16_t[uxn_c_l50_c11_ece4] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_c_l50_c11_ece4_return_output := CAST_TO_uint16_t_uint12_t(
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l50_c22_26f4_return_output);

     -- BIN_OP_AND[uxn_c_l33_c16_212f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l33_c16_212f_left <= VAR_BIN_OP_AND_uxn_c_l33_c16_212f_left;
     BIN_OP_AND_uxn_c_l33_c16_212f_right <= VAR_BIN_OP_AND_uxn_c_l33_c16_212f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l33_c16_212f_return_output := BIN_OP_AND_uxn_c_l33_c16_212f_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_212f_return_output;
     VAR_error_MUX_uxn_c_l35_c2_3840_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_212f_return_output;
     VAR_ins_MUX_uxn_c_l35_c2_3840_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_212f_return_output;
     VAR_k_MUX_uxn_c_l35_c2_3840_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_212f_return_output;
     VAR_opc_MUX_uxn_c_l35_c2_3840_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_212f_return_output;
     VAR_s_MUX_uxn_c_l35_c2_3840_cond := VAR_BIN_OP_AND_uxn_c_l33_c16_212f_return_output;
     REG_VAR_should_eval := VAR_BIN_OP_AND_uxn_c_l33_c16_212f_return_output;
     REG_VAR_result := VAR_CAST_TO_uint16_t_uxn_c_l50_c11_ece4_return_output;
     VAR_return_output := VAR_CAST_TO_uint16_t_uxn_c_l50_c11_ece4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_0ee0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_return_output;

     -- Submodule level 5
     VAR_eval_opcode_uxn_c_l41_c11_410b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_return_output;
     VAR_pc_add_uxn_c_l37_c3_0fb2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_return_output;
     VAR_peek_ram_uxn_c_l36_c9_179f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_0ee0_return_output;
     -- peek_ram[uxn_c_l36_c9_179f] LATENCY=0
     -- Clock enable
     peek_ram_uxn_c_l36_c9_179f_CLOCK_ENABLE <= VAR_peek_ram_uxn_c_l36_c9_179f_CLOCK_ENABLE;
     -- Inputs
     peek_ram_uxn_c_l36_c9_179f_address <= VAR_peek_ram_uxn_c_l36_c9_179f_address;
     -- Outputs
     VAR_peek_ram_uxn_c_l36_c9_179f_return_output := peek_ram_uxn_c_l36_c9_179f_return_output;

     -- pc_add[uxn_c_l37_c3_0fb2] LATENCY=0
     -- Clock enable
     pc_add_uxn_c_l37_c3_0fb2_CLOCK_ENABLE <= VAR_pc_add_uxn_c_l37_c3_0fb2_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_c_l37_c3_0fb2_adjustment <= VAR_pc_add_uxn_c_l37_c3_0fb2_adjustment;
     -- Outputs

     -- Submodule level 6
     VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_left := VAR_peek_ram_uxn_c_l36_c9_179f_return_output;
     -- BIN_OP_AND[uxn_c_l36_c9_e1cf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l36_c9_e1cf_left <= VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_left;
     BIN_OP_AND_uxn_c_l36_c9_e1cf_right <= VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_return_output := BIN_OP_AND_uxn_c_l36_c9_e1cf_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_uxn_c_l38_c7_5cd0_left := VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_return_output;
     VAR_BIN_OP_AND_uxn_c_l39_c7_b4af_left := VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_return_output;
     VAR_BIN_OP_AND_uxn_c_l40_c11_8650_left := VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_return_output;
     VAR_BIN_OP_AND_uxn_c_l40_c51_91ef_left := VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_return_output;
     VAR_CONST_SR_5_uxn_c_l40_c31_bf7c_x := VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_410b_ins := VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_return_output;
     VAR_ins_MUX_uxn_c_l35_c2_3840_iftrue := VAR_BIN_OP_AND_uxn_c_l36_c9_e1cf_return_output;
     -- ins_MUX[uxn_c_l35_c2_3840] LATENCY=0
     -- Inputs
     ins_MUX_uxn_c_l35_c2_3840_cond <= VAR_ins_MUX_uxn_c_l35_c2_3840_cond;
     ins_MUX_uxn_c_l35_c2_3840_iftrue <= VAR_ins_MUX_uxn_c_l35_c2_3840_iftrue;
     ins_MUX_uxn_c_l35_c2_3840_iffalse <= VAR_ins_MUX_uxn_c_l35_c2_3840_iffalse;
     -- Outputs
     VAR_ins_MUX_uxn_c_l35_c2_3840_return_output := ins_MUX_uxn_c_l35_c2_3840_return_output;

     -- BIN_OP_AND[uxn_c_l38_c7_5cd0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l38_c7_5cd0_left <= VAR_BIN_OP_AND_uxn_c_l38_c7_5cd0_left;
     BIN_OP_AND_uxn_c_l38_c7_5cd0_right <= VAR_BIN_OP_AND_uxn_c_l38_c7_5cd0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l38_c7_5cd0_return_output := BIN_OP_AND_uxn_c_l38_c7_5cd0_return_output;

     -- BIN_OP_AND[uxn_c_l39_c7_b4af] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l39_c7_b4af_left <= VAR_BIN_OP_AND_uxn_c_l39_c7_b4af_left;
     BIN_OP_AND_uxn_c_l39_c7_b4af_right <= VAR_BIN_OP_AND_uxn_c_l39_c7_b4af_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l39_c7_b4af_return_output := BIN_OP_AND_uxn_c_l39_c7_b4af_return_output;

     -- CONST_SR_5[uxn_c_l40_c31_bf7c] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_c_l40_c31_bf7c_x <= VAR_CONST_SR_5_uxn_c_l40_c31_bf7c_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_c_l40_c31_bf7c_return_output := CONST_SR_5_uxn_c_l40_c31_bf7c_return_output;

     -- BIN_OP_AND[uxn_c_l40_c51_91ef] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c51_91ef_left <= VAR_BIN_OP_AND_uxn_c_l40_c51_91ef_left;
     BIN_OP_AND_uxn_c_l40_c51_91ef_right <= VAR_BIN_OP_AND_uxn_c_l40_c51_91ef_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c51_91ef_return_output := BIN_OP_AND_uxn_c_l40_c51_91ef_return_output;

     -- BIN_OP_AND[uxn_c_l40_c11_8650] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c11_8650_left <= VAR_BIN_OP_AND_uxn_c_l40_c11_8650_left;
     BIN_OP_AND_uxn_c_l40_c11_8650_right <= VAR_BIN_OP_AND_uxn_c_l40_c11_8650_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c11_8650_return_output := BIN_OP_AND_uxn_c_l40_c11_8650_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l38_c7_d3f8_cond := resize(VAR_BIN_OP_AND_uxn_c_l38_c7_5cd0_return_output, 1);
     VAR_MUX_uxn_c_l39_c7_b03d_cond := resize(VAR_BIN_OP_AND_uxn_c_l39_c7_b4af_return_output, 1);
     VAR_UNARY_OP_NOT_uxn_c_l40_c11_c14c_expr := VAR_BIN_OP_AND_uxn_c_l40_c11_8650_return_output;
     VAR_MUX_uxn_c_l40_c11_2122_iffalse := VAR_BIN_OP_AND_uxn_c_l40_c51_91ef_return_output;
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_45d2_right := VAR_CONST_SR_5_uxn_c_l40_c31_bf7c_return_output;
     REG_VAR_ins := VAR_ins_MUX_uxn_c_l35_c2_3840_return_output;
     -- MUX[uxn_c_l39_c7_b03d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l39_c7_b03d_cond <= VAR_MUX_uxn_c_l39_c7_b03d_cond;
     MUX_uxn_c_l39_c7_b03d_iftrue <= VAR_MUX_uxn_c_l39_c7_b03d_iftrue;
     MUX_uxn_c_l39_c7_b03d_iffalse <= VAR_MUX_uxn_c_l39_c7_b03d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l39_c7_b03d_return_output := MUX_uxn_c_l39_c7_b03d_return_output;

     -- MUX[uxn_c_l38_c7_d3f8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l38_c7_d3f8_cond <= VAR_MUX_uxn_c_l38_c7_d3f8_cond;
     MUX_uxn_c_l38_c7_d3f8_iftrue <= VAR_MUX_uxn_c_l38_c7_d3f8_iftrue;
     MUX_uxn_c_l38_c7_d3f8_iffalse <= VAR_MUX_uxn_c_l38_c7_d3f8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l38_c7_d3f8_return_output := MUX_uxn_c_l38_c7_d3f8_return_output;

     -- UNARY_OP_NOT[uxn_c_l40_c11_c14c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l40_c11_c14c_expr <= VAR_UNARY_OP_NOT_uxn_c_l40_c11_c14c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l40_c11_c14c_return_output := UNARY_OP_NOT_uxn_c_l40_c11_c14c_return_output;

     -- BIN_OP_MINUS[uxn_c_l40_c26_45d2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_c_l40_c26_45d2_left <= VAR_BIN_OP_MINUS_uxn_c_l40_c26_45d2_left;
     BIN_OP_MINUS_uxn_c_l40_c26_45d2_right <= VAR_BIN_OP_MINUS_uxn_c_l40_c26_45d2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_c_l40_c26_45d2_return_output := BIN_OP_MINUS_uxn_c_l40_c26_45d2_return_output;

     -- Submodule level 9
     VAR_BIN_OP_AND_uxn_c_l40_c26_e76c_left := VAR_BIN_OP_MINUS_uxn_c_l40_c26_45d2_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_410b_k := VAR_MUX_uxn_c_l38_c7_d3f8_return_output;
     VAR_k_MUX_uxn_c_l35_c2_3840_iftrue := VAR_MUX_uxn_c_l38_c7_d3f8_return_output;
     VAR_eval_opcode_uxn_c_l41_c11_410b_stack_index := VAR_MUX_uxn_c_l39_c7_b03d_return_output;
     VAR_s_MUX_uxn_c_l35_c2_3840_iftrue := VAR_MUX_uxn_c_l39_c7_b03d_return_output;
     VAR_MUX_uxn_c_l40_c11_2122_cond := resize(VAR_UNARY_OP_NOT_uxn_c_l40_c11_c14c_return_output, 1);
     -- s_MUX[uxn_c_l35_c2_3840] LATENCY=0
     -- Inputs
     s_MUX_uxn_c_l35_c2_3840_cond <= VAR_s_MUX_uxn_c_l35_c2_3840_cond;
     s_MUX_uxn_c_l35_c2_3840_iftrue <= VAR_s_MUX_uxn_c_l35_c2_3840_iftrue;
     s_MUX_uxn_c_l35_c2_3840_iffalse <= VAR_s_MUX_uxn_c_l35_c2_3840_iffalse;
     -- Outputs
     VAR_s_MUX_uxn_c_l35_c2_3840_return_output := s_MUX_uxn_c_l35_c2_3840_return_output;

     -- BIN_OP_AND[uxn_c_l40_c26_e76c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l40_c26_e76c_left <= VAR_BIN_OP_AND_uxn_c_l40_c26_e76c_left;
     BIN_OP_AND_uxn_c_l40_c26_e76c_right <= VAR_BIN_OP_AND_uxn_c_l40_c26_e76c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l40_c26_e76c_return_output := BIN_OP_AND_uxn_c_l40_c26_e76c_return_output;

     -- k_MUX[uxn_c_l35_c2_3840] LATENCY=0
     -- Inputs
     k_MUX_uxn_c_l35_c2_3840_cond <= VAR_k_MUX_uxn_c_l35_c2_3840_cond;
     k_MUX_uxn_c_l35_c2_3840_iftrue <= VAR_k_MUX_uxn_c_l35_c2_3840_iftrue;
     k_MUX_uxn_c_l35_c2_3840_iffalse <= VAR_k_MUX_uxn_c_l35_c2_3840_iffalse;
     -- Outputs
     VAR_k_MUX_uxn_c_l35_c2_3840_return_output := k_MUX_uxn_c_l35_c2_3840_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l40_c11_2122_iftrue := VAR_BIN_OP_AND_uxn_c_l40_c26_e76c_return_output;
     REG_VAR_k := VAR_k_MUX_uxn_c_l35_c2_3840_return_output;
     REG_VAR_s := VAR_s_MUX_uxn_c_l35_c2_3840_return_output;
     -- MUX[uxn_c_l40_c11_2122] LATENCY=0
     -- Inputs
     MUX_uxn_c_l40_c11_2122_cond <= VAR_MUX_uxn_c_l40_c11_2122_cond;
     MUX_uxn_c_l40_c11_2122_iftrue <= VAR_MUX_uxn_c_l40_c11_2122_iftrue;
     MUX_uxn_c_l40_c11_2122_iffalse <= VAR_MUX_uxn_c_l40_c11_2122_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l40_c11_2122_return_output := MUX_uxn_c_l40_c11_2122_return_output;

     -- Submodule level 11
     VAR_eval_opcode_uxn_c_l41_c11_410b_opcode := VAR_MUX_uxn_c_l40_c11_2122_return_output;
     VAR_opc_MUX_uxn_c_l35_c2_3840_iftrue := VAR_MUX_uxn_c_l40_c11_2122_return_output;
     -- eval_opcode[uxn_c_l41_c11_410b] LATENCY=0
     -- Clock enable
     eval_opcode_uxn_c_l41_c11_410b_CLOCK_ENABLE <= VAR_eval_opcode_uxn_c_l41_c11_410b_CLOCK_ENABLE;
     -- Inputs
     eval_opcode_uxn_c_l41_c11_410b_stack_index <= VAR_eval_opcode_uxn_c_l41_c11_410b_stack_index;
     eval_opcode_uxn_c_l41_c11_410b_opcode <= VAR_eval_opcode_uxn_c_l41_c11_410b_opcode;
     eval_opcode_uxn_c_l41_c11_410b_ins <= VAR_eval_opcode_uxn_c_l41_c11_410b_ins;
     eval_opcode_uxn_c_l41_c11_410b_k <= VAR_eval_opcode_uxn_c_l41_c11_410b_k;
     -- Outputs
     VAR_eval_opcode_uxn_c_l41_c11_410b_return_output := eval_opcode_uxn_c_l41_c11_410b_return_output;

     -- opc_MUX[uxn_c_l35_c2_3840] LATENCY=0
     -- Inputs
     opc_MUX_uxn_c_l35_c2_3840_cond <= VAR_opc_MUX_uxn_c_l35_c2_3840_cond;
     opc_MUX_uxn_c_l35_c2_3840_iftrue <= VAR_opc_MUX_uxn_c_l35_c2_3840_iftrue;
     opc_MUX_uxn_c_l35_c2_3840_iffalse <= VAR_opc_MUX_uxn_c_l35_c2_3840_iffalse;
     -- Outputs
     VAR_opc_MUX_uxn_c_l35_c2_3840_return_output := opc_MUX_uxn_c_l35_c2_3840_return_output;

     -- Submodule level 12
     VAR_error_MUX_uxn_c_l35_c2_3840_iftrue := VAR_eval_opcode_uxn_c_l41_c11_410b_return_output;
     REG_VAR_opc := VAR_opc_MUX_uxn_c_l35_c2_3840_return_output;
     -- error_MUX[uxn_c_l35_c2_3840] LATENCY=0
     -- Inputs
     error_MUX_uxn_c_l35_c2_3840_cond <= VAR_error_MUX_uxn_c_l35_c2_3840_cond;
     error_MUX_uxn_c_l35_c2_3840_iftrue <= VAR_error_MUX_uxn_c_l35_c2_3840_iftrue;
     error_MUX_uxn_c_l35_c2_3840_iffalse <= VAR_error_MUX_uxn_c_l35_c2_3840_iffalse;
     -- Outputs
     VAR_error_MUX_uxn_c_l35_c2_3840_return_output := error_MUX_uxn_c_l35_c2_3840_return_output;

     -- Submodule level 13
     REG_VAR_error := VAR_error_MUX_uxn_c_l35_c2_3840_return_output;
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
