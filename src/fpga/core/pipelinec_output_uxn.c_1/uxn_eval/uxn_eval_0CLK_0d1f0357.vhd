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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 32
entity uxn_eval_0CLK_0d1f0357 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_0d1f0357;
architecture arch of uxn_eval_0CLK_0d1f0357 is
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
signal is_active_fill : unsigned(0 downto 0) := to_unsigned(0, 1);
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
signal REG_COMB_is_active_fill : unsigned(0 downto 0);
signal REG_COMB_is_ram_write : unsigned(0 downto 0);
signal REG_COMB_ram_address : unsigned(15 downto 0);
signal REG_COMB_ram_write_value : unsigned(7 downto 0);
signal REG_COMB_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_is_vram_write : unsigned(0 downto 0);
signal REG_COMB_vram_write_layer : unsigned(0 downto 0);
signal REG_COMB_vram_address : unsigned(31 downto 0);
signal REG_COMB_vram_value : unsigned(1 downto 0);

-- Each function instance gets signals
-- CONST_SR_12[uxn_c_l213_c15_7dab]
signal CONST_SR_12_uxn_c_l213_c15_7dab_x : unsigned(15 downto 0);
signal CONST_SR_12_uxn_c_l213_c15_7dab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l217_c6_012d]
signal BIN_OP_EQ_uxn_c_l217_c6_012d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l217_c6_012d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l217_c6_012d_return_output : unsigned(0 downto 0);

-- is_active_drawing_area_MUX[uxn_c_l217_c2_2a62]
signal is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_cond : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_iftrue : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_iffalse : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_return_output : unsigned(0 downto 0);

-- CONST_SR_2[uxn_c_l218_c28_eb4f]
signal CONST_SR_2_uxn_c_l218_c28_eb4f_x : unsigned(15 downto 0);
signal CONST_SR_2_uxn_c_l218_c28_eb4f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l218_c28_ac20]
signal BIN_OP_AND_uxn_c_l218_c28_ac20_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l218_c28_ac20_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l218_c28_ac20_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l221_c7_4e46]
signal UNARY_OP_NOT_uxn_c_l221_c7_4e46_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l221_c1_e07c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l227_c9_ee6c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l221_c2_6c33]
signal ram_write_value_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l221_c2_6c33]
signal is_ram_write_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(0 downto 0);

-- is_booted_MUX[uxn_c_l221_c2_6c33]
signal is_booted_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l221_c2_6c33]
signal is_vram_write_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(0 downto 0);

-- vram_write_layer_MUX[uxn_c_l221_c2_6c33]
signal vram_write_layer_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l221_c2_6c33]
signal ram_address_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(15 downto 0);

-- vram_value_MUX[uxn_c_l221_c2_6c33]
signal vram_value_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(1 downto 0);

-- vram_address_MUX[uxn_c_l221_c2_6c33]
signal vram_address_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(31 downto 0);

-- step_boot[uxn_c_l222_c41_c60f]
signal step_boot_uxn_c_l222_c41_c60f_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_boot_uxn_c_l222_c41_c60f_return_output : boot_step_result_t;

-- UNARY_OP_NOT[uxn_c_l227_c14_0e63]
signal UNARY_OP_NOT_uxn_c_l227_c14_0e63_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l227_c14_0e63_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l227_c1_d515]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l227_c9_ee6c]
signal ram_write_value_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l227_c9_ee6c]
signal is_ram_write_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l227_c9_ee6c]
signal is_vram_write_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(0 downto 0);

-- vram_write_layer_MUX[uxn_c_l227_c9_ee6c]
signal vram_write_layer_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l227_c9_ee6c]
signal ram_address_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(15 downto 0);

-- vram_value_MUX[uxn_c_l227_c9_ee6c]
signal vram_value_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(1 downto 0);

-- vram_address_MUX[uxn_c_l227_c9_ee6c]
signal vram_address_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(31 downto 0);

-- step_cpu[uxn_c_l228_c39_fdd4]
signal step_cpu_uxn_c_l228_c39_fdd4_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l228_c39_fdd4_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l228_c39_fdd4_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l238_c19_013c]
signal main_ram_update_uxn_c_l238_c19_013c_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l238_c19_013c_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l238_c19_013c_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l238_c19_013c_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l238_c19_013c_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l244_c38_5310]
signal step_gpu_uxn_c_l244_c38_5310_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l244_c38_5310_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l244_c38_5310_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l244_c38_5310_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l244_c38_5310_vram_address : unsigned(31 downto 0);
signal step_gpu_uxn_c_l244_c38_5310_vram_value : unsigned(1 downto 0);
signal step_gpu_uxn_c_l244_c38_5310_return_output : gpu_step_result_t;

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l246_c31_9a32]
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_ref_toks_0 : uint12_t_4;
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_var_dim_0 : unsigned(1 downto 0);
signal VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_return_output : unsigned(11 downto 0);

-- BIN_OP_PLUS[uxn_c_l247_c2_313c]
signal BIN_OP_PLUS_uxn_c_l247_c2_313c_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l247_c2_313c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l247_c2_313c_return_output : unsigned(32 downto 0);

function CAST_TO_uint16_t_uint12_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(11 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_12_uxn_c_l213_c15_7dab
CONST_SR_12_uxn_c_l213_c15_7dab : entity work.CONST_SR_12_uint16_t_0CLK_de264c78 port map (
CONST_SR_12_uxn_c_l213_c15_7dab_x,
CONST_SR_12_uxn_c_l213_c15_7dab_return_output);

-- BIN_OP_EQ_uxn_c_l217_c6_012d
BIN_OP_EQ_uxn_c_l217_c6_012d : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l217_c6_012d_left,
BIN_OP_EQ_uxn_c_l217_c6_012d_right,
BIN_OP_EQ_uxn_c_l217_c6_012d_return_output);

-- is_active_drawing_area_MUX_uxn_c_l217_c2_2a62
is_active_drawing_area_MUX_uxn_c_l217_c2_2a62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_cond,
is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_iftrue,
is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_iffalse,
is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_return_output);

