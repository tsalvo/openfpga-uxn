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
-- Submodules: 22
entity uxn_eval_0CLK_94c32716 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_94c32716;
architecture arch of uxn_eval_0CLK_94c32716 is
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
signal REG_COMB_vram_address : unsigned(31 downto 0);
signal REG_COMB_vram_value : unsigned(1 downto 0);

-- Each function instance gets signals
-- CONST_SR_12[uxn_c_l154_c15_dec5]
signal CONST_SR_12_uxn_c_l154_c15_dec5_x : unsigned(15 downto 0);
signal CONST_SR_12_uxn_c_l154_c15_dec5_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l156_c2_5c04[uxn_c_l156_c2_5c04]
signal printf_uxn_c_l156_c2_5c04_uxn_c_l156_c2_5c04_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l156_c2_5c04_uxn_c_l156_c2_5c04_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l158_c6_fe96]
signal BIN_OP_EQ_uxn_c_l158_c6_fe96_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c6_fe96_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l158_c6_fe96_return_output : unsigned(0 downto 0);

-- is_active_drawing_area_MUX[uxn_c_l158_c2_0633]
signal is_active_drawing_area_MUX_uxn_c_l158_c2_0633_cond : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l158_c2_0633_iftrue : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l158_c2_0633_iffalse : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l158_c2_0633_return_output : unsigned(0 downto 0);

-- CONST_SR_2[uxn_c_l159_c28_f255]
signal CONST_SR_2_uxn_c_l159_c28_f255_x : unsigned(15 downto 0);
signal CONST_SR_2_uxn_c_l159_c28_f255_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l159_c28_3a9f]
signal BIN_OP_AND_uxn_c_l159_c28_3a9f_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l159_c28_3a9f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l159_c28_3a9f_return_output : unsigned(15 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l162_c1_ab0a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l170_c1_a365]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l162_c2_ab0a]
signal ram_write_value_MUX_uxn_c_l162_c2_ab0a_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l162_c2_ab0a_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l162_c2_ab0a_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l162_c2_ab0a_return_output : unsigned(7 downto 0);

-- is_vram_write_MUX[uxn_c_l162_c2_ab0a]
signal is_vram_write_MUX_uxn_c_l162_c2_ab0a_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l162_c2_ab0a_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l162_c2_ab0a_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l162_c2_ab0a_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l162_c2_ab0a]
signal ram_address_MUX_uxn_c_l162_c2_ab0a_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l162_c2_ab0a_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l162_c2_ab0a_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l162_c2_ab0a_return_output : unsigned(15 downto 0);

-- is_booted_MUX[uxn_c_l162_c2_ab0a]
signal is_booted_MUX_uxn_c_l162_c2_ab0a_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l162_c2_ab0a_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l162_c2_ab0a_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l162_c2_ab0a_return_output : unsigned(0 downto 0);

-- vram_address_MUX[uxn_c_l162_c2_ab0a]
signal vram_address_MUX_uxn_c_l162_c2_ab0a_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l162_c2_ab0a_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l162_c2_ab0a_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l162_c2_ab0a_return_output : unsigned(31 downto 0);

-- is_ram_write_MUX[uxn_c_l162_c2_ab0a]
signal is_ram_write_MUX_uxn_c_l162_c2_ab0a_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l162_c2_ab0a_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l162_c2_ab0a_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l162_c2_ab0a_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l162_c2_ab0a]
signal vram_value_MUX_uxn_c_l162_c2_ab0a_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l162_c2_ab0a_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l162_c2_ab0a_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l162_c2_ab0a_return_output : unsigned(1 downto 0);

-- step_cpu[uxn_c_l163_c39_2cd6]
signal step_cpu_uxn_c_l163_c39_2cd6_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l163_c39_2cd6_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l163_c39_2cd6_return_output : cpu_step_result_t;

-- step_boot[uxn_c_l171_c41_ce9c]
signal step_boot_uxn_c_l171_c41_ce9c_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_boot_uxn_c_l171_c41_ce9c_return_output : boot_step_result_t;

-- main_ram_update[uxn_c_l178_c19_a829]
signal main_ram_update_uxn_c_l178_c19_a829_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l178_c19_a829_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l178_c19_a829_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l178_c19_a829_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l178_c19_a829_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l184_c32_6ac4]
signal step_gpu_uxn_c_l184_c32_6ac4_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l184_c32_6ac4_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l184_c32_6ac4_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l184_c32_6ac4_vram_address : unsigned(31 downto 0);
signal step_gpu_uxn_c_l184_c32_6ac4_vram_value : unsigned(1 downto 0);
signal step_gpu_uxn_c_l184_c32_6ac4_return_output : unsigned(1 downto 0);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l185_c31_d26b]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_return_output : unsigned(11 downto 0);

