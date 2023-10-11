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
-- Submodules: 23
entity uxn_eval_0CLK_015c5c1d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_015c5c1d;
architecture arch of uxn_eval_0CLK_015c5c1d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal main_clock_cycle : unsigned(31 downto 0) := to_unsigned(0, 32);
signal input_code : unsigned(3 downto 0) := to_unsigned(0, 4);
signal palette_color_values : uint12_t_4 := (
0 => to_unsigned(4095, 12),
1 => to_unsigned(0, 12),
2 => to_unsigned(2011, 12),
3 => to_unsigned(3938, 12),
others => to_unsigned(0, 12))
;
signal uxn_eval_result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal current_pixel_palette_color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal is_active_drawing_area : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_booted : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_ram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal ram_address : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ram_write_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ram_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal is_vram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal vram_write_layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal vram_address : unsigned(31 downto 0) := to_unsigned(0, 32);
signal vram_value : unsigned(1 downto 0) := to_unsigned(0, 2);
signal REG_COMB_main_clock_cycle : unsigned(31 downto 0);
signal REG_COMB_input_code : unsigned(3 downto 0);
signal REG_COMB_palette_color_values : uint12_t_4;
signal REG_COMB_uxn_eval_result : unsigned(15 downto 0);
signal REG_COMB_current_pixel_palette_color : unsigned(1 downto 0);
signal REG_COMB_is_active_drawing_area : unsigned(0 downto 0);
signal REG_COMB_is_booted : unsigned(0 downto 0);
signal REG_COMB_is_ram_write : unsigned(0 downto 0);
signal REG_COMB_ram_address : unsigned(15 downto 0);
signal REG_COMB_ram_write_value : unsigned(7 downto 0);
signal REG_COMB_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_is_vram_write : unsigned(0 downto 0);
signal REG_COMB_vram_write_layer : unsigned(0 downto 0);
signal REG_COMB_vram_address : unsigned(31 downto 0);
signal REG_COMB_vram_value : unsigned(1 downto 0);

-- Each function instance gets signals
-- CONST_SR_12[uxn_c_l155_c15_2602]
signal CONST_SR_12_uxn_c_l155_c15_2602_x : unsigned(15 downto 0);
signal CONST_SR_12_uxn_c_l155_c15_2602_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l157_c2_8335[uxn_c_l157_c2_8335]
signal printf_uxn_c_l157_c2_8335_uxn_c_l157_c2_8335_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l157_c2_8335_uxn_c_l157_c2_8335_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l159_c6_394f]
signal BIN_OP_EQ_uxn_c_l159_c6_394f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c6_394f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l159_c6_394f_return_output : unsigned(0 downto 0);

-- is_active_drawing_area_MUX[uxn_c_l159_c2_7657]
signal is_active_drawing_area_MUX_uxn_c_l159_c2_7657_cond : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l159_c2_7657_iftrue : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l159_c2_7657_iffalse : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l159_c2_7657_return_output : unsigned(0 downto 0);

-- CONST_SR_2[uxn_c_l160_c28_798a]
signal CONST_SR_2_uxn_c_l160_c28_798a_x : unsigned(15 downto 0);
signal CONST_SR_2_uxn_c_l160_c28_798a_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l160_c28_5e2a]
signal BIN_OP_AND_uxn_c_l160_c28_5e2a_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l160_c28_5e2a_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l160_c28_5e2a_return_output : unsigned(15 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l163_c1_ef59]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l172_c1_0feb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_return_output : unsigned(0 downto 0);

-- is_ram_write_MUX[uxn_c_l163_c2_3d25]
signal is_ram_write_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l163_c2_3d25]
signal vram_value_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(1 downto 0);

-- ram_address_MUX[uxn_c_l163_c2_3d25]
signal ram_address_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(15 downto 0);

-- vram_address_MUX[uxn_c_l163_c2_3d25]
signal vram_address_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(31 downto 0);

-- is_booted_MUX[uxn_c_l163_c2_3d25]
signal is_booted_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l163_c2_3d25]
signal ram_write_value_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(7 downto 0);

-- vram_write_layer_MUX[uxn_c_l163_c2_3d25]
signal vram_write_layer_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l163_c2_3d25]
signal is_vram_write_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(0 downto 0);

-- step_cpu[uxn_c_l164_c39_78d9]
signal step_cpu_uxn_c_l164_c39_78d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l164_c39_78d9_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l164_c39_78d9_return_output : cpu_step_result_t;

-- step_boot[uxn_c_l173_c41_965f]
signal step_boot_uxn_c_l173_c41_965f_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_boot_uxn_c_l173_c41_965f_return_output : boot_step_result_t;

-- main_ram_update[uxn_c_l180_c19_7c92]
signal main_ram_update_uxn_c_l180_c19_7c92_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l180_c19_7c92_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l180_c19_7c92_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l180_c19_7c92_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l180_c19_7c92_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l186_c32_938b]
signal step_gpu_uxn_c_l186_c32_938b_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l186_c32_938b_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l186_c32_938b_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l186_c32_938b_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l186_c32_938b_vram_address : unsigned(31 downto 0);
signal step_gpu_uxn_c_l186_c32_938b_vram_value : unsigned(1 downto 0);
signal step_gpu_uxn_c_l186_c32_938b_return_output : unsigned(1 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l187_c31_c6d1]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_return_output : unsigned(11 downto 0);