-- CONST_SR_2_uxn_c_l218_c28_eb4f
CONST_SR_2_uxn_c_l218_c28_eb4f : entity work.CONST_SR_2_uint16_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l218_c28_eb4f_x,
CONST_SR_2_uxn_c_l218_c28_eb4f_return_output);

-- BIN_OP_AND_uxn_c_l218_c28_ac20
BIN_OP_AND_uxn_c_l218_c28_ac20 : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l218_c28_ac20_left,
BIN_OP_AND_uxn_c_l218_c28_ac20_right,
BIN_OP_AND_uxn_c_l218_c28_ac20_return_output);

-- UNARY_OP_NOT_uxn_c_l221_c7_4e46
UNARY_OP_NOT_uxn_c_l221_c7_4e46 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l221_c7_4e46_expr,
UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c
TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c
FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_return_output);

-- ram_write_value_MUX_uxn_c_l221_c2_6c33
ram_write_value_MUX_uxn_c_l221_c2_6c33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l221_c2_6c33_cond,
ram_write_value_MUX_uxn_c_l221_c2_6c33_iftrue,
ram_write_value_MUX_uxn_c_l221_c2_6c33_iffalse,
ram_write_value_MUX_uxn_c_l221_c2_6c33_return_output);

-- is_ram_write_MUX_uxn_c_l221_c2_6c33
is_ram_write_MUX_uxn_c_l221_c2_6c33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l221_c2_6c33_cond,
is_ram_write_MUX_uxn_c_l221_c2_6c33_iftrue,
is_ram_write_MUX_uxn_c_l221_c2_6c33_iffalse,
is_ram_write_MUX_uxn_c_l221_c2_6c33_return_output);

-- is_booted_MUX_uxn_c_l221_c2_6c33
is_booted_MUX_uxn_c_l221_c2_6c33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l221_c2_6c33_cond,
is_booted_MUX_uxn_c_l221_c2_6c33_iftrue,
is_booted_MUX_uxn_c_l221_c2_6c33_iffalse,
is_booted_MUX_uxn_c_l221_c2_6c33_return_output);

-- is_vram_write_MUX_uxn_c_l221_c2_6c33
is_vram_write_MUX_uxn_c_l221_c2_6c33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l221_c2_6c33_cond,
is_vram_write_MUX_uxn_c_l221_c2_6c33_iftrue,
is_vram_write_MUX_uxn_c_l221_c2_6c33_iffalse,
is_vram_write_MUX_uxn_c_l221_c2_6c33_return_output);

-- vram_write_layer_MUX_uxn_c_l221_c2_6c33
vram_write_layer_MUX_uxn_c_l221_c2_6c33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l221_c2_6c33_cond,
vram_write_layer_MUX_uxn_c_l221_c2_6c33_iftrue,
vram_write_layer_MUX_uxn_c_l221_c2_6c33_iffalse,
vram_write_layer_MUX_uxn_c_l221_c2_6c33_return_output);

-- ram_address_MUX_uxn_c_l221_c2_6c33
ram_address_MUX_uxn_c_l221_c2_6c33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l221_c2_6c33_cond,
ram_address_MUX_uxn_c_l221_c2_6c33_iftrue,
ram_address_MUX_uxn_c_l221_c2_6c33_iffalse,
ram_address_MUX_uxn_c_l221_c2_6c33_return_output);

-- vram_value_MUX_uxn_c_l221_c2_6c33
vram_value_MUX_uxn_c_l221_c2_6c33 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l221_c2_6c33_cond,
vram_value_MUX_uxn_c_l221_c2_6c33_iftrue,
vram_value_MUX_uxn_c_l221_c2_6c33_iffalse,
vram_value_MUX_uxn_c_l221_c2_6c33_return_output);

-- vram_address_MUX_uxn_c_l221_c2_6c33
vram_address_MUX_uxn_c_l221_c2_6c33 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l221_c2_6c33_cond,
vram_address_MUX_uxn_c_l221_c2_6c33_iftrue,
vram_address_MUX_uxn_c_l221_c2_6c33_iffalse,
vram_address_MUX_uxn_c_l221_c2_6c33_return_output);

-- step_boot_uxn_c_l222_c41_c60f
step_boot_uxn_c_l222_c41_c60f : entity work.step_boot_0CLK_3197952a port map (
clk,
step_boot_uxn_c_l222_c41_c60f_CLOCK_ENABLE,
step_boot_uxn_c_l222_c41_c60f_return_output);

-- UNARY_OP_NOT_uxn_c_l227_c14_0e63
UNARY_OP_NOT_uxn_c_l227_c14_0e63 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l227_c14_0e63_expr,
UNARY_OP_NOT_uxn_c_l227_c14_0e63_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515
TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_return_output);

-- ram_write_value_MUX_uxn_c_l227_c9_ee6c
ram_write_value_MUX_uxn_c_l227_c9_ee6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l227_c9_ee6c_cond,
ram_write_value_MUX_uxn_c_l227_c9_ee6c_iftrue,
ram_write_value_MUX_uxn_c_l227_c9_ee6c_iffalse,
ram_write_value_MUX_uxn_c_l227_c9_ee6c_return_output);

-- is_ram_write_MUX_uxn_c_l227_c9_ee6c
is_ram_write_MUX_uxn_c_l227_c9_ee6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l227_c9_ee6c_cond,
is_ram_write_MUX_uxn_c_l227_c9_ee6c_iftrue,
is_ram_write_MUX_uxn_c_l227_c9_ee6c_iffalse,
is_ram_write_MUX_uxn_c_l227_c9_ee6c_return_output);

-- is_vram_write_MUX_uxn_c_l227_c9_ee6c
is_vram_write_MUX_uxn_c_l227_c9_ee6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l227_c9_ee6c_cond,
is_vram_write_MUX_uxn_c_l227_c9_ee6c_iftrue,
is_vram_write_MUX_uxn_c_l227_c9_ee6c_iffalse,
is_vram_write_MUX_uxn_c_l227_c9_ee6c_return_output);

