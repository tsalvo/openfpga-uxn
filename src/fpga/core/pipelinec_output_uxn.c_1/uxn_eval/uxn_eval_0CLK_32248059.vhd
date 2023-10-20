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
-- Submodules: 37
entity uxn_eval_0CLK_32248059 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_32248059;
architecture arch of uxn_eval_0CLK_32248059 is
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
signal gpu_step_result : gpu_step_result_t := gpu_step_result_t_NULL;
signal is_active_fill : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_ram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal ram_address : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ram_write_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ram_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_ram_address : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_ram_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal is_device_ram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
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
signal REG_COMB_gpu_step_result : gpu_step_result_t;
signal REG_COMB_is_active_fill : unsigned(0 downto 0);
signal REG_COMB_is_ram_write : unsigned(0 downto 0);
signal REG_COMB_ram_address : unsigned(15 downto 0);
signal REG_COMB_ram_write_value : unsigned(7 downto 0);
signal REG_COMB_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_device_ram_address : unsigned(7 downto 0);
signal REG_COMB_device_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_is_device_ram_write : unsigned(0 downto 0);
signal REG_COMB_is_vram_write : unsigned(0 downto 0);
signal REG_COMB_vram_write_layer : unsigned(0 downto 0);
signal REG_COMB_vram_address : unsigned(31 downto 0);
signal REG_COMB_vram_value : unsigned(1 downto 0);

-- Each function instance gets signals
-- CONST_SR_12[uxn_c_l299_c15_aa83]
signal CONST_SR_12_uxn_c_l299_c15_aa83_x : unsigned(15 downto 0);
signal CONST_SR_12_uxn_c_l299_c15_aa83_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l301_c6_5b20]
signal BIN_OP_EQ_uxn_c_l301_c6_5b20_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l301_c6_5b20_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l301_c6_5b20_return_output : unsigned(0 downto 0);

-- is_active_drawing_area_MUX[uxn_c_l301_c2_c12c]
signal is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_cond : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_iftrue : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_iffalse : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_return_output : unsigned(0 downto 0);

-- CONST_SR_2[uxn_c_l302_c28_3d3c]
signal CONST_SR_2_uxn_c_l302_c28_3d3c_x : unsigned(15 downto 0);
signal CONST_SR_2_uxn_c_l302_c28_3d3c_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l302_c28_4795]
signal BIN_OP_AND_uxn_c_l302_c28_4795_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l302_c28_4795_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l302_c28_4795_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l305_c7_2b43]
signal UNARY_OP_NOT_uxn_c_l305_c7_2b43_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l305_c1_448a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l311_c9_4260]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l305_c2_d30a]
signal is_vram_write_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(0 downto 0);

-- vram_write_layer_MUX[uxn_c_l305_c2_d30a]
signal vram_write_layer_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l305_c2_d30a]
signal ram_address_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(15 downto 0);

-- is_device_ram_write_MUX[uxn_c_l305_c2_d30a]
signal is_device_ram_write_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l305_c2_d30a]
signal vram_value_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(1 downto 0);

-- is_ram_write_MUX[uxn_c_l305_c2_d30a]
signal is_ram_write_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l305_c2_d30a]
signal ram_write_value_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(7 downto 0);

-- device_ram_address_MUX[uxn_c_l305_c2_d30a]
signal device_ram_address_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(7 downto 0);

-- vram_address_MUX[uxn_c_l305_c2_d30a]
signal vram_address_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(31 downto 0);

-- is_booted_MUX[uxn_c_l305_c2_d30a]
signal is_booted_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(0 downto 0);

-- step_boot[uxn_c_l306_c41_dc84]
signal step_boot_uxn_c_l306_c41_dc84_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_boot_uxn_c_l306_c41_dc84_return_output : boot_step_result_t;

-- UNARY_OP_NOT[uxn_c_l311_c14_e9da]
signal UNARY_OP_NOT_uxn_c_l311_c14_e9da_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l311_c1_6a0e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l311_c9_4260]
signal is_vram_write_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l311_c9_4260_return_output : unsigned(0 downto 0);

-- vram_write_layer_MUX[uxn_c_l311_c9_4260]
signal vram_write_layer_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l311_c9_4260_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l311_c9_4260]
signal ram_address_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l311_c9_4260_return_output : unsigned(15 downto 0);

-- is_device_ram_write_MUX[uxn_c_l311_c9_4260]
signal is_device_ram_write_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l311_c9_4260_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l311_c9_4260]
signal vram_value_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l311_c9_4260_return_output : unsigned(1 downto 0);

-- is_ram_write_MUX[uxn_c_l311_c9_4260]
signal is_ram_write_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l311_c9_4260_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l311_c9_4260]
signal ram_write_value_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l311_c9_4260_return_output : unsigned(7 downto 0);

-- device_ram_address_MUX[uxn_c_l311_c9_4260]
signal device_ram_address_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l311_c9_4260_return_output : unsigned(7 downto 0);

-- vram_address_MUX[uxn_c_l311_c9_4260]
signal vram_address_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l311_c9_4260_return_output : unsigned(31 downto 0);

-- step_cpu[uxn_c_l312_c39_7733]
signal step_cpu_uxn_c_l312_c39_7733_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l312_c39_7733_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l312_c39_7733_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l312_c39_7733_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l324_c19_61d2]
signal main_ram_update_uxn_c_l324_c19_61d2_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l324_c19_61d2_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l324_c19_61d2_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l324_c19_61d2_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l324_c19_61d2_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l330_c26_1940]
signal device_ram_update_uxn_c_l330_c26_1940_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l330_c26_1940_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l330_c26_1940_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l330_c26_1940_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l330_c26_1940_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l336_c20_9344]
signal step_gpu_uxn_c_l336_c20_9344_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l336_c20_9344_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l336_c20_9344_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l336_c20_9344_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l336_c20_9344_vram_address : unsigned(31 downto 0);
signal step_gpu_uxn_c_l336_c20_9344_vram_value : unsigned(1 downto 0);
signal step_gpu_uxn_c_l336_c20_9344_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l338_c20_0556]
signal palette_snoop_uxn_c_l338_c20_0556_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l338_c20_0556_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l338_c20_0556_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l338_c20_0556_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l338_c20_0556_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l338_c20_0556_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l340_c2_a711]
signal BIN_OP_PLUS_uxn_c_l340_c2_a711_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l340_c2_a711_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l340_c2_a711_return_output : unsigned(32 downto 0);

function CAST_TO_uint2_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_12_uxn_c_l299_c15_aa83
CONST_SR_12_uxn_c_l299_c15_aa83 : entity work.CONST_SR_12_uint16_t_0CLK_de264c78 port map (
CONST_SR_12_uxn_c_l299_c15_aa83_x,
CONST_SR_12_uxn_c_l299_c15_aa83_return_output);

-- BIN_OP_EQ_uxn_c_l301_c6_5b20
BIN_OP_EQ_uxn_c_l301_c6_5b20 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l301_c6_5b20_left,
BIN_OP_EQ_uxn_c_l301_c6_5b20_right,
BIN_OP_EQ_uxn_c_l301_c6_5b20_return_output);

-- is_active_drawing_area_MUX_uxn_c_l301_c2_c12c
is_active_drawing_area_MUX_uxn_c_l301_c2_c12c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_cond,
is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_iftrue,
is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_iffalse,
is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_return_output);

