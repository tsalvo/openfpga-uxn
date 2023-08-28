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
-- Submodules: 21
entity uxn_eval_0CLK_fdb4c05a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_fdb4c05a;
architecture arch of uxn_eval_0CLK_fdb4c05a is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal input_code : unsigned(3 downto 0) := to_unsigned(0, 4);
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
signal is_active_drawing_area : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_booted : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_input_code : unsigned(3 downto 0);
signal REG_COMB_palette_color_values : uint12_t_4;
signal REG_COMB_pixel_counter : unsigned(31 downto 0);
signal REG_COMB_clock_cycle_counter : unsigned(31 downto 0);
signal REG_COMB_seconds_counter : unsigned(31 downto 0);
signal REG_COMB_result : unsigned(15 downto 0);
signal REG_COMB_current_pixel_palette_color : unsigned(1 downto 0);
signal REG_COMB_is_active_drawing_area : unsigned(0 downto 0);
signal REG_COMB_is_booted : unsigned(0 downto 0);

-- Each function instance gets signals
-- CONST_SR_12[uxn_c_l155_c25_ecdc]
signal CONST_SR_12_uxn_c_l155_c25_ecdc_x : unsigned(15 downto 0);
signal CONST_SR_12_uxn_c_l155_c25_ecdc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l157_c6_e60e]
signal BIN_OP_EQ_uxn_c_l157_c6_e60e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l157_c6_e60e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l157_c6_e60e_return_output : unsigned(0 downto 0);

-- is_active_drawing_area_MUX[uxn_c_l157_c2_4aa7]
signal is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_cond : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_iftrue : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_iffalse : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_return_output : unsigned(0 downto 0);

-- CONST_SR_2[uxn_c_l158_c28_e719]
signal CONST_SR_2_uxn_c_l158_c28_e719_x : unsigned(15 downto 0);
signal CONST_SR_2_uxn_c_l158_c28_e719_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l158_c28_8942]
signal BIN_OP_AND_uxn_c_l158_c28_8942_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l158_c28_8942_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l158_c28_8942_return_output : unsigned(15 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l161_c1_41af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l165_c1_c03e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_return_output : unsigned(0 downto 0);

-- is_booted_MUX[uxn_c_l161_c2_2ae6]
signal is_booted_MUX_uxn_c_l161_c2_2ae6_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l161_c2_2ae6_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l161_c2_2ae6_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l161_c2_2ae6_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l162_c8_ec95]
signal UNARY_OP_NOT_uxn_c_l162_c8_ec95_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l162_c8_ec95_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l162_c1_ab8b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_return_output : unsigned(0 downto 0);

-- step_cpu[uxn_c_l163_c4_5bff]
signal step_cpu_uxn_c_l163_c4_5bff_CLOCK_ENABLE : unsigned(0 downto 0);

-- step_boot[uxn_c_l166_c15_b304]
signal step_boot_uxn_c_l166_c15_b304_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_boot_uxn_c_l166_c15_b304_return_output : unsigned(0 downto 0);

-- step_gpu[uxn_c_l169_c32_3fda]
signal step_gpu_uxn_c_l169_c32_3fda_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l169_c32_3fda_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l169_c32_3fda_seconds_counter : unsigned(31 downto 0);
signal step_gpu_uxn_c_l169_c32_3fda_return_output : unsigned(1 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l170_c22_038d]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_return_output : unsigned(11 downto 0);

-- BIN_OP_EQ[uxn_c_l173_c6_171e]
signal BIN_OP_EQ_uxn_c_l173_c6_171e_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c6_171e_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l173_c6_171e_return_output : unsigned(0 downto 0);

-- seconds_counter_MUX[uxn_c_l173_c2_fb86]
signal seconds_counter_MUX_uxn_c_l173_c2_fb86_cond : unsigned(0 downto 0);
signal seconds_counter_MUX_uxn_c_l173_c2_fb86_iftrue : unsigned(31 downto 0);
signal seconds_counter_MUX_uxn_c_l173_c2_fb86_iffalse : unsigned(31 downto 0);
signal seconds_counter_MUX_uxn_c_l173_c2_fb86_return_output : unsigned(31 downto 0);