-- vram_write_layer_MUX_uxn_c_l227_c9_ee6c
vram_write_layer_MUX_uxn_c_l227_c9_ee6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l227_c9_ee6c_cond,
vram_write_layer_MUX_uxn_c_l227_c9_ee6c_iftrue,
vram_write_layer_MUX_uxn_c_l227_c9_ee6c_iffalse,
vram_write_layer_MUX_uxn_c_l227_c9_ee6c_return_output);

-- ram_address_MUX_uxn_c_l227_c9_ee6c
ram_address_MUX_uxn_c_l227_c9_ee6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l227_c9_ee6c_cond,
ram_address_MUX_uxn_c_l227_c9_ee6c_iftrue,
ram_address_MUX_uxn_c_l227_c9_ee6c_iffalse,
ram_address_MUX_uxn_c_l227_c9_ee6c_return_output);

-- vram_value_MUX_uxn_c_l227_c9_ee6c
vram_value_MUX_uxn_c_l227_c9_ee6c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l227_c9_ee6c_cond,
vram_value_MUX_uxn_c_l227_c9_ee6c_iftrue,
vram_value_MUX_uxn_c_l227_c9_ee6c_iffalse,
vram_value_MUX_uxn_c_l227_c9_ee6c_return_output);

-- vram_address_MUX_uxn_c_l227_c9_ee6c
vram_address_MUX_uxn_c_l227_c9_ee6c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l227_c9_ee6c_cond,
vram_address_MUX_uxn_c_l227_c9_ee6c_iftrue,
vram_address_MUX_uxn_c_l227_c9_ee6c_iffalse,
vram_address_MUX_uxn_c_l227_c9_ee6c_return_output);

-- step_cpu_uxn_c_l228_c39_fdd4
step_cpu_uxn_c_l228_c39_fdd4 : entity work.step_cpu_0CLK_9ae23c9e port map (
clk,
step_cpu_uxn_c_l228_c39_fdd4_CLOCK_ENABLE,
step_cpu_uxn_c_l228_c39_fdd4_ram_read_value,
step_cpu_uxn_c_l228_c39_fdd4_return_output);

-- main_ram_update_uxn_c_l238_c19_013c
main_ram_update_uxn_c_l238_c19_013c : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l238_c19_013c_CLOCK_ENABLE,
main_ram_update_uxn_c_l238_c19_013c_ram_address,
main_ram_update_uxn_c_l238_c19_013c_value,
main_ram_update_uxn_c_l238_c19_013c_write_enable,
main_ram_update_uxn_c_l238_c19_013c_return_output);

-- step_gpu_uxn_c_l244_c38_5310
step_gpu_uxn_c_l244_c38_5310 : entity work.step_gpu_0CLK_30c03e9e port map (
clk,
step_gpu_uxn_c_l244_c38_5310_CLOCK_ENABLE,
step_gpu_uxn_c_l244_c38_5310_is_active_drawing_area,
step_gpu_uxn_c_l244_c38_5310_is_vram_write,
step_gpu_uxn_c_l244_c38_5310_vram_write_layer,
step_gpu_uxn_c_l244_c38_5310_vram_address,
step_gpu_uxn_c_l244_c38_5310_vram_value,
step_gpu_uxn_c_l244_c38_5310_return_output);

-- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32 : entity work.VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 port map (
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_ref_toks_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_var_dim_0,
VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_return_output);