-- CONST_SR_2_uxn_c_l302_c28_3d3c
CONST_SR_2_uxn_c_l302_c28_3d3c : entity work.CONST_SR_2_uint16_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l302_c28_3d3c_x,
CONST_SR_2_uxn_c_l302_c28_3d3c_return_output);

-- BIN_OP_AND_uxn_c_l302_c28_4795
BIN_OP_AND_uxn_c_l302_c28_4795 : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l302_c28_4795_left,
BIN_OP_AND_uxn_c_l302_c28_4795_right,
BIN_OP_AND_uxn_c_l302_c28_4795_return_output);

-- UNARY_OP_NOT_uxn_c_l305_c7_2b43
UNARY_OP_NOT_uxn_c_l305_c7_2b43 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l305_c7_2b43_expr,
UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a
TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260
FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_return_output);

-- is_vram_write_MUX_uxn_c_l305_c2_d30a
is_vram_write_MUX_uxn_c_l305_c2_d30a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l305_c2_d30a_cond,
is_vram_write_MUX_uxn_c_l305_c2_d30a_iftrue,
is_vram_write_MUX_uxn_c_l305_c2_d30a_iffalse,
is_vram_write_MUX_uxn_c_l305_c2_d30a_return_output);

-- vram_write_layer_MUX_uxn_c_l305_c2_d30a
vram_write_layer_MUX_uxn_c_l305_c2_d30a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l305_c2_d30a_cond,
vram_write_layer_MUX_uxn_c_l305_c2_d30a_iftrue,
vram_write_layer_MUX_uxn_c_l305_c2_d30a_iffalse,
vram_write_layer_MUX_uxn_c_l305_c2_d30a_return_output);

-- ram_address_MUX_uxn_c_l305_c2_d30a
ram_address_MUX_uxn_c_l305_c2_d30a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l305_c2_d30a_cond,
ram_address_MUX_uxn_c_l305_c2_d30a_iftrue,
ram_address_MUX_uxn_c_l305_c2_d30a_iffalse,
ram_address_MUX_uxn_c_l305_c2_d30a_return_output);

-- is_device_ram_write_MUX_uxn_c_l305_c2_d30a
is_device_ram_write_MUX_uxn_c_l305_c2_d30a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l305_c2_d30a_cond,
is_device_ram_write_MUX_uxn_c_l305_c2_d30a_iftrue,
is_device_ram_write_MUX_uxn_c_l305_c2_d30a_iffalse,
is_device_ram_write_MUX_uxn_c_l305_c2_d30a_return_output);

-- vram_value_MUX_uxn_c_l305_c2_d30a
vram_value_MUX_uxn_c_l305_c2_d30a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l305_c2_d30a_cond,
vram_value_MUX_uxn_c_l305_c2_d30a_iftrue,
vram_value_MUX_uxn_c_l305_c2_d30a_iffalse,
vram_value_MUX_uxn_c_l305_c2_d30a_return_output);

-- is_ram_write_MUX_uxn_c_l305_c2_d30a
is_ram_write_MUX_uxn_c_l305_c2_d30a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l305_c2_d30a_cond,
is_ram_write_MUX_uxn_c_l305_c2_d30a_iftrue,
is_ram_write_MUX_uxn_c_l305_c2_d30a_iffalse,
is_ram_write_MUX_uxn_c_l305_c2_d30a_return_output);

-- ram_write_value_MUX_uxn_c_l305_c2_d30a
ram_write_value_MUX_uxn_c_l305_c2_d30a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l305_c2_d30a_cond,
ram_write_value_MUX_uxn_c_l305_c2_d30a_iftrue,
ram_write_value_MUX_uxn_c_l305_c2_d30a_iffalse,
ram_write_value_MUX_uxn_c_l305_c2_d30a_return_output);

-- device_ram_address_MUX_uxn_c_l305_c2_d30a
device_ram_address_MUX_uxn_c_l305_c2_d30a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l305_c2_d30a_cond,
device_ram_address_MUX_uxn_c_l305_c2_d30a_iftrue,
device_ram_address_MUX_uxn_c_l305_c2_d30a_iffalse,
device_ram_address_MUX_uxn_c_l305_c2_d30a_return_output);

-- vram_address_MUX_uxn_c_l305_c2_d30a
vram_address_MUX_uxn_c_l305_c2_d30a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l305_c2_d30a_cond,
vram_address_MUX_uxn_c_l305_c2_d30a_iftrue,
vram_address_MUX_uxn_c_l305_c2_d30a_iffalse,
vram_address_MUX_uxn_c_l305_c2_d30a_return_output);

-- is_booted_MUX_uxn_c_l305_c2_d30a
is_booted_MUX_uxn_c_l305_c2_d30a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l305_c2_d30a_cond,
is_booted_MUX_uxn_c_l305_c2_d30a_iftrue,
is_booted_MUX_uxn_c_l305_c2_d30a_iffalse,
is_booted_MUX_uxn_c_l305_c2_d30a_return_output);

-- step_boot_uxn_c_l306_c41_dc84
step_boot_uxn_c_l306_c41_dc84 : entity work.step_boot_0CLK_e08689a7 port map (
clk,
step_boot_uxn_c_l306_c41_dc84_CLOCK_ENABLE,
step_boot_uxn_c_l306_c41_dc84_return_output);

-- UNARY_OP_NOT_uxn_c_l311_c14_e9da
UNARY_OP_NOT_uxn_c_l311_c14_e9da : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l311_c14_e9da_expr,
UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e
TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_return_output);

-- is_vram_write_MUX_uxn_c_l311_c9_4260
is_vram_write_MUX_uxn_c_l311_c9_4260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l311_c9_4260_cond,
is_vram_write_MUX_uxn_c_l311_c9_4260_iftrue,
is_vram_write_MUX_uxn_c_l311_c9_4260_iffalse,
is_vram_write_MUX_uxn_c_l311_c9_4260_return_output);

-- vram_write_layer_MUX_uxn_c_l311_c9_4260
vram_write_layer_MUX_uxn_c_l311_c9_4260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l311_c9_4260_cond,
vram_write_layer_MUX_uxn_c_l311_c9_4260_iftrue,
vram_write_layer_MUX_uxn_c_l311_c9_4260_iffalse,
vram_write_layer_MUX_uxn_c_l311_c9_4260_return_output);

-- ram_address_MUX_uxn_c_l311_c9_4260
ram_address_MUX_uxn_c_l311_c9_4260 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l311_c9_4260_cond,
ram_address_MUX_uxn_c_l311_c9_4260_iftrue,
ram_address_MUX_uxn_c_l311_c9_4260_iffalse,
ram_address_MUX_uxn_c_l311_c9_4260_return_output);

-- is_device_ram_write_MUX_uxn_c_l311_c9_4260
is_device_ram_write_MUX_uxn_c_l311_c9_4260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l311_c9_4260_cond,
is_device_ram_write_MUX_uxn_c_l311_c9_4260_iftrue,
is_device_ram_write_MUX_uxn_c_l311_c9_4260_iffalse,
is_device_ram_write_MUX_uxn_c_l311_c9_4260_return_output);

-- vram_value_MUX_uxn_c_l311_c9_4260
vram_value_MUX_uxn_c_l311_c9_4260 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l311_c9_4260_cond,
vram_value_MUX_uxn_c_l311_c9_4260_iftrue,
vram_value_MUX_uxn_c_l311_c9_4260_iffalse,
vram_value_MUX_uxn_c_l311_c9_4260_return_output);