-- clock_cycle_counter_MUX[uxn_c_l173_c2_fb86]
signal clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_cond : unsigned(0 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_iftrue : unsigned(31 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_iffalse : unsigned(31 downto 0);
signal clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l174_c3_e86d]
signal BIN_OP_PLUS_uxn_c_l174_c3_e86d_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l174_c3_e86d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l174_c3_e86d_return_output : unsigned(32 downto 0);

-- BIN_OP_PLUS[uxn_c_l177_c3_5cad]
signal BIN_OP_PLUS_uxn_c_l177_c3_5cad_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l177_c3_5cad_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l177_c3_5cad_return_output : unsigned(32 downto 0);

function CAST_TO_uint4_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
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
-- CONST_SR_12_uxn_c_l155_c25_ecdc
CONST_SR_12_uxn_c_l155_c25_ecdc : entity work.CONST_SR_12_uint16_t_0CLK_de264c78 port map (
CONST_SR_12_uxn_c_l155_c25_ecdc_x,
CONST_SR_12_uxn_c_l155_c25_ecdc_return_output);

-- BIN_OP_EQ_uxn_c_l157_c6_e60e
BIN_OP_EQ_uxn_c_l157_c6_e60e : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l157_c6_e60e_left,
BIN_OP_EQ_uxn_c_l157_c6_e60e_right,
BIN_OP_EQ_uxn_c_l157_c6_e60e_return_output);

-- is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7
is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_cond,
is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_iftrue,
is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_iffalse,
is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_return_output);

-- CONST_SR_2_uxn_c_l158_c28_e719
CONST_SR_2_uxn_c_l158_c28_e719 : entity work.CONST_SR_2_uint16_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l158_c28_e719_x,
CONST_SR_2_uxn_c_l158_c28_e719_return_output);

-- BIN_OP_AND_uxn_c_l158_c28_8942
BIN_OP_AND_uxn_c_l158_c28_8942 : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l158_c28_8942_left,
BIN_OP_AND_uxn_c_l158_c28_8942_right,
BIN_OP_AND_uxn_c_l158_c28_8942_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af
TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e
FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_return_output);

-- is_booted_MUX_uxn_c_l161_c2_2ae6
is_booted_MUX_uxn_c_l161_c2_2ae6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l161_c2_2ae6_cond,
is_booted_MUX_uxn_c_l161_c2_2ae6_iftrue,
is_booted_MUX_uxn_c_l161_c2_2ae6_iffalse,
is_booted_MUX_uxn_c_l161_c2_2ae6_return_output);

-- UNARY_OP_NOT_uxn_c_l162_c8_ec95
UNARY_OP_NOT_uxn_c_l162_c8_ec95 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l162_c8_ec95_expr,
UNARY_OP_NOT_uxn_c_l162_c8_ec95_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b
TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_return_output);

-- step_cpu_uxn_c_l163_c4_5bff
step_cpu_uxn_c_l163_c4_5bff : entity work.step_cpu_0CLK_be4be3cd port map (
clk,
step_cpu_uxn_c_l163_c4_5bff_CLOCK_ENABLE);

-- step_boot_uxn_c_l166_c15_b304
step_boot_uxn_c_l166_c15_b304 : entity work.step_boot_0CLK_b8381d00 port map (
clk,
step_boot_uxn_c_l166_c15_b304_CLOCK_ENABLE,
step_boot_uxn_c_l166_c15_b304_return_output);

-- step_gpu_uxn_c_l169_c32_3fda
step_gpu_uxn_c_l169_c32_3fda : entity work.step_gpu_0CLK_5d93c4a4 port map (
clk,
step_gpu_uxn_c_l169_c32_3fda_CLOCK_ENABLE,
step_gpu_uxn_c_l169_c32_3fda_is_active_drawing_area,
step_gpu_uxn_c_l169_c32_3fda_seconds_counter,
step_gpu_uxn_c_l169_c32_3fda_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_return_output);