-- BIN_OP_PLUS[uxn_c_l188_c2_699f]
signal BIN_OP_PLUS_uxn_c_l188_c2_699f_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l188_c2_699f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l188_c2_699f_return_output : unsigned(32 downto 0);

function CAST_TO_uint16_t_uint12_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(11 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_12_uxn_c_l155_c15_2602
CONST_SR_12_uxn_c_l155_c15_2602 : entity work.CONST_SR_12_uint16_t_0CLK_de264c78 port map (
CONST_SR_12_uxn_c_l155_c15_2602_x,
CONST_SR_12_uxn_c_l155_c15_2602_return_output);

-- printf_uxn_c_l157_c2_8335_uxn_c_l157_c2_8335
printf_uxn_c_l157_c2_8335_uxn_c_l157_c2_8335 : entity work.printf_uxn_c_l157_c2_8335_0CLK_de264c78 port map (
printf_uxn_c_l157_c2_8335_uxn_c_l157_c2_8335_CLOCK_ENABLE,
printf_uxn_c_l157_c2_8335_uxn_c_l157_c2_8335_arg0);

-- BIN_OP_EQ_uxn_c_l159_c6_394f
BIN_OP_EQ_uxn_c_l159_c6_394f : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l159_c6_394f_left,
BIN_OP_EQ_uxn_c_l159_c6_394f_right,
BIN_OP_EQ_uxn_c_l159_c6_394f_return_output);

-- is_active_drawing_area_MUX_uxn_c_l159_c2_7657
is_active_drawing_area_MUX_uxn_c_l159_c2_7657 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_active_drawing_area_MUX_uxn_c_l159_c2_7657_cond,
is_active_drawing_area_MUX_uxn_c_l159_c2_7657_iftrue,
is_active_drawing_area_MUX_uxn_c_l159_c2_7657_iffalse,
is_active_drawing_area_MUX_uxn_c_l159_c2_7657_return_output);

-- CONST_SR_2_uxn_c_l160_c28_798a
CONST_SR_2_uxn_c_l160_c28_798a : entity work.CONST_SR_2_uint16_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l160_c28_798a_x,
CONST_SR_2_uxn_c_l160_c28_798a_return_output);

-- BIN_OP_AND_uxn_c_l160_c28_5e2a
BIN_OP_AND_uxn_c_l160_c28_5e2a : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l160_c28_5e2a_left,
BIN_OP_AND_uxn_c_l160_c28_5e2a_right,
BIN_OP_AND_uxn_c_l160_c28_5e2a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59
TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb
FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_return_output);

-- is_ram_write_MUX_uxn_c_l163_c2_3d25
is_ram_write_MUX_uxn_c_l163_c2_3d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l163_c2_3d25_cond,
is_ram_write_MUX_uxn_c_l163_c2_3d25_iftrue,
is_ram_write_MUX_uxn_c_l163_c2_3d25_iffalse,
is_ram_write_MUX_uxn_c_l163_c2_3d25_return_output);

-- vram_value_MUX_uxn_c_l163_c2_3d25
vram_value_MUX_uxn_c_l163_c2_3d25 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l163_c2_3d25_cond,
vram_value_MUX_uxn_c_l163_c2_3d25_iftrue,
vram_value_MUX_uxn_c_l163_c2_3d25_iffalse,
vram_value_MUX_uxn_c_l163_c2_3d25_return_output);

-- ram_address_MUX_uxn_c_l163_c2_3d25
ram_address_MUX_uxn_c_l163_c2_3d25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l163_c2_3d25_cond,
ram_address_MUX_uxn_c_l163_c2_3d25_iftrue,
ram_address_MUX_uxn_c_l163_c2_3d25_iffalse,
ram_address_MUX_uxn_c_l163_c2_3d25_return_output);

-- vram_address_MUX_uxn_c_l163_c2_3d25
vram_address_MUX_uxn_c_l163_c2_3d25 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l163_c2_3d25_cond,
vram_address_MUX_uxn_c_l163_c2_3d25_iftrue,
vram_address_MUX_uxn_c_l163_c2_3d25_iffalse,
vram_address_MUX_uxn_c_l163_c2_3d25_return_output);

-- is_booted_MUX_uxn_c_l163_c2_3d25
is_booted_MUX_uxn_c_l163_c2_3d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l163_c2_3d25_cond,
is_booted_MUX_uxn_c_l163_c2_3d25_iftrue,
is_booted_MUX_uxn_c_l163_c2_3d25_iffalse,
is_booted_MUX_uxn_c_l163_c2_3d25_return_output);

-- ram_write_value_MUX_uxn_c_l163_c2_3d25
ram_write_value_MUX_uxn_c_l163_c2_3d25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l163_c2_3d25_cond,
ram_write_value_MUX_uxn_c_l163_c2_3d25_iftrue,
ram_write_value_MUX_uxn_c_l163_c2_3d25_iffalse,
ram_write_value_MUX_uxn_c_l163_c2_3d25_return_output);