-- is_ram_write_MUX_uxn_c_l311_c9_4260
is_ram_write_MUX_uxn_c_l311_c9_4260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l311_c9_4260_cond,
is_ram_write_MUX_uxn_c_l311_c9_4260_iftrue,
is_ram_write_MUX_uxn_c_l311_c9_4260_iffalse,
is_ram_write_MUX_uxn_c_l311_c9_4260_return_output);

-- ram_write_value_MUX_uxn_c_l311_c9_4260
ram_write_value_MUX_uxn_c_l311_c9_4260 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l311_c9_4260_cond,
ram_write_value_MUX_uxn_c_l311_c9_4260_iftrue,
ram_write_value_MUX_uxn_c_l311_c9_4260_iffalse,
ram_write_value_MUX_uxn_c_l311_c9_4260_return_output);

-- device_ram_address_MUX_uxn_c_l311_c9_4260
device_ram_address_MUX_uxn_c_l311_c9_4260 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l311_c9_4260_cond,
device_ram_address_MUX_uxn_c_l311_c9_4260_iftrue,
device_ram_address_MUX_uxn_c_l311_c9_4260_iffalse,
device_ram_address_MUX_uxn_c_l311_c9_4260_return_output);

-- vram_address_MUX_uxn_c_l311_c9_4260
vram_address_MUX_uxn_c_l311_c9_4260 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l311_c9_4260_cond,
vram_address_MUX_uxn_c_l311_c9_4260_iftrue,
vram_address_MUX_uxn_c_l311_c9_4260_iffalse,
vram_address_MUX_uxn_c_l311_c9_4260_return_output);

-- step_cpu_uxn_c_l312_c39_7733
step_cpu_uxn_c_l312_c39_7733 : entity work.step_cpu_0CLK_bc5ebb3b port map (
clk,
step_cpu_uxn_c_l312_c39_7733_CLOCK_ENABLE,
step_cpu_uxn_c_l312_c39_7733_previous_ram_read_value,
step_cpu_uxn_c_l312_c39_7733_previous_device_ram_read,
step_cpu_uxn_c_l312_c39_7733_return_output);

-- main_ram_update_uxn_c_l324_c19_61d2
main_ram_update_uxn_c_l324_c19_61d2 : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l324_c19_61d2_CLOCK_ENABLE,
main_ram_update_uxn_c_l324_c19_61d2_ram_address,
main_ram_update_uxn_c_l324_c19_61d2_value,
main_ram_update_uxn_c_l324_c19_61d2_write_enable,
main_ram_update_uxn_c_l324_c19_61d2_return_output);

-- device_ram_update_uxn_c_l330_c26_1940
device_ram_update_uxn_c_l330_c26_1940 : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l330_c26_1940_CLOCK_ENABLE,
device_ram_update_uxn_c_l330_c26_1940_device_address,
device_ram_update_uxn_c_l330_c26_1940_value,
device_ram_update_uxn_c_l330_c26_1940_write_enable,
device_ram_update_uxn_c_l330_c26_1940_return_output);

-- step_gpu_uxn_c_l336_c20_9344
step_gpu_uxn_c_l336_c20_9344 : entity work.step_gpu_0CLK_57094e53 port map (
clk,
step_gpu_uxn_c_l336_c20_9344_CLOCK_ENABLE,
step_gpu_uxn_c_l336_c20_9344_is_active_drawing_area,
step_gpu_uxn_c_l336_c20_9344_is_vram_write,
step_gpu_uxn_c_l336_c20_9344_vram_write_layer,
step_gpu_uxn_c_l336_c20_9344_vram_address,
step_gpu_uxn_c_l336_c20_9344_vram_value,
step_gpu_uxn_c_l336_c20_9344_return_output);

-- palette_snoop_uxn_c_l338_c20_0556
palette_snoop_uxn_c_l338_c20_0556 : entity work.palette_snoop_0CLK_26f67814 port map (
clk,
palette_snoop_uxn_c_l338_c20_0556_CLOCK_ENABLE,
palette_snoop_uxn_c_l338_c20_0556_device_ram_address,
palette_snoop_uxn_c_l338_c20_0556_device_ram_value,
palette_snoop_uxn_c_l338_c20_0556_is_device_ram_write,
palette_snoop_uxn_c_l338_c20_0556_gpu_step_color,
palette_snoop_uxn_c_l338_c20_0556_return_output);