-- BIN_OP_PLUS[uxn_c_l186_c2_f875]
signal BIN_OP_PLUS_uxn_c_l186_c2_f875_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l186_c2_f875_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l186_c2_f875_return_output : unsigned(32 downto 0);

function CAST_TO_uint16_t_uint12_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(11 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_12_uxn_c_l154_c15_dec5
CONST_SR_12_uxn_c_l154_c15_dec5 : entity work.CONST_SR_12_uint16_t_0CLK_de264c78 port map (
CONST_SR_12_uxn_c_l154_c15_dec5_x,
CONST_SR_12_uxn_c_l154_c15_dec5_return_output);

-- printf_uxn_c_l156_c2_5c04_uxn_c_l156_c2_5c04
printf_uxn_c_l156_c2_5c04_uxn_c_l156_c2_5c04 : entity work.printf_uxn_c_l156_c2_5c04_0CLK_de264c78 port map (
printf_uxn_c_l156_c2_5c04_uxn_c_l156_c2_5c04_CLOCK_ENABLE,
printf_uxn_c_l156_c2_5c04_uxn_c_l156_c2_5c04_arg0);

-- BIN_OP_EQ_uxn_c_l158_c6_fe96
BIN_OP_EQ_uxn_c_l158_c6_fe96 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l158_c6_fe96_left,
BIN_OP_EQ_uxn_c_l158_c6_fe96_right,
BIN_OP_EQ_uxn_c_l158_c6_fe96_return_output);

-- is_active_drawing_area_MUX_uxn_c_l158_c2_0633
is_active_drawing_area_MUX_uxn_c_l158_c2_0633 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_active_drawing_area_MUX_uxn_c_l158_c2_0633_cond,
is_active_drawing_area_MUX_uxn_c_l158_c2_0633_iftrue,
is_active_drawing_area_MUX_uxn_c_l158_c2_0633_iffalse,
is_active_drawing_area_MUX_uxn_c_l158_c2_0633_return_output);

-- CONST_SR_2_uxn_c_l159_c28_f255
CONST_SR_2_uxn_c_l159_c28_f255 : entity work.CONST_SR_2_uint16_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l159_c28_f255_x,
CONST_SR_2_uxn_c_l159_c28_f255_return_output);

-- BIN_OP_AND_uxn_c_l159_c28_3a9f
BIN_OP_AND_uxn_c_l159_c28_3a9f : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l159_c28_3a9f_left,
BIN_OP_AND_uxn_c_l159_c28_3a9f_right,
BIN_OP_AND_uxn_c_l159_c28_3a9f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a
TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365
FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_return_output);

-- ram_write_value_MUX_uxn_c_l162_c2_ab0a
ram_write_value_MUX_uxn_c_l162_c2_ab0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l162_c2_ab0a_cond,
ram_write_value_MUX_uxn_c_l162_c2_ab0a_iftrue,
ram_write_value_MUX_uxn_c_l162_c2_ab0a_iffalse,
ram_write_value_MUX_uxn_c_l162_c2_ab0a_return_output);

-- is_vram_write_MUX_uxn_c_l162_c2_ab0a
is_vram_write_MUX_uxn_c_l162_c2_ab0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l162_c2_ab0a_cond,
is_vram_write_MUX_uxn_c_l162_c2_ab0a_iftrue,
is_vram_write_MUX_uxn_c_l162_c2_ab0a_iffalse,
is_vram_write_MUX_uxn_c_l162_c2_ab0a_return_output);

-- ram_address_MUX_uxn_c_l162_c2_ab0a
ram_address_MUX_uxn_c_l162_c2_ab0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l162_c2_ab0a_cond,
ram_address_MUX_uxn_c_l162_c2_ab0a_iftrue,
ram_address_MUX_uxn_c_l162_c2_ab0a_iffalse,
ram_address_MUX_uxn_c_l162_c2_ab0a_return_output);

-- is_booted_MUX_uxn_c_l162_c2_ab0a
is_booted_MUX_uxn_c_l162_c2_ab0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l162_c2_ab0a_cond,
is_booted_MUX_uxn_c_l162_c2_ab0a_iftrue,
is_booted_MUX_uxn_c_l162_c2_ab0a_iffalse,
is_booted_MUX_uxn_c_l162_c2_ab0a_return_output);

-- vram_address_MUX_uxn_c_l162_c2_ab0a
vram_address_MUX_uxn_c_l162_c2_ab0a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l162_c2_ab0a_cond,
vram_address_MUX_uxn_c_l162_c2_ab0a_iftrue,
vram_address_MUX_uxn_c_l162_c2_ab0a_iffalse,
vram_address_MUX_uxn_c_l162_c2_ab0a_return_output);