-- BIN_OP_PLUS_uxn_c_l247_c2_313c
BIN_OP_PLUS_uxn_c_l247_c2_313c : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l247_c2_313c_left,
BIN_OP_PLUS_uxn_c_l247_c2_313c_right,
BIN_OP_PLUS_uxn_c_l247_c2_313c_return_output);



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
 is_active_fill,
 is_ram_write,
 ram_address,
 ram_write_value,
 ram_read_value,
 is_vram_write,
 vram_write_layer,
 vram_address,
 vram_value,
 -- All submodule outputs
 CONST_SR_12_uxn_c_l213_c15_7dab_return_output,
 BIN_OP_EQ_uxn_c_l217_c6_012d_return_output,
 is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_return_output,
 CONST_SR_2_uxn_c_l218_c28_eb4f_return_output,
 BIN_OP_AND_uxn_c_l218_c28_ac20_return_output,
 UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_return_output,
 ram_write_value_MUX_uxn_c_l221_c2_6c33_return_output,
 is_ram_write_MUX_uxn_c_l221_c2_6c33_return_output,
 is_booted_MUX_uxn_c_l221_c2_6c33_return_output,
 is_vram_write_MUX_uxn_c_l221_c2_6c33_return_output,
 vram_write_layer_MUX_uxn_c_l221_c2_6c33_return_output,
 ram_address_MUX_uxn_c_l221_c2_6c33_return_output,
 vram_value_MUX_uxn_c_l221_c2_6c33_return_output,
 vram_address_MUX_uxn_c_l221_c2_6c33_return_output,
 step_boot_uxn_c_l222_c41_c60f_return_output,
 UNARY_OP_NOT_uxn_c_l227_c14_0e63_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_return_output,
 ram_write_value_MUX_uxn_c_l227_c9_ee6c_return_output,
 is_ram_write_MUX_uxn_c_l227_c9_ee6c_return_output,
 is_vram_write_MUX_uxn_c_l227_c9_ee6c_return_output,
 vram_write_layer_MUX_uxn_c_l227_c9_ee6c_return_output,
 ram_address_MUX_uxn_c_l227_c9_ee6c_return_output,
 vram_value_MUX_uxn_c_l227_c9_ee6c_return_output,
 vram_address_MUX_uxn_c_l227_c9_ee6c_return_output,
 step_cpu_uxn_c_l228_c39_fdd4_return_output,
 main_ram_update_uxn_c_l238_c19_013c_return_output,
 step_gpu_uxn_c_l244_c38_5310_return_output,
 VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_return_output,
 BIN_OP_PLUS_uxn_c_l247_c2_313c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_input_code_uxn_c_l213_c2_f6a4 : unsigned(3 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l213_c15_7dab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l213_c15_7dab_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l217_c6_012d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l217_c6_012d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l217_c6_012d_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_iftrue : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_uxn_c_l218_c3_1e25 : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_iffalse : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c28_ac20_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l218_c28_eb4f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l218_c28_eb4f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c28_ac20_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l218_c28_ac20_return_output : unsigned(15 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l221_c2_6c33_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l221_c2_6c33_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l227_c9_ee6c_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l221_c2_6c33_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l221_c2_6c33_cond : unsigned(0 downto 0);
 variable VAR_boot_step_result : boot_step_result_t;
 variable VAR_step_boot_uxn_c_l222_c41_c60f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_boot_uxn_c_l222_c41_c60f_return_output : boot_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l223_c18_7374_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l224_c17_fb1b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l225_c21_9562_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l226_c15_98ea_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l227_c14_0e63_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l227_c14_0e63_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_iffalse : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l227_c9_ee6c_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l227_c9_ee6c_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l227_c9_ee6c_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result : cpu_step_result_t;
 variable VAR_step_cpu_uxn_c_l228_c39_fdd4_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l228_c39_fdd4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l228_c39_fdd4_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l229_c18_def1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l230_c17_ab10_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l231_c21_fedb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l232_c19_40c6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l233_c22_0004_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l234_c18_b305_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l235_c16_7696_return_output : unsigned(1 downto 0);
 variable VAR_main_ram_update_uxn_c_l238_c19_013c_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l238_c19_013c_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l238_c19_013c_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l238_c19_013c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l238_c19_013c_return_output : unsigned(7 downto 0);
 variable VAR_gpu_step_result : gpu_step_result_t;
 variable VAR_step_gpu_uxn_c_l244_c38_5310_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l244_c38_5310_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l244_c38_5310_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l244_c38_5310_vram_address : unsigned(31 downto 0);
 variable VAR_step_gpu_uxn_c_l244_c38_5310_vram_value : unsigned(1 downto 0);
 variable VAR_step_gpu_uxn_c_l244_c38_5310_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l244_c38_5310_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l245_c19_588a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l246_c52_a8d7_return_output : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_var_dim_0 : unsigned(1 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_return_output : unsigned(11 downto 0);
 variable VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_ref_toks_0 : uint12_t_4;
 variable VAR_CAST_TO_uint16_t_uxn_c_l246_c20_f135_return_output : unsigned(15 downto 0);
 variable VAR_main_clock_cycle_uxn_c_l247_c2_e62a : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l247_c2_313c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l247_c2_313c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l247_c2_313c_return_output : unsigned(32 downto 0);
 -- State registers comb logic variables
variable REG_VAR_main_clock_cycle : unsigned(31 downto 0);
variable REG_VAR_input_code : unsigned(3 downto 0);
variable REG_VAR_palette_color_values : uint12_t_4;
variable REG_VAR_uxn_eval_result : unsigned(15 downto 0);
variable REG_VAR_current_pixel_palette_color : unsigned(1 downto 0);
variable REG_VAR_is_active_drawing_area : unsigned(0 downto 0);
variable REG_VAR_is_booted : unsigned(0 downto 0);
variable REG_VAR_is_active_fill : unsigned(0 downto 0);
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
  REG_VAR_is_active_fill := is_active_fill;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l247_c2_313c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l217_c6_012d_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l218_c28_ac20_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_iftrue := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l238_c19_013c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l244_c38_5310_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     REG_VAR_current_pixel_palette_color := current_pixel_palette_color;
     VAR_CONST_SR_12_uxn_c_l213_c15_7dab_x := VAR_input;
     VAR_CONST_SR_2_uxn_c_l218_c28_eb4f_x := VAR_input;
     VAR_is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_iffalse := is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l227_c14_0e63_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l221_c2_6c33_iffalse := is_booted;
     VAR_is_ram_write_MUX_uxn_c_l227_c9_ee6c_iffalse := is_ram_write;
     VAR_is_vram_write_MUX_uxn_c_l221_c2_6c33_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l227_c9_ee6c_iffalse := is_vram_write;
     VAR_BIN_OP_PLUS_uxn_c_l247_c2_313c_left := main_clock_cycle;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_ref_toks_0 := palette_color_values;
     REG_VAR_palette_color_values := palette_color_values;
     VAR_ram_address_MUX_uxn_c_l227_c9_ee6c_iffalse := ram_address;
     VAR_step_cpu_uxn_c_l228_c39_fdd4_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l227_c9_ee6c_iffalse := ram_write_value;
     VAR_vram_address_MUX_uxn_c_l221_c2_6c33_iftrue := vram_address;
     VAR_vram_address_MUX_uxn_c_l227_c9_ee6c_iffalse := vram_address;
     VAR_vram_value_MUX_uxn_c_l221_c2_6c33_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l227_c9_ee6c_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l221_c2_6c33_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l227_c9_ee6c_iffalse := vram_write_layer;
     -- BIN_OP_PLUS[uxn_c_l247_c2_313c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l247_c2_313c_left <= VAR_BIN_OP_PLUS_uxn_c_l247_c2_313c_left;
     BIN_OP_PLUS_uxn_c_l247_c2_313c_right <= VAR_BIN_OP_PLUS_uxn_c_l247_c2_313c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l247_c2_313c_return_output := BIN_OP_PLUS_uxn_c_l247_c2_313c_return_output;

     -- CONST_SR_2[uxn_c_l218_c28_eb4f] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l218_c28_eb4f_x <= VAR_CONST_SR_2_uxn_c_l218_c28_eb4f_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l218_c28_eb4f_return_output := CONST_SR_2_uxn_c_l218_c28_eb4f_return_output;

     -- UNARY_OP_NOT[uxn_c_l227_c14_0e63] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l227_c14_0e63_expr <= VAR_UNARY_OP_NOT_uxn_c_l227_c14_0e63_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l227_c14_0e63_return_output := UNARY_OP_NOT_uxn_c_l227_c14_0e63_return_output;

     -- CONST_SR_12[uxn_c_l213_c15_7dab] LATENCY=0
     -- Inputs
     CONST_SR_12_uxn_c_l213_c15_7dab_x <= VAR_CONST_SR_12_uxn_c_l213_c15_7dab_x;
     -- Outputs
     VAR_CONST_SR_12_uxn_c_l213_c15_7dab_return_output := CONST_SR_12_uxn_c_l213_c15_7dab_return_output;

     -- UNARY_OP_NOT[uxn_c_l221_c7_4e46] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l221_c7_4e46_expr <= VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output := UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output;

     -- Submodule level 1
     VAR_main_clock_cycle_uxn_c_l247_c2_e62a := resize(VAR_BIN_OP_PLUS_uxn_c_l247_c2_313c_return_output, 32);
     VAR_input_code_uxn_c_l213_c2_f6a4 := resize(VAR_CONST_SR_12_uxn_c_l213_c15_7dab_return_output, 4);
     VAR_BIN_OP_AND_uxn_c_l218_c28_ac20_left := VAR_CONST_SR_2_uxn_c_l218_c28_eb4f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_cond := VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_cond := VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output;
     VAR_is_booted_MUX_uxn_c_l221_c2_6c33_cond := VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output;
     VAR_is_ram_write_MUX_uxn_c_l221_c2_6c33_cond := VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output;
     VAR_is_vram_write_MUX_uxn_c_l221_c2_6c33_cond := VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output;
     VAR_ram_address_MUX_uxn_c_l221_c2_6c33_cond := VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output;
     VAR_ram_write_value_MUX_uxn_c_l221_c2_6c33_cond := VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output;
     VAR_vram_address_MUX_uxn_c_l221_c2_6c33_cond := VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output;
     VAR_vram_value_MUX_uxn_c_l221_c2_6c33_cond := VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l221_c2_6c33_cond := VAR_UNARY_OP_NOT_uxn_c_l221_c7_4e46_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_cond := VAR_UNARY_OP_NOT_uxn_c_l227_c14_0e63_return_output;
     VAR_is_ram_write_MUX_uxn_c_l227_c9_ee6c_cond := VAR_UNARY_OP_NOT_uxn_c_l227_c14_0e63_return_output;
     VAR_is_vram_write_MUX_uxn_c_l227_c9_ee6c_cond := VAR_UNARY_OP_NOT_uxn_c_l227_c14_0e63_return_output;
     VAR_ram_address_MUX_uxn_c_l227_c9_ee6c_cond := VAR_UNARY_OP_NOT_uxn_c_l227_c14_0e63_return_output;
     VAR_ram_write_value_MUX_uxn_c_l227_c9_ee6c_cond := VAR_UNARY_OP_NOT_uxn_c_l227_c14_0e63_return_output;
     VAR_vram_address_MUX_uxn_c_l227_c9_ee6c_cond := VAR_UNARY_OP_NOT_uxn_c_l227_c14_0e63_return_output;
     VAR_vram_value_MUX_uxn_c_l227_c9_ee6c_cond := VAR_UNARY_OP_NOT_uxn_c_l227_c14_0e63_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l227_c9_ee6c_cond := VAR_UNARY_OP_NOT_uxn_c_l227_c14_0e63_return_output;
     VAR_BIN_OP_EQ_uxn_c_l217_c6_012d_left := VAR_input_code_uxn_c_l213_c2_f6a4;
     REG_VAR_input_code := VAR_input_code_uxn_c_l213_c2_f6a4;
     REG_VAR_main_clock_cycle := VAR_main_clock_cycle_uxn_c_l247_c2_e62a;
     -- BIN_OP_AND[uxn_c_l218_c28_ac20] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l218_c28_ac20_left <= VAR_BIN_OP_AND_uxn_c_l218_c28_ac20_left;
     BIN_OP_AND_uxn_c_l218_c28_ac20_right <= VAR_BIN_OP_AND_uxn_c_l218_c28_ac20_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l218_c28_ac20_return_output := BIN_OP_AND_uxn_c_l218_c28_ac20_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l221_c1_e07c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l227_c9_ee6c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_return_output;

     -- BIN_OP_EQ[uxn_c_l217_c6_012d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l217_c6_012d_left <= VAR_BIN_OP_EQ_uxn_c_l217_c6_012d_left;
     BIN_OP_EQ_uxn_c_l217_c6_012d_right <= VAR_BIN_OP_EQ_uxn_c_l217_c6_012d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l217_c6_012d_return_output := BIN_OP_EQ_uxn_c_l217_c6_012d_return_output;

     -- Submodule level 2
     VAR_is_active_drawing_area_uxn_c_l218_c3_1e25 := resize(VAR_BIN_OP_AND_uxn_c_l218_c28_ac20_return_output, 1);
     VAR_is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_cond := VAR_BIN_OP_EQ_uxn_c_l217_c6_012d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l227_c9_ee6c_return_output;
     VAR_step_boot_uxn_c_l222_c41_c60f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l221_c1_e07c_return_output;
     VAR_is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_iftrue := VAR_is_active_drawing_area_uxn_c_l218_c3_1e25;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l227_c1_d515] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_return_output;

     -- step_boot[uxn_c_l222_c41_c60f] LATENCY=0
     -- Clock enable
     step_boot_uxn_c_l222_c41_c60f_CLOCK_ENABLE <= VAR_step_boot_uxn_c_l222_c41_c60f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_step_boot_uxn_c_l222_c41_c60f_return_output := step_boot_uxn_c_l222_c41_c60f_return_output;

     -- is_active_drawing_area_MUX[uxn_c_l217_c2_2a62] LATENCY=0
     -- Inputs
     is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_cond <= VAR_is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_cond;
     is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_iftrue <= VAR_is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_iftrue;
     is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_iffalse <= VAR_is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_iffalse;
     -- Outputs
     VAR_is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_return_output := is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_return_output;

     -- Submodule level 3
     VAR_step_cpu_uxn_c_l228_c39_fdd4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l227_c1_d515_return_output;
     REG_VAR_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_return_output;
     VAR_step_gpu_uxn_c_l244_c38_5310_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l217_c2_2a62_return_output;
     -- CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d[uxn_c_l224_c17_fb1b] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l224_c17_fb1b_return_output := VAR_step_boot_uxn_c_l222_c41_c60f_return_output.ram_address;

     -- step_cpu[uxn_c_l228_c39_fdd4] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l228_c39_fdd4_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l228_c39_fdd4_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l228_c39_fdd4_ram_read_value <= VAR_step_cpu_uxn_c_l228_c39_fdd4_ram_read_value;
     -- Outputs
     VAR_step_cpu_uxn_c_l228_c39_fdd4_return_output := step_cpu_uxn_c_l228_c39_fdd4_return_output;

     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d[uxn_c_l223_c18_7374] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l223_c18_7374_return_output := VAR_step_boot_uxn_c_l222_c41_c60f_return_output.is_valid_byte;

     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d[uxn_c_l226_c15_98ea] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l226_c15_98ea_return_output := VAR_step_boot_uxn_c_l222_c41_c60f_return_output.is_finished;

     -- CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d[uxn_c_l225_c21_9562] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l225_c21_9562_return_output := VAR_step_boot_uxn_c_l222_c41_c60f_return_output.rom_byte;

     -- Submodule level 4
     VAR_ram_address_MUX_uxn_c_l221_c2_6c33_iftrue := VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l224_c17_fb1b_return_output;
     VAR_is_booted_MUX_uxn_c_l221_c2_6c33_iftrue := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l226_c15_98ea_return_output;
     VAR_is_ram_write_MUX_uxn_c_l221_c2_6c33_iftrue := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l223_c18_7374_return_output;
     VAR_ram_write_value_MUX_uxn_c_l221_c2_6c33_iftrue := VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l225_c21_9562_return_output;
     -- CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d[uxn_c_l231_c21_fedb] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l231_c21_fedb_return_output := VAR_step_cpu_uxn_c_l228_c39_fdd4_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l232_c19_40c6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l232_c19_40c6_return_output := VAR_step_cpu_uxn_c_l228_c39_fdd4_return_output.is_vram_write;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d[uxn_c_l230_c17_ab10] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l230_c17_ab10_return_output := VAR_step_cpu_uxn_c_l228_c39_fdd4_return_output.ram_address;

     -- CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d[uxn_c_l234_c18_b305] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l234_c18_b305_return_output := VAR_step_cpu_uxn_c_l228_c39_fdd4_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l233_c22_0004] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l233_c22_0004_return_output := VAR_step_cpu_uxn_c_l228_c39_fdd4_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l229_c18_def1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l229_c18_def1_return_output := VAR_step_cpu_uxn_c_l228_c39_fdd4_return_output.is_ram_write;

     -- CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d[uxn_c_l235_c16_7696] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l235_c16_7696_return_output := VAR_step_cpu_uxn_c_l228_c39_fdd4_return_output.vram_value;

     -- is_booted_MUX[uxn_c_l221_c2_6c33] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l221_c2_6c33_cond <= VAR_is_booted_MUX_uxn_c_l221_c2_6c33_cond;
     is_booted_MUX_uxn_c_l221_c2_6c33_iftrue <= VAR_is_booted_MUX_uxn_c_l221_c2_6c33_iftrue;
     is_booted_MUX_uxn_c_l221_c2_6c33_iffalse <= VAR_is_booted_MUX_uxn_c_l221_c2_6c33_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l221_c2_6c33_return_output := is_booted_MUX_uxn_c_l221_c2_6c33_return_output;

     -- Submodule level 5
     VAR_ram_address_MUX_uxn_c_l227_c9_ee6c_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l230_c17_ab10_return_output;
     VAR_is_ram_write_MUX_uxn_c_l227_c9_ee6c_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l229_c18_def1_return_output;
     VAR_is_vram_write_MUX_uxn_c_l227_c9_ee6c_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l232_c19_40c6_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l227_c9_ee6c_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l233_c22_0004_return_output;
     VAR_vram_value_MUX_uxn_c_l227_c9_ee6c_iftrue := VAR_CONST_REF_RD_uint2_t_cpu_step_result_t_vram_value_d41d_uxn_c_l235_c16_7696_return_output;
     VAR_vram_address_MUX_uxn_c_l227_c9_ee6c_iftrue := VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l234_c18_b305_return_output;
     VAR_ram_write_value_MUX_uxn_c_l227_c9_ee6c_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_ram_value_d41d_uxn_c_l231_c21_fedb_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l221_c2_6c33_return_output;
     -- ram_write_value_MUX[uxn_c_l227_c9_ee6c] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l227_c9_ee6c_cond <= VAR_ram_write_value_MUX_uxn_c_l227_c9_ee6c_cond;
     ram_write_value_MUX_uxn_c_l227_c9_ee6c_iftrue <= VAR_ram_write_value_MUX_uxn_c_l227_c9_ee6c_iftrue;
     ram_write_value_MUX_uxn_c_l227_c9_ee6c_iffalse <= VAR_ram_write_value_MUX_uxn_c_l227_c9_ee6c_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l227_c9_ee6c_return_output := ram_write_value_MUX_uxn_c_l227_c9_ee6c_return_output;

     -- vram_value_MUX[uxn_c_l227_c9_ee6c] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l227_c9_ee6c_cond <= VAR_vram_value_MUX_uxn_c_l227_c9_ee6c_cond;
     vram_value_MUX_uxn_c_l227_c9_ee6c_iftrue <= VAR_vram_value_MUX_uxn_c_l227_c9_ee6c_iftrue;
     vram_value_MUX_uxn_c_l227_c9_ee6c_iffalse <= VAR_vram_value_MUX_uxn_c_l227_c9_ee6c_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l227_c9_ee6c_return_output := vram_value_MUX_uxn_c_l227_c9_ee6c_return_output;

     -- vram_write_layer_MUX[uxn_c_l227_c9_ee6c] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l227_c9_ee6c_cond <= VAR_vram_write_layer_MUX_uxn_c_l227_c9_ee6c_cond;
     vram_write_layer_MUX_uxn_c_l227_c9_ee6c_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l227_c9_ee6c_iftrue;
     vram_write_layer_MUX_uxn_c_l227_c9_ee6c_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l227_c9_ee6c_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l227_c9_ee6c_return_output := vram_write_layer_MUX_uxn_c_l227_c9_ee6c_return_output;

     -- ram_address_MUX[uxn_c_l227_c9_ee6c] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l227_c9_ee6c_cond <= VAR_ram_address_MUX_uxn_c_l227_c9_ee6c_cond;
     ram_address_MUX_uxn_c_l227_c9_ee6c_iftrue <= VAR_ram_address_MUX_uxn_c_l227_c9_ee6c_iftrue;
     ram_address_MUX_uxn_c_l227_c9_ee6c_iffalse <= VAR_ram_address_MUX_uxn_c_l227_c9_ee6c_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l227_c9_ee6c_return_output := ram_address_MUX_uxn_c_l227_c9_ee6c_return_output;

     -- vram_address_MUX[uxn_c_l227_c9_ee6c] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l227_c9_ee6c_cond <= VAR_vram_address_MUX_uxn_c_l227_c9_ee6c_cond;
     vram_address_MUX_uxn_c_l227_c9_ee6c_iftrue <= VAR_vram_address_MUX_uxn_c_l227_c9_ee6c_iftrue;
     vram_address_MUX_uxn_c_l227_c9_ee6c_iffalse <= VAR_vram_address_MUX_uxn_c_l227_c9_ee6c_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l227_c9_ee6c_return_output := vram_address_MUX_uxn_c_l227_c9_ee6c_return_output;

     -- is_vram_write_MUX[uxn_c_l227_c9_ee6c] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l227_c9_ee6c_cond <= VAR_is_vram_write_MUX_uxn_c_l227_c9_ee6c_cond;
     is_vram_write_MUX_uxn_c_l227_c9_ee6c_iftrue <= VAR_is_vram_write_MUX_uxn_c_l227_c9_ee6c_iftrue;
     is_vram_write_MUX_uxn_c_l227_c9_ee6c_iffalse <= VAR_is_vram_write_MUX_uxn_c_l227_c9_ee6c_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l227_c9_ee6c_return_output := is_vram_write_MUX_uxn_c_l227_c9_ee6c_return_output;

     -- is_ram_write_MUX[uxn_c_l227_c9_ee6c] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l227_c9_ee6c_cond <= VAR_is_ram_write_MUX_uxn_c_l227_c9_ee6c_cond;
     is_ram_write_MUX_uxn_c_l227_c9_ee6c_iftrue <= VAR_is_ram_write_MUX_uxn_c_l227_c9_ee6c_iftrue;
     is_ram_write_MUX_uxn_c_l227_c9_ee6c_iffalse <= VAR_is_ram_write_MUX_uxn_c_l227_c9_ee6c_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l227_c9_ee6c_return_output := is_ram_write_MUX_uxn_c_l227_c9_ee6c_return_output;

     -- Submodule level 6
     VAR_is_ram_write_MUX_uxn_c_l221_c2_6c33_iffalse := VAR_is_ram_write_MUX_uxn_c_l227_c9_ee6c_return_output;
     VAR_is_vram_write_MUX_uxn_c_l221_c2_6c33_iffalse := VAR_is_vram_write_MUX_uxn_c_l227_c9_ee6c_return_output;
     VAR_ram_address_MUX_uxn_c_l221_c2_6c33_iffalse := VAR_ram_address_MUX_uxn_c_l227_c9_ee6c_return_output;
     VAR_ram_write_value_MUX_uxn_c_l221_c2_6c33_iffalse := VAR_ram_write_value_MUX_uxn_c_l227_c9_ee6c_return_output;
     VAR_vram_address_MUX_uxn_c_l221_c2_6c33_iffalse := VAR_vram_address_MUX_uxn_c_l227_c9_ee6c_return_output;
     VAR_vram_value_MUX_uxn_c_l221_c2_6c33_iffalse := VAR_vram_value_MUX_uxn_c_l227_c9_ee6c_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l221_c2_6c33_iffalse := VAR_vram_write_layer_MUX_uxn_c_l227_c9_ee6c_return_output;
     -- ram_write_value_MUX[uxn_c_l221_c2_6c33] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l221_c2_6c33_cond <= VAR_ram_write_value_MUX_uxn_c_l221_c2_6c33_cond;
     ram_write_value_MUX_uxn_c_l221_c2_6c33_iftrue <= VAR_ram_write_value_MUX_uxn_c_l221_c2_6c33_iftrue;
     ram_write_value_MUX_uxn_c_l221_c2_6c33_iffalse <= VAR_ram_write_value_MUX_uxn_c_l221_c2_6c33_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l221_c2_6c33_return_output := ram_write_value_MUX_uxn_c_l221_c2_6c33_return_output;

     -- ram_address_MUX[uxn_c_l221_c2_6c33] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l221_c2_6c33_cond <= VAR_ram_address_MUX_uxn_c_l221_c2_6c33_cond;
     ram_address_MUX_uxn_c_l221_c2_6c33_iftrue <= VAR_ram_address_MUX_uxn_c_l221_c2_6c33_iftrue;
     ram_address_MUX_uxn_c_l221_c2_6c33_iffalse <= VAR_ram_address_MUX_uxn_c_l221_c2_6c33_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l221_c2_6c33_return_output := ram_address_MUX_uxn_c_l221_c2_6c33_return_output;

     -- is_vram_write_MUX[uxn_c_l221_c2_6c33] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l221_c2_6c33_cond <= VAR_is_vram_write_MUX_uxn_c_l221_c2_6c33_cond;
     is_vram_write_MUX_uxn_c_l221_c2_6c33_iftrue <= VAR_is_vram_write_MUX_uxn_c_l221_c2_6c33_iftrue;
     is_vram_write_MUX_uxn_c_l221_c2_6c33_iffalse <= VAR_is_vram_write_MUX_uxn_c_l221_c2_6c33_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l221_c2_6c33_return_output := is_vram_write_MUX_uxn_c_l221_c2_6c33_return_output;

     -- vram_write_layer_MUX[uxn_c_l221_c2_6c33] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l221_c2_6c33_cond <= VAR_vram_write_layer_MUX_uxn_c_l221_c2_6c33_cond;
     vram_write_layer_MUX_uxn_c_l221_c2_6c33_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l221_c2_6c33_iftrue;
     vram_write_layer_MUX_uxn_c_l221_c2_6c33_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l221_c2_6c33_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l221_c2_6c33_return_output := vram_write_layer_MUX_uxn_c_l221_c2_6c33_return_output;

     -- is_ram_write_MUX[uxn_c_l221_c2_6c33] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l221_c2_6c33_cond <= VAR_is_ram_write_MUX_uxn_c_l221_c2_6c33_cond;
     is_ram_write_MUX_uxn_c_l221_c2_6c33_iftrue <= VAR_is_ram_write_MUX_uxn_c_l221_c2_6c33_iftrue;
     is_ram_write_MUX_uxn_c_l221_c2_6c33_iffalse <= VAR_is_ram_write_MUX_uxn_c_l221_c2_6c33_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l221_c2_6c33_return_output := is_ram_write_MUX_uxn_c_l221_c2_6c33_return_output;

     -- vram_value_MUX[uxn_c_l221_c2_6c33] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l221_c2_6c33_cond <= VAR_vram_value_MUX_uxn_c_l221_c2_6c33_cond;
     vram_value_MUX_uxn_c_l221_c2_6c33_iftrue <= VAR_vram_value_MUX_uxn_c_l221_c2_6c33_iftrue;
     vram_value_MUX_uxn_c_l221_c2_6c33_iffalse <= VAR_vram_value_MUX_uxn_c_l221_c2_6c33_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l221_c2_6c33_return_output := vram_value_MUX_uxn_c_l221_c2_6c33_return_output;

     -- vram_address_MUX[uxn_c_l221_c2_6c33] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l221_c2_6c33_cond <= VAR_vram_address_MUX_uxn_c_l221_c2_6c33_cond;
     vram_address_MUX_uxn_c_l221_c2_6c33_iftrue <= VAR_vram_address_MUX_uxn_c_l221_c2_6c33_iftrue;
     vram_address_MUX_uxn_c_l221_c2_6c33_iffalse <= VAR_vram_address_MUX_uxn_c_l221_c2_6c33_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l221_c2_6c33_return_output := vram_address_MUX_uxn_c_l221_c2_6c33_return_output;

     -- Submodule level 7
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l221_c2_6c33_return_output;
     VAR_main_ram_update_uxn_c_l238_c19_013c_write_enable := VAR_is_ram_write_MUX_uxn_c_l221_c2_6c33_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l221_c2_6c33_return_output;
     VAR_step_gpu_uxn_c_l244_c38_5310_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l221_c2_6c33_return_output;
     VAR_main_ram_update_uxn_c_l238_c19_013c_ram_address := VAR_ram_address_MUX_uxn_c_l221_c2_6c33_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l221_c2_6c33_return_output;
     VAR_main_ram_update_uxn_c_l238_c19_013c_value := VAR_ram_write_value_MUX_uxn_c_l221_c2_6c33_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l221_c2_6c33_return_output;
     VAR_step_gpu_uxn_c_l244_c38_5310_vram_address := VAR_vram_address_MUX_uxn_c_l221_c2_6c33_return_output;
     REG_VAR_vram_address := VAR_vram_address_MUX_uxn_c_l221_c2_6c33_return_output;
     VAR_step_gpu_uxn_c_l244_c38_5310_vram_value := VAR_vram_value_MUX_uxn_c_l221_c2_6c33_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l221_c2_6c33_return_output;
     VAR_step_gpu_uxn_c_l244_c38_5310_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l221_c2_6c33_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l221_c2_6c33_return_output;
     -- main_ram_update[uxn_c_l238_c19_013c] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l238_c19_013c_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l238_c19_013c_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l238_c19_013c_ram_address <= VAR_main_ram_update_uxn_c_l238_c19_013c_ram_address;
     main_ram_update_uxn_c_l238_c19_013c_value <= VAR_main_ram_update_uxn_c_l238_c19_013c_value;
     main_ram_update_uxn_c_l238_c19_013c_write_enable <= VAR_main_ram_update_uxn_c_l238_c19_013c_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l238_c19_013c_return_output := main_ram_update_uxn_c_l238_c19_013c_return_output;

     -- step_gpu[uxn_c_l244_c38_5310] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l244_c38_5310_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l244_c38_5310_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l244_c38_5310_is_active_drawing_area <= VAR_step_gpu_uxn_c_l244_c38_5310_is_active_drawing_area;
     step_gpu_uxn_c_l244_c38_5310_is_vram_write <= VAR_step_gpu_uxn_c_l244_c38_5310_is_vram_write;
     step_gpu_uxn_c_l244_c38_5310_vram_write_layer <= VAR_step_gpu_uxn_c_l244_c38_5310_vram_write_layer;
     step_gpu_uxn_c_l244_c38_5310_vram_address <= VAR_step_gpu_uxn_c_l244_c38_5310_vram_address;
     step_gpu_uxn_c_l244_c38_5310_vram_value <= VAR_step_gpu_uxn_c_l244_c38_5310_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l244_c38_5310_return_output := step_gpu_uxn_c_l244_c38_5310_return_output;

     -- Submodule level 8
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l238_c19_013c_return_output;
     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l246_c52_a8d7] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l246_c52_a8d7_return_output := VAR_step_gpu_uxn_c_l244_c38_5310_return_output.color;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l245_c19_588a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l245_c19_588a_return_output := VAR_step_gpu_uxn_c_l244_c38_5310_return_output.is_active_fill;

     -- Submodule level 9
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l245_c19_588a_return_output;
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_var_dim_0 := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l246_c52_a8d7_return_output;
     -- VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d[uxn_c_l246_c31_9a32] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_ref_toks_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_ref_toks_0;
     VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_var_dim_0 <= VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_return_output := VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_return_output;

     -- Submodule level 10
     -- CAST_TO_uint16_t[uxn_c_l246_c20_f135] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_c_l246_c20_f135_return_output := CAST_TO_uint16_t_uint12_t(
     VAR_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_uxn_c_l246_c31_9a32_return_output);

     -- Submodule level 11
     VAR_return_output := VAR_CAST_TO_uint16_t_uxn_c_l246_c20_f135_return_output;
     REG_VAR_uxn_eval_result := VAR_CAST_TO_uint16_t_uxn_c_l246_c20_f135_return_output;
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
REG_COMB_is_active_fill <= REG_VAR_is_active_fill;
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
     is_active_fill <= REG_COMB_is_active_fill;
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