-- BIN_OP_EQ_uxn_c_l173_c6_171e
BIN_OP_EQ_uxn_c_l173_c6_171e : entity work.BIN_OP_EQ_uint32_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l173_c6_171e_left,
BIN_OP_EQ_uxn_c_l173_c6_171e_right,
BIN_OP_EQ_uxn_c_l173_c6_171e_return_output);

-- seconds_counter_MUX_uxn_c_l173_c2_fb86
seconds_counter_MUX_uxn_c_l173_c2_fb86 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
seconds_counter_MUX_uxn_c_l173_c2_fb86_cond,
seconds_counter_MUX_uxn_c_l173_c2_fb86_iftrue,
seconds_counter_MUX_uxn_c_l173_c2_fb86_iffalse,
seconds_counter_MUX_uxn_c_l173_c2_fb86_return_output);

-- clock_cycle_counter_MUX_uxn_c_l173_c2_fb86
clock_cycle_counter_MUX_uxn_c_l173_c2_fb86 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_cond,
clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_iftrue,
clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_iffalse,
clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_return_output);

-- BIN_OP_PLUS_uxn_c_l174_c3_e86d
BIN_OP_PLUS_uxn_c_l174_c3_e86d : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l174_c3_e86d_left,
BIN_OP_PLUS_uxn_c_l174_c3_e86d_right,
BIN_OP_PLUS_uxn_c_l174_c3_e86d_return_output);