-- is_ram_write_MUX_uxn_c_l162_c2_ab0a
is_ram_write_MUX_uxn_c_l162_c2_ab0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l162_c2_ab0a_cond,
is_ram_write_MUX_uxn_c_l162_c2_ab0a_iftrue,
is_ram_write_MUX_uxn_c_l162_c2_ab0a_iffalse,
is_ram_write_MUX_uxn_c_l162_c2_ab0a_return_output);

-- vram_value_MUX_uxn_c_l162_c2_ab0a
vram_value_MUX_uxn_c_l162_c2_ab0a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l162_c2_ab0a_cond,
vram_value_MUX_uxn_c_l162_c2_ab0a_iftrue,
vram_value_MUX_uxn_c_l162_c2_ab0a_iffalse,
vram_value_MUX_uxn_c_l162_c2_ab0a_return_output);

-- step_cpu_uxn_c_l163_c39_2cd6
step_cpu_uxn_c_l163_c39_2cd6 : entity work.step_cpu_0CLK_f508a836 port map (
clk,
step_cpu_uxn_c_l163_c39_2cd6_CLOCK_ENABLE,
step_cpu_uxn_c_l163_c39_2cd6_ram_read_value,
step_cpu_uxn_c_l163_c39_2cd6_return_output);

-- step_boot_uxn_c_l171_c41_ce9c
step_boot_uxn_c_l171_c41_ce9c : entity work.step_boot_0CLK_d2064c95 port map (
clk,
step_boot_uxn_c_l171_c41_ce9c_CLOCK_ENABLE,
step_boot_uxn_c_l171_c41_ce9c_return_output);

-- main_ram_update_uxn_c_l178_c19_a829
main_ram_update_uxn_c_l178_c19_a829 : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l178_c19_a829_CLOCK_ENABLE,
main_ram_update_uxn_c_l178_c19_a829_ram_address,
main_ram_update_uxn_c_l178_c19_a829_value,
main_ram_update_uxn_c_l178_c19_a829_write_enable,
main_ram_update_uxn_c_l178_c19_a829_return_output);

-- step_gpu_uxn_c_l184_c32_6ac4
step_gpu_uxn_c_l184_c32_6ac4 : entity work.step_gpu_0CLK_8cfe5299 port map (
clk,
step_gpu_uxn_c_l184_c32_6ac4_CLOCK_ENABLE,
step_gpu_uxn_c_l184_c32_6ac4_is_active_drawing_area,
step_gpu_uxn_c_l184_c32_6ac4_is_vram_write,
step_gpu_uxn_c_l184_c32_6ac4_vram_address,
step_gpu_uxn_c_l184_c32_6ac4_vram_value,
step_gpu_uxn_c_l184_c32_6ac4_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_return_output);