-- vram_write_layer_MUX_uxn_c_l163_c2_3d25
vram_write_layer_MUX_uxn_c_l163_c2_3d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l163_c2_3d25_cond,
vram_write_layer_MUX_uxn_c_l163_c2_3d25_iftrue,
vram_write_layer_MUX_uxn_c_l163_c2_3d25_iffalse,
vram_write_layer_MUX_uxn_c_l163_c2_3d25_return_output);

-- is_vram_write_MUX_uxn_c_l163_c2_3d25
is_vram_write_MUX_uxn_c_l163_c2_3d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l163_c2_3d25_cond,
is_vram_write_MUX_uxn_c_l163_c2_3d25_iftrue,
is_vram_write_MUX_uxn_c_l163_c2_3d25_iffalse,
is_vram_write_MUX_uxn_c_l163_c2_3d25_return_output);

-- step_cpu_uxn_c_l164_c39_78d9
step_cpu_uxn_c_l164_c39_78d9 : entity work.step_cpu_0CLK_c82b94e9 port map (
clk,
step_cpu_uxn_c_l164_c39_78d9_CLOCK_ENABLE,
step_cpu_uxn_c_l164_c39_78d9_ram_read_value,
step_cpu_uxn_c_l164_c39_78d9_return_output);

-- step_boot_uxn_c_l173_c41_965f
step_boot_uxn_c_l173_c41_965f : entity work.step_boot_0CLK_3197952a port map (
clk,
step_boot_uxn_c_l173_c41_965f_CLOCK_ENABLE,
step_boot_uxn_c_l173_c41_965f_return_output);

-- main_ram_update_uxn_c_l180_c19_7c92
main_ram_update_uxn_c_l180_c19_7c92 : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l180_c19_7c92_CLOCK_ENABLE,
main_ram_update_uxn_c_l180_c19_7c92_ram_address,
main_ram_update_uxn_c_l180_c19_7c92_value,
main_ram_update_uxn_c_l180_c19_7c92_write_enable,
main_ram_update_uxn_c_l180_c19_7c92_return_output);

-- step_gpu_uxn_c_l186_c32_938b
step_gpu_uxn_c_l186_c32_938b : entity work.step_gpu_0CLK_d43adcb6 port map (
clk,
step_gpu_uxn_c_l186_c32_938b_CLOCK_ENABLE,
step_gpu_uxn_c_l186_c32_938b_is_active_drawing_area,
step_gpu_uxn_c_l186_c32_938b_is_vram_write,
step_gpu_uxn_c_l186_c32_938b_vram_write_layer,
step_gpu_uxn_c_l186_c32_938b_vram_address,
step_gpu_uxn_c_l186_c32_938b_vram_value,
step_gpu_uxn_c_l186_c32_938b_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_return_output);