-- BIN_OP_PLUS_uxn_c_l340_c2_a711
BIN_OP_PLUS_uxn_c_l340_c2_a711 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l340_c2_a711_left,
BIN_OP_PLUS_uxn_c_l340_c2_a711_right,
BIN_OP_PLUS_uxn_c_l340_c2_a711_return_output);



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
 gpu_step_result,
 is_active_fill,
 is_ram_write,
 ram_address,
 ram_write_value,
 ram_read_value,
 device_ram_address,
 device_ram_read_value,
 is_device_ram_write,
 is_vram_write,
 vram_write_layer,
 vram_address,
 vram_value,
 -- All submodule outputs
 CONST_SR_12_uxn_c_l299_c15_aa83_return_output,
 BIN_OP_EQ_uxn_c_l301_c6_5b20_return_output,
 is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_return_output,
 CONST_SR_2_uxn_c_l302_c28_3d3c_return_output,
 BIN_OP_AND_uxn_c_l302_c28_4795_return_output,
 UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_return_output,
 is_vram_write_MUX_uxn_c_l305_c2_d30a_return_output,
 vram_write_layer_MUX_uxn_c_l305_c2_d30a_return_output,
 ram_address_MUX_uxn_c_l305_c2_d30a_return_output,
 is_device_ram_write_MUX_uxn_c_l305_c2_d30a_return_output,
 vram_value_MUX_uxn_c_l305_c2_d30a_return_output,
 is_ram_write_MUX_uxn_c_l305_c2_d30a_return_output,
 ram_write_value_MUX_uxn_c_l305_c2_d30a_return_output,
 device_ram_address_MUX_uxn_c_l305_c2_d30a_return_output,
 vram_address_MUX_uxn_c_l305_c2_d30a_return_output,
 is_booted_MUX_uxn_c_l305_c2_d30a_return_output,
 step_boot_uxn_c_l306_c41_dc84_return_output,
 UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_return_output,
 is_vram_write_MUX_uxn_c_l311_c9_4260_return_output,
 vram_write_layer_MUX_uxn_c_l311_c9_4260_return_output,
 ram_address_MUX_uxn_c_l311_c9_4260_return_output,
 is_device_ram_write_MUX_uxn_c_l311_c9_4260_return_output,
 vram_value_MUX_uxn_c_l311_c9_4260_return_output,
 is_ram_write_MUX_uxn_c_l311_c9_4260_return_output,
 ram_write_value_MUX_uxn_c_l311_c9_4260_return_output,
 device_ram_address_MUX_uxn_c_l311_c9_4260_return_output,
 vram_address_MUX_uxn_c_l311_c9_4260_return_output,
 step_cpu_uxn_c_l312_c39_7733_return_output,
 main_ram_update_uxn_c_l324_c19_61d2_return_output,
 device_ram_update_uxn_c_l330_c26_1940_return_output,
 step_gpu_uxn_c_l336_c20_9344_return_output,
 palette_snoop_uxn_c_l338_c20_0556_return_output,
 BIN_OP_PLUS_uxn_c_l340_c2_a711_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_input_code_uxn_c_l299_c2_33da : unsigned(3 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l299_c15_aa83_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l299_c15_aa83_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l301_c6_5b20_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l301_c6_5b20_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l301_c6_5b20_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_iftrue : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_uxn_c_l302_c3_d692 : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_iffalse : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l302_c28_4795_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l302_c28_3d3c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l302_c28_3d3c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l302_c28_4795_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l302_c28_4795_return_output : unsigned(15 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l311_c9_4260_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l311_c9_4260_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l311_c9_4260_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l311_c9_4260_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l311_c9_4260_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l311_c9_4260_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l311_c9_4260_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l311_c9_4260_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l311_c9_4260_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l305_c2_d30a_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l305_c2_d30a_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l305_c2_d30a_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l305_c2_d30a_cond : unsigned(0 downto 0);
 variable VAR_boot_step_result : boot_step_result_t;
 variable VAR_step_boot_uxn_c_l306_c41_dc84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_boot_uxn_c_l306_c41_dc84_return_output : boot_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l307_c18_f243_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l308_c17_9e34_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l309_c21_7cf6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l310_c15_6f84_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l311_c9_4260_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l311_c9_4260_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l311_c9_4260_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result : cpu_step_result_t;
 variable VAR_step_cpu_uxn_c_l312_c39_7733_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l312_c39_7733_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l312_c39_7733_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l312_c39_7733_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l313_c18_af2a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l314_c17_2ec0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l315_c24_7afb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l316_c25_d0e4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l318_c19_c1e7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l319_c22_a416_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l320_c18_3b75_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l321_c16_8b69_return_output : unsigned(1 downto 0);
 variable VAR_main_ram_update_uxn_c_l324_c19_61d2_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l324_c19_61d2_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l324_c19_61d2_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l324_c19_61d2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l324_c19_61d2_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l330_c26_1940_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l330_c26_1940_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l330_c26_1940_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l330_c26_1940_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l330_c26_1940_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l336_c20_9344_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l336_c20_9344_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l336_c20_9344_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l336_c20_9344_vram_address : unsigned(31 downto 0);
 variable VAR_step_gpu_uxn_c_l336_c20_9344_vram_value : unsigned(1 downto 0);
 variable VAR_step_gpu_uxn_c_l336_c20_9344_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l336_c20_9344_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l337_c19_f261_return_output : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l338_c20_0556_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l338_c20_0556_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l338_c20_0556_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l338_c20_0556_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l338_c92_1916_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l338_c20_0556_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l338_c20_0556_return_output : unsigned(15 downto 0);
 variable VAR_main_clock_cycle_uxn_c_l340_c2_e997 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l340_c2_a711_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l340_c2_a711_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l340_c2_a711_return_output : unsigned(32 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l317_l321_DUPLICATE_d7e0_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_main_clock_cycle : unsigned(31 downto 0);
variable REG_VAR_input_code : unsigned(3 downto 0);
variable REG_VAR_palette_color_values : uint12_t_4;
variable REG_VAR_uxn_eval_result : unsigned(15 downto 0);
variable REG_VAR_current_pixel_palette_color : unsigned(1 downto 0);
variable REG_VAR_is_active_drawing_area : unsigned(0 downto 0);
variable REG_VAR_is_booted : unsigned(0 downto 0);
variable REG_VAR_gpu_step_result : gpu_step_result_t;
variable REG_VAR_is_active_fill : unsigned(0 downto 0);
variable REG_VAR_is_ram_write : unsigned(0 downto 0);
variable REG_VAR_ram_address : unsigned(15 downto 0);
variable REG_VAR_ram_write_value : unsigned(7 downto 0);
variable REG_VAR_ram_read_value : unsigned(7 downto 0);
variable REG_VAR_device_ram_address : unsigned(7 downto 0);
variable REG_VAR_device_ram_read_value : unsigned(7 downto 0);
variable REG_VAR_is_device_ram_write : unsigned(0 downto 0);
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
  REG_VAR_gpu_step_result := gpu_step_result;
  REG_VAR_is_active_fill := is_active_fill;
  REG_VAR_is_ram_write := is_ram_write;
  REG_VAR_ram_address := ram_address;
  REG_VAR_ram_write_value := ram_write_value;
  REG_VAR_ram_read_value := ram_read_value;
  REG_VAR_device_ram_address := device_ram_address;
  REG_VAR_device_ram_read_value := device_ram_read_value;
  REG_VAR_is_device_ram_write := is_device_ram_write;
  REG_VAR_is_vram_write := is_vram_write;
  REG_VAR_vram_write_layer := vram_write_layer;
  REG_VAR_vram_address := vram_address;
  REG_VAR_vram_value := vram_value;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_c_l340_c2_a711_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l302_c28_4795_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l301_c6_5b20_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l330_c26_1940_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l324_c19_61d2_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l338_c20_0556_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l336_c20_9344_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     REG_VAR_current_pixel_palette_color := current_pixel_palette_color;
     VAR_device_ram_address_MUX_uxn_c_l305_c2_d30a_iftrue := device_ram_address;
     VAR_device_ram_address_MUX_uxn_c_l311_c9_4260_iffalse := device_ram_address;
     VAR_step_cpu_uxn_c_l312_c39_7733_previous_device_ram_read := device_ram_read_value;
     VAR_CONST_SR_12_uxn_c_l299_c15_aa83_x := VAR_input;
     VAR_CONST_SR_2_uxn_c_l302_c28_3d3c_x := VAR_input;
     VAR_is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_iffalse := is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l305_c2_d30a_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l305_c2_d30a_iftrue := is_device_ram_write;
     VAR_is_device_ram_write_MUX_uxn_c_l311_c9_4260_iffalse := is_device_ram_write;
     VAR_is_ram_write_MUX_uxn_c_l311_c9_4260_iffalse := is_ram_write;
     VAR_is_vram_write_MUX_uxn_c_l305_c2_d30a_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l311_c9_4260_iffalse := is_vram_write;
     VAR_BIN_OP_PLUS_uxn_c_l340_c2_a711_left := main_clock_cycle;
     REG_VAR_palette_color_values := palette_color_values;
     VAR_ram_address_MUX_uxn_c_l311_c9_4260_iffalse := ram_address;
     VAR_step_cpu_uxn_c_l312_c39_7733_previous_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l311_c9_4260_iffalse := ram_write_value;
     VAR_vram_address_MUX_uxn_c_l305_c2_d30a_iftrue := vram_address;
     VAR_vram_address_MUX_uxn_c_l311_c9_4260_iffalse := vram_address;
     VAR_vram_value_MUX_uxn_c_l305_c2_d30a_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l311_c9_4260_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l305_c2_d30a_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l311_c9_4260_iffalse := vram_write_layer;
     -- CONST_SR_12[uxn_c_l299_c15_aa83] LATENCY=0
     -- Inputs
     CONST_SR_12_uxn_c_l299_c15_aa83_x <= VAR_CONST_SR_12_uxn_c_l299_c15_aa83_x;
     -- Outputs
     VAR_CONST_SR_12_uxn_c_l299_c15_aa83_return_output := CONST_SR_12_uxn_c_l299_c15_aa83_return_output;

     -- UNARY_OP_NOT[uxn_c_l305_c7_2b43] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l305_c7_2b43_expr <= VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output := UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output;

     -- BIN_OP_PLUS[uxn_c_l340_c2_a711] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l340_c2_a711_left <= VAR_BIN_OP_PLUS_uxn_c_l340_c2_a711_left;
     BIN_OP_PLUS_uxn_c_l340_c2_a711_right <= VAR_BIN_OP_PLUS_uxn_c_l340_c2_a711_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l340_c2_a711_return_output := BIN_OP_PLUS_uxn_c_l340_c2_a711_return_output;

     -- UNARY_OP_NOT[uxn_c_l311_c14_e9da] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l311_c14_e9da_expr <= VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output := UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output;

     -- CONST_SR_2[uxn_c_l302_c28_3d3c] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l302_c28_3d3c_x <= VAR_CONST_SR_2_uxn_c_l302_c28_3d3c_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l302_c28_3d3c_return_output := CONST_SR_2_uxn_c_l302_c28_3d3c_return_output;

     -- Submodule level 1
     VAR_main_clock_cycle_uxn_c_l340_c2_e997 := resize(VAR_BIN_OP_PLUS_uxn_c_l340_c2_a711_return_output, 32);
     VAR_input_code_uxn_c_l299_c2_33da := resize(VAR_CONST_SR_12_uxn_c_l299_c15_aa83_return_output, 4);
     VAR_BIN_OP_AND_uxn_c_l302_c28_4795_left := VAR_CONST_SR_2_uxn_c_l302_c28_3d3c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_cond := VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_cond := VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output;
     VAR_device_ram_address_MUX_uxn_c_l305_c2_d30a_cond := VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output;
     VAR_is_booted_MUX_uxn_c_l305_c2_d30a_cond := VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l305_c2_d30a_cond := VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output;
     VAR_is_ram_write_MUX_uxn_c_l305_c2_d30a_cond := VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output;
     VAR_is_vram_write_MUX_uxn_c_l305_c2_d30a_cond := VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output;
     VAR_ram_address_MUX_uxn_c_l305_c2_d30a_cond := VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output;
     VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_cond := VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output;
     VAR_vram_address_MUX_uxn_c_l305_c2_d30a_cond := VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output;
     VAR_vram_value_MUX_uxn_c_l305_c2_d30a_cond := VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l305_c2_d30a_cond := VAR_UNARY_OP_NOT_uxn_c_l305_c7_2b43_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_cond := VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output;
     VAR_device_ram_address_MUX_uxn_c_l311_c9_4260_cond := VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l311_c9_4260_cond := VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output;
     VAR_is_ram_write_MUX_uxn_c_l311_c9_4260_cond := VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output;
     VAR_is_vram_write_MUX_uxn_c_l311_c9_4260_cond := VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output;
     VAR_ram_address_MUX_uxn_c_l311_c9_4260_cond := VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output;
     VAR_ram_write_value_MUX_uxn_c_l311_c9_4260_cond := VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output;
     VAR_vram_address_MUX_uxn_c_l311_c9_4260_cond := VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output;
     VAR_vram_value_MUX_uxn_c_l311_c9_4260_cond := VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l311_c9_4260_cond := VAR_UNARY_OP_NOT_uxn_c_l311_c14_e9da_return_output;
     VAR_BIN_OP_EQ_uxn_c_l301_c6_5b20_left := VAR_input_code_uxn_c_l299_c2_33da;
     REG_VAR_input_code := VAR_input_code_uxn_c_l299_c2_33da;
     REG_VAR_main_clock_cycle := VAR_main_clock_cycle_uxn_c_l340_c2_e997;
     -- BIN_OP_EQ[uxn_c_l301_c6_5b20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l301_c6_5b20_left <= VAR_BIN_OP_EQ_uxn_c_l301_c6_5b20_left;
     BIN_OP_EQ_uxn_c_l301_c6_5b20_right <= VAR_BIN_OP_EQ_uxn_c_l301_c6_5b20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l301_c6_5b20_return_output := BIN_OP_EQ_uxn_c_l301_c6_5b20_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l305_c1_448a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l311_c9_4260] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_return_output;

     -- BIN_OP_AND[uxn_c_l302_c28_4795] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l302_c28_4795_left <= VAR_BIN_OP_AND_uxn_c_l302_c28_4795_left;
     BIN_OP_AND_uxn_c_l302_c28_4795_right <= VAR_BIN_OP_AND_uxn_c_l302_c28_4795_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l302_c28_4795_return_output := BIN_OP_AND_uxn_c_l302_c28_4795_return_output;

     -- Submodule level 2
     VAR_is_active_drawing_area_uxn_c_l302_c3_d692 := resize(VAR_BIN_OP_AND_uxn_c_l302_c28_4795_return_output, 1);
     VAR_is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_cond := VAR_BIN_OP_EQ_uxn_c_l301_c6_5b20_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l311_c9_4260_return_output;
     VAR_step_boot_uxn_c_l306_c41_dc84_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l305_c1_448a_return_output;
     VAR_is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_iftrue := VAR_is_active_drawing_area_uxn_c_l302_c3_d692;
     -- is_active_drawing_area_MUX[uxn_c_l301_c2_c12c] LATENCY=0
     -- Inputs
     is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_cond <= VAR_is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_cond;
     is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_iftrue <= VAR_is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_iftrue;
     is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_iffalse <= VAR_is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_iffalse;
     -- Outputs
     VAR_is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_return_output := is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l311_c1_6a0e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_return_output;

     -- step_boot[uxn_c_l306_c41_dc84] LATENCY=0
     -- Clock enable
     step_boot_uxn_c_l306_c41_dc84_CLOCK_ENABLE <= VAR_step_boot_uxn_c_l306_c41_dc84_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_step_boot_uxn_c_l306_c41_dc84_return_output := step_boot_uxn_c_l306_c41_dc84_return_output;

     -- Submodule level 3
     VAR_step_cpu_uxn_c_l312_c39_7733_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l311_c1_6a0e_return_output;
     REG_VAR_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_return_output;
     VAR_step_gpu_uxn_c_l336_c20_9344_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l301_c2_c12c_return_output;
     -- CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d[uxn_c_l308_c17_9e34] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l308_c17_9e34_return_output := VAR_step_boot_uxn_c_l306_c41_dc84_return_output.ram_address;

     -- step_cpu[uxn_c_l312_c39_7733] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l312_c39_7733_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l312_c39_7733_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l312_c39_7733_previous_ram_read_value <= VAR_step_cpu_uxn_c_l312_c39_7733_previous_ram_read_value;
     step_cpu_uxn_c_l312_c39_7733_previous_device_ram_read <= VAR_step_cpu_uxn_c_l312_c39_7733_previous_device_ram_read;
     -- Outputs
     VAR_step_cpu_uxn_c_l312_c39_7733_return_output := step_cpu_uxn_c_l312_c39_7733_return_output;

     -- CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d[uxn_c_l309_c21_7cf6] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l309_c21_7cf6_return_output := VAR_step_boot_uxn_c_l306_c41_dc84_return_output.rom_byte;

     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d[uxn_c_l307_c18_f243] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l307_c18_f243_return_output := VAR_step_boot_uxn_c_l306_c41_dc84_return_output.is_valid_byte;

     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d[uxn_c_l310_c15_6f84] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l310_c15_6f84_return_output := VAR_step_boot_uxn_c_l306_c41_dc84_return_output.is_finished;

     -- Submodule level 4
     VAR_ram_address_MUX_uxn_c_l305_c2_d30a_iftrue := VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l308_c17_9e34_return_output;
     VAR_is_booted_MUX_uxn_c_l305_c2_d30a_iftrue := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l310_c15_6f84_return_output;
     VAR_is_ram_write_MUX_uxn_c_l305_c2_d30a_iftrue := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l307_c18_f243_return_output;
     VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_iftrue := VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l309_c21_7cf6_return_output;
     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l316_c25_d0e4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l316_c25_d0e4_return_output := VAR_step_cpu_uxn_c_l312_c39_7733_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l319_c22_a416] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l319_c22_a416_return_output := VAR_step_cpu_uxn_c_l312_c39_7733_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l317_l321_DUPLICATE_d7e0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l317_l321_DUPLICATE_d7e0_return_output := VAR_step_cpu_uxn_c_l312_c39_7733_return_output.u8_value;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l315_c24_7afb] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l315_c24_7afb_return_output := VAR_step_cpu_uxn_c_l312_c39_7733_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l318_c19_c1e7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l318_c19_c1e7_return_output := VAR_step_cpu_uxn_c_l312_c39_7733_return_output.is_vram_write;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d[uxn_c_l314_c17_2ec0] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l314_c17_2ec0_return_output := VAR_step_cpu_uxn_c_l312_c39_7733_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l313_c18_af2a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l313_c18_af2a_return_output := VAR_step_cpu_uxn_c_l312_c39_7733_return_output.is_ram_write;

     -- CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d[uxn_c_l320_c18_3b75] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l320_c18_3b75_return_output := VAR_step_cpu_uxn_c_l312_c39_7733_return_output.vram_address;

     -- is_booted_MUX[uxn_c_l305_c2_d30a] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l305_c2_d30a_cond <= VAR_is_booted_MUX_uxn_c_l305_c2_d30a_cond;
     is_booted_MUX_uxn_c_l305_c2_d30a_iftrue <= VAR_is_booted_MUX_uxn_c_l305_c2_d30a_iftrue;
     is_booted_MUX_uxn_c_l305_c2_d30a_iffalse <= VAR_is_booted_MUX_uxn_c_l305_c2_d30a_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l305_c2_d30a_return_output := is_booted_MUX_uxn_c_l305_c2_d30a_return_output;

     -- Submodule level 5
     VAR_ram_address_MUX_uxn_c_l311_c9_4260_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l314_c17_2ec0_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l311_c9_4260_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l316_c25_d0e4_return_output;
     VAR_is_ram_write_MUX_uxn_c_l311_c9_4260_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l313_c18_af2a_return_output;
     VAR_is_vram_write_MUX_uxn_c_l311_c9_4260_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l318_c19_c1e7_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l311_c9_4260_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l319_c22_a416_return_output;
     VAR_vram_address_MUX_uxn_c_l311_c9_4260_iftrue := VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l320_c18_3b75_return_output;
     VAR_device_ram_address_MUX_uxn_c_l311_c9_4260_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l315_c24_7afb_return_output;
     VAR_ram_write_value_MUX_uxn_c_l311_c9_4260_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l317_l321_DUPLICATE_d7e0_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l305_c2_d30a_return_output;
     -- is_vram_write_MUX[uxn_c_l311_c9_4260] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l311_c9_4260_cond <= VAR_is_vram_write_MUX_uxn_c_l311_c9_4260_cond;
     is_vram_write_MUX_uxn_c_l311_c9_4260_iftrue <= VAR_is_vram_write_MUX_uxn_c_l311_c9_4260_iftrue;
     is_vram_write_MUX_uxn_c_l311_c9_4260_iffalse <= VAR_is_vram_write_MUX_uxn_c_l311_c9_4260_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l311_c9_4260_return_output := is_vram_write_MUX_uxn_c_l311_c9_4260_return_output;

     -- vram_address_MUX[uxn_c_l311_c9_4260] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l311_c9_4260_cond <= VAR_vram_address_MUX_uxn_c_l311_c9_4260_cond;
     vram_address_MUX_uxn_c_l311_c9_4260_iftrue <= VAR_vram_address_MUX_uxn_c_l311_c9_4260_iftrue;
     vram_address_MUX_uxn_c_l311_c9_4260_iffalse <= VAR_vram_address_MUX_uxn_c_l311_c9_4260_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l311_c9_4260_return_output := vram_address_MUX_uxn_c_l311_c9_4260_return_output;

     -- vram_write_layer_MUX[uxn_c_l311_c9_4260] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l311_c9_4260_cond <= VAR_vram_write_layer_MUX_uxn_c_l311_c9_4260_cond;
     vram_write_layer_MUX_uxn_c_l311_c9_4260_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l311_c9_4260_iftrue;
     vram_write_layer_MUX_uxn_c_l311_c9_4260_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l311_c9_4260_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l311_c9_4260_return_output := vram_write_layer_MUX_uxn_c_l311_c9_4260_return_output;

     -- CAST_TO_uint2_t[uxn_c_l321_c16_8b69] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l321_c16_8b69_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l317_l321_DUPLICATE_d7e0_return_output);

     -- ram_address_MUX[uxn_c_l311_c9_4260] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l311_c9_4260_cond <= VAR_ram_address_MUX_uxn_c_l311_c9_4260_cond;
     ram_address_MUX_uxn_c_l311_c9_4260_iftrue <= VAR_ram_address_MUX_uxn_c_l311_c9_4260_iftrue;
     ram_address_MUX_uxn_c_l311_c9_4260_iffalse <= VAR_ram_address_MUX_uxn_c_l311_c9_4260_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l311_c9_4260_return_output := ram_address_MUX_uxn_c_l311_c9_4260_return_output;

     -- is_ram_write_MUX[uxn_c_l311_c9_4260] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l311_c9_4260_cond <= VAR_is_ram_write_MUX_uxn_c_l311_c9_4260_cond;
     is_ram_write_MUX_uxn_c_l311_c9_4260_iftrue <= VAR_is_ram_write_MUX_uxn_c_l311_c9_4260_iftrue;
     is_ram_write_MUX_uxn_c_l311_c9_4260_iffalse <= VAR_is_ram_write_MUX_uxn_c_l311_c9_4260_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l311_c9_4260_return_output := is_ram_write_MUX_uxn_c_l311_c9_4260_return_output;

     -- is_device_ram_write_MUX[uxn_c_l311_c9_4260] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l311_c9_4260_cond <= VAR_is_device_ram_write_MUX_uxn_c_l311_c9_4260_cond;
     is_device_ram_write_MUX_uxn_c_l311_c9_4260_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l311_c9_4260_iftrue;
     is_device_ram_write_MUX_uxn_c_l311_c9_4260_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l311_c9_4260_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l311_c9_4260_return_output := is_device_ram_write_MUX_uxn_c_l311_c9_4260_return_output;

     -- ram_write_value_MUX[uxn_c_l311_c9_4260] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l311_c9_4260_cond <= VAR_ram_write_value_MUX_uxn_c_l311_c9_4260_cond;
     ram_write_value_MUX_uxn_c_l311_c9_4260_iftrue <= VAR_ram_write_value_MUX_uxn_c_l311_c9_4260_iftrue;
     ram_write_value_MUX_uxn_c_l311_c9_4260_iffalse <= VAR_ram_write_value_MUX_uxn_c_l311_c9_4260_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l311_c9_4260_return_output := ram_write_value_MUX_uxn_c_l311_c9_4260_return_output;

     -- device_ram_address_MUX[uxn_c_l311_c9_4260] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l311_c9_4260_cond <= VAR_device_ram_address_MUX_uxn_c_l311_c9_4260_cond;
     device_ram_address_MUX_uxn_c_l311_c9_4260_iftrue <= VAR_device_ram_address_MUX_uxn_c_l311_c9_4260_iftrue;
     device_ram_address_MUX_uxn_c_l311_c9_4260_iffalse <= VAR_device_ram_address_MUX_uxn_c_l311_c9_4260_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l311_c9_4260_return_output := device_ram_address_MUX_uxn_c_l311_c9_4260_return_output;

     -- Submodule level 6
     VAR_vram_value_MUX_uxn_c_l311_c9_4260_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l321_c16_8b69_return_output;
     VAR_device_ram_address_MUX_uxn_c_l305_c2_d30a_iffalse := VAR_device_ram_address_MUX_uxn_c_l311_c9_4260_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l305_c2_d30a_iffalse := VAR_is_device_ram_write_MUX_uxn_c_l311_c9_4260_return_output;
     VAR_is_ram_write_MUX_uxn_c_l305_c2_d30a_iffalse := VAR_is_ram_write_MUX_uxn_c_l311_c9_4260_return_output;
     VAR_is_vram_write_MUX_uxn_c_l305_c2_d30a_iffalse := VAR_is_vram_write_MUX_uxn_c_l311_c9_4260_return_output;
     VAR_ram_address_MUX_uxn_c_l305_c2_d30a_iffalse := VAR_ram_address_MUX_uxn_c_l311_c9_4260_return_output;
     VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_iffalse := VAR_ram_write_value_MUX_uxn_c_l311_c9_4260_return_output;
     VAR_vram_address_MUX_uxn_c_l305_c2_d30a_iffalse := VAR_vram_address_MUX_uxn_c_l311_c9_4260_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l305_c2_d30a_iffalse := VAR_vram_write_layer_MUX_uxn_c_l311_c9_4260_return_output;
     -- ram_write_value_MUX[uxn_c_l305_c2_d30a] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l305_c2_d30a_cond <= VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_cond;
     ram_write_value_MUX_uxn_c_l305_c2_d30a_iftrue <= VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_iftrue;
     ram_write_value_MUX_uxn_c_l305_c2_d30a_iffalse <= VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_return_output := ram_write_value_MUX_uxn_c_l305_c2_d30a_return_output;

     -- ram_address_MUX[uxn_c_l305_c2_d30a] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l305_c2_d30a_cond <= VAR_ram_address_MUX_uxn_c_l305_c2_d30a_cond;
     ram_address_MUX_uxn_c_l305_c2_d30a_iftrue <= VAR_ram_address_MUX_uxn_c_l305_c2_d30a_iftrue;
     ram_address_MUX_uxn_c_l305_c2_d30a_iffalse <= VAR_ram_address_MUX_uxn_c_l305_c2_d30a_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l305_c2_d30a_return_output := ram_address_MUX_uxn_c_l305_c2_d30a_return_output;

     -- is_ram_write_MUX[uxn_c_l305_c2_d30a] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l305_c2_d30a_cond <= VAR_is_ram_write_MUX_uxn_c_l305_c2_d30a_cond;
     is_ram_write_MUX_uxn_c_l305_c2_d30a_iftrue <= VAR_is_ram_write_MUX_uxn_c_l305_c2_d30a_iftrue;
     is_ram_write_MUX_uxn_c_l305_c2_d30a_iffalse <= VAR_is_ram_write_MUX_uxn_c_l305_c2_d30a_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l305_c2_d30a_return_output := is_ram_write_MUX_uxn_c_l305_c2_d30a_return_output;

     -- vram_value_MUX[uxn_c_l311_c9_4260] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l311_c9_4260_cond <= VAR_vram_value_MUX_uxn_c_l311_c9_4260_cond;
     vram_value_MUX_uxn_c_l311_c9_4260_iftrue <= VAR_vram_value_MUX_uxn_c_l311_c9_4260_iftrue;
     vram_value_MUX_uxn_c_l311_c9_4260_iffalse <= VAR_vram_value_MUX_uxn_c_l311_c9_4260_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l311_c9_4260_return_output := vram_value_MUX_uxn_c_l311_c9_4260_return_output;

     -- vram_write_layer_MUX[uxn_c_l305_c2_d30a] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l305_c2_d30a_cond <= VAR_vram_write_layer_MUX_uxn_c_l305_c2_d30a_cond;
     vram_write_layer_MUX_uxn_c_l305_c2_d30a_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l305_c2_d30a_iftrue;
     vram_write_layer_MUX_uxn_c_l305_c2_d30a_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l305_c2_d30a_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l305_c2_d30a_return_output := vram_write_layer_MUX_uxn_c_l305_c2_d30a_return_output;

     -- device_ram_address_MUX[uxn_c_l305_c2_d30a] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l305_c2_d30a_cond <= VAR_device_ram_address_MUX_uxn_c_l305_c2_d30a_cond;
     device_ram_address_MUX_uxn_c_l305_c2_d30a_iftrue <= VAR_device_ram_address_MUX_uxn_c_l305_c2_d30a_iftrue;
     device_ram_address_MUX_uxn_c_l305_c2_d30a_iffalse <= VAR_device_ram_address_MUX_uxn_c_l305_c2_d30a_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l305_c2_d30a_return_output := device_ram_address_MUX_uxn_c_l305_c2_d30a_return_output;

     -- is_vram_write_MUX[uxn_c_l305_c2_d30a] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l305_c2_d30a_cond <= VAR_is_vram_write_MUX_uxn_c_l305_c2_d30a_cond;
     is_vram_write_MUX_uxn_c_l305_c2_d30a_iftrue <= VAR_is_vram_write_MUX_uxn_c_l305_c2_d30a_iftrue;
     is_vram_write_MUX_uxn_c_l305_c2_d30a_iffalse <= VAR_is_vram_write_MUX_uxn_c_l305_c2_d30a_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l305_c2_d30a_return_output := is_vram_write_MUX_uxn_c_l305_c2_d30a_return_output;

     -- is_device_ram_write_MUX[uxn_c_l305_c2_d30a] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l305_c2_d30a_cond <= VAR_is_device_ram_write_MUX_uxn_c_l305_c2_d30a_cond;
     is_device_ram_write_MUX_uxn_c_l305_c2_d30a_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l305_c2_d30a_iftrue;
     is_device_ram_write_MUX_uxn_c_l305_c2_d30a_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l305_c2_d30a_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l305_c2_d30a_return_output := is_device_ram_write_MUX_uxn_c_l305_c2_d30a_return_output;

     -- vram_address_MUX[uxn_c_l305_c2_d30a] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l305_c2_d30a_cond <= VAR_vram_address_MUX_uxn_c_l305_c2_d30a_cond;
     vram_address_MUX_uxn_c_l305_c2_d30a_iftrue <= VAR_vram_address_MUX_uxn_c_l305_c2_d30a_iftrue;
     vram_address_MUX_uxn_c_l305_c2_d30a_iffalse <= VAR_vram_address_MUX_uxn_c_l305_c2_d30a_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l305_c2_d30a_return_output := vram_address_MUX_uxn_c_l305_c2_d30a_return_output;

     -- Submodule level 7
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l305_c2_d30a_return_output;
     VAR_device_ram_update_uxn_c_l330_c26_1940_device_address := VAR_device_ram_address_MUX_uxn_c_l305_c2_d30a_return_output;
     VAR_palette_snoop_uxn_c_l338_c20_0556_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l305_c2_d30a_return_output;
     VAR_device_ram_update_uxn_c_l330_c26_1940_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l305_c2_d30a_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l305_c2_d30a_return_output;
     VAR_palette_snoop_uxn_c_l338_c20_0556_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l305_c2_d30a_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l305_c2_d30a_return_output;
     VAR_main_ram_update_uxn_c_l324_c19_61d2_write_enable := VAR_is_ram_write_MUX_uxn_c_l305_c2_d30a_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l305_c2_d30a_return_output;
     VAR_step_gpu_uxn_c_l336_c20_9344_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l305_c2_d30a_return_output;
     VAR_main_ram_update_uxn_c_l324_c19_61d2_ram_address := VAR_ram_address_MUX_uxn_c_l305_c2_d30a_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l305_c2_d30a_return_output;
     VAR_device_ram_update_uxn_c_l330_c26_1940_value := VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_return_output;
     VAR_main_ram_update_uxn_c_l324_c19_61d2_value := VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_return_output;
     VAR_palette_snoop_uxn_c_l338_c20_0556_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l305_c2_d30a_return_output;
     VAR_step_gpu_uxn_c_l336_c20_9344_vram_address := VAR_vram_address_MUX_uxn_c_l305_c2_d30a_return_output;
     REG_VAR_vram_address := VAR_vram_address_MUX_uxn_c_l305_c2_d30a_return_output;
     VAR_vram_value_MUX_uxn_c_l305_c2_d30a_iffalse := VAR_vram_value_MUX_uxn_c_l311_c9_4260_return_output;
     VAR_step_gpu_uxn_c_l336_c20_9344_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l305_c2_d30a_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l305_c2_d30a_return_output;
     -- device_ram_update[uxn_c_l330_c26_1940] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l330_c26_1940_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l330_c26_1940_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l330_c26_1940_device_address <= VAR_device_ram_update_uxn_c_l330_c26_1940_device_address;
     device_ram_update_uxn_c_l330_c26_1940_value <= VAR_device_ram_update_uxn_c_l330_c26_1940_value;
     device_ram_update_uxn_c_l330_c26_1940_write_enable <= VAR_device_ram_update_uxn_c_l330_c26_1940_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l330_c26_1940_return_output := device_ram_update_uxn_c_l330_c26_1940_return_output;

     -- main_ram_update[uxn_c_l324_c19_61d2] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l324_c19_61d2_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l324_c19_61d2_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l324_c19_61d2_ram_address <= VAR_main_ram_update_uxn_c_l324_c19_61d2_ram_address;
     main_ram_update_uxn_c_l324_c19_61d2_value <= VAR_main_ram_update_uxn_c_l324_c19_61d2_value;
     main_ram_update_uxn_c_l324_c19_61d2_write_enable <= VAR_main_ram_update_uxn_c_l324_c19_61d2_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l324_c19_61d2_return_output := main_ram_update_uxn_c_l324_c19_61d2_return_output;

     -- vram_value_MUX[uxn_c_l305_c2_d30a] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l305_c2_d30a_cond <= VAR_vram_value_MUX_uxn_c_l305_c2_d30a_cond;
     vram_value_MUX_uxn_c_l305_c2_d30a_iftrue <= VAR_vram_value_MUX_uxn_c_l305_c2_d30a_iftrue;
     vram_value_MUX_uxn_c_l305_c2_d30a_iffalse <= VAR_vram_value_MUX_uxn_c_l305_c2_d30a_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l305_c2_d30a_return_output := vram_value_MUX_uxn_c_l305_c2_d30a_return_output;

     -- Submodule level 8
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l330_c26_1940_return_output;
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l324_c19_61d2_return_output;
     VAR_step_gpu_uxn_c_l336_c20_9344_vram_value := VAR_vram_value_MUX_uxn_c_l305_c2_d30a_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l305_c2_d30a_return_output;
     -- step_gpu[uxn_c_l336_c20_9344] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l336_c20_9344_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l336_c20_9344_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l336_c20_9344_is_active_drawing_area <= VAR_step_gpu_uxn_c_l336_c20_9344_is_active_drawing_area;
     step_gpu_uxn_c_l336_c20_9344_is_vram_write <= VAR_step_gpu_uxn_c_l336_c20_9344_is_vram_write;
     step_gpu_uxn_c_l336_c20_9344_vram_write_layer <= VAR_step_gpu_uxn_c_l336_c20_9344_vram_write_layer;
     step_gpu_uxn_c_l336_c20_9344_vram_address <= VAR_step_gpu_uxn_c_l336_c20_9344_vram_address;
     step_gpu_uxn_c_l336_c20_9344_vram_value <= VAR_step_gpu_uxn_c_l336_c20_9344_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l336_c20_9344_return_output := step_gpu_uxn_c_l336_c20_9344_return_output;

     -- Submodule level 9
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l336_c20_9344_return_output;
     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l337_c19_f261] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l337_c19_f261_return_output := VAR_step_gpu_uxn_c_l336_c20_9344_return_output.is_active_fill;

     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l338_c92_1916] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l338_c92_1916_return_output := VAR_step_gpu_uxn_c_l336_c20_9344_return_output.color;

     -- Submodule level 10
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l337_c19_f261_return_output;
     VAR_palette_snoop_uxn_c_l338_c20_0556_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l338_c92_1916_return_output;
     -- palette_snoop[uxn_c_l338_c20_0556] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l338_c20_0556_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l338_c20_0556_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l338_c20_0556_device_ram_address <= VAR_palette_snoop_uxn_c_l338_c20_0556_device_ram_address;
     palette_snoop_uxn_c_l338_c20_0556_device_ram_value <= VAR_palette_snoop_uxn_c_l338_c20_0556_device_ram_value;
     palette_snoop_uxn_c_l338_c20_0556_is_device_ram_write <= VAR_palette_snoop_uxn_c_l338_c20_0556_is_device_ram_write;
     palette_snoop_uxn_c_l338_c20_0556_gpu_step_color <= VAR_palette_snoop_uxn_c_l338_c20_0556_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l338_c20_0556_return_output := palette_snoop_uxn_c_l338_c20_0556_return_output;

     -- Submodule level 11
     VAR_return_output := VAR_palette_snoop_uxn_c_l338_c20_0556_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l338_c20_0556_return_output;
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
REG_COMB_gpu_step_result <= REG_VAR_gpu_step_result;
REG_COMB_is_active_fill <= REG_VAR_is_active_fill;
REG_COMB_is_ram_write <= REG_VAR_is_ram_write;
REG_COMB_ram_address <= REG_VAR_ram_address;
REG_COMB_ram_write_value <= REG_VAR_ram_write_value;
REG_COMB_ram_read_value <= REG_VAR_ram_read_value;
REG_COMB_device_ram_address <= REG_VAR_device_ram_address;
REG_COMB_device_ram_read_value <= REG_VAR_device_ram_read_value;
REG_COMB_is_device_ram_write <= REG_VAR_is_device_ram_write;
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
     gpu_step_result <= REG_COMB_gpu_step_result;
     is_active_fill <= REG_COMB_is_active_fill;
     is_ram_write <= REG_COMB_is_ram_write;
     ram_address <= REG_COMB_ram_address;
     ram_write_value <= REG_COMB_ram_write_value;
     ram_read_value <= REG_COMB_ram_read_value;
     device_ram_address <= REG_COMB_device_ram_address;
     device_ram_read_value <= REG_COMB_device_ram_read_value;
     is_device_ram_write <= REG_COMB_is_device_ram_write;
     is_vram_write <= REG_COMB_is_vram_write;
     vram_write_layer <= REG_COMB_vram_write_layer;
     vram_address <= REG_COMB_vram_address;
     vram_value <= REG_COMB_vram_value;
 end if;
 end if;
end process;

end arch;