-- BIN_OP_PLUS_uxn_c_l186_c2_f875
BIN_OP_PLUS_uxn_c_l186_c2_f875 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l186_c2_f875_left,
BIN_OP_PLUS_uxn_c_l186_c2_f875_right,
BIN_OP_PLUS_uxn_c_l186_c2_f875_return_output);



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
 vram_address,
 vram_value,
 -- All submodule outputs
 CONST_SR_12_uxn_c_l154_c15_dec5_return_output,
 BIN_OP_EQ_uxn_c_l158_c6_fe96_return_output,
 is_active_drawing_area_MUX_uxn_c_l158_c2_0633_return_output,
 CONST_SR_2_uxn_c_l159_c28_f255_return_output,
 BIN_OP_AND_uxn_c_l159_c28_3a9f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_return_output,
 ram_write_value_MUX_uxn_c_l162_c2_ab0a_return_output,
 is_vram_write_MUX_uxn_c_l162_c2_ab0a_return_output,
 ram_address_MUX_uxn_c_l162_c2_ab0a_return_output,
 is_booted_MUX_uxn_c_l162_c2_ab0a_return_output,
 vram_address_MUX_uxn_c_l162_c2_ab0a_return_output,
 is_ram_write_MUX_uxn_c_l162_c2_ab0a_return_output,
 vram_value_MUX_uxn_c_l162_c2_ab0a_return_output,
 step_cpu_uxn_c_l163_c39_2cd6_return_output,
 step_boot_uxn_c_l171_c41_ce9c_return_output,
 main_ram_update_uxn_c_l178_c19_a829_return_output,
 step_gpu_uxn_c_l184_c32_6ac4_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_return_output,
 BIN_OP_PLUS_uxn_c_l186_c2_f875_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_input_code_uxn_c_l154_c2_edd5 : unsigned(3 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l154_c15_dec5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l154_c15_dec5_x : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l156_c2_5c04_uxn_c_l156_c2_5c04_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l156_c2_5c04_uxn_c_l156_c2_5c04_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c6_fe96_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c6_fe96_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l158_c6_fe96_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l158_c2_0633_iftrue : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_uxn_c_l159_c3_fd86 : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l158_c2_0633_iffalse : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l158_c2_0633_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l158_c2_0633_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c28_3a9f_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l159_c28_f255_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l159_c28_f255_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c28_3a9f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l159_c28_3a9f_return_output : unsigned(15 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_iffalse : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l162_c2_ab0a_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l162_c2_ab0a_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l162_c2_ab0a_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l162_c2_ab0a_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l162_c2_ab0a_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l162_c2_ab0a_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l162_c2_ab0a_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l162_c2_ab0a_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l162_c2_ab0a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l162_c2_ab0a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l162_c2_ab0a_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l162_c2_ab0a_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l162_c2_ab0a_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l162_c2_ab0a_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l162_c2_ab0a_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l162_c2_ab0a_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l162_c2_ab0a_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l162_c2_ab0a_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l162_c2_ab0a_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l162_c2_ab0a_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l162_c2_ab0a_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l162_c2_ab0a_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l162_c2_ab0a_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l162_c2_ab0a_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l162_c2_ab0a_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l162_c2_ab0a_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l162_c2_ab0a_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l162_c2_ab0a_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result : cpu_step_result_t;
 variable VAR_step_cpu_uxn_c_l163_c39_2cd6_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l163_c39_2cd6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l163_c39_2cd6_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l164_c18_023a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l165_c17_51ea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l166_c21_6271_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l167_c19_ed9e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l168_c18_8eba_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l169_c16_21c1_return_output : unsigned(1 downto 0);
 variable VAR_boot_step_result : boot_step_result_t;
 variable VAR_step_boot_uxn_c_l171_c41_ce9c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_boot_uxn_c_l171_c41_ce9c_return_output : boot_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l172_c18_905a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l173_c17_3963_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l174_c21_1b3e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l175_c15_9bb8_return_output : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l178_c19_a829_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l178_c19_a829_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l178_c19_a829_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l178_c19_a829_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l178_c19_a829_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l184_c32_6ac4_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l184_c32_6ac4_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l184_c32_6ac4_vram_address : unsigned(31 downto 0);
 variable VAR_step_gpu_uxn_c_l184_c32_6ac4_vram_value : unsigned(1 downto 0);
 variable VAR_step_gpu_uxn_c_l184_c32_6ac4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l184_c32_6ac4_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_ref_toks_0 : uint12_t_4;
 variable VAR_CAST_TO_uint16_t_uxn_c_l185_c20_d356_return_output : unsigned(15 downto 0);
 variable VAR_main_clock_cycle_uxn_c_l186_c2_959a : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l186_c2_f875_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l186_c2_f875_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l186_c2_f875_return_output : unsigned(32 downto 0);
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
  REG_VAR_vram_address := vram_address;
  REG_VAR_vram_value := vram_value;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l159_c28_3a9f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l158_c6_fe96_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_c_l186_c2_f875_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_iftrue := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l178_c19_a829_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_c_l156_c2_5c04_uxn_c_l156_c2_5c04_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l184_c32_6ac4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_CONST_SR_12_uxn_c_l154_c15_dec5_x := VAR_input;
     VAR_CONST_SR_2_uxn_c_l159_c28_f255_x := VAR_input;
     VAR_is_active_drawing_area_MUX_uxn_c_l158_c2_0633_iffalse := is_active_drawing_area;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_cond := is_booted;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_cond := is_booted;
     VAR_is_booted_MUX_uxn_c_l162_c2_ab0a_cond := is_booted;
     VAR_is_booted_MUX_uxn_c_l162_c2_ab0a_iftrue := is_booted;
     VAR_is_ram_write_MUX_uxn_c_l162_c2_ab0a_cond := is_booted;
     VAR_is_vram_write_MUX_uxn_c_l162_c2_ab0a_cond := is_booted;
     VAR_ram_address_MUX_uxn_c_l162_c2_ab0a_cond := is_booted;
     VAR_ram_write_value_MUX_uxn_c_l162_c2_ab0a_cond := is_booted;
     VAR_vram_address_MUX_uxn_c_l162_c2_ab0a_cond := is_booted;
     VAR_vram_value_MUX_uxn_c_l162_c2_ab0a_cond := is_booted;
     VAR_is_vram_write_MUX_uxn_c_l162_c2_ab0a_iffalse := is_vram_write;
     VAR_BIN_OP_PLUS_uxn_c_l186_c2_f875_left := main_clock_cycle;
     VAR_printf_uxn_c_l156_c2_5c04_uxn_c_l156_c2_5c04_arg0 := main_clock_cycle;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_ref_toks_0 := palette_color_values;
     REG_VAR_palette_color_values := palette_color_values;
     VAR_step_cpu_uxn_c_l163_c39_2cd6_ram_read_value := ram_read_value;
     VAR_vram_address_MUX_uxn_c_l162_c2_ab0a_iffalse := vram_address;
     VAR_vram_value_MUX_uxn_c_l162_c2_ab0a_iffalse := vram_value;
     -- printf_uxn_c_l156_c2_5c04[uxn_c_l156_c2_5c04] LATENCY=0
     -- Clock enable
     printf_uxn_c_l156_c2_5c04_uxn_c_l156_c2_5c04_CLOCK_ENABLE <= VAR_printf_uxn_c_l156_c2_5c04_uxn_c_l156_c2_5c04_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l156_c2_5c04_uxn_c_l156_c2_5c04_arg0 <= VAR_printf_uxn_c_l156_c2_5c04_uxn_c_l156_c2_5c04_arg0;
     -- Outputs

     -- CONST_SR_12[uxn_c_l154_c15_dec5] LATENCY=0
     -- Inputs
     CONST_SR_12_uxn_c_l154_c15_dec5_x <= VAR_CONST_SR_12_uxn_c_l154_c15_dec5_x;
     -- Outputs
     VAR_CONST_SR_12_uxn_c_l154_c15_dec5_return_output := CONST_SR_12_uxn_c_l154_c15_dec5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l162_c1_ab0a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_return_output;

     -- BIN_OP_PLUS[uxn_c_l186_c2_f875] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l186_c2_f875_left <= VAR_BIN_OP_PLUS_uxn_c_l186_c2_f875_left;
     BIN_OP_PLUS_uxn_c_l186_c2_f875_right <= VAR_BIN_OP_PLUS_uxn_c_l186_c2_f875_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l186_c2_f875_return_output := BIN_OP_PLUS_uxn_c_l186_c2_f875_return_output;

     -- CONST_SR_2[uxn_c_l159_c28_f255] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l159_c28_f255_x <= VAR_CONST_SR_2_uxn_c_l159_c28_f255_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l159_c28_f255_return_output := CONST_SR_2_uxn_c_l159_c28_f255_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l170_c1_a365] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_return_output;

     -- Submodule level 1
     VAR_main_clock_cycle_uxn_c_l186_c2_959a := resize(VAR_BIN_OP_PLUS_uxn_c_l186_c2_f875_return_output, 32);
     VAR_input_code_uxn_c_l154_c2_edd5 := resize(VAR_CONST_SR_12_uxn_c_l154_c15_dec5_return_output, 4);
     VAR_BIN_OP_AND_uxn_c_l159_c28_3a9f_left := VAR_CONST_SR_2_uxn_c_l159_c28_f255_return_output;
     VAR_step_boot_uxn_c_l171_c41_ce9c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l170_c1_a365_return_output;
     VAR_step_cpu_uxn_c_l163_c39_2cd6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l162_c1_ab0a_return_output;
     VAR_BIN_OP_EQ_uxn_c_l158_c6_fe96_left := VAR_input_code_uxn_c_l154_c2_edd5;
     REG_VAR_input_code := VAR_input_code_uxn_c_l154_c2_edd5;
     REG_VAR_main_clock_cycle := VAR_main_clock_cycle_uxn_c_l186_c2_959a;
     -- step_cpu[uxn_c_l163_c39_2cd6] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l163_c39_2cd6_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l163_c39_2cd6_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l163_c39_2cd6_ram_read_value <= VAR_step_cpu_uxn_c_l163_c39_2cd6_ram_read_value;
     -- Outputs
     VAR_step_cpu_uxn_c_l163_c39_2cd6_return_output := step_cpu_uxn_c_l163_c39_2cd6_return_output;

     -- BIN_OP_AND[uxn_c_l159_c28_3a9f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l159_c28_3a9f_left <= VAR_BIN_OP_AND_uxn_c_l159_c28_3a9f_left;
     BIN_OP_AND_uxn_c_l159_c28_3a9f_right <= VAR_BIN_OP_AND_uxn_c_l159_c28_3a9f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l159_c28_3a9f_return_output := BIN_OP_AND_uxn_c_l159_c28_3a9f_return_output;

     -- step_boot[uxn_c_l171_c41_ce9c] LATENCY=0
     -- Clock enable
     step_boot_uxn_c_l171_c41_ce9c_CLOCK_ENABLE <= VAR_step_boot_uxn_c_l171_c41_ce9c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_step_boot_uxn_c_l171_c41_ce9c_return_output := step_boot_uxn_c_l171_c41_ce9c_return_output;

     -- BIN_OP_EQ[uxn_c_l158_c6_fe96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l158_c6_fe96_left <= VAR_BIN_OP_EQ_uxn_c_l158_c6_fe96_left;
     BIN_OP_EQ_uxn_c_l158_c6_fe96_right <= VAR_BIN_OP_EQ_uxn_c_l158_c6_fe96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l158_c6_fe96_return_output := BIN_OP_EQ_uxn_c_l158_c6_fe96_return_output;

     -- Submodule level 2
     VAR_is_active_drawing_area_uxn_c_l159_c3_fd86 := resize(VAR_BIN_OP_AND_uxn_c_l159_c28_3a9f_return_output, 1);
     VAR_is_active_drawing_area_MUX_uxn_c_l158_c2_0633_cond := VAR_BIN_OP_EQ_uxn_c_l158_c6_fe96_return_output;
     VAR_is_active_drawing_area_MUX_uxn_c_l158_c2_0633_iftrue := VAR_is_active_drawing_area_uxn_c_l159_c3_fd86;
     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d[uxn_c_l175_c15_9bb8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l175_c15_9bb8_return_output := VAR_step_boot_uxn_c_l171_c41_ce9c_return_output.is_finished;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d[uxn_c_l165_c17_51ea] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l165_c17_51ea_return_output := VAR_step_cpu_uxn_c_l163_c39_2cd6_return_output.ram_address;

     -- CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d[uxn_c_l174_c21_1b3e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l174_c21_1b3e_return_output := VAR_step_boot_uxn_c_l171_c41_ce9c_return_output.rom_byte;

     -- CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d[uxn_c_l169_c16_21c1] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l169_c16_21c1_return_output := VAR_step_cpu_uxn_c_l163_c39_2cd6_return_output.vram_value;

     -- is_active_drawing_area_MUX[uxn_c_l158_c2_0633] LATENCY=0
     -- Inputs
     is_active_drawing_area_MUX_uxn_c_l158_c2_0633_cond <= VAR_is_active_drawing_area_MUX_uxn_c_l158_c2_0633_cond;
     is_active_drawing_area_MUX_uxn_c_l158_c2_0633_iftrue <= VAR_is_active_drawing_area_MUX_uxn_c_l158_c2_0633_iftrue;
     is_active_drawing_area_MUX_uxn_c_l158_c2_0633_iffalse <= VAR_is_active_drawing_area_MUX_uxn_c_l158_c2_0633_iffalse;
     -- Outputs
     VAR_is_active_drawing_area_MUX_uxn_c_l158_c2_0633_return_output := is_active_drawing_area_MUX_uxn_c_l158_c2_0633_return_output;

     -- CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d[uxn_c_l168_c18_8eba] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l168_c18_8eba_return_output := VAR_step_cpu_uxn_c_l163_c39_2cd6_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d[uxn_c_l166_c21_6271] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l166_c21_6271_return_output := VAR_step_cpu_uxn_c_l163_c39_2cd6_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l167_c19_ed9e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l167_c19_ed9e_return_output := VAR_step_cpu_uxn_c_l163_c39_2cd6_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l164_c18_023a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l164_c18_023a_return_output := VAR_step_cpu_uxn_c_l163_c39_2cd6_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d[uxn_c_l172_c18_905a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l172_c18_905a_return_output := VAR_step_boot_uxn_c_l171_c41_ce9c_return_output.is_valid_byte;

     -- CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d[uxn_c_l173_c17_3963] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l173_c17_3963_return_output := VAR_step_boot_uxn_c_l171_c41_ce9c_return_output.ram_address;

     -- Submodule level 3
     VAR_ram_address_MUX_uxn_c_l162_c2_ab0a_iffalse := VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l173_c17_3963_return_output;
     VAR_ram_address_MUX_uxn_c_l162_c2_ab0a_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l165_c17_51ea_return_output;
     VAR_is_booted_MUX_uxn_c_l162_c2_ab0a_iffalse := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l175_c15_9bb8_return_output;
     VAR_is_ram_write_MUX_uxn_c_l162_c2_ab0a_iffalse := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l172_c18_905a_return_output;
     VAR_is_ram_write_MUX_uxn_c_l162_c2_ab0a_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l164_c18_023a_return_output;
     VAR_is_vram_write_MUX_uxn_c_l162_c2_ab0a_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l167_c19_ed9e_return_output;
     VAR_vram_value_MUX_uxn_c_l162_c2_ab0a_iftrue := VAR_CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l169_c16_21c1_return_output;
     VAR_vram_address_MUX_uxn_c_l162_c2_ab0a_iftrue := VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l168_c18_8eba_return_output;
     VAR_ram_write_value_MUX_uxn_c_l162_c2_ab0a_iffalse := VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l174_c21_1b3e_return_output;
     VAR_ram_write_value_MUX_uxn_c_l162_c2_ab0a_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l166_c21_6271_return_output;
     REG_VAR_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l158_c2_0633_return_output;
     VAR_step_gpu_uxn_c_l184_c32_6ac4_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l158_c2_0633_return_output;
     -- is_vram_write_MUX[uxn_c_l162_c2_ab0a] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l162_c2_ab0a_cond <= VAR_is_vram_write_MUX_uxn_c_l162_c2_ab0a_cond;
     is_vram_write_MUX_uxn_c_l162_c2_ab0a_iftrue <= VAR_is_vram_write_MUX_uxn_c_l162_c2_ab0a_iftrue;
     is_vram_write_MUX_uxn_c_l162_c2_ab0a_iffalse <= VAR_is_vram_write_MUX_uxn_c_l162_c2_ab0a_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l162_c2_ab0a_return_output := is_vram_write_MUX_uxn_c_l162_c2_ab0a_return_output;

     -- vram_value_MUX[uxn_c_l162_c2_ab0a] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l162_c2_ab0a_cond <= VAR_vram_value_MUX_uxn_c_l162_c2_ab0a_cond;
     vram_value_MUX_uxn_c_l162_c2_ab0a_iftrue <= VAR_vram_value_MUX_uxn_c_l162_c2_ab0a_iftrue;
     vram_value_MUX_uxn_c_l162_c2_ab0a_iffalse <= VAR_vram_value_MUX_uxn_c_l162_c2_ab0a_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l162_c2_ab0a_return_output := vram_value_MUX_uxn_c_l162_c2_ab0a_return_output;

     -- ram_write_value_MUX[uxn_c_l162_c2_ab0a] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l162_c2_ab0a_cond <= VAR_ram_write_value_MUX_uxn_c_l162_c2_ab0a_cond;
     ram_write_value_MUX_uxn_c_l162_c2_ab0a_iftrue <= VAR_ram_write_value_MUX_uxn_c_l162_c2_ab0a_iftrue;
     ram_write_value_MUX_uxn_c_l162_c2_ab0a_iffalse <= VAR_ram_write_value_MUX_uxn_c_l162_c2_ab0a_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l162_c2_ab0a_return_output := ram_write_value_MUX_uxn_c_l162_c2_ab0a_return_output;

     -- ram_address_MUX[uxn_c_l162_c2_ab0a] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l162_c2_ab0a_cond <= VAR_ram_address_MUX_uxn_c_l162_c2_ab0a_cond;
     ram_address_MUX_uxn_c_l162_c2_ab0a_iftrue <= VAR_ram_address_MUX_uxn_c_l162_c2_ab0a_iftrue;
     ram_address_MUX_uxn_c_l162_c2_ab0a_iffalse <= VAR_ram_address_MUX_uxn_c_l162_c2_ab0a_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l162_c2_ab0a_return_output := ram_address_MUX_uxn_c_l162_c2_ab0a_return_output;

     -- is_ram_write_MUX[uxn_c_l162_c2_ab0a] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l162_c2_ab0a_cond <= VAR_is_ram_write_MUX_uxn_c_l162_c2_ab0a_cond;
     is_ram_write_MUX_uxn_c_l162_c2_ab0a_iftrue <= VAR_is_ram_write_MUX_uxn_c_l162_c2_ab0a_iftrue;
     is_ram_write_MUX_uxn_c_l162_c2_ab0a_iffalse <= VAR_is_ram_write_MUX_uxn_c_l162_c2_ab0a_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l162_c2_ab0a_return_output := is_ram_write_MUX_uxn_c_l162_c2_ab0a_return_output;

     -- is_booted_MUX[uxn_c_l162_c2_ab0a] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l162_c2_ab0a_cond <= VAR_is_booted_MUX_uxn_c_l162_c2_ab0a_cond;
     is_booted_MUX_uxn_c_l162_c2_ab0a_iftrue <= VAR_is_booted_MUX_uxn_c_l162_c2_ab0a_iftrue;
     is_booted_MUX_uxn_c_l162_c2_ab0a_iffalse <= VAR_is_booted_MUX_uxn_c_l162_c2_ab0a_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l162_c2_ab0a_return_output := is_booted_MUX_uxn_c_l162_c2_ab0a_return_output;

     -- vram_address_MUX[uxn_c_l162_c2_ab0a] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l162_c2_ab0a_cond <= VAR_vram_address_MUX_uxn_c_l162_c2_ab0a_cond;
     vram_address_MUX_uxn_c_l162_c2_ab0a_iftrue <= VAR_vram_address_MUX_uxn_c_l162_c2_ab0a_iftrue;
     vram_address_MUX_uxn_c_l162_c2_ab0a_iffalse <= VAR_vram_address_MUX_uxn_c_l162_c2_ab0a_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l162_c2_ab0a_return_output := vram_address_MUX_uxn_c_l162_c2_ab0a_return_output;

     -- Submodule level 4
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l162_c2_ab0a_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l162_c2_ab0a_return_output;
     VAR_main_ram_update_uxn_c_l178_c19_a829_write_enable := VAR_is_ram_write_MUX_uxn_c_l162_c2_ab0a_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l162_c2_ab0a_return_output;
     VAR_step_gpu_uxn_c_l184_c32_6ac4_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l162_c2_ab0a_return_output;
     VAR_main_ram_update_uxn_c_l178_c19_a829_ram_address := VAR_ram_address_MUX_uxn_c_l162_c2_ab0a_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l162_c2_ab0a_return_output;
     VAR_main_ram_update_uxn_c_l178_c19_a829_value := VAR_ram_write_value_MUX_uxn_c_l162_c2_ab0a_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l162_c2_ab0a_return_output;
     VAR_step_gpu_uxn_c_l184_c32_6ac4_vram_address := VAR_vram_address_MUX_uxn_c_l162_c2_ab0a_return_output;
     REG_VAR_vram_address := VAR_vram_address_MUX_uxn_c_l162_c2_ab0a_return_output;
     VAR_step_gpu_uxn_c_l184_c32_6ac4_vram_value := VAR_vram_value_MUX_uxn_c_l162_c2_ab0a_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l162_c2_ab0a_return_output;
     -- step_gpu[uxn_c_l184_c32_6ac4] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l184_c32_6ac4_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l184_c32_6ac4_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l184_c32_6ac4_is_active_drawing_area <= VAR_step_gpu_uxn_c_l184_c32_6ac4_is_active_drawing_area;
     step_gpu_uxn_c_l184_c32_6ac4_is_vram_write <= VAR_step_gpu_uxn_c_l184_c32_6ac4_is_vram_write;
     step_gpu_uxn_c_l184_c32_6ac4_vram_address <= VAR_step_gpu_uxn_c_l184_c32_6ac4_vram_address;
     step_gpu_uxn_c_l184_c32_6ac4_vram_value <= VAR_step_gpu_uxn_c_l184_c32_6ac4_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l184_c32_6ac4_return_output := step_gpu_uxn_c_l184_c32_6ac4_return_output;

     -- main_ram_update[uxn_c_l178_c19_a829] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l178_c19_a829_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l178_c19_a829_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l178_c19_a829_ram_address <= VAR_main_ram_update_uxn_c_l178_c19_a829_ram_address;
     main_ram_update_uxn_c_l178_c19_a829_value <= VAR_main_ram_update_uxn_c_l178_c19_a829_value;
     main_ram_update_uxn_c_l178_c19_a829_write_enable <= VAR_main_ram_update_uxn_c_l178_c19_a829_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l178_c19_a829_return_output := main_ram_update_uxn_c_l178_c19_a829_return_output;

     -- Submodule level 5
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l178_c19_a829_return_output;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_var_dim_0 := VAR_step_gpu_uxn_c_l184_c32_6ac4_return_output;
     REG_VAR_current_pixel_palette_color := VAR_step_gpu_uxn_c_l184_c32_6ac4_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l185_c31_d26b] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_return_output;

     -- Submodule level 6
     -- CAST_TO_uint16_t[uxn_c_l185_c20_d356] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_c_l185_c20_d356_return_output := CAST_TO_uint16_t_uint12_t(
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l185_c31_d26b_return_output);

     -- Submodule level 7
     VAR_return_output := VAR_CAST_TO_uint16_t_uxn_c_l185_c20_d356_return_output;
     REG_VAR_uxn_eval_result := VAR_CAST_TO_uint16_t_uxn_c_l185_c20_d356_return_output;
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
     vram_address <= REG_COMB_vram_address;
     vram_value <= REG_COMB_vram_value;
 end if;
 end if;
end process;

end arch;