-- BIN_OP_PLUS_uxn_c_l188_c2_699f
BIN_OP_PLUS_uxn_c_l188_c2_699f : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l188_c2_699f_left,
BIN_OP_PLUS_uxn_c_l188_c2_699f_right,
BIN_OP_PLUS_uxn_c_l188_c2_699f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 input,
 -- Registers
 main_clock_cycle,
 input_code,
 palette_color_values,
 uxn_eval_result,
 current_pixel_palette_color,
 is_active_drawing_area,
 is_booted,
 is_ram_write,
 ram_address,
 ram_write_value,
 ram_read_value,
 is_vram_write,
 vram_write_layer,
 vram_address,
 vram_value,
 -- All submodule outputs
 CONST_SR_12_uxn_c_l155_c15_2602_return_output,
 BIN_OP_EQ_uxn_c_l159_c6_394f_return_output,
 is_active_drawing_area_MUX_uxn_c_l159_c2_7657_return_output,
 CONST_SR_2_uxn_c_l160_c28_798a_return_output,
 BIN_OP_AND_uxn_c_l160_c28_5e2a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_return_output,
 is_ram_write_MUX_uxn_c_l163_c2_3d25_return_output,
 vram_value_MUX_uxn_c_l163_c2_3d25_return_output,
 ram_address_MUX_uxn_c_l163_c2_3d25_return_output,
 vram_address_MUX_uxn_c_l163_c2_3d25_return_output,
 is_booted_MUX_uxn_c_l163_c2_3d25_return_output,
 ram_write_value_MUX_uxn_c_l163_c2_3d25_return_output,
 vram_write_layer_MUX_uxn_c_l163_c2_3d25_return_output,
 is_vram_write_MUX_uxn_c_l163_c2_3d25_return_output,
 step_cpu_uxn_c_l164_c39_78d9_return_output,
 step_boot_uxn_c_l173_c41_965f_return_output,
 main_ram_update_uxn_c_l180_c19_7c92_return_output,
 step_gpu_uxn_c_l186_c32_938b_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_return_output,
 BIN_OP_PLUS_uxn_c_l188_c2_699f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_input_code_uxn_c_l155_c2_3ed9 : unsigned(3 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l155_c15_2602_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l155_c15_2602_x : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l157_c2_8335_uxn_c_l157_c2_8335_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l157_c2_8335_uxn_c_l157_c2_8335_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c6_394f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c6_394f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l159_c6_394f_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l159_c2_7657_iftrue : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_uxn_c_l160_c3_3115 : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l159_c2_7657_iffalse : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l159_c2_7657_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l159_c2_7657_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c28_5e2a_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l160_c28_798a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l160_c28_798a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c28_5e2a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l160_c28_5e2a_return_output : unsigned(15 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l163_c2_3d25_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l163_c2_3d25_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l163_c2_3d25_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l163_c2_3d25_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result : cpu_step_result_t;
 variable VAR_step_cpu_uxn_c_l164_c39_78d9_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l164_c39_78d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l164_c39_78d9_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l165_c18_1b1f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l166_c17_e7bf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l167_c21_2b5c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l168_c19_4f99_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l169_c22_5967_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l170_c18_5109_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l171_c16_2e13_return_output : unsigned(1 downto 0);
 variable VAR_boot_step_result : boot_step_result_t;
 variable VAR_step_boot_uxn_c_l173_c41_965f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_boot_uxn_c_l173_c41_965f_return_output : boot_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l174_c18_e351_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l175_c17_c809_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l176_c21_dcc6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l177_c15_566c_return_output : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l180_c19_7c92_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l180_c19_7c92_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l180_c19_7c92_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l180_c19_7c92_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l180_c19_7c92_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l186_c32_938b_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l186_c32_938b_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l186_c32_938b_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l186_c32_938b_vram_address : unsigned(31 downto 0);
 variable VAR_step_gpu_uxn_c_l186_c32_938b_vram_value : unsigned(1 downto 0);
 variable VAR_step_gpu_uxn_c_l186_c32_938b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l186_c32_938b_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_ref_toks_0 : uint12_t_4;
 variable VAR_CAST_TO_uint16_t_uxn_c_l187_c20_b125_return_output : unsigned(15 downto 0);
 variable VAR_main_clock_cycle_uxn_c_l188_c2_c4b1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l188_c2_699f_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l188_c2_699f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l188_c2_699f_return_output : unsigned(32 downto 0);
 -- State registers comb logic variables
variable REG_VAR_main_clock_cycle : unsigned(31 downto 0);
variable REG_VAR_input_code : unsigned(3 downto 0);
variable REG_VAR_palette_color_values : uint12_t_4;
variable REG_VAR_uxn_eval_result : unsigned(15 downto 0);
variable REG_VAR_current_pixel_palette_color : unsigned(1 downto 0);
variable REG_VAR_is_active_drawing_area : unsigned(0 downto 0);
variable REG_VAR_is_booted : unsigned(0 downto 0);
variable REG_VAR_is_ram_write : unsigned(0 downto 0);
variable REG_VAR_ram_address : unsigned(15 downto 0);
variable REG_VAR_ram_write_value : unsigned(7 downto 0);
variable REG_VAR_ram_read_value : unsigned(7 downto 0);
variable REG_VAR_is_vram_write : unsigned(0 downto 0);
variable REG_VAR_vram_write_layer : unsigned(0 downto 0);
variable REG_VAR_vram_address : unsigned(31 downto 0);
variable REG_VAR_vram_value : unsigned(1 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_main_clock_cycle := main_clock_cycle;
  REG_VAR_input_code := input_code;
  REG_VAR_palette_color_values := palette_color_values;
  REG_VAR_uxn_eval_result := uxn_eval_result;
  REG_VAR_current_pixel_palette_color := current_pixel_palette_color;
  REG_VAR_is_active_drawing_area := is_active_drawing_area;
  REG_VAR_is_booted := is_booted;
  REG_VAR_is_ram_write := is_ram_write;
  REG_VAR_ram_address := ram_address;
  REG_VAR_ram_write_value := ram_write_value;
  REG_VAR_ram_read_value := ram_read_value;
  REG_VAR_is_vram_write := is_vram_write;
  REG_VAR_vram_write_layer := vram_write_layer;
  REG_VAR_vram_address := vram_address;
  REG_VAR_vram_value := vram_value;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l159_c6_394f_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_c_l188_c2_699f_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l160_c28_5e2a_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_iftrue := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l180_c19_7c92_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_c_l157_c2_8335_uxn_c_l157_c2_8335_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l186_c32_938b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_CONST_SR_12_uxn_c_l155_c15_2602_x := VAR_input;
     VAR_CONST_SR_2_uxn_c_l160_c28_798a_x := VAR_input;
     VAR_is_active_drawing_area_MUX_uxn_c_l159_c2_7657_iffalse := is_active_drawing_area;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_cond := is_booted;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_cond := is_booted;
     VAR_is_booted_MUX_uxn_c_l163_c2_3d25_cond := is_booted;
     VAR_is_booted_MUX_uxn_c_l163_c2_3d25_iftrue := is_booted;
     VAR_is_ram_write_MUX_uxn_c_l163_c2_3d25_cond := is_booted;
     VAR_is_vram_write_MUX_uxn_c_l163_c2_3d25_cond := is_booted;
     VAR_ram_address_MUX_uxn_c_l163_c2_3d25_cond := is_booted;
     VAR_ram_write_value_MUX_uxn_c_l163_c2_3d25_cond := is_booted;
     VAR_vram_address_MUX_uxn_c_l163_c2_3d25_cond := is_booted;
     VAR_vram_value_MUX_uxn_c_l163_c2_3d25_cond := is_booted;
     VAR_vram_write_layer_MUX_uxn_c_l163_c2_3d25_cond := is_booted;
     VAR_is_vram_write_MUX_uxn_c_l163_c2_3d25_iffalse := is_vram_write;
     VAR_BIN_OP_PLUS_uxn_c_l188_c2_699f_left := main_clock_cycle;
     VAR_printf_uxn_c_l157_c2_8335_uxn_c_l157_c2_8335_arg0 := main_clock_cycle;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_ref_toks_0 := palette_color_values;
     REG_VAR_palette_color_values := palette_color_values;
     VAR_step_cpu_uxn_c_l164_c39_78d9_ram_read_value := ram_read_value;
     VAR_vram_address_MUX_uxn_c_l163_c2_3d25_iffalse := vram_address;
     VAR_vram_value_MUX_uxn_c_l163_c2_3d25_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l163_c2_3d25_iffalse := vram_write_layer;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l163_c1_ef59] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_return_output;

     -- BIN_OP_PLUS[uxn_c_l188_c2_699f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l188_c2_699f_left <= VAR_BIN_OP_PLUS_uxn_c_l188_c2_699f_left;
     BIN_OP_PLUS_uxn_c_l188_c2_699f_right <= VAR_BIN_OP_PLUS_uxn_c_l188_c2_699f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l188_c2_699f_return_output := BIN_OP_PLUS_uxn_c_l188_c2_699f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l172_c1_0feb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_return_output;

     -- printf_uxn_c_l157_c2_8335[uxn_c_l157_c2_8335] LATENCY=0
     -- Clock enable
     printf_uxn_c_l157_c2_8335_uxn_c_l157_c2_8335_CLOCK_ENABLE <= VAR_printf_uxn_c_l157_c2_8335_uxn_c_l157_c2_8335_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l157_c2_8335_uxn_c_l157_c2_8335_arg0 <= VAR_printf_uxn_c_l157_c2_8335_uxn_c_l157_c2_8335_arg0;
     -- Outputs

     -- CONST_SR_2[uxn_c_l160_c28_798a] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l160_c28_798a_x <= VAR_CONST_SR_2_uxn_c_l160_c28_798a_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l160_c28_798a_return_output := CONST_SR_2_uxn_c_l160_c28_798a_return_output;

     -- CONST_SR_12[uxn_c_l155_c15_2602] LATENCY=0
     -- Inputs
     CONST_SR_12_uxn_c_l155_c15_2602_x <= VAR_CONST_SR_12_uxn_c_l155_c15_2602_x;
     -- Outputs
     VAR_CONST_SR_12_uxn_c_l155_c15_2602_return_output := CONST_SR_12_uxn_c_l155_c15_2602_return_output;

     -- Submodule level 1
     VAR_main_clock_cycle_uxn_c_l188_c2_c4b1 := resize(VAR_BIN_OP_PLUS_uxn_c_l188_c2_699f_return_output, 32);
     VAR_input_code_uxn_c_l155_c2_3ed9 := resize(VAR_CONST_SR_12_uxn_c_l155_c15_2602_return_output, 4);
     VAR_BIN_OP_AND_uxn_c_l160_c28_5e2a_left := VAR_CONST_SR_2_uxn_c_l160_c28_798a_return_output;
     VAR_step_boot_uxn_c_l173_c41_965f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l172_c1_0feb_return_output;
     VAR_step_cpu_uxn_c_l164_c39_78d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l163_c1_ef59_return_output;
     VAR_BIN_OP_EQ_uxn_c_l159_c6_394f_left := VAR_input_code_uxn_c_l155_c2_3ed9;
     REG_VAR_input_code := VAR_input_code_uxn_c_l155_c2_3ed9;
     REG_VAR_main_clock_cycle := VAR_main_clock_cycle_uxn_c_l188_c2_c4b1;
     -- step_cpu[uxn_c_l164_c39_78d9] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l164_c39_78d9_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l164_c39_78d9_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l164_c39_78d9_ram_read_value <= VAR_step_cpu_uxn_c_l164_c39_78d9_ram_read_value;
     -- Outputs
     VAR_step_cpu_uxn_c_l164_c39_78d9_return_output := step_cpu_uxn_c_l164_c39_78d9_return_output;

     -- BIN_OP_EQ[uxn_c_l159_c6_394f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l159_c6_394f_left <= VAR_BIN_OP_EQ_uxn_c_l159_c6_394f_left;
     BIN_OP_EQ_uxn_c_l159_c6_394f_right <= VAR_BIN_OP_EQ_uxn_c_l159_c6_394f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l159_c6_394f_return_output := BIN_OP_EQ_uxn_c_l159_c6_394f_return_output;

     -- step_boot[uxn_c_l173_c41_965f] LATENCY=0
     -- Clock enable
     step_boot_uxn_c_l173_c41_965f_CLOCK_ENABLE <= VAR_step_boot_uxn_c_l173_c41_965f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_step_boot_uxn_c_l173_c41_965f_return_output := step_boot_uxn_c_l173_c41_965f_return_output;

     -- BIN_OP_AND[uxn_c_l160_c28_5e2a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l160_c28_5e2a_left <= VAR_BIN_OP_AND_uxn_c_l160_c28_5e2a_left;
     BIN_OP_AND_uxn_c_l160_c28_5e2a_right <= VAR_BIN_OP_AND_uxn_c_l160_c28_5e2a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l160_c28_5e2a_return_output := BIN_OP_AND_uxn_c_l160_c28_5e2a_return_output;

     -- Submodule level 2
     VAR_is_active_drawing_area_uxn_c_l160_c3_3115 := resize(VAR_BIN_OP_AND_uxn_c_l160_c28_5e2a_return_output, 1);
     VAR_is_active_drawing_area_MUX_uxn_c_l159_c2_7657_cond := VAR_BIN_OP_EQ_uxn_c_l159_c6_394f_return_output;
     VAR_is_active_drawing_area_MUX_uxn_c_l159_c2_7657_iftrue := VAR_is_active_drawing_area_uxn_c_l160_c3_3115;
     -- is_active_drawing_area_MUX[uxn_c_l159_c2_7657] LATENCY=0
     -- Inputs
     is_active_drawing_area_MUX_uxn_c_l159_c2_7657_cond <= VAR_is_active_drawing_area_MUX_uxn_c_l159_c2_7657_cond;
     is_active_drawing_area_MUX_uxn_c_l159_c2_7657_iftrue <= VAR_is_active_drawing_area_MUX_uxn_c_l159_c2_7657_iftrue;
     is_active_drawing_area_MUX_uxn_c_l159_c2_7657_iffalse <= VAR_is_active_drawing_area_MUX_uxn_c_l159_c2_7657_iffalse;
     -- Outputs
     VAR_is_active_drawing_area_MUX_uxn_c_l159_c2_7657_return_output := is_active_drawing_area_MUX_uxn_c_l159_c2_7657_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l168_c19_4f99] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l168_c19_4f99_return_output := VAR_step_cpu_uxn_c_l164_c39_78d9_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d[uxn_c_l174_c18_e351] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l174_c18_e351_return_output := VAR_step_boot_uxn_c_l173_c41_965f_return_output.is_valid_byte;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l165_c18_1b1f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l165_c18_1b1f_return_output := VAR_step_cpu_uxn_c_l164_c39_78d9_return_output.is_ram_write;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d[uxn_c_l166_c17_e7bf] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l166_c17_e7bf_return_output := VAR_step_cpu_uxn_c_l164_c39_78d9_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d[uxn_c_l177_c15_566c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l177_c15_566c_return_output := VAR_step_boot_uxn_c_l173_c41_965f_return_output.is_finished;

     -- CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d[uxn_c_l175_c17_c809] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l175_c17_c809_return_output := VAR_step_boot_uxn_c_l173_c41_965f_return_output.ram_address;

     -- CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d[uxn_c_l170_c18_5109] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l170_c18_5109_return_output := VAR_step_cpu_uxn_c_l164_c39_78d9_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d[uxn_c_l176_c21_dcc6] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l176_c21_dcc6_return_output := VAR_step_boot_uxn_c_l173_c41_965f_return_output.rom_byte;

     -- CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d[uxn_c_l171_c16_2e13] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l171_c16_2e13_return_output := VAR_step_cpu_uxn_c_l164_c39_78d9_return_output.vram_value;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l169_c22_5967] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l169_c22_5967_return_output := VAR_step_cpu_uxn_c_l164_c39_78d9_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d[uxn_c_l167_c21_2b5c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l167_c21_2b5c_return_output := VAR_step_cpu_uxn_c_l164_c39_78d9_return_output.ram_value;

     -- Submodule level 3
     VAR_ram_address_MUX_uxn_c_l163_c2_3d25_iffalse := VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l175_c17_c809_return_output;
     VAR_ram_address_MUX_uxn_c_l163_c2_3d25_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l166_c17_e7bf_return_output;
     VAR_is_booted_MUX_uxn_c_l163_c2_3d25_iffalse := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l177_c15_566c_return_output;
     VAR_is_ram_write_MUX_uxn_c_l163_c2_3d25_iffalse := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l174_c18_e351_return_output;
     VAR_is_ram_write_MUX_uxn_c_l163_c2_3d25_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l165_c18_1b1f_return_output;
     VAR_is_vram_write_MUX_uxn_c_l163_c2_3d25_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l168_c19_4f99_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l163_c2_3d25_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l169_c22_5967_return_output;
     VAR_vram_value_MUX_uxn_c_l163_c2_3d25_iftrue := VAR_CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l171_c16_2e13_return_output;
     VAR_vram_address_MUX_uxn_c_l163_c2_3d25_iftrue := VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l170_c18_5109_return_output;
     VAR_ram_write_value_MUX_uxn_c_l163_c2_3d25_iffalse := VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l176_c21_dcc6_return_output;
     VAR_ram_write_value_MUX_uxn_c_l163_c2_3d25_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l167_c21_2b5c_return_output;
     REG_VAR_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l159_c2_7657_return_output;
     VAR_step_gpu_uxn_c_l186_c32_938b_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l159_c2_7657_return_output;
     -- is_vram_write_MUX[uxn_c_l163_c2_3d25] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l163_c2_3d25_cond <= VAR_is_vram_write_MUX_uxn_c_l163_c2_3d25_cond;
     is_vram_write_MUX_uxn_c_l163_c2_3d25_iftrue <= VAR_is_vram_write_MUX_uxn_c_l163_c2_3d25_iftrue;
     is_vram_write_MUX_uxn_c_l163_c2_3d25_iffalse <= VAR_is_vram_write_MUX_uxn_c_l163_c2_3d25_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l163_c2_3d25_return_output := is_vram_write_MUX_uxn_c_l163_c2_3d25_return_output;

     -- vram_value_MUX[uxn_c_l163_c2_3d25] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l163_c2_3d25_cond <= VAR_vram_value_MUX_uxn_c_l163_c2_3d25_cond;
     vram_value_MUX_uxn_c_l163_c2_3d25_iftrue <= VAR_vram_value_MUX_uxn_c_l163_c2_3d25_iftrue;
     vram_value_MUX_uxn_c_l163_c2_3d25_iffalse <= VAR_vram_value_MUX_uxn_c_l163_c2_3d25_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l163_c2_3d25_return_output := vram_value_MUX_uxn_c_l163_c2_3d25_return_output;

     -- ram_address_MUX[uxn_c_l163_c2_3d25] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l163_c2_3d25_cond <= VAR_ram_address_MUX_uxn_c_l163_c2_3d25_cond;
     ram_address_MUX_uxn_c_l163_c2_3d25_iftrue <= VAR_ram_address_MUX_uxn_c_l163_c2_3d25_iftrue;
     ram_address_MUX_uxn_c_l163_c2_3d25_iffalse <= VAR_ram_address_MUX_uxn_c_l163_c2_3d25_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l163_c2_3d25_return_output := ram_address_MUX_uxn_c_l163_c2_3d25_return_output;

     -- is_booted_MUX[uxn_c_l163_c2_3d25] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l163_c2_3d25_cond <= VAR_is_booted_MUX_uxn_c_l163_c2_3d25_cond;
     is_booted_MUX_uxn_c_l163_c2_3d25_iftrue <= VAR_is_booted_MUX_uxn_c_l163_c2_3d25_iftrue;
     is_booted_MUX_uxn_c_l163_c2_3d25_iffalse <= VAR_is_booted_MUX_uxn_c_l163_c2_3d25_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l163_c2_3d25_return_output := is_booted_MUX_uxn_c_l163_c2_3d25_return_output;

     -- vram_address_MUX[uxn_c_l163_c2_3d25] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l163_c2_3d25_cond <= VAR_vram_address_MUX_uxn_c_l163_c2_3d25_cond;
     vram_address_MUX_uxn_c_l163_c2_3d25_iftrue <= VAR_vram_address_MUX_uxn_c_l163_c2_3d25_iftrue;
     vram_address_MUX_uxn_c_l163_c2_3d25_iffalse <= VAR_vram_address_MUX_uxn_c_l163_c2_3d25_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l163_c2_3d25_return_output := vram_address_MUX_uxn_c_l163_c2_3d25_return_output;

     -- ram_write_value_MUX[uxn_c_l163_c2_3d25] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l163_c2_3d25_cond <= VAR_ram_write_value_MUX_uxn_c_l163_c2_3d25_cond;
     ram_write_value_MUX_uxn_c_l163_c2_3d25_iftrue <= VAR_ram_write_value_MUX_uxn_c_l163_c2_3d25_iftrue;
     ram_write_value_MUX_uxn_c_l163_c2_3d25_iffalse <= VAR_ram_write_value_MUX_uxn_c_l163_c2_3d25_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l163_c2_3d25_return_output := ram_write_value_MUX_uxn_c_l163_c2_3d25_return_output;

     -- is_ram_write_MUX[uxn_c_l163_c2_3d25] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l163_c2_3d25_cond <= VAR_is_ram_write_MUX_uxn_c_l163_c2_3d25_cond;
     is_ram_write_MUX_uxn_c_l163_c2_3d25_iftrue <= VAR_is_ram_write_MUX_uxn_c_l163_c2_3d25_iftrue;
     is_ram_write_MUX_uxn_c_l163_c2_3d25_iffalse <= VAR_is_ram_write_MUX_uxn_c_l163_c2_3d25_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l163_c2_3d25_return_output := is_ram_write_MUX_uxn_c_l163_c2_3d25_return_output;

     -- vram_write_layer_MUX[uxn_c_l163_c2_3d25] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l163_c2_3d25_cond <= VAR_vram_write_layer_MUX_uxn_c_l163_c2_3d25_cond;
     vram_write_layer_MUX_uxn_c_l163_c2_3d25_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l163_c2_3d25_iftrue;
     vram_write_layer_MUX_uxn_c_l163_c2_3d25_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l163_c2_3d25_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l163_c2_3d25_return_output := vram_write_layer_MUX_uxn_c_l163_c2_3d25_return_output;

     -- Submodule level 4
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l163_c2_3d25_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l163_c2_3d25_return_output;
     VAR_main_ram_update_uxn_c_l180_c19_7c92_write_enable := VAR_is_ram_write_MUX_uxn_c_l163_c2_3d25_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l163_c2_3d25_return_output;
     VAR_step_gpu_uxn_c_l186_c32_938b_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l163_c2_3d25_return_output;
     VAR_main_ram_update_uxn_c_l180_c19_7c92_ram_address := VAR_ram_address_MUX_uxn_c_l163_c2_3d25_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l163_c2_3d25_return_output;
     VAR_main_ram_update_uxn_c_l180_c19_7c92_value := VAR_ram_write_value_MUX_uxn_c_l163_c2_3d25_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l163_c2_3d25_return_output;
     VAR_step_gpu_uxn_c_l186_c32_938b_vram_address := VAR_vram_address_MUX_uxn_c_l163_c2_3d25_return_output;
     REG_VAR_vram_address := VAR_vram_address_MUX_uxn_c_l163_c2_3d25_return_output;
     VAR_step_gpu_uxn_c_l186_c32_938b_vram_value := VAR_vram_value_MUX_uxn_c_l163_c2_3d25_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l163_c2_3d25_return_output;
     VAR_step_gpu_uxn_c_l186_c32_938b_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l163_c2_3d25_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l163_c2_3d25_return_output;
     -- step_gpu[uxn_c_l186_c32_938b] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l186_c32_938b_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l186_c32_938b_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l186_c32_938b_is_active_drawing_area <= VAR_step_gpu_uxn_c_l186_c32_938b_is_active_drawing_area;
     step_gpu_uxn_c_l186_c32_938b_is_vram_write <= VAR_step_gpu_uxn_c_l186_c32_938b_is_vram_write;
     step_gpu_uxn_c_l186_c32_938b_vram_write_layer <= VAR_step_gpu_uxn_c_l186_c32_938b_vram_write_layer;
     step_gpu_uxn_c_l186_c32_938b_vram_address <= VAR_step_gpu_uxn_c_l186_c32_938b_vram_address;
     step_gpu_uxn_c_l186_c32_938b_vram_value <= VAR_step_gpu_uxn_c_l186_c32_938b_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l186_c32_938b_return_output := step_gpu_uxn_c_l186_c32_938b_return_output;

     -- main_ram_update[uxn_c_l180_c19_7c92] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l180_c19_7c92_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l180_c19_7c92_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l180_c19_7c92_ram_address <= VAR_main_ram_update_uxn_c_l180_c19_7c92_ram_address;
     main_ram_update_uxn_c_l180_c19_7c92_value <= VAR_main_ram_update_uxn_c_l180_c19_7c92_value;
     main_ram_update_uxn_c_l180_c19_7c92_write_enable <= VAR_main_ram_update_uxn_c_l180_c19_7c92_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l180_c19_7c92_return_output := main_ram_update_uxn_c_l180_c19_7c92_return_output;

     -- Submodule level 5
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l180_c19_7c92_return_output;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_var_dim_0 := VAR_step_gpu_uxn_c_l186_c32_938b_return_output;
     REG_VAR_current_pixel_palette_color := VAR_step_gpu_uxn_c_l186_c32_938b_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l187_c31_c6d1] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_return_output;

     -- Submodule level 6
     -- CAST_TO_uint16_t[uxn_c_l187_c20_b125] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_c_l187_c20_b125_return_output := CAST_TO_uint16_t_uint12_t(
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l187_c31_c6d1_return_output);

     -- Submodule level 7
     VAR_return_output := VAR_CAST_TO_uint16_t_uxn_c_l187_c20_b125_return_output;
     REG_VAR_uxn_eval_result := VAR_CAST_TO_uint16_t_uxn_c_l187_c20_b125_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_main_clock_cycle <= REG_VAR_main_clock_cycle;
REG_COMB_input_code <= REG_VAR_input_code;
REG_COMB_palette_color_values <= REG_VAR_palette_color_values;
REG_COMB_uxn_eval_result <= REG_VAR_uxn_eval_result;
REG_COMB_current_pixel_palette_color <= REG_VAR_current_pixel_palette_color;
REG_COMB_is_active_drawing_area <= REG_VAR_is_active_drawing_area;
REG_COMB_is_booted <= REG_VAR_is_booted;
REG_COMB_is_ram_write <= REG_VAR_is_ram_write;
REG_COMB_ram_address <= REG_VAR_ram_address;
REG_COMB_ram_write_value <= REG_VAR_ram_write_value;
REG_COMB_ram_read_value <= REG_VAR_ram_read_value;
REG_COMB_is_vram_write <= REG_VAR_is_vram_write;
REG_COMB_vram_write_layer <= REG_VAR_vram_write_layer;
REG_COMB_vram_address <= REG_VAR_vram_address;
REG_COMB_vram_value <= REG_VAR_vram_value;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     main_clock_cycle <= REG_COMB_main_clock_cycle;
     input_code <= REG_COMB_input_code;
     palette_color_values <= REG_COMB_palette_color_values;
     uxn_eval_result <= REG_COMB_uxn_eval_result;
     current_pixel_palette_color <= REG_COMB_current_pixel_palette_color;
     is_active_drawing_area <= REG_COMB_is_active_drawing_area;
     is_booted <= REG_COMB_is_booted;
     is_ram_write <= REG_COMB_is_ram_write;
     ram_address <= REG_COMB_ram_address;
     ram_write_value <= REG_COMB_ram_write_value;
     ram_read_value <= REG_COMB_ram_read_value;
     is_vram_write <= REG_COMB_is_vram_write;
     vram_write_layer <= REG_COMB_vram_write_layer;
     vram_address <= REG_COMB_vram_address;
     vram_value <= REG_COMB_vram_value;
 end if;
 end if;
end process;

end arch;