-- BIN_OP_PLUS_uxn_c_l177_c3_5cad
BIN_OP_PLUS_uxn_c_l177_c3_5cad : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l177_c3_5cad_left,
BIN_OP_PLUS_uxn_c_l177_c3_5cad_right,
BIN_OP_PLUS_uxn_c_l177_c3_5cad_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 input,
 -- Registers
 input_code,
 palette_color_values,
 pixel_counter,
 clock_cycle_counter,
 seconds_counter,
 result,
 current_pixel_palette_color,
 is_active_drawing_area,
 is_booted,
 -- All submodule outputs
 CONST_SR_12_uxn_c_l155_c25_ecdc_return_output,
 BIN_OP_EQ_uxn_c_l157_c6_e60e_return_output,
 is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_return_output,
 CONST_SR_2_uxn_c_l158_c28_e719_return_output,
 BIN_OP_AND_uxn_c_l158_c28_8942_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_return_output,
 is_booted_MUX_uxn_c_l161_c2_2ae6_return_output,
 UNARY_OP_NOT_uxn_c_l162_c8_ec95_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_return_output,
 step_boot_uxn_c_l166_c15_b304_return_output,
 step_gpu_uxn_c_l169_c32_3fda_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_return_output,
 BIN_OP_EQ_uxn_c_l173_c6_171e_return_output,
 seconds_counter_MUX_uxn_c_l173_c2_fb86_return_output,
 clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_return_output,
 BIN_OP_PLUS_uxn_c_l174_c3_e86d_return_output,
 BIN_OP_PLUS_uxn_c_l177_c3_5cad_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l155_c25_ecdc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l155_c25_ecdc_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_c_l155_c15_15b2_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l157_c6_e60e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l157_c6_e60e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l157_c6_e60e_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_iftrue : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_uxn_c_l158_c3_8567 : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_iffalse : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c28_8942_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l158_c28_e719_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l158_c28_e719_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c28_8942_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l158_c28_8942_return_output : unsigned(15 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l161_c2_2ae6_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l161_c2_2ae6_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l161_c2_2ae6_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l161_c2_2ae6_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l162_c8_ec95_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l162_c8_ec95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_iffalse : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l163_c4_5bff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_boot_uxn_c_l166_c15_b304_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_boot_uxn_c_l166_c15_b304_return_output : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l169_c32_3fda_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l169_c32_3fda_seconds_counter : unsigned(31 downto 0);
 variable VAR_step_gpu_uxn_c_l169_c32_3fda_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l169_c32_3fda_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_ref_toks_0 : uint12_t_4;
 variable VAR_CAST_TO_uint16_t_uxn_c_l170_c11_3a4f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c6_171e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c6_171e_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l173_c6_171e_return_output : unsigned(0 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l173_c2_fb86_iftrue : unsigned(31 downto 0);
 variable VAR_seconds_counter_uxn_c_l174_c3_dfc1 : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l173_c2_fb86_iffalse : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l173_c2_fb86_return_output : unsigned(31 downto 0);
 variable VAR_seconds_counter_MUX_uxn_c_l173_c2_fb86_cond : unsigned(0 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_iftrue : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_uxn_c_l175_c3_e44f : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_iffalse : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_uxn_c_l177_c3_f9da : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_return_output : unsigned(31 downto 0);
 variable VAR_clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c3_e86d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c3_e86d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l174_c3_e86d_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l177_c3_5cad_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l177_c3_5cad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l177_c3_5cad_return_output : unsigned(32 downto 0);
 -- State registers comb logic variables
variable REG_VAR_input_code : unsigned(3 downto 0);
variable REG_VAR_palette_color_values : uint12_t_4;
variable REG_VAR_pixel_counter : unsigned(31 downto 0);
variable REG_VAR_clock_cycle_counter : unsigned(31 downto 0);
variable REG_VAR_seconds_counter : unsigned(31 downto 0);
variable REG_VAR_result : unsigned(15 downto 0);
variable REG_VAR_current_pixel_palette_color : unsigned(1 downto 0);
variable REG_VAR_is_active_drawing_area : unsigned(0 downto 0);
variable REG_VAR_is_booted : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_input_code := input_code;
  REG_VAR_palette_color_values := palette_color_values;
  REG_VAR_pixel_counter := pixel_counter;
  REG_VAR_clock_cycle_counter := clock_cycle_counter;
  REG_VAR_seconds_counter := seconds_counter;
  REG_VAR_result := result;
  REG_VAR_current_pixel_palette_color := current_pixel_palette_color;
  REG_VAR_is_active_drawing_area := is_active_drawing_area;
  REG_VAR_is_booted := is_booted;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l173_c6_171e_right := to_unsigned(12287998, 24);
     VAR_BIN_OP_PLUS_uxn_c_l174_c3_e86d_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l177_c3_5cad_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l157_c6_e60e_right := to_unsigned(2, 2);
     VAR_clock_cycle_counter_uxn_c_l175_c3_e44f := resize(to_unsigned(0, 1), 32);
     VAR_clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_iftrue := VAR_clock_cycle_counter_uxn_c_l175_c3_e44f;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l158_c28_8942_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_iftrue := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l169_c32_3fda_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l173_c6_171e_left := clock_cycle_counter;
     VAR_BIN_OP_PLUS_uxn_c_l177_c3_5cad_left := clock_cycle_counter;
     VAR_CONST_SR_12_uxn_c_l155_c25_ecdc_x := VAR_input;
     VAR_CONST_SR_2_uxn_c_l158_c28_e719_x := VAR_input;
     VAR_is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_iffalse := is_active_drawing_area;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_cond := is_booted;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_cond := is_booted;
     VAR_is_booted_MUX_uxn_c_l161_c2_2ae6_cond := is_booted;
     VAR_is_booted_MUX_uxn_c_l161_c2_2ae6_iftrue := is_booted;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_ref_toks_0 := palette_color_values;
     REG_VAR_palette_color_values := palette_color_values;
     REG_VAR_pixel_counter := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l174_c3_e86d_left := seconds_counter;
     VAR_seconds_counter_MUX_uxn_c_l173_c2_fb86_iffalse := seconds_counter;
     VAR_step_gpu_uxn_c_l169_c32_3fda_seconds_counter := seconds_counter;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l165_c1_c03e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_return_output;

     -- CONST_SR_2[uxn_c_l158_c28_e719] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l158_c28_e719_x <= VAR_CONST_SR_2_uxn_c_l158_c28_e719_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l158_c28_e719_return_output := CONST_SR_2_uxn_c_l158_c28_e719_return_output;

     -- CONST_SR_12[uxn_c_l155_c25_ecdc] LATENCY=0
     -- Inputs
     CONST_SR_12_uxn_c_l155_c25_ecdc_x <= VAR_CONST_SR_12_uxn_c_l155_c25_ecdc_x;
     -- Outputs
     VAR_CONST_SR_12_uxn_c_l155_c25_ecdc_return_output := CONST_SR_12_uxn_c_l155_c25_ecdc_return_output;

     -- BIN_OP_EQ[uxn_c_l173_c6_171e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l173_c6_171e_left <= VAR_BIN_OP_EQ_uxn_c_l173_c6_171e_left;
     BIN_OP_EQ_uxn_c_l173_c6_171e_right <= VAR_BIN_OP_EQ_uxn_c_l173_c6_171e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l173_c6_171e_return_output := BIN_OP_EQ_uxn_c_l173_c6_171e_return_output;

     -- BIN_OP_PLUS[uxn_c_l177_c3_5cad] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l177_c3_5cad_left <= VAR_BIN_OP_PLUS_uxn_c_l177_c3_5cad_left;
     BIN_OP_PLUS_uxn_c_l177_c3_5cad_right <= VAR_BIN_OP_PLUS_uxn_c_l177_c3_5cad_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l177_c3_5cad_return_output := BIN_OP_PLUS_uxn_c_l177_c3_5cad_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l161_c1_41af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_return_output;

     -- BIN_OP_PLUS[uxn_c_l174_c3_e86d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l174_c3_e86d_left <= VAR_BIN_OP_PLUS_uxn_c_l174_c3_e86d_left;
     BIN_OP_PLUS_uxn_c_l174_c3_e86d_right <= VAR_BIN_OP_PLUS_uxn_c_l174_c3_e86d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l174_c3_e86d_return_output := BIN_OP_PLUS_uxn_c_l174_c3_e86d_return_output;

     -- Submodule level 1
     VAR_clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_cond := VAR_BIN_OP_EQ_uxn_c_l173_c6_171e_return_output;
     VAR_seconds_counter_MUX_uxn_c_l173_c2_fb86_cond := VAR_BIN_OP_EQ_uxn_c_l173_c6_171e_return_output;
     VAR_seconds_counter_uxn_c_l174_c3_dfc1 := resize(VAR_BIN_OP_PLUS_uxn_c_l174_c3_e86d_return_output, 32);
     VAR_clock_cycle_counter_uxn_c_l177_c3_f9da := resize(VAR_BIN_OP_PLUS_uxn_c_l177_c3_5cad_return_output, 32);
     VAR_BIN_OP_AND_uxn_c_l158_c28_8942_left := VAR_CONST_SR_2_uxn_c_l158_c28_e719_return_output;
     VAR_step_boot_uxn_c_l166_c15_b304_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l165_c1_c03e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l161_c1_41af_return_output;
     VAR_clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_iffalse := VAR_clock_cycle_counter_uxn_c_l177_c3_f9da;
     VAR_seconds_counter_MUX_uxn_c_l173_c2_fb86_iftrue := VAR_seconds_counter_uxn_c_l174_c3_dfc1;
     -- step_boot[uxn_c_l166_c15_b304] LATENCY=0
     -- Clock enable
     step_boot_uxn_c_l166_c15_b304_CLOCK_ENABLE <= VAR_step_boot_uxn_c_l166_c15_b304_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_step_boot_uxn_c_l166_c15_b304_return_output := step_boot_uxn_c_l166_c15_b304_return_output;

     -- BIN_OP_AND[uxn_c_l158_c28_8942] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l158_c28_8942_left <= VAR_BIN_OP_AND_uxn_c_l158_c28_8942_left;
     BIN_OP_AND_uxn_c_l158_c28_8942_right <= VAR_BIN_OP_AND_uxn_c_l158_c28_8942_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l158_c28_8942_return_output := BIN_OP_AND_uxn_c_l158_c28_8942_return_output;

     -- seconds_counter_MUX[uxn_c_l173_c2_fb86] LATENCY=0
     -- Inputs
     seconds_counter_MUX_uxn_c_l173_c2_fb86_cond <= VAR_seconds_counter_MUX_uxn_c_l173_c2_fb86_cond;
     seconds_counter_MUX_uxn_c_l173_c2_fb86_iftrue <= VAR_seconds_counter_MUX_uxn_c_l173_c2_fb86_iftrue;
     seconds_counter_MUX_uxn_c_l173_c2_fb86_iffalse <= VAR_seconds_counter_MUX_uxn_c_l173_c2_fb86_iffalse;
     -- Outputs
     VAR_seconds_counter_MUX_uxn_c_l173_c2_fb86_return_output := seconds_counter_MUX_uxn_c_l173_c2_fb86_return_output;

     -- CAST_TO_uint4_t[uxn_c_l155_c15_15b2] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_c_l155_c15_15b2_return_output := CAST_TO_uint4_t_uint16_t(
     VAR_CONST_SR_12_uxn_c_l155_c25_ecdc_return_output);

     -- clock_cycle_counter_MUX[uxn_c_l173_c2_fb86] LATENCY=0
     -- Inputs
     clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_cond <= VAR_clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_cond;
     clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_iftrue <= VAR_clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_iftrue;
     clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_iffalse <= VAR_clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_iffalse;
     -- Outputs
     VAR_clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_return_output := clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_return_output;

     -- Submodule level 2
     VAR_is_active_drawing_area_uxn_c_l158_c3_8567 := resize(VAR_BIN_OP_AND_uxn_c_l158_c28_8942_return_output, 1);
     VAR_BIN_OP_EQ_uxn_c_l157_c6_e60e_left := VAR_CAST_TO_uint4_t_uxn_c_l155_c15_15b2_return_output;
     REG_VAR_input_code := VAR_CAST_TO_uint4_t_uxn_c_l155_c15_15b2_return_output;
     REG_VAR_clock_cycle_counter := VAR_clock_cycle_counter_MUX_uxn_c_l173_c2_fb86_return_output;
     REG_VAR_seconds_counter := VAR_seconds_counter_MUX_uxn_c_l173_c2_fb86_return_output;
     VAR_is_booted_MUX_uxn_c_l161_c2_2ae6_iffalse := VAR_step_boot_uxn_c_l166_c15_b304_return_output;
     VAR_is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_iftrue := VAR_is_active_drawing_area_uxn_c_l158_c3_8567;
     -- BIN_OP_EQ[uxn_c_l157_c6_e60e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l157_c6_e60e_left <= VAR_BIN_OP_EQ_uxn_c_l157_c6_e60e_left;
     BIN_OP_EQ_uxn_c_l157_c6_e60e_right <= VAR_BIN_OP_EQ_uxn_c_l157_c6_e60e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l157_c6_e60e_return_output := BIN_OP_EQ_uxn_c_l157_c6_e60e_return_output;

     -- is_booted_MUX[uxn_c_l161_c2_2ae6] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l161_c2_2ae6_cond <= VAR_is_booted_MUX_uxn_c_l161_c2_2ae6_cond;
     is_booted_MUX_uxn_c_l161_c2_2ae6_iftrue <= VAR_is_booted_MUX_uxn_c_l161_c2_2ae6_iftrue;
     is_booted_MUX_uxn_c_l161_c2_2ae6_iffalse <= VAR_is_booted_MUX_uxn_c_l161_c2_2ae6_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l161_c2_2ae6_return_output := is_booted_MUX_uxn_c_l161_c2_2ae6_return_output;

     -- Submodule level 3
     VAR_is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_cond := VAR_BIN_OP_EQ_uxn_c_l157_c6_e60e_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l161_c2_2ae6_return_output;
     -- is_active_drawing_area_MUX[uxn_c_l157_c2_4aa7] LATENCY=0
     -- Inputs
     is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_cond <= VAR_is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_cond;
     is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_iftrue <= VAR_is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_iftrue;
     is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_iffalse <= VAR_is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_iffalse;
     -- Outputs
     VAR_is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_return_output := is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_return_output;

     -- Submodule level 4
     VAR_UNARY_OP_NOT_uxn_c_l162_c8_ec95_expr := VAR_is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_return_output;
     REG_VAR_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_return_output;
     VAR_step_gpu_uxn_c_l169_c32_3fda_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l157_c2_4aa7_return_output;
     -- step_gpu[uxn_c_l169_c32_3fda] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l169_c32_3fda_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l169_c32_3fda_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l169_c32_3fda_is_active_drawing_area <= VAR_step_gpu_uxn_c_l169_c32_3fda_is_active_drawing_area;
     step_gpu_uxn_c_l169_c32_3fda_seconds_counter <= VAR_step_gpu_uxn_c_l169_c32_3fda_seconds_counter;
     -- Outputs
     VAR_step_gpu_uxn_c_l169_c32_3fda_return_output := step_gpu_uxn_c_l169_c32_3fda_return_output;

     -- UNARY_OP_NOT[uxn_c_l162_c8_ec95] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l162_c8_ec95_expr <= VAR_UNARY_OP_NOT_uxn_c_l162_c8_ec95_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l162_c8_ec95_return_output := UNARY_OP_NOT_uxn_c_l162_c8_ec95_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_cond := VAR_UNARY_OP_NOT_uxn_c_l162_c8_ec95_return_output;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_var_dim_0 := VAR_step_gpu_uxn_c_l169_c32_3fda_return_output;
     REG_VAR_current_pixel_palette_color := VAR_step_gpu_uxn_c_l169_c32_3fda_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l162_c1_ab8b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_return_output;

     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l170_c22_038d] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_return_output;

     -- Submodule level 6
     VAR_step_cpu_uxn_c_l163_c4_5bff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab8b_return_output;
     -- step_cpu[uxn_c_l163_c4_5bff] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l163_c4_5bff_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l163_c4_5bff_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- CAST_TO_uint16_t[uxn_c_l170_c11_3a4f] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_c_l170_c11_3a4f_return_output := CAST_TO_uint16_t_uint12_t(
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l170_c22_038d_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CAST_TO_uint16_t_uxn_c_l170_c11_3a4f_return_output;
     VAR_return_output := VAR_CAST_TO_uint16_t_uxn_c_l170_c11_3a4f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_input_code <= REG_VAR_input_code;
REG_COMB_palette_color_values <= REG_VAR_palette_color_values;
REG_COMB_pixel_counter <= REG_VAR_pixel_counter;
REG_COMB_clock_cycle_counter <= REG_VAR_clock_cycle_counter;
REG_COMB_seconds_counter <= REG_VAR_seconds_counter;
REG_COMB_result <= REG_VAR_result;
REG_COMB_current_pixel_palette_color <= REG_VAR_current_pixel_palette_color;
REG_COMB_is_active_drawing_area <= REG_VAR_is_active_drawing_area;
REG_COMB_is_booted <= REG_VAR_is_booted;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     input_code <= REG_COMB_input_code;
     palette_color_values <= REG_COMB_palette_color_values;
     pixel_counter <= REG_COMB_pixel_counter;
     clock_cycle_counter <= REG_COMB_clock_cycle_counter;
     seconds_counter <= REG_COMB_seconds_counter;
     result <= REG_COMB_result;
     current_pixel_palette_color <= REG_COMB_current_pixel_palette_color;
     is_active_drawing_area <= REG_COMB_is_active_drawing_area;
     is_booted <= REG_COMB_is_booted;
 end if;
 end if;
end process;

end arch;
